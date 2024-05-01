<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="Opportunity.aspx.cs" Inherits="Export_Opportunity" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <link rel="stylesheet" href="../Theme/Modified/modifiedcss.css" type="text/css" />
     <link rel="stylesheet" href="../Template/assets/vendor/libs/toaster/toaster.css" type="text/css" />
      <title>E-Connect/</title>
   
 <%--   <!-- Datatable plugin CSS file -->
    <link href="../FacilityManagement/Datatable/css/jquery.dataTables.min.css" rel="stylesheet" />
	<!-- Datatable plugin JS library file -->	
    <script src="../FacilityManagement/Datatable/js/jquery.dataTables.min.js"></script>
   
     <script src="../FacilityManagement/Datatable/js/dataTables.buttons.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/jszip.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/pdfmake.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/vfs_fonts.js"></script>
    <script src="../FacilityManagement/Datatable/js/buttons.html5.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/buttons.print.min.js"></script>--%>

    <script type="text/javascript" src="https://cdn.datatables.net/1.10.9/js/jquery.dataTables.min.js"></script>
<link type="text/css" rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" />

    <script src="../CRMAdmin/Script/opt.js"></script>
    <%--<script src="../js/jquery-1.11.2.min.js"></script>--%>
    <%--<script src="../CustomSearch/js/jquery-customselect-1.9.1.js"></script>--%>
    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    	
    <script src="../FacilityManagement/Datatable/js/buttons.print.min.js"></script>
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
   
  <script>

     
      function onCalendarShown() {

          var cal = $find("Calendar1");

          //Setting the default mode to month

          cal._switchMode("months", true);

          //Iterate every month Item and attach click event to it

          if (cal._monthsBody) {

              for (var i = 0; i < cal._monthsBody.rows.length; i++) {

                  var row = cal._monthsBody.rows[i];

                  for (var j = 0; j < row.cells.length; j++) {

                      Sys.UI.DomEvent.addHandler(row.cells[j].firstChild, "click", call);

                  }

              }

          }

      }

      function call(eventElement) {

          var target = eventElement.target;

          switch (target.mode) {

              case "month":

                  var cal = $find("Calendar1");

                  cal._visibleDate = target.date;

                  cal.set_selectedDate(target.date);

                  cal._blur.post(true);

                  cal.raiseDateSelectionChanged();

                  break;

          }

      }


  </script>
    
</asp:Content> 
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
        <ContentTemplate>
          
            <script type="text/javascript">
                var xPos, yPos;
                var prm = Sys.WebForms.PageRequestManager.getInstance();

                prm.add_beginRequest(BeginRequest);
                prm.add_endRequest(EndRequest);

                function BeginRequest(sender, args) {


                    var contentPanel = $get("<%=dvupdate.ClientID %>");

                    if (Object.is(contentPanel, null)) {
                    }
                    else {
                        xPos = contentPanel.scrollLeft;
                        yPos = contentPanel.scrollTop;
                    }


                }
                function EndRequest(sender, args) {

                    //Same thing here, you need to set the Panel's scroll:
                    var contentPanel = $get("<%=dvupdate.ClientID %>");

                    if (Object.is(contentPanel, null)) {
                    }
                    else {
                        contentPanel.scrollLeft = xPos;
                        contentPanel.scrollTop = yPos;
                    }


                }

            </script>


            <div class="GridviewDiv" id="pnlSummaryView" runat="server">

                <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">

                    <asp:Panel ID="Panel1" runat="server" CssClass="pnlheading">
                        <div class="card-header pnlheading">
                            <h3>
                                <asp:Label ID="Label13" ForeColor="White" Font-Bold="true" runat="server" Text="OPPORTUNITY"></asp:Label>
                                <asp:HiddenField ID="hfdSummaryRowCount" Value="50" runat="server" />
                            </h3>


                        </div>
                    </asp:Panel>
                    <div class="card-block">
                         <div class="row">
                              <div class="pull-right" style="padding-top: 5px;">
                                <label class="form-label">
                                       <asp:Label ID="Label26" runat="server" Text="General Search"></asp:Label>
                                    </label>
                                  </div>
                              <div class="pull-right" style="padding-top: 5px;">
                               <asp:TextBox ID="txtGeneralSearch" runat="server" ForeColor="Black" CssClass="form-control textBox1"></asp:TextBox>
                             </div>

                                <div class="pull-right" style="padding-top: 5px;">
                                      <asp:LinkButton ID="lbkGeneralSearch" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="lbkGeneralSearch_Click"
                                                ><i class="fa fa-search" aria-hidden="true" title="Search"></i></asp:LinkButton>   
                       <asp:LinkButton ID="lbkAdvanceButton"  Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="lbkAdvanceButton_Click"    
                                             runat="server"   ><i class="fa fa-filter" aria-hidden="true" title="Advanced Filter"></i></asp:LinkButton>   
                                    
                                   <asp:LinkButton ID="lbkAddNew"  Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="lbkAddNew_Click" 
                                             runat="server" Visible="true"><i class="fa fa-plus" aria-hidden="true" title="Add New Opportunity"></i></asp:LinkButton>   
                                        </div>

                              &nbsp;&nbsp;  &nbsp;&nbsp;
                            
                               <div class="pull-right">
                                   <label class="form-label">
                                       <asp:Label ID="lblRowCount" runat="server" Text="" ForeColor="Red"></asp:Label>

                                   </label>
                               </div>
                         </div>
                        <div class="row" style="padding-left: 8px;padding-top: 10px;">
                            <div class="col-1" style="width: 20%;border-style: groove;" id="dvdAdvancedSearch" runat="server" visible="false">
                                <asp:Panel runat="server" ID="pnlNumberClose" style="padding-top:5px" Visible="false">
                                    <div class="row">
                                        <div style="width: 30%">
                                              PROJECT # 
                                        </div>
                                        <div style="width: 60%">
                                             <asp:TextBox ID="txtNumber" CssClass="form-control textBox1" runat="server" ForeColor="Black" ></asp:TextBox>
                                        </div>
                                          <div style="width: 5%">
                                               <asp:Button ID="btnNumberPnlClose" runat="server" CssClass="btn btn-close" style="padding: 10px 0px;" OnClick="btnNumberPnlClose_Click">
                                        </asp:Button>
                                              </div>
                                    </div>
                                </asp:Panel>
                                <asp:Panel runat="server" ID="pnlcompanydrp" style="padding-top:5px" Visible="false">
                                    <div class="row">

                                        <div style="width: 30%">
                                            Company 
                                        </div>
                                        <div style="width: 60%">
                                            <asp:DropDownList ID="ddlOrganization" CssClass="form-control textBox1" runat="server" ForeColor="Black" OnSelectedIndexChanged="ddlOrganization_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                        </div>
                                          <div style="width: 5%">
                                               <asp:Button ID="btnCloseCompanyFilt" runat="server" CssClass="btn btn-close" style="padding: 10px 0px;" OnClick="btnCloseCompanyFilt_Click">
                                            
                                        </asp:Button>
                                              </div>
                                    </div>
                                </asp:Panel>
                                <asp:Panel runat="server" ID="pnlManager" style="padding-top:5px" Visible="false">
                                    <div class="row">
                                        <div style="width: 30%">
                                            Marketing 
                                        </div>
                                        <div style="width: 60%">
                                            <asp:DropDownList ID="ddlManager"  CssClass="form-control textBox1" runat="server" ForeColor="Black"  style="max-width:100%"></asp:DropDownList>
                                        </div>
                                        <div style="width: 5%">
                                               <asp:Button ID="btnManagerClose" runat="server" CssClass="btn btn-close" style="padding: 10px 0px;" OnClick="btnManagerClose_Click">
                                            
                                        </asp:Button>
                                              </div>
                                    </div>
                                </asp:Panel>

                                    <asp:Panel runat="server" ID="pnlStatus" style="padding-top:5px" Visible="false">
                                    <div class="row">
                                        <div style="width: 30%">
                                               Status  
                                        </div>
                                        <div style="width: 60%">
                                            <asp:DropDownList ID="ddlStatus" CssClass="form-control textBox1" runat="server" ForeColor="Black" >
                                                <asp:ListItem Text="OPEN" Value="OPEN" Selected="True"></asp:ListItem>
                                                <asp:ListItem Text="WON" Value="WON" ></asp:ListItem>
                                                <asp:ListItem Text="LOST" Value="LOST" ></asp:ListItem>
                                                  <asp:ListItem Text="NO SALE" Value="NO SALE" ></asp:ListItem>
                                                </asp:DropDownList>
                                        </div>
                                        <div style="width: 5%">
                                               <asp:Button ID="btnStatusClose" runat="server" CssClass="btn btn-close" style="padding: 10px 0px;" OnClick="btnStatusClose_Click">
                                            
                                        </asp:Button>
                                              </div>
                                    </div>
                                </asp:Panel>
                                   <asp:Panel runat="server" ID="pnlSalesStage" style="padding-top:5px" Visible="false">
                                    <div class="row">
                                        <div style="width: 30%">
                                               Sales Satge  
                                        </div>
                                        <div style="width: 60%">
                                            <asp:DropDownList ID="ddlSalesStageSearch" CssClass="form-control textBox1" runat="server" ForeColor="Black" >
                                                <asp:ListItem Text="J.O.H" Value="J.O.H" Selected="True"></asp:ListItem>
                                                <asp:ListItem Text="TENDER" Value="TENDER"></asp:ListItem>
                                                </asp:DropDownList>
                                        </div>
                                        <div style="width: 5%">
                                               <asp:Button ID="btnSalesstageClose" runat="server" CssClass="btn btn-close" style="padding: 10px 0px;" OnClick="btnSalesstageClose_Click">
                                            
                                        </asp:Button>
                                              </div>
                                    </div>
                                </asp:Panel>
                                    <asp:Panel runat="server" ID="Panel4" style="padding-top:5px">
                                    <div class="row">
                                        
                                        <div style="width: 100%">
                                            <div class="pull-left">
                                            <asp:DropDownList ID="ddlNewField" CssClass="form-control textBox1" runat="server" ForeColor="Black" AutoPostBack="true" OnSelectedIndexChanged="ddlNewField_SelectedIndexChanged" style="align-items:center" >
                                           
                                                 <asp:ListItem Text="ADD FIELD" Value="ADD"  Selected="True"></asp:ListItem>    
                                                 <asp:ListItem Text="OPT Number" Value="OPT"></asp:ListItem>
                                                <asp:ListItem Text="Company" Value="Company" ></asp:ListItem>
                                                 <asp:ListItem Text="Owner" Value="Owner"></asp:ListItem>
                                                  <asp:ListItem Text="Status" Value="Status"></asp:ListItem>
                                                    <asp:ListItem Text="SalesStage" Value="SalesStage"></asp:ListItem>
                                                </asp:DropDownList>
                                                </div>
                                            <div class="pull-left" style="padding-left:10%">
                                            <asp:Button runat="server" ID="btnSearch" Text="Search" CssClass="btn btn-info" OnClick="btnSearch_Click"/>
                                              </div>
                                              <div class="pull-left" style="padding-left:1%">
                                            <asp:Button runat="server" ID="btnExport" Text="Export" CssClass="btn btn-gray" OnClick="btnExport_Click"/>
                                              </div>
                                        </div>
                                    </div>
                                </asp:Panel>

                     
                       
                            
                            
                 
                            
                               
                            
                               <div class="pull-right">
                                   <label class="form-label">
                                       <asp:Label ID="lblSummaryErrormsg" runat="server" Text="" ForeColor="Red"></asp:Label>

                                   </label>
                               </div>


                            </div>
                        
                               <div style="width: 80%;" id="dvdResult" runat="server"> 

                        <div id="dvupdate" runat="server" style="overflow-y: auto; height: calc(100vh - 225px); overflow-x: hidden">
                            <asp:GridView ID="gdvSummaryDetails" runat="server" AutoGenerateColumns="False"
                                
                                OnRowCommand="gdvSummaryDetails_RowCommand"
                                CellSpacing="0" BorderWidth="0" AllowSorting="True" EmptyDataText="No Data Found"
                                class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                                <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                 <HeaderStyle CssClass="GridHeader-blue" />
                                <Columns>

                                    <asp:TemplateField HeaderText="OPT Number" ItemStyle-Width="5%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="PRJNumber">
                                        <ItemTemplate>
                                            <asp:Label ID="lblOPTNumber" Text='<%#(Eval("OPTNumber").ToString()) %>'
                                                runat="server" />
                                            <asp:HiddenField ID="hfdOPTNumber" Value='<%#(Eval("OPTNumber").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />

                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Name" ItemStyle-Width="15%" Visible="True" SortExpression="Name" HeaderStyle-HorizontalAlign="Left">
                                     
                                        <ItemTemplate>
                                            <asp:Label ID="lblName" Text='<%#(Eval("Name").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>

                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Owner" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="Owner">
                                        <ItemTemplate>
                                            <asp:Label ID="lblOwner" Text='<%#(Eval("Owner").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                    </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Assistant Owner" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="AssistantOwner">
                                        <ItemTemplate>
                                            <asp:Label ID="lblAssistantOwner" Text='<%#(Eval("AssistantOwner").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Stage" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" SortExpression="Stage">
                                        <ItemTemplate>
                                            <asp:Label ID="lblStage" Text='<%#(Eval("Stage").ToString()) %>' runat="server" />
                                        </ItemTemplate>
                                        <ItemStyle Width="10%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Status" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="Status">
                                        <ItemTemplate>
                                            <asp:Label ID="lblStatus" Text='<%#(Eval("Status").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>

                                        <ItemStyle HorizontalAlign="Center" Width="10%" />
                                    </asp:TemplateField>
                                
                                    <asp:TemplateField HeaderText="Created Date" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="CreatedDate">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCreatedDate" Text='<%#(Eval("CreatedDate").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>

                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="View">
                                        <HeaderStyle Font-Size="Small" Width="4%" HorizontalAlign="Center" />
                                        <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lblView" runat="server" Text='' CommandName="View" CssClass="btn rounded-pill btn-icon btn-round"
                                                CommandArgument='<%#Eval("OPTNumber")%>' Style="text-align: center"><i class="fa fa-eye" title="View"></i></asp:LinkButton>
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
                               

                            </asp:GridView>

                            <div class="row">
                                <asp:Button runat="server" ID="btnLoadMoreSummary" OnClick="btnLoadMoreSummary_Click" Width="100%" Text="Load More"></asp:Button>
                            </div>
                        </div>
                   
               
                                </div>
                            </div>


                    
                    </div>


                </div>
                

            </div>


          <cc1:ModalPopupExtender ID="mpSearch" runat="server" PopupControlID="pnlSearchDetails" TargetControlID="txtSearchDeatils"
                Enabled="true" DropShadow="true" BehaviorID="ModalPopupExtenderBehavior1" RepositionMode="RepositionOnWindowResizeAndScroll" 
                BackgroundCssClass="modalBackground">
            </cc1:ModalPopupExtender>

            <asp:Panel ID="pnlSearchDetails"  AccessKey="s" runat="server" CssClass="modalPopup" align="center" Style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 50px !important; display: none; font-family: 'Times New Roman'; font-size: medium" BorderStyle="Solid" BorderWidth="1px">

                <div style="border-radius: 50px !important; background-color: #ffffff !important; padding-left: 7px; padding-top: 7px; float: left; padding-right: 7px; width: 70%; padding-bottom: 7px; position: fixed; z-index: 100001; left: 15%; top: 64.5px; border: solid; border-color: silver; padding-bottom: 20px">
                    <div class="row" style="height: 55px">

                        <div class="pull-left" style="border-radius: 50px !important; padding-left: 20px;">
                            <img src="../masters/images/ec.png" style="height: 30px;" />
                            <img src="../masters/images/ec1.png" style="height: 50px;" />

                        </div>
                        <div>
                        </div>
                    </div>

                    <div class="modal-header panl14" style="font-family: system-ui;">

                        <div class="pull-left">

                            <h4>
                                <asp:Label ID="Label34" class="subpnlhdg" runat="server" Text="Search"></asp:Label>
                            </h4>

                        </div>


                        <div class="pull-right">
                         <%--    <button type="button" class="btn btn-close"  aria-label="Close" runat="server" id="btnCloseSearchMP"/>--%>
                            <asp:Button ID="btnCloseSearchMPNew" OnClick="btnCloseSearchMPNew_Click" runat="server"   class="btn btn-close"/>
                        
                         <%--   <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="../Icons/deleteData.png" Style="padding-top: 10%;" /></td>--%>
                        </div>

                    </div>
                  
                    <table class="table table-condensed" style="padding-top: 10px;">

                        <tr>
                            <td style="padding: 3px 5px; width: 10%;padding-top:10px" class="label-alignment no-border">
                                <asp:Label ID="Label35" runat="server" Text="Search By Name"></asp:Label>
                     
                            </td>
                            <td style="padding: 3px 5px; width: 90%;padding-top:10px" class="no-border">
                                <div class="pull-left">
                                 <asp:TextBox ID="txtSearchDeatils"  CssClass="textBox1 form-control " runat="server" />
                                    </div>
                                <div class="pull-left" style="padding-left:5px">
                                 <asp:LinkButton ID="lbSearchDetails" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="lbSearchDetails_Click" 
                                                ><i class="fa fa-search" aria-hidden="true" title="Search"></i></asp:LinkButton>   
                                    </div>
                            </td>
                       
                        </tr>
           
               
                    </table>

                
                     <asp:HiddenField ID="hfdOper" runat="server"  />
                    <div style="padding-top: 10px;">
                             <asp:GridView ID="gdvSearchDetails" runat="server" AutoGenerateColumns="false" Width="100%"
                        CellSpacing="0" BorderWidth="0" AllowSorting="True" EmptyDataText="No Data Found"  OnRowCommand="gdvSearchDetails_RowCommand"
                        class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                        <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                        <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                        <Columns>
                            <asp:TemplateField ItemStyle-Width="5%" Visible="false">
                              
                                <ItemTemplate>
                                     <asp:HiddenField ID="hfdRefID" runat="server" Value='<%#Eval("RefId")%>' />
                                  <asp:LinkButton ID="lblUpdate" runat="server" Text=""  CommandArgument='<%#Eval("RefId")%>'
                                                CommandName="Select" Style="text-align: center"><i class="fa fa-bookmark" aria-hidden="true" title="Search"></i> </asp:LinkButton>
                                 
                                </ItemTemplate>
                            </asp:TemplateField>
                              <asp:TemplateField ItemStyle-Width="40%" ItemStyle-HorizontalAlign="Center">
                              
                                <ItemTemplate>
                                   
                                  <asp:LinkButton ID="lblName" runat="server" Text='<%#Eval("Name")%>'  Style="text-align: center"   CommandArgument='<%#Eval("RefId")%>'
                                                CommandName="Select"></asp:LinkButton>
                                 
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-Width="40%" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                  <asp:Label ID="lblOwner" runat="server" Text='<%#Eval("Owner")%>'  Style="text-align: center"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                              <asp:TemplateField ItemStyle-Width="15%" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                  <asp:Label ID="lblCompany" runat="server" Text='<%#Eval("Company")%>'  Style="text-align: center"></asp:Label>
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
                    </div>

                </div>

            </asp:Panel>


                  <cc1:ModalPopupExtender ID="mpAddNewOPT" runat="server" PopupControlID="pnlAddNewOPT" TargetControlID="btnCloseAddNewOPT"
                Enabled="true" CancelControlID="btnCloseAddNewOPT" DropShadow="true" BehaviorID="ModalPopupExtenderBehavior3" RepositionMode="RepositionOnWindowResizeAndScroll" 
                BackgroundCssClass="modalBackground">
            </cc1:ModalPopupExtender>

            <asp:Panel ID="pnlAddNewOPT"  AccessKey="s" runat="server" CssClass="modalPopup" align="center" Style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 50px !important; display: none; font-family: 'Times New Roman'; font-size: medium" BorderStyle="Solid" BorderWidth="1px">

                <div style="border-radius: 50px !important; background-color: #ffffff !important; padding-left: 7px; padding-top: 7px; float: left; padding-right: 7px; width: 50%; padding-bottom: 7px; position: fixed; z-index: 100001; left: 25%; top: 64.5px; border: solid; border-color: silver; padding-bottom: 20px">
                    <div class="row" style="height: 55px">

                        <div class="pull-left" style="border-radius: 50px !important; padding-left: 20px;">
                            <img src="../masters/images/ec.png" style="height: 30px;" />
                            <img src="../masters/images/ec1.png" style="height: 50px;" />

                        </div>
                        <div>
                        </div>
                    </div>

                    <div class="modal-header panl14" style="font-family: system-ui;">

                        <div class="pull-left">

                            <h4>
                                <asp:Label ID="Label3" class="subpnlhdg" runat="server" Text="Add New BOQ Opportunity"></asp:Label>
                            </h4>

                        </div>


                        <div class="pull-right">
                             <button type="button" class="btn btn-close"    aria-label="Close" runat="server" id="btnCloseAddNewOPT"/>
                          
                        
                         <%--   <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="../Icons/deleteData.png" Style="padding-top: 10%;" /></td>--%>
                        </div>

                    </div>
                  
                    <table class="table table-condensed" style="margin-top: 20px;">
                        <tr>
								<td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
									<asp:Label ID="Label25" runat="server" Text="Name"></asp:Label>
                                       <asp:HiddenField ID="hfdNewOPT" runat="server" ></asp:HiddenField>
								</td>
								<td style="padding: 3px 5px; width: 8%" class="no-border">
									<asp:TextBox ID="txtName" CssClass="textBox1 form-control " runat="server" />
								</td>
							
								<td style="padding: 3px 5px; width: 4%" class="label-alignment no-border"></td>
							
								<td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
									<asp:Label ID="Label9" runat="server" Text="Owner"></asp:Label>
								</td>
								<td style="padding: 3px 5px; width: 8%" class="no-border">
									<div class="input-group">
										<span class="input-group-text">
											<asp:LinkButton ID="lbSearchManager" runat="server" Text="" OnClick="lbSearchManager_Click"><i class="tf-icons bx bx-search"></i></asp:LinkButton></span>
										<asp:TextBox ID="txtManagerName" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
										<asp:HiddenField ID="hfdManagerId" runat="server" />
									</div>
								</td>
							</tr>
           			<tr>
								<td style="padding: 3px 5px; width: 10%" class="label-alignment no-border">
									<asp:Label ID="Label19" runat="server" Text="Customer"></asp:Label>
                                      
								</td>
								<td style="padding: 3px 5px; width: 37%" class="no-border">
									<div class="input-group">
										<span class="input-group-text">
											<asp:LinkButton ID="lblCustomerNewOPT" runat="server" Text="" OnClick="lblCustomerNewOPT_Click"><i class="tf-icons bx bx-search"></i></asp:LinkButton></span>
										<asp:TextBox ID="txtCustomerNewOPT" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
										<asp:HiddenField ID="hfdCustomerNewOPT" runat="server" />
									</div>
								</td>
								<td style="padding: 3px 5px; width: 4%" class="label-alignment no-border"></td>
                                	<td style="padding: 3px 5px; width: 10%" class="label-alignment no-border">
									<asp:Label ID="Label21" runat="server" Text="Assistant Owner"></asp:Label>
								</td>
								<td style="padding: 3px 5px; width: 37%" class="no-border">
									<div class="input-group">
										<span class="input-group-text">
											<asp:LinkButton ID="lblAssistantOwnerNewOPT" runat="server" Text="" OnClick="lblAssistantOwnerNewOPT_Click"><i class="tf-icons bx bx-search"></i></asp:LinkButton></span>
										<asp:TextBox ID="txtAssistantOwnerNewOPT" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
										<asp:HiddenField ID="hfdAssistantOwnerIDNewOPT" runat="server" />
									</div>
								</td>

							</tr>
                         <tr>
                                     <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										<asp:Label ID="Label44" runat="server" Text="Country"></asp:Label>
									</td>
									<td style="padding: 3px 5px; width: 8%" class="no-border">
										<asp:DropDownList ID="ddlCountryNew" runat="server" CssClass="textBox1 form-control " Font-Bold="True" ></asp:DropDownList>
									</td>
                                    </tr>
                                  
             
           
               
                    </table>

					<div style="padding-top: 20px;">
						<asp:LinkButton ID="lblSaveNewOPT" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="lblSaveNewOPT_Click"><i class="fa fa-floppy-o" aria-hidden="true" title="Save"></i></asp:LinkButton>
					</div>

                </div>

            </asp:Panel>



                   <asp:Panel ID="pnlDetailView" runat="server" Visible="false">
             
                    <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">
                           <asp:Panel ID="Panel3" runat="server" CssClass="pnlheading">
                        <div class="card-header pnlheading">
                            <div class="pull-left" >
                            <h3>
                                <asp:Label ID="Label8" ForeColor="White" Font-Bold="true" runat="server" Text="Project Master"></asp:Label>
                                
                            </h3>
                                </div>
                             <div class="pull-right" >

                                  <asp:LinkButton ID="btnAdminHistory" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="btnAdminHistory_Click"
                                             ><i class="fa fa-address-book" title="Admin Remarks"></i></asp:LinkButton>

                              <asp:LinkButton ID="btnMore" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="btnMore_Click"
                                                ><i class="fa fa-ellipsis-h" aria-hidden="true" title="More Info"></i></asp:LinkButton>
                                 <%--<asp:Button ID="btnStartConv" runat="server" Text="Start Converstation" CssClass="btn btn-Cancel" Font-Size="Small" AccessKey="a" TabIndex="15" Visible="true" OnClick="btnStartConv_Click" />--%>
                                 <asp:LinkButton ID="btnStartConv" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="btnStartConv_Click"
                                                ><i class="fa fa-comments" aria-hidden="true" title="Start Conversation"></i></asp:LinkButton>
                                 
                                <%--<asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btn rounded-pill me-2 btn-primary" Font-Size="Small" AccessKey="a" TabIndex="15" Visible="true" OnClick="btnBack_Click" />--%>
                               <asp:LinkButton ID="btnBack" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="btnBack_Click"
                                                ><i class="fa fa-arrow-circle-left" aria-hidden="true" title="Go Back"></i></asp:LinkButton>   
                             </div>


                        </div>
                    </asp:Panel>
                         <div class="card-block">
                            <asp:Panel ID="Panel2" runat="server" CssClass="pnlsubheading">
                               
                                 <div class="pull-left">
                                     <h5>
                                         <asp:Label ID="Label2" class="panel-heading" Style="color: white;" runat="server" Text="Opportunity Details"></asp:Label></h5>
                                 </div>
                                 <div class="pull-right" style="margin-top: -9px;margin-right: 10px;">
                                      <asp:LinkButton ID="lbUpdateOPT" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="lbUpdateOPT_Click"
                                                ><i class="fa fa-save" aria-hidden="true" title="Update Opportunity Details"></i></asp:LinkButton>   
                                 </div>
                               
                             </asp:Panel>
                         

                       
						
							 <table class="table table-condensed" style="width: 100%">
                                 <tr>
                                     <td style="padding: 3px 5px; width: 5%;" class="label-alignment no-border" >
										<asp:Label ID="Label23" runat="server" Text="Inquiry Type"></asp:Label>
									</td>
									<td style="padding: 3px 5px; width: 8%;" class="no-border">
									<asp:DropDownList ID="ddlInquiryType" runat="server" CssClass="textBox1 form-control " Font-Bold="True" OnSelectedIndexChanged="ddlInquiryType_SelectedIndexChanged" AutoPostBack="true">

										<asp:ListItem Text="BOQ" Value="BOQ" Selected="True"></asp:ListItem>
										<asp:ListItem Text="PROJECT" Value="PROJECT"></asp:ListItem>
										<asp:ListItem Text="DIRECT ORDER" Value="DIRECT ORDER"></asp:ListItem>
										<asp:ListItem Text="VEHICLE" Value="VEHICLE"></asp:ListItem>

									</asp:DropDownList>
									</td>
                                        <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                     <asp:Panel runat="server" id="pnlProjectDetails">
                                       <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border" >
										<asp:Label ID="Label24" runat="server" Text="Project"></asp:Label>
									    </td>
									    <td style="padding: 3px 5px; width: 8%;" class="no-border" colspan="4">
										 <div class="input-group">
												 <span class="input-group-text">
													 <asp:LinkButton ID="lbSearchProject" runat="server" Text="" OnClick="lbSearchProject_Click"><i class="tf-icons bx bx-search"></i></asp:LinkButton>

												 </span>
												<a href="#" runat="server" id="linkProject"> <asp:Label ID="lblProjectName" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="2" Enabled="false" Style="min-height:39px;min-width:234px"></asp:Label>
                                             </a>  <asp:HiddenField ID="hfdProjectId" runat="server" />
											 </div>
                                         
									</td>
                                        </asp:Panel>
                                     </tr>
                                 <tr>



                                     <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">

                                         <asp:Label ID="Label15" runat="server" Text="Project Number"></asp:Label>
                                     </td>
                                     <td style="padding: 3px 5px; width: 8%" class="no-border">

                                         <asp:TextBox ID="txtOPTNumberEdit" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
                                     </td>

                                     <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>

                                     <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                         <asp:Label ID="Label20" runat="server" Text="Name"></asp:Label>
                                         <asp:HiddenField ID="hfdOPTID" runat="server" />
                                     </td>

                                     <td style="padding: 3px 5px; width: 10%" class="no-border">
                                         <asp:TextBox ID="txtNameEdit" runat="server" CssClass="textBox1 form-control " Enabled="true" Font-Bold="True"></asp:TextBox>
                                     </td>
                                     <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                     <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
									<asp:Label ID="Label7" runat="server" Text="Customer"></asp:Label>
                                      
								</td>
								<td style="padding: 3px 5px; width: 10%" class="no-border">
									<div class="input-group">
										<span class="input-group-text">
											<asp:LinkButton ID="lbCustomerEditSearch" runat="server" Text="" OnClick="lbCustomerEditSearch_Click"><i class="tf-icons bx bx-search"></i></asp:LinkButton></span>
										<asp:TextBox ID="txtCustomerNameEdit" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
										<asp:HiddenField ID="hfdCustomerIdEdit" runat="server" />
									</div>
								</td>
                                      <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                     <td style="padding: 3px 5px;width: 5%" class="label-alignment no-border">
                                         <asp:Label ID="Label1" runat="server" Text="Manager"></asp:Label>
                                     </td>
                                     <td style="padding: 3px 5px;width: 10%" class="no-border">


                                         <div class="input-group">
                                             <span class="input-group-text">
                                                 <asp:LinkButton ID="lbSearchManagerEdit" runat="server" Text="" OnClick="lbSearchManagerEdit_Click"><i class="tf-icons bx bx-search"></i></asp:LinkButton></span>
                                             <asp:TextBox ID="txtManagerNameEdit" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="2" Enabled="false"></asp:TextBox>
                                             <asp:HiddenField ID="hfdManagerIdIDEdit" runat="server" />
                                         </div>
                                     </td>
                                   
                                    

                                 </tr>
                                 <tr>
                                      <td style="padding: 3px 5px;width: 5%" class="label-alignment no-border">
                                         <asp:Label ID="Label5" runat="server" Text="Assistant Owner"></asp:Label>
                                     </td>
                                     <td style="padding: 3px 5px;width: 10%" class="no-border">


                                         <div class="input-group">
                                             <span class="input-group-text">
                                                 <asp:LinkButton ID="lbAssistantOwnerEditSearch" runat="server" Text="" OnClick="lbAssistantOwnerEditSearch_Click"><i class="tf-icons bx bx-search"></i></asp:LinkButton></span>
                                             <asp:TextBox ID="txtAssistantOwnerEdit" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="2" Enabled="false"></asp:TextBox>
                                             <asp:HiddenField ID="hfdAssistantOwnerIdEdit" runat="server" />
                                         </div>
                                     </td>
                                      <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>

                                      <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                         <asp:Label ID="Label42" runat="server" Text="Country"></asp:Label>
                                     </td>
                                    
                                     <td style="padding: 3px 5px; width: 10%" class="no-border">
                                         <asp:DropDownList ID="ddlCountryEdit" runat="server" CssClass="textBox1 form-control " Font-Bold="True" AutoPostBack="true"></asp:DropDownList>
                                     </td>
                                        <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                     <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                          <asp:Label ID="Label4" runat="server" Text="Stage"></asp:Label>
                                         </td>
                                       <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                        <asp:DropDownList ID="ddlStageEdit" CssClass="form-control textBox1" runat="server" ForeColor="Black" >
                                                <asp:ListItem Text="J.O.H" Value="J.O.H" Selected="True"></asp:ListItem>
                                                <asp:ListItem Text="TENDER" Value="TENDER"></asp:ListItem>
                                                </asp:DropDownList>
                                           </td>
                                       <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>

                                     <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                         <asp:Label ID="Label6" runat="server" Text="Status"></asp:Label>
                                  
                                     </td>

                                     <td style="padding: 3px 5px; width: 10%" class="no-border">
                                       <asp:DropDownList ID="ddlStatusEdit" CssClass="form-control textBox1" runat="server" ForeColor="Black" >
                                                <asp:ListItem Text="OPEN" Value="OPEN" Selected="True"></asp:ListItem>
                                                <asp:ListItem Text="WON" Value="WON" ></asp:ListItem>
                                                <asp:ListItem Text="LOST" Value="LOST" ></asp:ListItem>
                                           <asp:ListItem Text="NO SALE" Value="NO SALE" ></asp:ListItem>
                                                </asp:DropDownList>
                                     </td>
                                 </tr>
                    
								
				
                                
							
				
							 </table>

        

                           <asp:Panel ID="Panel10" runat="server" CssClass="pnlsubheading">
                                 <div class="pull-left">
                                     <h5>
                                         <asp:Label ID="Label46" class="panel-heading" Style="color: white;" runat="server" Text="Revenue Details"></asp:Label></h5>
                                 </div>
                                <div class="pull-right" style="margin-top: -9px;margin-right: 10px;">
                                      <asp:LinkButton ID="lbAddProduct" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="lbAddProduct_Click"
                                                ><i class="fa fa-plus" aria-hidden="true" title="Add An Item"></i></asp:LinkButton>   
                                 </div>
                                
                                
                             </asp:Panel>


                            <%-- REvenue details --%>
                 <div id="Div1" runat="server" style="overflow-x: auto">
                                 <asp:GridView ID="gdvRevUpdate" runat="server" AutoGenerateColumns="False"
                                     AllowSorting="True" EmptyDataText="No Data Found" AllowPaging="false" 
                                     OnRowCommand="gdvRevUpdate_RowCommand" OnRowDataBound="gdvRevUpdate_RowDataBound"
                                     OnRowEditing="gdvRevUpdate_RowEditing" OnRowUpdating="gdvRevUpdate_RowUpdating"
                                     class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                                     <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                     <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                     <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                     <Columns>
                    
                                         <asp:TemplateField HeaderText="Product Type" ItemStyle-Width="15%" Visible="True">
                                             <ItemTemplate>
                                                 <asp:Label ID="lblProductType" Text='<%#(Eval("Product").ToString()) %>'
                                                     runat="server" />
                                                 <asp:HiddenField ID="hfdRevenueRowId" Value='<%#(Eval("RevId").ToString()) %>' runat="server" />
                                                 <asp:HiddenField ID="hfdOpportunityNumber" Value='<%#(Eval("OPTNumber").ToString()) %>' runat="server" />
                                             </ItemTemplate>
                                         </asp:TemplateField>
                                       
                                         
                                         <asp:TemplateField HeaderText="Revenue Status" ItemStyle-Width="10%" Visible="false" ItemStyle-HorizontalAlign="Center">
                                             <ItemTemplate>
                                                 <asp:Label ID="lblRevenueStatus" Text='<%#(Eval("Status").ToString()) %>' runat="server" />
                                             </ItemTemplate>
                                         </asp:TemplateField>
                                          <asp:TemplateField HeaderText="Revenue Status" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                             <ItemTemplate>
                                                 <asp:DropDownList ID="ddlRevenueStatus" runat="server">
                                                 </asp:DropDownList>
                                             </ItemTemplate>
                                         </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Sub Stage" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                             <ItemTemplate>
                                                 <asp:DropDownList ID="ddlSubStage" runat="server">
                                                 </asp:DropDownList>
                                             </ItemTemplate>
                                         </asp:TemplateField>
                                          <asp:TemplateField HeaderText="Sub Stage" ItemStyle-Width="5%" Visible="false" ItemStyle-HorizontalAlign="Center">
                                             <ItemTemplate>
                                                  <asp:Label ID="lblSubStage" Text='<%#(Eval("SubStage").ToString()) %>'
                                                     runat="server" />
                                             </ItemTemplate>
                                         </asp:TemplateField>
                                           <asp:TemplateField HeaderText="Sub Stage Date" ItemStyle-Width="5%" Visible="false" ItemStyle-HorizontalAlign="Center">
                                             <ItemTemplate>
                                                  <asp:Label ID="lblSubStageDate" Text='<%#(Eval("SubStageDate").ToString()) %>'
                                                     runat="server" />
                                             </ItemTemplate>
                                         </asp:TemplateField>
                                     
                                         <asp:TemplateField HeaderText="Admin Remaks" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                             <ItemTemplate>
                                                 <asp:TextBox ID="txtRemarks" runat="server"  Text='<%#(Eval("AdminRemarks").ToString()) %>'/>
                                             </ItemTemplate>
                                         </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Quotation Number" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
											<ItemTemplate>
												<asp:TextBox ID="txtQuotationNumber" runat="server"  Text='<%#(Eval("QuotationNumber").ToString()) %>'/>
											</ItemTemplate>
										</asp:TemplateField>
										<asp:TemplateField HeaderText="Quotation Date" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
											<ItemTemplate>
												<asp:TextBox ID="txtQuotationDate" runat="server" Text='<%#(Eval("QuotationDate").ToString()) %>' />
												<ajax:CalendarExtender ID="calS3" runat="server" Format="yyyy-MM-dd" TargetControlID="txtQuotationDate" 
													CssClass="MyCalendar">
												</ajax:CalendarExtender>
											</ItemTemplate>
										</asp:TemplateField>
                                           <asp:TemplateField HeaderText="SO Number" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
											<ItemTemplate>
												<asp:TextBox ID="txtSONumber" runat="server"  Text='<%#(Eval("SONumber").ToString()) %>'/>
											</ItemTemplate>
										</asp:TemplateField>
										<asp:TemplateField HeaderText="SO Date" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
											<ItemTemplate>
												<asp:TextBox ID="txtSODate" runat="server" Text='<%#(Eval("SoDate").ToString()) %>' />
												<ajax:CalendarExtender ID="calS4" runat="server" Format="yyyy-MM-dd" TargetControlID="txtSODate" 
													CssClass="MyCalendar">
												</ajax:CalendarExtender>
											</ItemTemplate>
										</asp:TemplateField>
                                          <asp:TemplateField HeaderText="VALUE" ItemStyle-Width="5%" Visible="True" ItemStyle-HorizontalAlign="Center">
                                             <ItemTemplate>
                                                 <asp:TextBox ID="lblValue" Text='<%#(Eval("VALUE").ToString()) %>' runat="server" style="text-align:center"/>
                                             </ItemTemplate>
                                         </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Currency" ItemStyle-Width="5%" Visible="True" ItemStyle-HorizontalAlign="Center">
                                             <ItemTemplate>
                                               <asp:Label ID="lblCurrency" Text='<%#(Eval("Currency").ToString()) %>'
                                                     runat="server" />
                                             </ItemTemplate>
                                         </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Update" Visible="true">

                                             <ItemStyle Font-Size="Small" HorizontalAlign="Center" Width="4%" />
                                             <ItemTemplate>
                                                 <asp:LinkButton ID="lblUpdate" runat="server" Text='' CssClass="btn rounded-pill btn-icon btn-round"
                                                     CommandName="Update" Style="text-align: center"><i class="fa fa-floppy-o" title="Save"></i></asp:LinkButton>
                                             </ItemTemplate>

                                         </asp:TemplateField>

                                         <asp:TemplateField HeaderText="History">
                                             <HeaderStyle Font-Size="Small" Width="4%" HorizontalAlign="Center" />
                                             <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                             <ItemTemplate>
                                                 <asp:LinkButton ID="lblHistory" runat="server" Text='' CssClass="btn rounded-pill btn-icon btn-round"
                                                     CommandArgument='<%#Eval("RevId")%>' CommandName="History" Style="text-align: center"><i class="fa fa-history" title="History"></i></asp:LinkButton>
                                             </ItemTemplate>
                                         </asp:TemplateField>
                                      
                                 <%--   <asp:TemplateField HeaderText="Others">
                                        <HeaderStyle Font-Size="Small" Width="4%" HorizontalAlign="Center" />
                                        <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btnothers" runat="server" Style="text-align: center" CommandName="Others" CssClass="btn rounded-pill btn-icon btn-round"
                                                CommandArgument='<%#(Eval("RevId").ToString())%>'><i class="fa fa-info-circle" title="Others"></i></asp:LinkButton>

                                        </ItemTemplate>
                                    </asp:TemplateField>--%>

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

    

           <cc1:ModalPopupExtender ID="mpMediaInfo" runat="server" PopupControlID="pnlMediaInfo" TargetControlID="btnMediInfoClose"
                Enabled="true" CancelControlID="btnMediInfoClose" DropShadow="true" BehaviorID="ModalPopupExtenderBehavior23" RepositionMode="RepositionOnWindowResizeAndScroll"
                BackgroundCssClass="modalBackground">
            </cc1:ModalPopupExtender>

            <asp:Panel ID="pnlMediaInfo" runat="server" CssClass="modalPopup" align="center" Style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 50px !important; display: none; font-family: 'Times New Roman'; font-size: medium" BorderStyle="Solid" BorderWidth="1px">

                <div style="border-radius: 50px !important; background-color: #ffffff !important; padding-left: 7px; padding-top: 7px; float: left; padding-right: 7px; width: 80%; padding-bottom: 7px; position: fixed; z-index: 100001; left: 10%; top: 64.5px; border: solid; border-color: silver; padding-bottom: 20px">
                    <div class="row" style="height: 55px">

                        <div class="pull-left" style="border-radius: 50px !important; padding-left: 20px;">
                            <img src="../masters/images/ec.png" style="height: 30px;" />
                            <img src="../masters/images/ec1.png" style="height: 50px;" />

                        </div>
                        <div>
                        </div>
                    </div>

                    <div class="modal-header panl14" style="font-family: system-ui;">

                        <div class="pull-left">

                            <h4>
                                <asp:Label ID="lblMediaInfoHeader" class="subpnlhdg" runat="server" Text="Media information"></asp:Label>
                                 <asp:HiddenField ID="hfdMediaRefID" runat="server" ></asp:HiddenField>
                            </h4>

                        </div>


                        <div class="pull-right">
                             <button type="button" class="btn btn-close"  aria-label="Close" runat="server" id="btnMediInfoClose"/>
                         <%--   <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="../Icons/deleteData.png" Style="padding-top: 10%;" /></td>--%>
                      </div>

                  </div>
					<div class="popupmaxheight">
						<table class="table table-condensed" style="width: 100%">

                            <tr>

                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label73" runat="server" Text="Medi Name"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 15%" class="no-border">
                                    <asp:TextBox ID="txtMediaNameP" CssClass="textBox1 form-control " runat="server" />
                                </td>

                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label74" runat="server" Text="Media Reference"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 15%" class="no-border">
                                    <asp:TextBox ID="txtMediaRefP" runat="server" CssClass="textBox1 form-control" Font-Bold="True"></asp:TextBox>
                                </td>
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label75" runat="server" Text="Media URL"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 15%" class="no-border">
                                    <asp:TextBox ID="txtMediaURLP" runat="server" CssClass="textBox1 form-control" Font-Bold="True"></asp:TextBox>
                                </td>
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label76" runat="server" Text="More Info"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 15%" class="no-border">
                                    <asp:TextBox ID="txtMediaMoreInfoP" runat="server" CssClass="textBox1 form-control" Font-Bold="True"></asp:TextBox>
                                </td>
                                 <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                  <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                      <asp:LinkButton ID="btnSaveMediaInfo" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="btnSaveMediaInfo_Click"><i class="fa fa-floppy-o" aria-hidden="true" title="Save"></i></asp:LinkButton>
                                      </td>
                            </tr>
                          
                          
                      
							
						</table>
                          <div id="Div3" runat="server" style="overflow-y: auto; height: calc(100vh - 500px); overflow-x: hidden">
                            <asp:GridView ID="gdvMediInfo" runat="server" AutoGenerateColumns="False"
                                CellSpacing="0" BorderWidth="0" AllowSorting="True" EmptyDataText="No Data Found" 
                                class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                                <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                <Columns>

                                    <asp:TemplateField HeaderText="Media Name" ItemStyle-Width="5%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="MediaName">
                                        <ItemTemplate>
                                            <asp:Label ID="lblMediaName" Text='<%#(Eval("MediaName").ToString()) %>'
                                                runat="server" />
                                            <asp:HiddenField ID="hfdMediaInfoID" Value='<%#(Eval("ID").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>

                                        <HeaderStyle HorizontalAlign="Center" />

                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Media Reference" ItemStyle-Width="15%" Visible="True" SortExpression="MediaReference">
                                        <HeaderStyle CssClass="gridheadercenter" />
                                        <ItemTemplate>
                                            <asp:Label ID="lblMediaReference" Text='<%#(Eval("MediaReference").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                      
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Media URL" ItemStyle-Width="12%" Visible="true" ItemStyle-HorizontalAlign="Center" >
                                        <ItemTemplate>
                                            <asp:Label ID="lblMediaURL" Text='<%#(Eval("MediaURL").ToString()) %>' 
                                                runat="server" />
                                        </ItemTemplate>
                                      
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="More Information" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" >
                                        <ItemTemplate>
                                            <asp:Label ID="lblMoreInfo" Text='<%#(Eval("MoreInfo").ToString()) %>' runat="server" />
                                        </ItemTemplate>
                                      
                                        
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Created By" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center" >
                                        <ItemTemplate>
                                            <asp:Label ID="lblCreatedBy" Text='<%#(Eval("CreatedBy").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>

                                        <ItemStyle HorizontalAlign="Center" Width="10%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Created Date" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" >
                                        <ItemTemplate>
                                            <asp:Label ID="lblCreatedDate" Text='<%#(Eval("CreatedDate").ToString()) %>' 
                                                runat="server" />
                                        </ItemTemplate>
                                    
                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
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

						<div style="padding-top: 20px;">
							
						</div>
					</div>

                </div>

</asp:Panel>


             <cc1:ModalPopupExtender ID="mpAdminRemarks" runat="server" PopupControlID="pnlAdminRemarks" TargetControlID="btnCloseAdminRemarks"
                Enabled="true" CancelControlID="btnCloseAdminRemarks" DropShadow="true" BehaviorID="ModalPopupExtenderBehavior25" RepositionMode="RepositionOnWindowResizeAndScroll"
                BackgroundCssClass="modalBackground">
            </cc1:ModalPopupExtender>

            <asp:Panel ID="pnlAdminRemarks" runat="server" CssClass="modalPopup" align="center" Style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 50px !important; display: none; font-family: 'Times New Roman'; font-size: medium" BorderStyle="Solid" BorderWidth="1px">

                <div style="border-radius: 50px !important; background-color: #ffffff !important; padding-left: 7px; padding-top: 7px; float: left; padding-right: 7px; width: 60%; padding-bottom: 7px; position: fixed; z-index: 100001; left: 20%; top: 64.5px; border: solid; border-color: silver; padding-bottom: 20px">
                    <div class="row" style="height: 55px">

                        <div class="pull-left" style="border-radius: 50px !important; padding-left: 20px;">
                            <img src="../masters/images/ec.png" style="height: 30px;" />
                            <img src="../masters/images/ec1.png" style="height: 50px;" />

                        </div>
                        <div>
                        </div>
                    </div>

                    <div class="modal-header panl14" style="font-family: system-ui;">

                        <div class="pull-left">

                            <h4>
                                <asp:Label ID="Label77" class="subpnlhdg" runat="server" Text="Admin Remarks"></asp:Label>
                                 
                            </h4>

                        </div>


                        <div class="pull-right">
                             <button type="button" class="btn btn-close"  aria-label="Close" runat="server" id="btnCloseAdminRemarks"/>
                         <%--   <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="../Icons/deleteData.png" Style="padding-top: 10%;" /></td>--%>
                      </div>

                  </div>
					<div class="popupmaxheight">
						<table class="table table-condensed" style="width: 100%">

                            <tr>

                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label78" runat="server" Text="Admin Remarks"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 15%" class="no-border">
                                    <asp:TextBox ID="txtAdminRemarks" CssClass="textBox1 form-control" runat="server" />
                                </td>
                                   <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                      <asp:LinkButton ID="btnSaveAdminRemakrs" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="btnSaveAdminRemakrs_Click"><i class="fa fa-floppy-o" aria-hidden="true" title="Save"></i></asp:LinkButton>
                                      </td>
                              
                            </tr>
                          
                          
                      
							
						</table>
                          <div id="Div4" runat="server" style="overflow-y: auto; height: calc(100vh - 500px); overflow-x: hidden">
                            <asp:GridView ID="gdvAdminRemarksHistory" runat="server" AutoGenerateColumns="False"
                                CellSpacing="0" BorderWidth="0" AllowSorting="True" EmptyDataText="No Data Found" 
                                class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                                <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                <Columns>

                                    <asp:TemplateField HeaderText="Admin Remarks" ItemStyle-Width="25%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" >
                                        <ItemTemplate>
                                            <asp:Label ID="lblAdminHistory" Text='<%#(Eval("AdminHistory").ToString()) %>'
                                                runat="server" />
                                        
                                        </ItemTemplate>

                                        <HeaderStyle HorizontalAlign="Center" />

                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Update Date" ItemStyle-Width="12%" Visible="True" ItemStyle-HorizontalAlign="Center"  HeaderStyle-HorizontalAlign="Center"> 
                                        
                                        <ItemTemplate>
                                            <asp:Label ID="lblUpdateDate" Text='<%#(Eval("UpdatedDate").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                      
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Updated By" ItemStyle-Width="12%" Visible="true" ItemStyle-HorizontalAlign="Center"  HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblUpdatedBy" Text='<%#(Eval("UpdatedBy").ToString()) %>' 
                                                runat="server" />
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

                          
                        </div>

						<div style="padding-top: 20px;">
							
						</div>
					</div>

                </div>

</asp:Panel>

                     <div class="modal fade" id="mpShowhistory" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content" style="width: 300%;right: 100%;">
                                    <div class="modal-header">
                                        <h3 class="modal-title" id="H1">History</h3>
                                        <button type="button" class="btn btn-close" data-bs-dismiss="modal" aria-label="Close">
                                            
                                        </button>
                                    </div>
                                    <div class="modal-body">


                                        <asp:GridView ID="gdvHistory" runat="server" AutoGenerateColumns="False"
                                            CellSpacing="0" BorderWidth="0" AllowSorting="True" EmptyDataText="No Data Found"
                                            class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                                            <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                            <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                            <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                            <Columns>

                                                <asp:TemplateField HeaderText="Product Type" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblProductType" Text='<%#(Eval("ProductType").ToString()) %>'
                                                            runat="server" />

                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Rvenue Status" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblRevenueStatus" Text='<%#(Eval("RevenueStatus").ToString()) %>'
                                                            runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Sub Stage" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSubStage" Text='<%#(Eval("SubStage").ToString()) %>' runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Sub Stage Date" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSubStageDate" Text='<%#(Eval("SubStageDate").ToString()) %>' runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="CRM Remarks" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCRMRemarks" Text='<%#(Eval("CRMRemarks").ToString()) %>' runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Quotation No" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblQuotationNo" Text='<%#(Eval("QuotationNo").ToString()) %>'
                                                            runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                  <asp:TemplateField HeaderText="Quotation Date" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblQuotationDate" Text='<%#(Eval("QuotationDate").ToString()) %>'
                                                            runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                  <asp:TemplateField HeaderText="Revenue Amount" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblFORMATVALUE" Text='<%#(Eval("FORMATVALUE").ToString()) %>'
                                                            runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Updated BY" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblLastUpdatedBy" Text='<%#(Eval("LastUpdatedBy").ToString()) %>'
                                                            runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                
                                                <asp:TemplateField HeaderText="Updated Date" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblLastUpdateDate" Text='<%#(Eval("LastUpdateDate").ToString()) %>'
                                                            runat="server" />
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

                                    </div>

                                </div>
                            </div>
                        </div>
         
                 <div class="modal fade" id="mpOthersUpdates" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content" style="width: 300%;right: 100%;">
                                            <div class="modal-header">
                                                <h3 class="modal-title" id="H2">Others Updates</h3>
                                                <button type="button" class="btn btn-close" data-bs-dismiss="modal" aria-label="Close">
                                                   
                                                </button>
                                            </div>
                                            <div class="modal-body">

                                                <asp:GridView ID="gdvfinalpriceUpdate" runat="server" EmptyDataText="No Other Updates Found.." AutoGenerateColumns="False" CellSpacing="0" BorderWidth="0" AllowSorting="True"
                                                    class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4">
                                                    <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                                    <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                                   <Columns>
                                                         <asp:TemplateField HeaderText="Salesman Overview" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                    <HeaderStyle CssClass="salesmanUpdates" />
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSOverview" Text='<%#(Eval("SalesmanOverview").ToString()) %>'
                                                            runat="server" />

                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Salesman Remarks" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                    <HeaderStyle CssClass="salesmanUpdates" />
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSRemarks" Text='<%#(Eval("SalesmanRemarks").ToString()) %>'
                                                            runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Salesman Win Perc" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                    <HeaderStyle CssClass="salesmanUpdates" />
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSWinPerc" Text='<%#(Eval("SalesmanWinPerc").ToString()) %>' runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Salesman Update Date" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                    <HeaderStyle CssClass="salesmanUpdates" />
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSUpdatedDate" Text='<%#(Eval("SalesmanUpdateDate").ToString()) %>'
                                                            runat="server" />

                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Sales Manager Overview" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                            <HeaderStyle CssClass="salesmanagerUpdates" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSMOverview" Text='<%#(Eval("SMOverview").ToString()) %>'
                                                                    runat="server" />

                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Sales Manager Remarks" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                            <HeaderStyle CssClass="salesmanagerUpdates" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSMRemarks" Text='<%#(Eval("SMRemarks").ToString()) %>'
                                                                    runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Sales Manager Win Perc" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                            <HeaderStyle CssClass="salesmanagerUpdates" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSMWinPerc" Text='<%#(Eval("SMWinPerc").ToString()) %>' runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Sales Manager Update Date" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                            <HeaderStyle CssClass="salesmanagerUpdates" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSMUpdatedDate" Text='<%#(Eval("SMUpdatedDate").ToString()) %>'
                                                                    runat="server" />

                                                            </ItemTemplate>
                                                        </asp:TemplateField>


                                                        <asp:TemplateField HeaderText="Marketing  Overview" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                          <HeaderStyle CssClass="marketingUpdates" />
                                                              <ItemTemplate>
                                                                <asp:Label ID="lblMTOverview" Text='<%#(Eval("MTOverview").ToString()) %>'
                                                                    runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Marketing Remarks" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                         <HeaderStyle CssClass="marketingUpdates" />
                                                               <ItemTemplate>
                                                                <asp:Label ID="lblMTRemarks" Text='<%#(Eval("MTRemarks").ToString()) %>' runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Marketing Win Perc" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                         <HeaderStyle CssClass="marketingUpdates" />
                                                               <ItemTemplate>
                                                                <asp:Label ID="lblMTWinPerc" Text='<%#(Eval("MTWinPerc").ToString()) %>' runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Marketing Update Date" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                           <HeaderStyle CssClass="marketingUpdates" />
                                                             <ItemTemplate>
                                                                <asp:Label ID="lblMTUpdateDate" Text='<%#(Eval("MTUpdateDate").ToString()) %>' runat="server" />
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



        </ContentTemplate>
      
        <Triggers>
            <asp:PostBackTrigger ControlID="btnExport" />
        </Triggers>
        
    </asp:UpdatePanel>
    
    <asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="UpdatePanel1" runat="server">
        <ProgressTemplate>

            <asp:Panel ID="pnlBackGround1" runat="server" CssClass="popup-div-background" style="z-index:1000001" >
                <div class="CenterPB" style="height: 40px; width: 60px;" >
                    <asp:Image ID="Image2" runat="server" ImageUrl="~/Icons/loader.gif" Height="35px"
                        Width="35px" />
                    Loading ...
                </div>
            </asp:Panel>


        </ProgressTemplate>
    </asp:UpdateProgress>
</asp:Content>
