<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="MTUpdates.aspx.cs" Inherits="Marketing_MTUpdates" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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

     <style>
        .nav-tabs .nav-link.active, .nav-tabs .nav-item.show .nav-link {
            color: #ffffff;
            background-color: #a92828;
            border-color: #fff;
        }

        .nav-tabs .nav-item .nav-link.active {
            color: #ffffff;
            background-color: #a92828;
            border-color: #fff;
        }

        .nav-tabs .nav-item .nav-link:hover {
            color: #ffffff;
            background-color: #a92828;
            border-color: #fff;
        }

        .nav-tabs .nav-item .nav-link:not(.active) {
            color: black;
            background-color: #b4b9bf;
        }

        .breadcrumb-custom {
            /*centering*/
            text-align: center;
            font-family: 'Merriweather Sans', arial, verdana;
            display: inline-block;
            overflow: hidden;
            border-radius: 5px;
            /*Lets add the numbers for each link using CSS counters. flag is the name of the counter. to be defined using counter-reset in the parent element of the links*/
            counter-reset: flag;
        }

            .breadcrumb-custom a {
                text-decoration: none;
                outline: none;
                display: block;
                float: left;
                font-size: 18px;
                line-height: 36px;
                color: white;
                /*need more margin on the left of links to accomodate the numbers*/
                padding: 0 10px 0 60px;
                background: #666;
                background: linear-gradient(#666, #333);
                position: relative;
            }


                /*since the first link does not have a triangle before it we can reduce the left padding to make it look consistent with other links*/
                .breadcrumb-custom a:first-child {
                    padding-left: 12px;
                    border-radius: 5px 0 0 5px; /*to match with the parent's radius*/
                    width: 235px;
                }

                    .breadcrumb-custom a:first-child:before {
                        left: 14px;
                    }

                .breadcrumb-custom a:last-child {
                    border-radius: 0 5px 5px 0; /*this was to prevent glitches on hover*/
                    padding-right: 20px;
                }

                /*hover/active styles*/
                .breadcrumb-custom a.active, .breadcrumb-custom a:hover {
                    background: #333;
                    background: linear-gradient(#333, #000);
                    color: white !important;
                }

                    .breadcrumb-custom a.active:after, .breadcrumb-custom a:hover:after {
                        background: #333;
                        background: linear-gradient(135deg, #333,#000);
                    }

                /*adding the arrows for the breadcrumbs using rotated pseudo elements*/

                /*we dont need an arrow after the last link*/
                .breadcrumb-custom a:last-child:after {
                    content: none;
                }

        .flat a, .flat a:after {
            background: white;
            color: white;
            transition: all 0.5s;
            width: 235px;
            padding-left: 0%;
        }



            .flat a:hover, .flat a.active, .flat a:hover:after, .flat a.active:after {
                background: #a92828;
                /* color: white; */
            }


             .Contact-item-list-table th {
            background-color: #a92828 !important;
            color: white !important;
        }

        .Contact-item-list-table td {
            color: #333333 !important;
        }

         .btn-Style {
            color: #fff;
            background-color: #d14f42;
            border-color: #ffffff;
            box-shadow: 0 0.125rem 0.25rem 0 rgba(105, 108, 255, 0.4);
        }

            .btn-Style.active, .btn-Style:hover {
                color: #fff;
                background-color: green;
                border-color: #ffffff;
                box-shadow: 0 0.125rem 0.25rem 0 rgba(105, 108, 255, 0.4);
            }


             .newContact {
            background-color: #a92828;
            color: white;
        }

            .newContact:hover {
                background: #d51a1a;
                color: white;
            }

               .OPP-SUpdate-table th {
            background-color: #a92828 !important;
            color: white !important;
        }

        .OPP-SUpdate-table td {
            color: #333333 !important;
        }

 .OPP-SMUpdate-table th {
            background-color: #a92828 !important;
            color: white !important;
        }

        .OPP-SMUpdate-table td {
            color: #333333 !important;
        }


        .OPP-MUpdate-table th {
            background-color: #a92828 !important;
            color: white !important;
        }

        .OPP-MUpdate-table td {
            color: #333333 !important;
        }

 .OPP-AdminHistory-table th {
            background-color: #a92828 !important;
            color: white !important;
        }

        .OPP-AdminHistory-table td {
            color: #333333 !important;
        }


        .OPP-MoreInfo-table th {
            background-color: #a92828 !important;
            color: white !important;
        }

        .OPP-MoreInfo-table td {
            color: #333333 !important;
        }
    </style>
    
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

              <asp:HiddenField runat="server" ID="hfdOper" Value="1" />
                  
            <div class="GridviewDiv" id="pnlSummaryView" runat="server">

                <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">

                    <asp:Panel ID="Panel1" runat="server" CssClass="pnlheading">
                        <div class="card-header pnlheading">
                            <h3>
                                <asp:Label ID="Label13" ForeColor="White" Font-Bold="true" runat="server" Text="MKT Update"></asp:Label>
                                <asp:HiddenField ID="hfdDate" runat="server" />
                                 <asp:HiddenField ID="hfdSummaryRowCount" Value="50"  runat="server" />
                              
                            </h3>


                        </div>
                    </asp:Panel>
                    <div class="card-block">

                        <div class="row">
                             <div class="pull-right">
                                <label class="form-label">
                                    Company : 
                                                <asp:DropDownList ID="ddlOrganization" runat="server" CssClass="form-control textBox1" AutoPostBack="true" OnSelectedIndexChanged="ddlOrganization_SelectedIndexChanged"></asp:DropDownList>
                                </label>
                            </div>
                              &nbsp;&nbsp;  &nbsp;&nbsp;
                            
                               <div class="pull-right">
                                <label class="form-label">
                                    Salesman : 
                                                <asp:DropDownList ID="ddlSalesmanSearch" runat="server" CssClass="form-control textBox1" AutoPostBack="true" OnSelectedIndexChanged="ddlSalesman_SelectedIndexChanged"></asp:DropDownList>
                                </label>
                            </div>
                              &nbsp;&nbsp;  &nbsp;&nbsp;
                             <div class="pull-right">
                                <label class="form-label">
                                    Consultant : 
                                                <asp:TextBox ID="txtConsultantSearch" runat="server" CssClass="form-control textBox1" AutoPostBack="true" OnTextChanged="ddlConsultant_TextChanged"></asp:TextBox>
                                </label>
                            </div>
                               &nbsp;&nbsp;  &nbsp;&nbsp;
                            <div class="pull-right">
                                <label class="form-label">
                                    Opportunity : 
                                                <asp:TextBox ID="txtOptNumber" runat="server" CssClass="form-control textBox1" AutoPostBack="true" OnTextChanged="txtOptNumber_TextChanged"></asp:TextBox>
                                </label>
                            </div>
                             &nbsp;&nbsp;  &nbsp;&nbsp;
                            
                               <div class="pull-right">
                                <label class="form-label">
                                    Status : 
                                                <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control textBox1" AutoPostBack="true" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged">
                                                 <asp:ListItem Text="NOT UPDATED" Value="NOT UPDATED" Selected="True"></asp:ListItem>
                                                <asp:ListItem Text="UPDATED" Value="UPDATED"></asp:ListItem>
                                                <asp:ListItem Text="APPROVED" Value="APPROVED"></asp:ListItem>
                                                <asp:ListItem Text="REJECTED" Value="REJECTED"></asp:ListItem>
                                                <asp:ListItem Text="ALL" Value="ALL"></asp:ListItem>
                                                </asp:DropDownList>
                                </label>
                            </div>
                               &nbsp;&nbsp;  &nbsp;&nbsp;
                            
                               <div class="pull-right">
                                   <label class="form-label">
                                       Value : 
                                                <asp:DropDownList ID="ddlValue" runat="server" CssClass="form-control textBox1" AutoPostBack="true" OnSelectedIndexChanged="ddlValue_SelectedIndexChanged">
                                                    <asp:ListItem Text="ALL" Value="0" Selected="True"></asp:ListItem>
                                                    <asp:ListItem Text="Above 1M" Value="1000000"></asp:ListItem>
                                                    <asp:ListItem Text="Above 3M" Value="3000000"></asp:ListItem>
                                                     <asp:ListItem Text="Above 5M" Value="5000000"></asp:ListItem>
                                                </asp:DropDownList>
                                   </label>
                               </div>
                            &nbsp;&nbsp;  &nbsp;&nbsp;
                            
                               <div class="pull-right" style="padding-bottom:1%;padding-top:1%;">


                                   <asp:CheckBox ID="chkRequestedLost" runat="server" Text="RequestedLost" AutoPostBack="true" OnCheckedChanged="RequestedLost_CheckedChanged" />
                                   </label>
                               </div>
                      
                            </div>
                            <div class="row">
                            
                               <div class="pull-right">
                                <label class="form-label">
                                  <asp:Label ID="lblRowCount" runat="server" Text="" ForeColor="Red"></asp:Label>
                                              
                                </label>
                            </div>
                                &nbsp;&nbsp;  &nbsp;&nbsp;
                            
                               <div class="pull-right">
                                <label class="form-label">
                                  <asp:Label ID="lblSummaryErrormsg" runat="server" Text="" ForeColor="Red"></asp:Label>
                                              
                                </label>
                            </div>
                           


                        </div>

                       
                        <div id="dvupdate" runat="server" style="overflow-y:auto;height: calc(100vh - 210px);overflow-x:hidden">
                        <asp:GridView ID="gdvMKTUpdates" runat="server" AutoGenerateColumns="False" CellSpacing="0" BorderWidth="0"  Width=100%  max-width="1020px !important"
                            AllowSorting="True" EmptyDataText="No Data Found"    OnPageIndexChanging="gdvMKTUpdates_PageIndexChanging" ShowHeader="true"
                            OnRowCommand="gdvMKTUpdates_RowCommand" OnSorting="gdvMKTUpdates_Sorting" OnRowDataBound="gdvMKTUpdates_RowDataBound"
                            OnRowEditing="gdvMKTUpdates_RowEditing" OnRowUpdating="gdvMKTUpdates_RowUpdating"
                            class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                            <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                            <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                            <Columns>
                                 <asp:TemplateField HeaderText="Forecast Status" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                             <ItemTemplate>
                                               
                                                    <asp:LinkButton ID="lblForecaststatus" runat="server" Text='<%#(Eval("Forecaststatus").ToString()) %>' Font-Bold="true" Font-Size="Medium" CssClass='<%#(Eval("ForecastIcon").ToString()) %>' CommandName="ForecastedData" CommandArgument='<%#(Eval("OpportunityNumber").ToString()) %>'></asp:LinkButton>
                                             </ItemTemplate>
                                         </asp:TemplateField>

                                <asp:TemplateField HeaderText="Opt Number" ItemStyle-Width="100px" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="OpportunityNumber">
                                    <HeaderStyle Font-Size="Small" Width="100px" HorizontalAlign="Center" />
                                     <ItemTemplate>
                                        <asp:Label ID="lblOptNumber" Text='<%#(Eval("OpportunityNumber").ToString()) %>'
                                            runat="server" />
                                        <asp:HiddenField ID="hfdOptNumber" Value='<%#(Eval("OpportunityNumber").ToString()) %>'
                                            runat="server" />
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" />

                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Name" ItemStyle-Width="150px" Visible="True" SortExpression="Name">
                                     <HeaderStyle Font-Size="Small" Width="150px" HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblToOrgInvName" Text='<%#(Eval("Name").ToString()) %>'
                                            runat="server" />
                                    </ItemTemplate>

                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="MEP Contractor" ItemStyle-Width="120px" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="MEPContractor">
                                     <HeaderStyle Font-Size="Small" Width="120px" HorizontalAlign="Center" />

                                    <ItemTemplate>
                                        <asp:Label ID="lblMEPContractor" Text='<%#(Eval("MEPContractor").ToString()) %>'
                                            runat="server" />
                                    </ItemTemplate>
                                 
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Owner" ItemStyle-Width="100px" Visible="True" ItemStyle-HorizontalAlign="Center" SortExpression="Owner">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSalesman" Text='<%#(Eval("Owner").ToString()) %>' runat="server" />
                                    </ItemTemplate>
                                    <ItemStyle Width="10%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Consultant" ItemStyle-Width="100px" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="MEPConsultant">
                                     <HeaderStyle Font-Size="Small" Width="100px" HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblConsultant" Text='<%#(Eval("MEPConsultant").ToString()) %>'
                                            runat="server" />
                                    </ItemTemplate>

                                </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Open Value" ItemStyle-Width="100px" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="OPENVALUESORT">
                                       <HeaderStyle Font-Size="Small" Width="100px" HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblOPENVALUE" Text='<%#(Eval("OPENVALUE").ToString()) %>'
                                            runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Update Aging" ItemStyle-Width="100px" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="UpdateAging">
                                     <HeaderStyle Font-Size="Small" Width="100px" HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblUpdateAging" Text='<%#(Eval("UpdateAging").ToString()) %>'
                                            runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Overview" ItemStyle-Width="140px" Visible="true" ItemStyle-HorizontalAlign="Center">
                                    <HeaderStyle Font-Size="Small" Width="140px" HorizontalAlign="Center" />
                                    <ItemTemplate>
                                           <asp:HiddenField runat="server" ID="hfdOverview" Value='<%#(Eval("Overview").ToString()) %>' />
                                        <asp:DropDownList ID="ddlOverview" runat="server">
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
                                <asp:TemplateField HeaderText="Remaks" ItemStyle-Width="80px" Visible="true" ItemStyle-HorizontalAlign="Center">
                                    <HeaderStyle Font-Size="Small" Width="80px" HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtRemarks" runat="server" Height="100px" Style="resize:none" TextMode="MultiLine" Text='<%#(Eval("Remarks").ToString()) %>'/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Win %" ItemStyle-Width="80px" Visible="true" ItemStyle-HorizontalAlign="Center">
                                     <HeaderStyle Font-Size="Small" Width="80px" HorizontalAlign="Center" />
                                    <ItemTemplate>
                                      <asp:HiddenField ID="hfdWinPerc" Value='<%#(Eval("WinPerc").ToString()) %>' runat="server" />
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
                          
                                 <asp:TemplateField HeaderText="Update">
                                    <HeaderStyle Font-Size="Small" Width="4%" HorizontalAlign="Center" />
                                    <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                    <ItemTemplate>
                                           <asp:LinkButton ID="lblUpdate" runat="server" Text='' CssClass="btn rounded-pill btn-icon btn-round"
                                            CommandName="Update" Style="text-align: center"><i class="fa fa-floppy-o" title="Save"></i></asp:LinkButton>
                                             </ItemTemplate>
                                </asp:TemplateField>
                                       <asp:TemplateField HeaderText="View">
                                        <HeaderStyle Font-Size="Small" Width="4%" HorizontalAlign="Center" />
                                        <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                        <ItemTemplate>
                                           <asp:LinkButton ID="lblView" runat="server" Text='' CommandName="View" CssClass="btn rounded-pill btn-icon btn-round"
                                            CommandArgument='<%#Eval("OpportunityNumber")%>' Style="text-align: center"><i class="fa fa-eye" title="View"></i></asp:LinkButton>
                                           </ItemTemplate>
                                </asp:TemplateField>
                                  <asp:TemplateField HeaderText="History">
                                        <HeaderStyle Font-Size="Small" Width="4%" HorizontalAlign="Center" />
                                        <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                        <ItemTemplate>
                                           <asp:LinkButton ID="lblHistory" runat="server" Text='' CssClass="btn rounded-pill btn-icon btn-round"
                                            CommandArgument='<%#Eval("OpportunityNumber")%>' CommandName="History" Style="text-align: center"><i class="fa fa-history" title="History"></i></asp:LinkButton>
                                      
                                        </ItemTemplate>
                                </asp:TemplateField>
                            <%--      <asp:TemplateField HeaderText="Others">
                                        <HeaderStyle Font-Size="Small" Width="4%" HorizontalAlign="Center" />
                                        <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                        <ItemTemplate>
                                 <asp:LinkButton ID="btnothers" runat="server" Style="text-align: center" CommandName="Others" CssClass="btn rounded-pill btn-icon btn-round" CommandArgument='<%#(Eval("OpportunityNumber").ToString())%>'><i class="fa fa-info-circle" title="Others"></i></asp:LinkButton>
                                           
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
                         
                            <div class="row">
                                <asp:Button runat="server" id="btnLoadMoreSummary" OnClick="btnLoadMoreSummary_Click" Width="100%" Text="Load More"></asp:Button>
                             </div>
                        </div>

                        <div id="WarningPopup" class="modal fade">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <form>

                                        <div class="modal-body">
                                            <h4 class="modal-title" style="color: red; font-size: large; text-align-last: center;">
                                                <asp:Label ID="lblPopupWarning" runat="server" Text="Overview Should be Under Risk if Win percentage is below 70 "></asp:Label>
                                            </h4>

                                        </div>
                                        <div class="modal-footer" style="padding-left: 45%;">
                                            <input type="button" class="btn btn-default" data-bs-dismiss="modal" value="OK">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>    
                  <%-- Others details popup --%>


               

                    <%-- End others popup --%>

                    

                    </div>


                </div>

            </div>
                        <div class="modal fade" id="mpOthersUpdates" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content" style="width: 250%; right: 400px;">
                                    <div class="modal-header">
                                        <h3 class="modal-title" id="H1">Others Updates</h3>
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
                                                                <asp:Label ID="lblMTOverview" Text='<%#(Eval("SalesmanOverview").ToString()) %>'
                                                                    runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Salesman Remarks" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                            <HeaderStyle CssClass="salesmanUpdates" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblMTRemarks" Text='<%#(Eval("SalesmanRemarks").ToString()) %>' runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Salesman Win Perc" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                            <HeaderStyle CssClass="salesmanUpdates" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblMTWinPerc" Text='<%#(Eval("SalesmanWinPerc").ToString()) %>' runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Salesman Update Date" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                            <HeaderStyle CssClass="salesmanUpdates" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblMTUpdateDate" Text='<%#(Eval("SalesmanUpdateDate").ToString()) %>' runat="server" />
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
                <div class="modal fade" id="mpShowOPThistory" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content" style="width: 136%">
                                    <div class="modal-header">
                                        <h3 class="modal-title" id="H2">History</h3>
                                      <button type="button" class="btn btn-close" data-bs-dismiss="modal" aria-label="Close">
                                       
                                        </button>
                                    </div>
                                    <div class="modal-body">


                                        <asp:GridView ID="gdvHistory" runat="server" EmptyDataText="No History Found..." AutoGenerateColumns="False" CellSpacing="0" BorderWidth="0" AllowSorting="True"
                                            class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4">
                                            <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                            <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                            <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                            <Columns>

                                                <asp:TemplateField HeaderText="MKT Overview" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblMKTOverview" Text='<%#(Eval("MKTOverview").ToString()) %>'
                                                            runat="server" />

                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="MKT Remarks" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblMKTRemarks" Text='<%#(Eval("MKTRemarks").ToString()) %>'
                                                            runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Win Perc" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblMKTWinPerc" Text='<%#(Eval("MKTWinPerc").ToString()) %>' runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Updated Date" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblUpdatedDate" Text='<%#(Eval("UpdatedDate").ToString()) %>'
                                                            runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Updated BY" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblUpdatedBY" Text='<%#(Eval("UpdatedBY").ToString()) %>'
                                                            runat="server" />
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

                   <div class="modal fade" id="mpForecastedDataView" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content" style="width: 250%;right: 400px;">
                                            <div class="modal-header">
                                                <h3 class="modal-title">Forecasted Data</h3>
                                                <button type="button" class="btn btn-close" data-bs-dismiss="modal" aria-label="Close">
                                                   
                                                </button>
                                            </div>
                                            <div class="modal-body">

                                                <asp:GridView ID="gdvForecastedDataview" runat="server" EmptyDataText="No Other Updates Found.." AutoGenerateColumns="False" CellSpacing="0" BorderWidth="0" AllowSorting="True"
                                                    class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4">
                                                    <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                                    <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                                    <Columns>


                                                        <asp:TemplateField HeaderText="OPT#" ItemStyle-Width="5%" Visible="false" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="lblOptNumber" Text='<%#(Eval("OptNumber").ToString()) %>'
                                                                    runat="server" />

                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Forecasted Month" ItemStyle-Width="8%" Visible="True" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblForecastedFor" Text='<%#(Eval("ForecastedMonth").ToString()) %>' 
                                                                    runat="server" />

                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Forecasted Amount" ItemStyle-Width="8%" Visible="True" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblForecastedAmount" Text='<%#(Eval("ForecastedAmount").ToString()) %>' runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Remakrs" ItemStyle-Width="5%" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblRemakrs" Text='<%#(Eval("Remakrs").ToString()) %>'
                                                                    runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Products" ItemStyle-Width="17%" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblProducts" Text='<%#Eval("Products").ToString().Replace(",",",<br />") %>' Font-Bold="true"
                                                                    runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Update Date" ItemStyle-Width="5%" ItemStyle-HorizontalAlign="right">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblUpdatedDate" Text='<%#(Eval("UpdatedDate").ToString()) %>'
                                                                    runat="server" />
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
                    
                      <div id="Div3" runat="server" style="overflow-y: auto; max-height: calc(100vh - 300px); overflow-x: hidden">
                    <table class="table table-condensed" style="width: 100%">
                        <tr>
                            <td style="padding: 3px 5px; width: 45%;border-right: double;" class="label-alignment no-border" >
                                <table class="table table-condensed" style="width: 100%">

                                    <tr>
                                        <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border">
                                            <asp:Label ID="Label28" runat="server" Text="Opportunity Number"></asp:Label>
                                            <asp:HiddenField ID="hfdOverView" runat="server" />
                                            <asp:HiddenField ID="hfdRemarks" runat="server" />
                                            <asp:HiddenField ID="hfdWinPerc" runat="server" />
                                            <asp:HiddenField ID="hfdOptNumber" runat="server" />
                                             <asp:HiddenField ID="hfdUnderRiskActionOper" runat="server" />
                                             <asp:HiddenField ID="hfdUnserRiskActionRevId" runat="server" />
                                             <asp:HiddenField ID="hfdUnserRiskActionProd" runat="server" />
                                             <asp:HiddenField ID="hfdUnserRiskActionWaiting" runat="server" />
                                             <asp:HiddenField ID="hfdUnserRiskActionSubstage" runat="server" />
                                        </td>
                                        <td style="padding: 3px 5px; width: 8%" class="no-border">
                                            <asp:TextBox ID="txtOptNumberUnderRisk" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>

                                        </td>
                                        <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>

                                    </tr>
                                    <tr>
                                        <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                            <asp:Label ID="Label32" runat="server" Text="Action Owner"></asp:Label>
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

                   <asp:Panel ID="pnlDetailView" runat="server" Visible="false">
             
                    <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">
                           <asp:Panel ID="Panel3" runat="server" CssClass="pnlheading">
                        <div class="card-header pnlheading">
                            <div class="pull-left" >
                            <h3>
                                <asp:Label ID="Label8" ForeColor="White" Font-Bold="true" runat="server" Text="MKT Update"></asp:Label>
                                
                            </h3>
                                </div>
                             <div class="pull-right" >
                                  <asp:LinkButton ID="btnStartConv" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="btnStartConv_Click"
                                                ><i class="fa fa-comments" aria-hidden="true" title="Start Conversation"></i></asp:LinkButton>

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
                                
                             </asp:Panel>
                         

                       
                                      <table class="table table-condensed" style="width: 100%">

                                 <tr>
                                     <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border">
                                         <asp:Label ID="Label15" runat="server" Text="Project Number"></asp:Label>
                                     </td>
                                     <td style="padding: 3px 5px; width: 8%" class="no-border">
                                         <asp:TextBox ID="txtProjectNumber" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
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
                                         <asp:Label ID="Label16" runat="server" Text="Client"></asp:Label>
                                     </td>
                                     <td style="padding: 3px 5px; width: 8%" class="no-border">
                                         <asp:TextBox ID="txtClient" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
                                     </td>
                                 </tr>
                                 <tr>
                                     <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border">
                                         <asp:Label ID="Label17" runat="server" Text="Developer Owner/Client"></asp:Label>
                                     </td>
                                     <td style="padding: 3px 5px; width: 8%" class="no-border">
                                         <asp:TextBox ID="txtDeveloperClient" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
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
                                         <asp:Label ID="Label18" runat="server" Text="Main Contractor Owner"></asp:Label>
                                     </td>
                                     <td style="padding: 3px 5px;" class="no-border">
                                         <asp:TextBox ID="txtMainContractorOwner" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="2" Enabled="false"></asp:TextBox>
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
                                         <asp:Label ID="Label1" runat="server" Text="Marketing"></asp:Label>
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
                                     <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                         <asp:Label ID="Label21" runat="server" Text="Salesman"></asp:Label>
                                     </td>
                                     <td style="padding: 3px 5px; width: 8%" class="no-border">
                                         <asp:TextBox ID="txtOwner" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
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
                                         <asp:Label ID="Label4" runat="server" Text="Status"></asp:Label>
                                     </td>
                                     <td style="padding: 3px 5px; width: 8%" class="no-border">
                                         <asp:TextBox ID="txtStatus" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
                                     </td>

                                     
                                   
                                    
                                 </tr>
                                 <tr>
                                   

                                 </tr>
                                 <tr>
                                     <td style="padding: 3px 5px;" class="label-alignment no-border" colspan="9">
                                         <asp:Label ID="lblUpdateError" runat="server" Text="" ForeColor="Red"></asp:Label>
                                     </td>
                                 </tr>
                             </table>
                                            <div class="row" style="display: block !important;">
                               
												<asp:GridView ID="gdvOPTJOHUpdate" runat="server" AutoGenerateColumns="False" Width="100%"
													OnRowCommand="gdvOPTJOHUpdate_RowCommand" OnRowDataBound="gdvOPTJOHUpdate_RowDataBound"
													OnRowEditing="gdvOPTJOHUpdate_RowEditing" OnRowUpdating="gdvOPTJOHUpdate_RowUpdating"
													CellSpacing="0" BorderWidth="0" AllowSorting="True" EmptyDataText="No Data Found"
													class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
													<FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
													<RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
													<HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
													<Columns>





														<asp:TemplateField HeaderText="Overview" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
															<ItemTemplate>
																<asp:HiddenField runat="server" ID="hfdOptNumber" Value='<%#(Eval("OpportunityNumber").ToString()) %>' />
																<asp:HiddenField runat="server" ID="hfdOverview" Value='<%#(Eval("Overview").ToString()) %>' />
																<asp:DropDownList ID="ddlOverview" runat="server">
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
														<asp:TemplateField HeaderText="Remaks" ItemStyle-Width="20%" Visible="true" ItemStyle-HorizontalAlign="Center">
															<ItemTemplate>
																<asp:TextBox ID="txtRemarks" runat="server" Height="75px" Width="200px" Style="resize: none" TextMode="MultiLine" Text='<%#(Eval("Remarks").ToString()) %>' />
															</ItemTemplate>
														</asp:TemplateField>
														<asp:TemplateField HeaderText="Win %" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center">
															<ItemTemplate>
																  <asp:HiddenField ID="hfdWinPerc" Value='<%#(Eval("WinPerc").ToString()) %>' runat="server" />
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
																	CommandArgument='<%#Eval("OpportunityNumber")%>' CommandName="History" Style="text-align: center"><i class="fa fa-history" title="History"></i></asp:LinkButton>
															</ItemTemplate>
														</asp:TemplateField>


														<%--<asp:TemplateField HeaderText="Others">
															<HeaderStyle Font-Size="Small" Width="4%" HorizontalAlign="Center" />
															<ItemStyle Font-Size="Small" HorizontalAlign="Center" />
															<ItemTemplate>
																<asp:LinkButton ID="btnothers" runat="server" Style="text-align: center" CommandName="Others" CssClass="btn rounded-pill btn-icon btn-round"
																	CommandArgument='<%#(Eval("OpportunityNumber").ToString())%>'><i class="fa fa-info-circle" title="Others"></i></asp:LinkButton>

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

                           <asp:Panel ID="Panel10" runat="server" CssClass="pnlsubheading">
                                 <div class="pull-left">
                                     <h5>
                                         <asp:Label ID="Label46" class="panel-heading" Style="color: white;" runat="server" Text="Revenue Details"></asp:Label></h5>
                                 </div>
                                
                             </asp:Panel>


                            <%-- REvenue details --%>
                            <asp:GridView ID="gdvMKTRevUpdate" runat="server" AutoGenerateColumns="False"
                                AllowSorting="True" EmptyDataText="No Data Found" AllowPaging="true" PageSize="10" OnPageIndexChanging="gdvMKTRevUpdate_PageIndexChanging"
                                OnRowCommand="gdvMKTRevUpdate_RowCommand" OnRowDataBound="gdvMKTRevUpdate_RowDataBound"
                                OnRowEditing="gdvMKTRevUpdate_RowEditing" OnRowUpdating="gdvMKTRevUpdate_RowUpdating"
                                class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                                <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Product Type" ItemStyle-Width="15%" Visible="True" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblProductType" Text='<%#(Eval("ProductType").ToString()) %>'
                                                runat="server" />
                                            <asp:HiddenField ID="hfdRevenueRowId" Value='<%#(Eval("RevenueRowId").ToString()) %>' runat="server" />
                                            <asp:HiddenField ID="hfdOpportunityNumber" Value='<%#(Eval("OpportunityNumber").ToString()) %>' runat="server" />
                                                 <asp:HiddenField ID="hfdRevUpdateAging" Value='<%#(Eval("UpdateAging").ToString()) %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Revenue Status" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center">
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
                                    <asp:TemplateField HeaderText="Salesman Remarks" ItemStyle-Width="15%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblSalesmanRemarks" Text='<%#(Eval("SalesmanRemarks").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Overview" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                             <asp:HiddenField runat="server" ID="hfdOverview" Value='<%#(Eval("Overview").ToString()) %>' />
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
                                    <asp:TemplateField HeaderText="Remaks" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtRemarks" runat="server" Text='<%#(Eval("Remarks").ToString()) %>'/>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Win %" ItemStyle-Width="6%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                             <asp:HiddenField ID="hfdWinPerc" Value='<%#(Eval("WinPerc").ToString()) %>' runat="server" />
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
                                      <asp:TemplateField HeaderText="Value" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblFORMATVALUE" Text='<%#(Eval("FORMATVALUE").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Update Status" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                             <ItemTemplate>
                                               
                                                    <asp:LinkButton ID="lblsubmittype" runat="server" Text='<%#(Eval("UpdateAging").ToString()) %>' Font-Bold="true" Font-Size="Medium" CssClass="badge bg-label-light me-1"></asp:LinkButton>
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
                                                CommandArgument='<%#Eval("RevenueRowId")%>' CommandName="History" Style="text-align: center"><i class="fa fa-history" title="History"></i></asp:LinkButton>
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

             <div class="modal fade" id="mpOPPShowhistory" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content" style="width: 314%; right: 107%;">
                        <div class="modal-header">
                            <h3 class="modal-title" id="h5">Other Updates</h3>
                            <button type="button" class="btn btn-close" data-bs-dismiss="modal" aria-label="Close">
                            </button>
                        </div>
                        <div class="card-body" style="margin-top: -2%;">
                            <div class="nav-align-top tab-Inspections" style="padding-top: 1%;">

                                <ul class="nav nav-tabs" role="tablist">
                                    <%-- <li class="nav-item">
                        <button type="button" id="btnPTOverview" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#tab-PTOverview" aria-controls="tab-PTOverview" aria-selected="true">Product Team OverView</button>
                    </li>
                     <li class="nav-item">
                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-Quotation" aria-controls="tab-Quotation" aria-selected="true">Quotation</button>
                    </li>--%>
                                    <%--<li class="nav-item">
                                        <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#tab-OPPMoreInfo" aria-controls="tab-OPPMoreInfo" aria-selected="false">More Information</button>
                                    </li>--%>
                                    <li class="nav-item">
                                        <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#tab-OPPSalesmanUpdate" aria-controls="tab-OPPSalesmanUpdate" aria-selected="false">Salesman Update</button>
                                    </li>
                                    <li class="nav-item">
                                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-OPPSalesmanagerUpdate" aria-controls="tab-OPPSalesmanagerUpdate" aria-selected="false">Salesmanager Update</button>
                                    </li>
                                    <li class="nav-item">
                                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-OPPMarketingUpdate" aria-controls="tab-OPPMarketingUpdate" aria-selected="false">Marketing Update</button>
                                    </li>
                                    <li class="nav-item">
                                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-ProjectUpdate" aria-controls="tab-ProjectUpdate" aria-selected="false">Project Update</button>
                                    </li>
                                   <%-- <li class="nav-item">
                                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-OPPMajorInfo" aria-controls="tab-OPPMajorInfo" aria-selected="false">Major Information</button>
                                    </li>
                                    <li class="nav-item">
                                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-OPPAdminRemarks" aria-controls="tab-OPPAdminRemarks" aria-selected="false">Admin History</button>
                                    </li>
                                     <li class="nav-item">
                                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-Attatchment" aria-controls="tab-Attatchment" aria-selected="false">Attatchment</button>
                                    </li>--%>





                                </ul>

                                <div class="tab-content">

                                    <%-- <div class="tab-pane fade show active" id="tab-PTOverview" role="tabpanel">
                       
                          <div class="" style="margin-top: 1%;">

                            <table class="table table-bordered table-striped OPP-PTOverview-table">


                                <thead>
                                    <tr>
                                        <%--<th>Id</th>--%>
                                    <%--<th>OverView</th>
                                        <th>Remarks</th>
                                        <th>Win Perc.</th>
                                        <th>UpdatedBy</th>
                                        <th>Updated Date</th>--%>
                                    <%--<th>Status</th>--%>


                                    <%-- </tr>
                                </thead>


                                <tbody class="tbody-PTOverView">
                                </tbody>
                            </table>
                        </div>
                    </div>--%>



                                    <%--<div class="tab-pane fade" id="tab-Quotation" role="tabpanel">
                       
                          <div class="" style="margin-top: 1%;">

                            <table class="table table-bordered table-striped OPP-Quotation-table">


                                <thead>
                                    <tr>
                                        <%--<th>Id</th>--%>
                                    <%--<th>Product Type</th>
                                        <th>Quotation.No</th>
                                        <th>Quotation Date</th>
                                        <th>Revenue Amount</th>
                                        <th>UpdatedBy</th>
                                        <th>UpdatedDate</th>--%>
                                    <%--<th>Status</th>--%>


                                    <%-- </tr>
                                </thead>


                                <tbody class="tbody-Quotation">
                                </tbody>
                            </table>
                        </div>
                    </div>--%>




                                    <div class="tab-pane fade show active" id="tab-OPPSalesmanUpdate" role="tabpanel">

                                        <div class="" style="margin-top: 1%;">

                                            <table class="table table-bordered table-striped OPP-SUpdate-table">


                                                <thead>
                                                    <tr>
                                                        <%--<th>Id</th>--%>
                                                        <th>OverView</th>
                                                        <th>Remarks</th>
                                                        <th>Win Perc.</th>
                                                        <th>UpdatedBy</th>
                                                        <th>Updated Date</th>
                                                        <%--<th>Status</th>--%>
                                                    </tr>
                                                </thead>


                                                <tbody class="tbody-OPPSupdate">
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>


                                    <div class="tab-pane fade" id="tab-OPPSalesmanagerUpdate" role="tabpanel">

                                        <div class="" style="margin-top: 1%;">

                                            <table class="table table-bordered table-striped OPP-SMUpdate-table">


                                                <thead>
                                                    <tr>
                                                        <%--<th>Id</th>--%>
                                                        <th>OverView</th>
                                                        <th>Remarks</th>
                                                        <th>Win Perc.</th>
                                                        <th>UpdatedBy</th>
                                                        <th>Updated Date</th>
                                                        <%--<th>Status</th>--%>
                                                    </tr>
                                                </thead>


                                                <tbody class="tbody-OPPSMUpdates">
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>



                                    <div class="tab-pane fade" id="tab-OPPMarketingUpdate" role="tabpanel">

                                        <div class="" style="margin-top: 1%;">

                                            <table class="table table-bordered table-striped OPP-MUpdate-table">


                                                <thead>
                                                    <tr>
                                                        <%--<th>Id</th>--%>
                                                        <th>OverView</th>
                                                        <th>Remarks</th>
                                                        <th>Win Perc.</th>
                                                        <th>UpdatedBy</th>
                                                        <th>Updated Date</th>
                                                        <%--<th>Status</th>--%>
                                                    </tr>
                                                </thead>


                                                <tbody class="tbody-OPPMKTUpdates">
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>

                                      <div class="tab-pane fade" id="tab-ProjectUpdate" role="tabpanel">

                                        <div class="" style="margin-top: 1%;">

                                            <table class="table table-bordered table-striped OPP-MUpdate-table">


                                                <thead>
                                                    <tr>
                                                        <%--<th>Id</th>--%>
                                                        <th>OverView</th>
                                                        <th>Remarks</th>
                                                        <th>UpdatedBy</th>
                                                        <th>Updated Date</th>
                                                        <%--<th>Status</th>--%>
                                                    </tr>
                                                </thead>


                                                <tbody class="tbody-Projectupdate">
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>



                                   <%-- <div class="tab-pane fade" id="tab-OPPAdminHistory" role="tabpanel">

                                        <div class="" style="margin-top: 1%;">

                                            <table class="table table-bordered table-striped OPP-AdminHistory-table">


                                                <thead>
                                                    <tr>--%>
                                                        <%--<th>Id</th>--%>
                                                       <%-- <th>Name</th>
                                                        <th>Developer Client</th>
                                                        <th>Developer Owner</th>
                                                        <th>Main Contractor</th>
                                                        <th>MEP Contractor</th>
                                                        <th>MEP Consultant</th>
                                                        <th>Salesman</th>
                                                        <th>SalesStage</th>
                                                        <th>Status</th>
                                                        <th>UpdatedBy</th>
                                                        <th>UpdatedDate</th>--%>
                                                        <%--<th>Status</th>--%>
                                                   <%-- </tr>
                                                </thead>


                                                <tbody class="tbody-OPPAdminHistory">
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>


                                    <div class="tab-pane fade show active" id="tab-OPPMoreInfo" role="tabpanel">

                                        <div class="" style="margin-top: 1%;">

                                            <table class="table table-bordered table-striped OPP-MoreInfo-table">


                                                <thead>
                                                    <tr>--%>
                                                        <%--<th>Id</th>--%>
                                                      <%--  <th style="display:none;">Company</th>
                                                        <th>CreatedBy</th>
                                                        <th>Creation Date</th>
                                                        <th>SalesStage</th>
                                                        <th style="display:none;">Project.No</th>
                                                        <th style="display:none;">Plot</th>
                                                        <th>Stage Date</th>
                                                        <th>Status Date</th>
                                                        <th>Last UpdatedBy</th>
                                                        <th>Last Updated Date</th>--%>
                                                        <%--<th>Status</th>--%>
                                                  <%--  </tr>
                                                </thead>


                                                <tbody class="tbody-OPPmoreinfo">
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>--%>



                                 <%--   <div class="tab-pane fade" id="tab-OPPMajorInfo" role="tabpanel">

                                        <div style="margin-top: 1%;">--%>
                                            <%--<a href="#" id="btnbtn" style="float:right;"><i class="fa fa-plus" aria-hidden="true" style="font-size: 50px;color:green" title="Add Information"></i></a>--%>

                                          <%--  <asp:LinkButton ID="btnAddMjInfo" runat="server" Style="text-align: center; float: right; margin-top: -3%;" CssClass="btn rounded-pill btn-icon btn-round" OnClick="btnAddMjInfo_Click"><i class="fa fa-plus" title="Major Info"></i></asp:LinkButton>

                                        </div>
                                        <div class="" style="margin-top: 1%;">
                                            <table class="table table-bordered table-striped OPP-MajorInfo-table">


                                                <thead>
                                                    <tr>--%>
                                                        <%--<th>Id</th>--%>
                                                       <%--  <th style="display:none;">RefNo</th>
                                                        <th>Type</th>
                                                        <th>Source of Info</th>
                                                        <th>Source Name</th>
                                                        <th>More Information</th>
                                                        <th>CreatedBy</th>
                                                        <th>Created Date</th>
                                                        <th style="display:none;">URL</th>
                                                        <th>Attatchment</th>--%>
                                                        <%--<th>Status</th>--%>
                                                   <%-- </tr>
                                                </thead>


                                                <tbody class="tbody-OPPmajorInfo">
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>--%>




                                   <%-- <div class="tab-pane fade" id="tab-OPPAdminRemarks" role="tabpanel">

                                        <div class="" style="margin-top: 1%;">--%>
                                            <%--  <a href="#" id="btnAddAdminRemarks" style="float:right;"><i class="fa fa-plus" aria-hidden="true" style="font-size: 50px;color:green" title="Add Information"></i></a>--%>

                                            <%--<asp:LinkButton ID="btnAddAdminRemarks" runat="server" Style="text-align: center; float: right; margin-top: -3%;" CssClass="btn rounded-pill btn-icon btn-round" OnClick="btnAddAdminRemarks_Click"><i class="fa fa-plus" aria-hidden="true" title="Major Info"></i></asp:LinkButton>

                                            <table class="table table-bordered table-striped OPP-AdminRemarks-table">


                                                <thead>
                                                    <tr>--%>
                                                        <%--<th>Id</th>--%>
                                                       <%-- <th style="display:none;">RefNo</th>
                                                        <th>Remarks</th>
                                                        <th>UpdateBy</th>
                                                        <th>Updated Date</th>
                                                         <th style="display:none;">URL</th>
                                                        <th>Attatchment</th>--%>
                                                        <%--<th>Status</th>--%>
                                                    <%--</tr>
                                                </thead>


                                                <tbody class="tbody-OPPadminRemarks">
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>--%>


                                     <%-- <div class="tab-pane fade" id="tab-Attatchment" role="tabpanel">

                                        <div class="" style="margin-top: 1%;">

                                            <table class="table table-bordered table-striped OPP-AdminHistory-table">


                                                <thead>
                                                    <tr>--%>
                                                        <%--<th>Id</th>--%>
                                                    <%--    <th style="display:none;">Ref.No</th>
                                                        <th>Instance Name</th>
                                                        <th>Comments</th>
                                                        <th style="display:none">URL</th>
                                                        <th>Download</th>--%>
                                                        <%--<th>Status</th>--%>
                                                   <%-- </tr>
                                                </thead>


                                                <tbody class="tbody-Attatchment">
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>--%>


                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
             


        </ContentTemplate>
        <Triggers>
        </Triggers>

    </asp:UpdatePanel>


     <script type="text/javascript">
         var currUserId = '';
         var EmpNo = '';
         var EmpName = '';
         var myrole = '';
         var overAllPerfo = 0;
         $(document).ready(function () {
             currUserId = <%=Convert.ToInt32(Session["UserId"]).ToString()%>;
                EmpNo = '<%= Session["EmpNo"] %>';
                    myrole = '<%=Session["Role"]%>';
                    EmpName ='<%=Session["EmpName"]%>'
            });

     </script>


    <script src="../Template/Datatable/js/jquery.dataTables.min.js"></script>
    <script src="../Template/Datatable/js/dataTables.buttons.min.js"></script>
    <script src="../Template/Datatable/js/jszip.min.js"></script>
    <script src="../Template/Datatable/js/pdfmake.min.js"></script>
    <script src="../Template/Datatable/js/buttons.print.min.js"></script>
    <script src="../Template/Datatable/js/vfs_fonts.js"></script>
    <script src="../Template/Datatable/js/buttons.html5.min.js"></script>


       <link href="../FacilityManagement/Datatable/css/jquery.dataTables.min.css" rel="stylesheet" />


    <script src="../FacilityManagement/Datatable/js/jquery.dataTables.min.js"></script>


     <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />
    <script src="../Marketing/Scripts/MTUpdates.js?v=0.5"></script>


  <asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="UpdatePanel1" runat="server">
        <ProgressTemplate>

            <asp:Panel ID="pnlBackGround1" runat="server" CssClass="popup-div-background">
                <div class="CenterPB" style="height: 40px; width: 60px;">
                    <asp:Image ID="Image2" runat="server" ImageUrl="~/Icons/loader.gif" Height="35px"
                        Width="35px" />
                    Loading ...
                </div>
            </asp:Panel>


        </ProgressTemplate>
    </asp:UpdateProgress>
</asp:Content>
