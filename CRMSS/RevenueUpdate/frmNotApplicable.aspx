<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="frmNotApplicable.aspx.cs" Inherits="CRMSupport_frmNotApplicable" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
         <link rel="stylesheet" href="../Theme/Modified/modifiedcss.css" type="text/css" />
     <link rel="stylesheet" href="../Template/assets/vendor/libs/toaster/toaster.css" type="text/css" />
     <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>

  
    <script src="../js/jquery-1.11.2.min.js"></script>
    <script src="../CustomSearch/js/jquery-customselect-1.9.1.js"></script>



  
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
    
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always" >
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
            <asp:Panel ID="pnlDetails" runat="server" Visible="true" CssClass="GridviewDiv">

                   <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">

                        <asp:Panel ID="Panel1" runat="server" CssClass="pnlheading">
                           
                             
                            <div class="card-header pnlheading">
                               
                                    <h3>
                                        <asp:Label ID="Label13" ForeColor="White" Font-Bold="true" runat="server" Text="PT UPDATE"></asp:Label>
                                        <asp:HiddenField ID="hfdSummaryRowCount" Value="50" runat="server" />
                                        
                                    </h3>

                                
                                </div>

                           
                        </asp:Panel>




                        <div class="card-block">
                            <div class="row">
                                <div class="pull-right">
                                    <label class="form-label">
                               
                           Company:
                                        <asp:DropDownList ID="ddlCompany" runat="server" CssClass="textBox11 form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlCompany_SelectedIndexChanged" />
                                        </label>
                                    </div>
                                &nbsp;&nbsp;  &nbsp;&nbsp;
                                <div class="pull-right">
                                    <label class="form-label">
                                        Manager:
                                   
                                        <asp:DropDownList ID="ddlManager" runat="server"  CssClass="textBox11 form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlManager_SelectedIndexChanged" />
                                        </label>
                                    </div>
                                &nbsp;&nbsp;  &nbsp;&nbsp;
                                <div class="pull-right">
                                    <label class="pull-right">
                                 Salesman:
                                        <asp:DropDownList ID="ddlSalesman" runat="server" CssClass="textBox11 form-control" />
                                        </label>
                                    </div>
                                &nbsp;&nbsp;  &nbsp;&nbsp;
                                <div class="pull-right">
                                    <label class="form-label">
                                        Opportunity:
                                   
                                        <asp:TextBox ID="txtoptNumber" runat="server" CssClass="textBox11 form-control" />
                                        </label>
                                    </div>
                                &nbsp;&nbsp;  &nbsp;&nbsp;
                                <div class="pull-right">
                                    <label class="form-label">
                                        Substage:
                               
                                        <asp:DropDownList ID="ddlSubStage" runat="server" CssClass="textBox11 form-control" />
                                        </label>
                                    </div>
                                &nbsp;&nbsp;  &nbsp;&nbsp;
                                <div class="pull-right">
                                    <label class="form-label">
                                        UpdateAging:
                                 
                                        <asp:DropDownList ID="ddlUpdateAging" runat="server" CssClass="textBox11 form-control">
                                              <asp:ListItem Text="NOT UPDATED" Value="16" Selected="True"></asp:ListItem>
                                                    <asp:ListItem Text="UPDATED" Value="15"></asp:ListItem>
                                        </asp:DropDownList>
                                        </label>
                                    </div>
                                  <div class="pull-right">
                                    <label class="form-label">
                                        Product:
                               
                                        <asp:DropDownList ID="ddlProduct" runat="server" CssClass="textBox11 form-control" />
                                        </label>
                                    </div>


                                &nbsp;&nbsp;  &nbsp;&nbsp;
                                   <div class="pull-right" style="padding-top:1%;">
                                        <asp:LinkButton ID="btnsearch" runat="server" OnClick="btnsearch_Click"
                                             Style="text-align: center;" CssClass="btn rounded-pill btn-icon btn-round">
                                             <i class="fa fa-search" aria-hidden="true" title="Search"></i>
                                        </asp:LinkButton>
                                     &nbsp;&nbsp;  &nbsp;&nbsp;

                                       <asp:LinkButton ID="lnksearch" runat="server" OnClick="lnksearch_Click" Style="text-align: center;" CssClass="btn rounded-pill btn-icon btn-round">
                                           <i class="fa fa-file-excel-o" aria-hidden="true" title="Search"></i>
                                       </asp:LinkButton>
                                       </div>
                                </div>
                                <div class="row">
                                    <asp:Label ID="lblRowCount" runat="server" Text=""  ForeColor="Red"></asp:Label>
                                    &nbsp;&nbsp;  &nbsp;&nbsp;
                               
                                      <asp:Label ID="lblError" Text="" runat="server" Font-Size="Medium" ForeColor="Red" Font-Bold="true" Font-Names="Times New Roman" />
                            

                            </div>

                             <div id="Div3" runat="server" style="overflow-y: auto; height: calc(100vh - 280px); overflow-x: hidden">
                                <asp:GridView ID="gdvOpt" runat="server" AutoGenerateColumns="False" OnRowCommand="gdvOpt_RowCommand1" CellSpacing="0" BorderWidth="0" OnRowDataBound="gdvOpt_RowDataBound"
                                    AllowSorting="True" EmptyDataText="No Data Found" OnRowUpdating="gdvOpt_RowUpdating"
                                    OnSorting="gdvOpt_Sorting"
                                    class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                                      <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                    <Columns>

                                        <asp:TemplateField HeaderText="Opportunity Number" ItemStyle-Width="5%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="OpportunityNumber">
                                            <ItemTemplate>
                                                <asp:Label ID="lblOptNumber" Text='<%#(Eval("OpportunityNumber").ToString()) %>'
                                                    runat="server" />
                                                <asp:HiddenField ID="hfdOpportunity1" runat="server" Value='<%#(Eval("OpportunityNumber").ToString()) %>' />
                                                <asp:HiddenField ID="hfdRevenueId1" runat="server" Value='<%#(Eval("RevenueROWID").ToString()) %>' />
                                                <asp:HiddenField ID="hfdProductType1" runat="server" Value='<%#(Eval("ProductType").ToString()) %>' />
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" Width="5%" />
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Name" ItemStyle-Width="17%" Visible="True" SortExpression="Name">
                                            <ItemTemplate>
                                                <asp:Label ID="lblToOrgInvName" Text='<%#(Eval("Name").ToString()) %>'
                                                    runat="server" />
                                            </ItemTemplate>
                                            <ItemStyle Width="17%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="MEP Contractor" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="MEPContractor">
                                            <ItemTemplate>
                                                <asp:Label ID="lblMEPContractor" Text='<%#(Eval("MEPContractor").ToString()) %>'
                                                    runat="server" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="5%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Owner" ItemStyle-Width="10%" Visible="True" SortExpression="Owner">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCustomerName" Text='<%#(Eval("Owner").ToString()) %>' runat="server" />
                                            </ItemTemplate>
                                            <ItemStyle Width="10%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Status" ItemStyle-Width="5%" Visible="false" ItemStyle-HorizontalAlign="Center" SortExpression="StatusCode">
                                            <ItemTemplate>
                                                <asp:Label ID="lblToSubInvCode" Text='<%#(Eval("StatusCode").ToString()) %>'
                                                    runat="server" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="5%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Sub Stage" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="SalesStageName">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSubStage" text='<%#(Eval("SubStage").ToString()) %>' runat="server"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="5%" />
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Sales Stage" ItemStyle-Width="5%" Visible="false" ItemStyle-HorizontalAlign="Center" SortExpression="SalesStageName">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSalesStageName" Text='<%#(Eval("SalesStageName").ToString()) %>'
                                                    runat="server" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="5%" />
                                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Salesman Remarks" ItemStyle-Width="10%" Visible="false" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSalesmanRemarks1" Text='<%#(Eval("SalesmanRemarks").ToString()) %>'
                                                    runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>


                                         <asp:TemplateField HeaderText="Update Aging" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="UpdateAging">
                                            <ItemTemplate>
                                                <asp:Label ID="lblUpdateAging" Text='<%#(Eval("UpdateAging").ToString()) %>'
                                                    runat="server" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="5%" />
                                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="PT Overview" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:HiddenField runat="server" ID="hfdOverview1" Value='<%#(Eval("PTLastUpdate").ToString()) %>' />
                                                <asp:DropDownList ID="ddlOverview1" runat="server" DataTextField=<%#(Eval("PTLastUpdate").ToString()) %>>
                                                    <asp:ListItem Text="SELECT" Value="-"></asp:ListItem>
                                                    <asp:ListItem Text="ON TRACK" Value="ON TRACK"></asp:ListItem>
                                                    <asp:ListItem Text="SECURED" Value="SECURED"></asp:ListItem>
                                                    <asp:ListItem Text="UNDER RISK" Value="UNDER RISK"></asp:ListItem>
                                                    <asp:ListItem Text="EARLY TO JUDGE" Value="EARLY TO JUDGE"></asp:ListItem>
                                                    <asp:ListItem Text="LOST" Value="LOST"></asp:ListItem>
                                                    <asp:ListItem Text="OTHERS" Value="OTHERS"></asp:ListItem>
                                                </asp:DropDownList>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="PT Remaks" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtRemarks1" runat="server" Text='<%#(Eval("PTRemarks").ToString()) %>'/>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Win Percentage" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                               <asp:HiddenField ID="hfdWinPerc" Value='<%#(Eval("PTWinPerc").ToString()) %>' runat="server" />
                                          <asp:DropDownList ID="txtWin" runat="server"  Width="70px">
                                              <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                              <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                              <asp:ListItem Text="20" Value="20"></asp:ListItem>
                                              <asp:ListItem Text="30" Value="30"></asp:ListItem>
                                              <asp:ListItem Text="40" Value="40"></asp:ListItem>
                                              <asp:ListItem Text="50" Value="50"></asp:ListItem>
                                              <asp:ListItem Text="60" Value="60"></asp:ListItem>
                                              <asp:ListItem Text="70" Value="70"></asp:ListItem>
                                              <asp:ListItem Text="80" Value="80"></asp:ListItem>
                                              <asp:ListItem Text="90" Value="90"></asp:ListItem>
                                              <asp:ListItem Text="100" Value="100"></asp:ListItem>
                                              </asp:DropDownList>
                                            </ItemTemplate>
                                        </asp:TemplateField> 

                                         <asp:TemplateField HeaderText="Revenue Amount" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="AMOUNTSORT">
                                            <ItemTemplate>
                                               <asp:Label ID="lblRevenueAmount" Text='<%#(Eval("FORMATVALUE").ToString())%>'
                                                    runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="View" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="OpportunityNumber">
                                            <ItemTemplate>
                                                
                                                <asp:LinkButton ID="lblView" Text='View' CommandArgument='<%#Eval("OpportunityNumber")%>' CommandName="View" runat="server"  CssClass="btn rounded-pill btn-icon btn-round">
                                                    <i class="fa fa-eye" title="VIEW"></i></asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="5%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Save" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="OpportunityNumber">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lblsave" Text='save' CommandName="Update" runat="server" CssClass="btn rounded-pill btn-icon btn-round">
                                                     <i class="fa fa-floppy-o" title="Save"></i>
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField> 

                                        <asp:TemplateField HeaderText="History" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>

                                                <asp:LinkButton ID="lbview" runat="server" Style="text-align: center" CommandName="PThistory"  CssClass="btn rounded-pill btn-icon btn-round" CommandArgument='<%#(Eval("RevenueRowId").ToString())%>'><i class="fa fa-history" title="PT History"></i></asp:LinkButton>

                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="4%" />
                                        </asp:TemplateField>


                                        <asp:TemplateField HeaderText="Others" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="OpportunityNumber">
                                            <ItemTemplate>
                                                 <asp:LinkButton ID="lblOthers" runat="server" Style="text-align: center" CommandName="Others"  CssClass="btn rounded-pill btn-icon btn-round" CommandArgument='<%#Eval("RevenueRowId") %>'>
                                                <i class="fa fa-info-circle" title="Others"></i></asp:LinkButton>
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
                                  <div class="row">
                                <asp:Button runat="server" ID="btnLoadMoreSummary" OnClick="btnLoadMoreSummary_Click" Width="100%" Text="Load More"></asp:Button>
                            </div>
                            </div>
                        </div>
                    </div>
              

            </asp:Panel>


            <asp:Panel ID="pnlEditDetails" runat="server" Visible="false">
               <div id="Div1">
                    <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">
                        <asp:Panel ID="Panel2" runat="server" CssClass="pnlheading">
                            <div class="card-header pnlheading">
                                <div class="pull-left">
                                <h3>
                                    <asp:Label ID="Label2" ForeColor="White" Font-Bold="true" runat="server" Text="PT UPDATE"></asp:Label>

                                </h3>
                                    </div>
                                 <div class="pull-right" >
                                
                                <asp:LinkButton ID="lnkback" runat="server" OnClick="lnkback_Click" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" Visible="true" >
                                     <i class="fa fa-arrow-circle-left" aria-hidden="true" title="Go Back"></i>
                                </asp:LinkButton>
                                </div>

                            </div>
                        </asp:Panel>
                        <div class="card-block">
                            <asp:Panel ID="Panel3" runat="server" CssClass="pnlsubheading">
                                <div class="pull-left">
                                    <h5>
                                        <asp:Label ID="lblh" class="panel-heading" Style="color: white;" runat="server" Text="Opportunity Details"></asp:Label></h5>
                                </div>

                            </asp:Panel>
                            <table class="table table-condensed" style="width: 100%">

                                <tr>
                                     <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border">
                                        <asp:Label ID="Label8" runat="server" Text="Project Number"></asp:Label>
                                     
                                    </td>
                                    <td style="padding: 3px 5px; width: 8%" class="no-border">
                                        <asp:TextBox ID="txtPrjNo" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>

                                    </td>
                                    <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                     <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border">
                                        <asp:Label ID="Label19" runat="server" Text="Opportunity Number"></asp:Label>
                                        <asp:HiddenField ID="hfdOptId" runat="server" />
                                    </td>
                                     <td style="padding: 3px 5px; width: 8%" class="no-border">
                                        <asp:TextBox ID="txtOptNo" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>

                                    </td>
                                     <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                     <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                        <asp:Label ID="Label20" runat="server" Text="Name"></asp:Label>
                                    </td>

                                    <td style="padding: 3px 5px; width: 10%" class="no-border">
                                        <asp:TextBox ID="txtName" runat="server" CssClass="textBox1 form-control " Enabled="false" Font-Bold="True"></asp:TextBox>
                                    </td>
                                    <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                     <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                        <asp:Label ID="Label9" runat="server" Text="Client"></asp:Label>
                                    </td>

                                   <td style="padding: 3px 5px; width: 8%" class="no-border">
                                        <asp:TextBox ID="txtclient" runat="server" CssClass="textBox1 form-control " Enabled="false" Font-Bold="True"></asp:TextBox>
                                 </td>
                                    </tr>

                                   
                                   
                                <tr>
                                         <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border">
                                        <asp:Label ID="Label1" runat="server" Text="Developer Owner/Client"></asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px; width: 8%" class="no-border">
                                        <asp:TextBox ID="txtdeveloper" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="2" Enabled="false"></asp:TextBox>

                                    </td>
                                     <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>

                                     <td style="padding: 3px 5px;" class="label-alignment no-border">
                                        <asp:Label ID="Label7" runat="server" Text="Main Contractor"></asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px;" class="no-border">
                                        <asp:TextBox ID="txtMainContractor" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="2" Enabled="false"></asp:TextBox>
                                    </td>

                                    
                                    <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>

                                     <td style="padding: 3px 5px;" class="label-alignment no-border">
                                        <asp:Label ID="Label5" runat="server" Text="Main Contractor Owner"></asp:Label>
                                    </td>
                                     <td style="padding: 3px 5px;" class="no-border">
                                        <asp:TextBox ID="txtMCOwner" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="2" Enabled="false"></asp:TextBox>
                                    </td>
                                      <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>


                                     <td style="padding: 3px 5px;" class="label-alignment no-border">
                                        <asp:Label ID="Label6" runat="server" Text="MEP Consultant"></asp:Label>
                                    </td>
                                      <td style="padding: 3px 5px;" class="no-border">
                                        <asp:TextBox ID="txtMEPConsultant" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="2" Enabled="false"></asp:TextBox>
                                    </td>



                                </tr>
                                <tr>
                                     <td style="padding: 3px 5px;" class="label-alignment no-border">
                                        <asp:Label ID="Label4" runat="server" Text="Marketing"></asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px;" class="no-border">
                                        <asp:TextBox ID="txtMarketing" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="2" Enabled="false"></asp:TextBox>

                                    </td>

                                    <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                    <td style="padding: 3px 5px;" class="label-alignment no-border">
                                        <asp:Label ID="Label3" runat="server" Text="MEP Contractor"></asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px;" class="no-border">
                                        <asp:TextBox ID="txtMEPContractor" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="2" Enabled="false"></asp:TextBox>

                                    </td>
                                     <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                    <td style="padding: 3px 5px;" class="label-alignment no-border">
                                        <asp:Label ID="Label10" runat="server" Text="SalesMan"></asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px;" class="no-border">
                                        <asp:TextBox ID="txtSalesman" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="2" Enabled="false"></asp:TextBox>

                                    </td>
                                    
                                   
                                   

                                </tr>
                                <tr>
                                    


                                    <td style="padding: 3px 5px;" class="label-alignment no-border">
                                        <asp:Label ID="Label22" runat="server" Text="Sales Stage"></asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px;" class="no-border">
                                        <asp:TextBox ID="txtSalesStage" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="2" Enabled="false"></asp:TextBox>
                                    </td>
                                    <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                    <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                        <asp:Label ID="Label11" runat="server" Text="Status"></asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px; width: 8%" class="no-border">
                                        <asp:TextBox ID="txtStatus" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
                                    </td>
                                </tr>





                              
                            </table>

                               <asp:Panel ID="Panel4" runat="server" CssClass="pnlsubheading">
                                <div class="pull-left">
                                    <h5>
                                        <asp:Label ID="Label14" class="panel-heading" Style="color: white;" runat="server" Text="Revenue Details"></asp:Label></h5>
                                </div>

                            </asp:Panel>


                            <%-- REvenue details --%>
                            <div runat="server" style="overflow-x:auto">
                            <asp:GridView ID="gdvPTupdate" runat="server" AutoGenerateColumns="False" OnRowCommand="gdvPTupdate_RowCommand"
                                    AllowSorting="True" EmptyDataText="No Data Found"
                                OnRowUpdating="gdvPTupdate_RowUpdating" OnRowEditing="gdvPTupdate_RowEditing"
                                class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                                  <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                     <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                     <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                <Columns>
                                        <asp:TemplateField HeaderText="Product Type" ItemStyle-Width="15%" Visible="True">
                                            <ItemTemplate>
                                                <asp:Label ID="lblProductType" Text='<%#(Eval("ProductType").ToString()) %>'
                                                    runat="server" />
                                                <asp:HiddenField ID="hfdRevenueRowId" Value='<%#(Eval("RevenueRowId").ToString()) %>' runat="server" />
                                                <asp:HiddenField ID="hfdOpportunityNumber" Value='<%#(Eval("OpportunityNumber").ToString()) %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Revenue Status" ItemStyle-Width="8%" Visible="True" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Label ID="lblRevenueStatus" Text='<%#(Eval("RevenueStatus").ToString()) %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Sub Stage" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSubStage" Text='<%#(Eval("SubStage").ToString()) %>'
                                                    runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Salesman Remarks" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSalesmanRemarks" Text='<%#(Eval("SalesmanRemarks").ToString()) %>'
                                                    runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="PT Owner" ItemStyle-Width="8%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtPTOwner" Text="" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                       

                                        <asp:TemplateField HeaderText="PT Overview" ItemStyle-Width="5%" Visible="false" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:DropDownList ID="ddlOverview" runat="server">
                                                    <asp:ListItem Text="SELECT" Value="-" Selected="True"></asp:ListItem>
                                                    <asp:ListItem Text="ON TRACK" Value="ON TRACK"></asp:ListItem>
                                                    <asp:ListItem Text="SECURED" Value="SECURED"></asp:ListItem>
                                                    <asp:ListItem Text="UNDER RISK" Value="UNDER RISK"></asp:ListItem>
                                                    <asp:ListItem Text="EARLY TO JUDGE" Value="EARLY TO JUDGE"></asp:ListItem>
                                                    <asp:ListItem Text="LOST" Value="LOST"></asp:ListItem>
                                                    <asp:ListItem Text="OTHERS" Value="OTHERS"></asp:ListItem>
                                                </asp:DropDownList>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                     <asp:TemplateField HeaderText="PT Remaks" ItemStyle-Width="10%" Visible="false" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtRemarks" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Win %" ItemStyle-Width="5%" Visible="false" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                               <asp:TextBox ID="txtWin" runat="server" onfocus="Focus(this.id,'0')" onblur="Blur(this.id,'0')"  Width="60px"/>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                           <asp:TemplateField HeaderText="Revenue Amount" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                               <asp:Label ID="lblRevenueAmount" Text='<%#(Eval("FORMATVALUE").ToString())%>'
                                                    runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Update" Visible="false">

                                        <ItemStyle Font-Size="Small" HorizontalAlign="Center" Width="4%" />
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lblUpdate" runat="server" Text='' CssClass="btn rounded-pill btn-icon btn-round"
                                                CommandName="Update" Style="text-align: center"><i class="fa fa-floppy-o" title="Save"></i></asp:LinkButton>
                                        </ItemTemplate>

                                    </asp:TemplateField>

                                        <asp:TemplateField HeaderText="History" ItemStyle-Width="10%" Visible="false" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>

                                                <asp:LinkButton ID="lbview" runat="server" Style="text-align: center" CommandName="PThistory"  CssClass="btn rounded-pill btn-icon btn-round" CommandArgument='<%#(Eval("RevenueRowId").ToString())%>'><i class="fa fa-history" title="PT History"></i></asp:LinkButton>

                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="4%" />
                                        </asp:TemplateField>

                                     <asp:TemplateField HeaderText="Others" ItemStyle-Width="10%" Visible="false" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>

                                                <asp:LinkButton ID="btnothers" runat="server" Style="text-align: center" CommandName="Others"  CssClass="btn rounded-pill btn-icon btn-round" CommandArgument='<%#(Eval("RevenueRowId").ToString())%>'><i class="fa fa-info-circle" title="Others"></i></asp:LinkButton>
                                               
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="4%" />
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
                <div id="Div5">

                          
                         
                            <%-- PT History Popup --%>

                             
                   

                            <%-- End --%>



                    <%-- Others details popup --%>


                    <div class="modal fade" id="mpOthersoverview" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content"  style="width: 280%;right:90%;" >
                                <div class="modal-header">
                                    <h3 class="modal-title" id="H3">Others Updates</h3>
                                    <button type="button" class="btn btn-close" data-bs-dismiss="modal" aria-label="Close">
                                   
                                    </button>
                                </div>
                                <div class="modal-body">

                                    <asp:GridView ID="gdvsalesmanageroverview" runat="server" EmptyDataText="No History Found..." AutoGenerateColumns="False" CellSpacing="0" BorderWidth="0" AllowSorting="True"
                                                     class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4">
                                                             
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
                                               <asp:TemplateField HeaderText="Salesman Overview" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                    <HeaderStyle CssClass="salesmanUpdates" />
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSMOverview" Text='<%#(Eval("SalesmanOverview").ToString()) %>'
                                                            runat="server" />

                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Salesman Remarks" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                    <HeaderStyle CssClass="salesmanUpdates" />
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSMRemarks" Text='<%#(Eval("SalesmanRemarks").ToString()) %>'
                                                            runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Salesman Win Perc" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                    <HeaderStyle CssClass="salesmanUpdates" />
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSMWinPerc" Text='<%#(Eval("SalesmanWinPerc").ToString()) %>' runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Salesman Update Date" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                    <HeaderStyle CssClass="salesmanUpdates" />
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSMUpdatedDate" Text='<%#(Eval("SalesmanUpdateDate").ToString()) %>'
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

                                            <asp:TemplateField HeaderText="Marketing Overview" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
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
                    </div>
                </asp:Panel>

                    <%-- End others popup --%>

                  <div class="modal fade" id="mpOthersoverview1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content"  style="width: 280%;right:90%;" >
                                <div class="modal-header">
                                    <h3 class="modal-title" id="H5">Others Updates</h3>
                                    <button type="button" class="btn btn-close" data-bs-dismiss="modal" aria-label="Close">
                                   
                                    </button>
                                </div>
                                <div class="modal-body">

                                    <asp:GridView ID="GdvOthers" runat="server" EmptyDataText="No Data Found..." AutoGenerateColumns="False" CellSpacing="0" BorderWidth="0" AllowSorting="True"
                                                     class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4">
                                                             
                                    <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                     <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                     <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="Product Type" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblProductType1" Text='<%#(Eval("ProductType").ToString()) %>'
                                                        runat="server" />

                                                </ItemTemplate>
                                            </asp:TemplateField>
                                              <asp:TemplateField HeaderText="Salesman Overview" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                    <HeaderStyle CssClass="salesmanUpdates" />
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSMOverview" Text='<%#(Eval("SalesmanOverview").ToString()) %>'
                                                            runat="server" />

                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Salesman Remarks" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                    <HeaderStyle CssClass="salesmanUpdates" />
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSMRemarks" Text='<%#(Eval("SalesmanRemarks").ToString()) %>'
                                                            runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Salesman Win Perc" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                    <HeaderStyle CssClass="salesmanUpdates" />
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSMWinPerc" Text='<%#(Eval("SalesmanWinPerc").ToString()) %>' runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Salesman Update Date" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                    <HeaderStyle CssClass="salesmanUpdates" />
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSMUpdatedDate" Text='<%#(Eval("SalesmanUpdateDate").ToString()) %>'
                                                            runat="server" />

                                                    </ItemTemplate>
                                                </asp:TemplateField>


                                            <asp:TemplateField HeaderText="Sales Manager Overview" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <HeaderStyle CssClass="salesmanagerUpdates" />
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSMOverview1" Text='<%#(Eval("SMOverview").ToString()) %>'
                                                        runat="server" />

                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Sales Manager Remarks" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <HeaderStyle CssClass="salesmanagerUpdates" />
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSMRemarks1" Text='<%#(Eval("SMRemarks").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Sales Manager Win Perc" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <HeaderStyle CssClass="salesmanagerUpdates" />

                                                <ItemTemplate>
                                                    <asp:Label ID="lblSMWinPerc1" Text='<%#(Eval("SMWinPerc").ToString()) %>' runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Sales Manager Update Date" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <HeaderStyle CssClass="salesmanagerUpdates" />
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSMUpdatedDate1" Text='<%#(Eval("SMUpdatedDate").ToString()) %>'
                                                        runat="server" />

                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Marketing Overview" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <HeaderStyle CssClass="marketingUpdates" />
                                                <ItemTemplate>
                                                    <asp:Label ID="lblMTOverview1" Text='<%#(Eval("MTOverview").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Marketing Remarks" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <HeaderStyle CssClass="marketingUpdates" />
                                                <ItemTemplate>
                                                    <asp:Label ID="lblMTRemarks1" Text='<%#(Eval("MTRemarks").ToString()) %>' runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Marketing Win Perc" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <HeaderStyle CssClass="marketingUpdates" />
                                                <ItemTemplate>
                                                    <asp:Label ID="lblMTWinPerc1" Text='<%#(Eval("MTWinPerc").ToString()) %>' runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Marketing Update Date" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <HeaderStyle CssClass="marketingUpdates" />
                                                <ItemTemplate>
                                                    <asp:Label ID="lblMTUpdateDate1" Text='<%#(Eval("MTUpdateDate").ToString()) %>' runat="server" />
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

                        
                    <div class="modal fade" id="mpShowPThistory" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content" style="width:200%;right:50%;">
                                            <div class="modal-header">
                                                <h3 class="modal-title" id="H2">PT History</h3>
                                               <button type="button" class="btn btn-close" data-bs-dismiss="modal" aria-label="Close">
                                                
                                                </button>
                                            </div>
                                            <div class="modal-body">

                                               
                                                <asp:GridView ID="gdvPTHistory" runat="server" EmptyDataText="No History Found..." AutoGenerateColumns="False" CellSpacing="0" BorderWidth="0" AllowSorting="True"
                                                    class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4">
                                                    <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                     <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                     <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                                    <Columns>

                                                        <asp:TemplateField HeaderText="Product Type" ItemStyle-Width="5%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblProductType" Text='<%#(Eval("ProductType").ToString()) %>'
                                                                    runat="server" />
                                                                <asp:HiddenField ID="hfdOPTNumber" runat="server" Value='<%#(Eval("OptNumber").ToString()) %>' />
                                                                <asp:HiddenField ID="hfdRevLineId" runat="server" Value='<%#(Eval("RevenueROWID").ToString()) %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="PT Confirmation" ItemStyle-Width="17%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblPTConfirmation" Text='<%#(Eval("PTConformation").ToString()) %>'
                                                                    runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="PT Owner" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblPTOwner" Text='<%#(Eval("PTOwner").ToString()) %>' runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="PT Remarks" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblPTRemarks" Text='<%#(Eval("PTRemarks").ToString()) %>'
                                                                    runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="PT Overview" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblPTUpdate" Text='<%#(Eval("PTLastUpdate").ToString()) %>'
                                                                    runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Updated By" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblUpdatedBy" Text='<%#(Eval("UpdatedName").ToString()) %>'
                                                                    runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Updated Date" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblUpdatedDate" Text='<%#(Eval("UpdatedDate").ToString()) %>'
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
                




            <cc1:ModalPopupExtender ID="mpUnderRiskActionPlan" runat="server" PopupControlID="pnlUnderRiskActionPlan" TargetControlID="btnCloseAction"
                Enabled="true" CancelControlID="btnCloseAction" DropShadow="true" BehaviorID="Mp25" RepositionMode="RepositionOnWindowResizeAndScroll"
                BackgroundCssClass="modalBackground">
            </cc1:ModalPopupExtender>

            <asp:Panel ID="pnlUnderRiskActionPlan" runat="server" CssClass="modalPopup" align="center" Style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 50px !important; display: none; font-family: 'Times New Roman'; font-size: medium" BorderStyle="Solid" BorderWidth="1px">

                <div style="border-radius: 50px !important; background-color: #ffffff !important; padding-left: 7px; padding-top: 7px; float: left; padding-right: 7px; width: 30%; padding-bottom: 7px; position: fixed; z-index: 100001; left: 35%; top: 64.5px; border: solid; border-color: silver; padding-bottom: 20px">
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
                                <asp:Label ID="Label26" class="subpnlhdg" runat="server" Text="Under Risk Action Plan"></asp:Label>
                            </h4>

                        </div>


                        <div class="pull-right">
                             <button type="button" class="btn btn-close"  aria-label="Close" runat="server" id="btnCloseAction"/>
                         <%--   <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="../Icons/deleteData.png" Style="padding-top: 10%;" /></td>--%>
                        </div>

                    </div>
                    
                      <div id="Div2" runat="server" style="overflow-y: auto; max-height: calc(100vh - 300px); overflow-x: hidden">
                    <table class="table table-condensed" style="width: 100%">
                        <tr>
                            <td style="padding: 3px 5px; width: 45%;border-right: double;" class="label-alignment no-border" >
                                <table class="table table-condensed" style="width: 100%">

                                   

                                    <tr>
                                        <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                            <asp:Label ID="Label32" runat="server" Text="Action Owner"></asp:Label>
                                             <asp:HiddenField ID="hfdOverViewAc" runat="server" />
                                            <asp:HiddenField ID="hfdRemarksAC" runat="server" />
                                            <asp:HiddenField ID="hfdWinPercAC" runat="server" />
                                            <asp:HiddenField ID="hfdOptNumberAC" runat="server" />
                                            <asp:HiddenField ID="hfdRevIDAc" runat="server" />
                                            <asp:HiddenField ID="hfdProductAc" runat="server" />
                                            <asp:HiddenField ID="hfdoptAP" runat="server" />
                                        </td>

                                        <td style="padding: 3px 5px; width: 10%" class="no-border">

                                           <asp:DropDownList ID="ddlUnderRiskTaggedIn" CssClass="textBox1 form-control " runat="server" OnSelectedIndexChanged="ddlUnderRiskTaggedIn_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                          
                                        </td>
                                        <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>

                                    </tr>
                                    <asp:Panel ID="pnlOtherTaggedIn" runat="server">
                                    <tr >
                                        <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                           
                                        </td>

                                        <td style="padding: 3px 5px; width: 10%" class="no-border">
                                           <asp:TextBox ID="txtActionOwner" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:TextBox>
                                        </td>
                                       

                                    </tr>
                                    </asp:Panel>
                                     <tr>
                                        <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                            <asp:Label ID="Label33" runat="server" Text="Action Required"></asp:Label>
                                        </td>

                                        <td style="padding: 3px 5px; width: 10%" class="no-border">
                                            <asp:TextBox ID="txtActionRequired" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TextMode="MultiLine" Height="150px" style="resize:none"></asp:TextBox>
                                          
                                        </td>
                                        <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>

                                    </tr>
                                    <tr>
                                        <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                            <asp:Label ID="Label29" runat="server" Text="Due Date"></asp:Label>
                                        </td>

                                        <td style="padding: 3px 5px; width: 10%" class="no-border">
                                            <asp:TextBox ID="txtActionDueDate" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:TextBox>
                                            <cc1:CalendarExtender ID="CdactionDueDate" runat="server" Format="yyyy-MM-dd" TargetControlID="txtActionDueDate"
                                                BehaviorID="CalendarActionDate"
                                                OnClientShown="onCalendarShown"
                                                CssClass="MyCalendar">
                                            </cc1:CalendarExtender>
                                        </td>
                                        <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>

                                    </tr>
                                   
                                </table>

                             

                                <div style="padding-top: 20px;text-align-last:center">
                                    <asp:LinkButton ID="lbSaveUnderRiskAction" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="lbSaveUnderRiskAction_Click"><i class="fa fa-floppy-o" aria-hidden="true" title="Save"></i></asp:LinkButton>
                                </div>
                            </td>
                           
                        </tr>
                    </table>
                          </div>

                </div>

            </asp:Panel>


            
        </ContentTemplate>
    <Triggers>
        <asp:PostBackTrigger ControlID="lnksearch" />
    </Triggers>
    </asp:UpdatePanel>

     <asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="UpdatePanel1" runat="server" >
        <ProgressTemplate >
         <div style="z-index:100002 !important;position: absolute; background: url(/Style/Engine/images/black-bg.png); top: 0px; left: 0px; width: 100%; height: 100%;">
                <div class="CenterPB" style="height: 100%; width: 100%;position: absolute;">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Icons/loader.gif" Height="35px"
                        Width="35px" />
                    Loading...
                </div>
           </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
</asp:Content>

