<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="SalesmanAccounts.aspx.cs" Inherits="Sales_Salesman_Accounds" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
	<link rel="stylesheet" href="../Theme/Modified/modifiedcss.css" type="text/css" />
     <link rel="stylesheet" href="../Template/assets/vendor/libs/toaster/toaster.css" type="text/css" />
     <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>

  
    <script src="../js/jquery-1.11.2.min.js"></script>
     <script src="../Sales/Scripts/SalesmanAccounts.js?v=0.5"></script>
    <script src="../CustomSearch/js/jquery-customselect-1.9.1.js"></script>
    


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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
        <ContentTemplate>
             <style>
        @import url(http://fonts.googleapis.com/css?family=Merriweather+Sans);

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
            width:235px;
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
            color:white !important;
            
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
    width:235px;
    padding-left:0%;
}

   

    .flat a:hover, .flat a.active, .flat a:hover:after, .flat a.active:after {
    background: #a92828;
    
    /* color: white; */
}
       
     .Account-table th {
            background-color: #a92828 !important;
            color: white !important;
        }

        .Account-table td {
            color: #333333 !important;
        }

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

  
    </style>
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
            <asp:Panel ID="pnlSummary" runat="server">
             <div class="GridviewDiv" id="pnlSummaryView" runat="server">

                <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">

                    <asp:Panel ID="Panel1" runat="server" CssClass="pnlheading">
                        <div class="card-header pnlheading">
                            <h3>
                                <asp:Label ID="Label13" ForeColor="White" Font-Bold="true" runat="server" Text="ACCOUNTS"></asp:Label>
                                 <asp:HiddenField ID="hfdSummaryRowCount" Value="50" runat="server" />
                            </h3>


                        </div>
                    </asp:Panel>
                    <div class="card-block">

                        <div class="row">
                             <div class="pull-right">
                                <label class="form-label">
                                    Company : 
                                                <asp:DropDownList ID="ddlOrganization" runat="server" ForeColor="Black" AutoPostBack="true" OnSelectedIndexChanged="ddlOrganization_SelectedIndexChanged" CssClass="textBox11 form-control"></asp:DropDownList>
                                </label>
                            </div>
                              &nbsp;&nbsp;  &nbsp;&nbsp;
                             <div class="pull-right">
                                <label class="form-label">
                                    Manager : 
                                                <asp:DropDownList ID="ddlSalesManager" runat="server" ForeColor="Black" AutoPostBack="true" OnSelectedIndexChanged="ddlSalesManager_SelectedIndexChanged" CssClass="textBox11 form-control"></asp:DropDownList>
                                </label>
                            </div>
                              &nbsp;&nbsp;  &nbsp;&nbsp;
                               <div class="pull-right">
                                <label class="form-label">
                                    Salesman : 
                                                <asp:DropDownList ID="ddlSalesmanSearch" runat="server" ForeColor="Black" AutoPostBack="true" CssClass="textBox11 form-control"></asp:DropDownList>
                                </label>
                            </div>
                             &nbsp;&nbsp;  &nbsp;&nbsp;
                               <div class="pull-right">
                                <label class="form-label">
                                    Account : 
                                                <asp:TextBox ID="txtAccnamesearch" runat="server" ForeColor="Black"  CssClass="textBox11 form-control" Width="350px"></asp:TextBox>
                                </label>
                            </div>

                             &nbsp;&nbsp;  &nbsp;&nbsp;
                               <div class="pull-right">
                                <label class="form-label">
                                    Status : 
                                                <asp:DropDownList ID="ddlUpdateStatus" runat="server" ForeColor="Black" AutoPostBack="true" CssClass="textBox11 form-control">
                                                    <asp:ListItem Value="-1">-- All --</asp:ListItem>
                                                    <asp:ListItem Value="1">Updated</asp:ListItem>
                                                    <asp:ListItem Value="2">Not Updated</asp:ListItem>
                                                </asp:DropDownList>
                                </label>
                            </div>

                            <div style="padding-top:1%;">
                                
                                    <asp:LinkButton ID="lbSearch" runat="server" Style="text-align: center;" CssClass="btn rounded-pill btn-icon btn-round" OnClick="lbSearch_Click">
                                        <i class="fa fa-search" title="Search"></i>
                                    </asp:LinkButton>
                            
                            </div>
                            <div style="padding-top:1%;">
                                
                                    <asp:LinkButton ID="lblExport" runat="server" Style="text-align: center;" CssClass="btn rounded-pill btn-icon btn-round" OnClick="lblExport_Click">
                                        <i class="fa fa-file-excel-o" title="Search"></i>
                                    </asp:LinkButton>
                            
                            </div>
                            
                          
                             </div>
                        <div class="row">
                            
                               <div class="pull-right">
                                   <label class="form-label">
                                       <asp:Label ID="lblRowCount" runat="server" Text="" ForeColor="Red"></asp:Label>

                                   </label>
                               </div>
                            
                             
                            </div>

                       
                        <div id="dvupdate" runat="server" style="overflow-y: auto; height: calc(100vh - 270px);overflow-x:hidden">
                            <asp:GridView ID="gdvSummaryDetails" runat="server" AutoGenerateColumns="False" OnRowDataBound="gdvSummaryDetails_RowDataBound"
                                 Style="overflow-x: scroll" OnSorting="gdvSummaryDetails_Sorting" OnRowCommand="gdvSummaryDetails_RowCommand" OnRowUpdating="gdvSummaryDetails_RowUpdating"
                                CellSpacing="0" BorderWidth="0" AllowSorting="True" EmptyDataText="No Data Found"
                                class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                                <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                <Columns>

                                    <asp:TemplateField HeaderText="Account Name" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="Center" SortExpression="AccountName">
                                        <ItemTemplate>
                                            <asp:Label ID="lblAccountName" Text='<%#(Eval("AccountName").ToString()) %>'
                                                runat="server" />
                                            <asp:HiddenField ID="hfdAccountID" Value='<%#(Eval("CRMAccountId").ToString()) %>'
                                                runat="server" />
                                            <asp:HiddenField ID="hfdMasterid" runat="server" Value='<%#(Eval("MasterAccountId").ToString()) %>' />
                                        </ItemTemplate>
                                      
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Last Assignment Date" ItemStyle-Width="8%" Visible="True" SortExpression="LastAssignmentDate" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblLastAssignmentDate" Text='<%#(Eval("LastAssignmentDate").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                      
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Primary Category" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="PrimaryCategory">
                                        <ItemTemplate>
                                            <asp:Label ID="lblPrimaryCategory" Text='<%#(Eval("PrimaryCategory").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                    
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Sub category" ItemStyle-Width="5%" Visible="false" ItemStyle-HorizontalAlign="Center" SortExpression="SubCategory">
                                        <ItemTemplate>
                                            <asp:Label ID="lblSubCategory" Text='<%#(Eval("SubCategory").ToString()) %>' runat="server" />
                                        </ItemTemplate>
                                    
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Phone" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="Phone">
                                        <ItemTemplate>
                                            <asp:Label ID="lblPhone" Text='<%#(Eval("Phone").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>

                                      
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Email" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="Email">
                                        <ItemTemplate>
                                            <asp:Label ID="lblEmail" Text='<%#(Eval("Email").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>

                                        
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="URL" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="URL">
                                        <ItemTemplate>
                                            <asp:Label ID="lblUrl" Text='<%#(Eval("URL").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>

                                    
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Address" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="Address">
                                        <ItemTemplate>
                                            <asp:Label ID="lblAddress" Text='<%#(Eval("Address").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>

                                    
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Country" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="Country">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCountry" Text='<%#(Eval("Country").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>

                                        
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="City" ItemStyle-Width="5%" Visible="false" ItemStyle-HorizontalAlign="Center" SortExpression="City" >
                                        <ItemTemplate>
                                            <asp:Label ID="lblCity" Text='<%#(Eval("City").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>

                                        
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="% Of Relation With Account"  ItemStyle-Width="7%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="RelationPerc">
                                        <ItemTemplate>
                                             <asp:HiddenField ID="hfdRelationPerc" Value='<%#(Eval("RelationPerc").ToString()) %>' runat="server" />
                                            <asp:DropDownList ID="txtRelation"  runat="server" CssClass="form-control" style="text-align:center">
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
                                        <asp:TemplateField HeaderText="Customer Status"  ItemStyle-Width="12%" Visible="true" ItemStyle-HorizontalAlign="Center" >
                                        <ItemTemplate>
                                            <asp:HiddenField runat="server" ID="hfdCustomerStatus" Value='<%#(Eval("CustomerStatus").ToString()) %>' />
                                            <asp:DropDownList ID="ddlCustomerStatus"  Width="100%"  runat="server" CssClass="form-control">
                                                <asp:ListItem Value="-1" Text="--- Select ---"></asp:ListItem>
                                                <asp:ListItem Value="NEW_CUSTOMER" Text="NEW CUSTOMER"></asp:ListItem>
                                                <asp:ListItem Value="BLACK_LIST" Text="BLACK LIST"></asp:ListItem>
                                                <asp:ListItem Value="WORKING_WITH_US" Text="WORKING WITH US"></asp:ListItem>
                                                <asp:ListItem Value="TO_BE_MAINTAINED" Text="TO BE MAINTAINED"></asp:ListItem>
                                            </asp:DropDownList>
                                        </ItemTemplate>
                                       
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Remarks" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtRemarks" runat="server" Height="75px" Style="resize:none" TextMode="MultiLine" Text='<%#(Eval("CustomerAssessment").ToString())%>' CssClass="form-control"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField> 

                                    <asp:TemplateField HeaderText="Update" Visible="true">
                                        <ItemStyle Font-Size="Small" HorizontalAlign="Center" Width="4%" />
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbUpdate" runat="server" Text='' CommandArgument='<%#Eval("CRMAccountId").ToString() %>' CommandName="Update" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round"><i class="fa fa-floppy-o" title="Save"></i></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="View" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbView" runat="server" CommandName="View" CommandArgument='<%#(Eval("CRMAccountId").ToString()) + ";" + Eval("MasterAccountId").ToString() %>' CssClass="btn rounded-pill btn-icon btn-round">
                                                <i class="fa fa-eye" title="View"></i>
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Others" ItemStyle-Width="5%" Visible="false" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbOthers" runat="server" CommandName="Others" Visible="false" CommandArgument='<%#(Eval("CRMAccountId").ToString()) %>' CssClass="btn rounded-pill btn-icon btn-round">
                                                <i class="fa fa-info-circle" title="Others"></i>
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField> 


                                        <asp:TemplateField HeaderText="History" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbHistory" runat="server" CommandName="history" Visible="true" CommandArgument='<%#(Eval("CRMAccountId").ToString()) %>' CssClass="btn rounded-pill btn-icon btn-round">
                                                <i class="fa fa-history" title="History"></i>
                                            </asp:LinkButton>
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
                                <asp:Button runat="server" ID="btnLoadMoreSummary" Width="100%" OnClick="btnLoadMoreSummary_Click" Text="Load More" Visible="false"></asp:Button>
                            </div>
                        </div>
                        </div>
                    </div>
                 </div>
            
                </asp:Panel>
             <asp:Panel ID="pnlAccountDetails" runat="server" Visible="false">
                <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">
                <asp:Panel ID="Panel2" runat="server" CssClass="pnlheading">
                    <div class="pull-left">
                            <h3>
                                <asp:Label ID="Label18" ForeColor="White" Font-Bold="true" runat="server" Text="ACCOUNTS"></asp:Label></h3>
                        </div>

<%--                        <div class="pull-left">
                            <h4>
                                <asp:Label ID="Label40"  runat="server" Text="CRMSS Quotation"></asp:Label></h4>
                        </div>--%>

                     <div class="pull-right">
                           <asp:LinkButton ID="lbBack" runat="server" CssClass="btn rounded-pill btn-icon btn-round" OnClick="lbBack_Click">
                                <i class="fa fa-arrow-circle-left" aria-hidden="true" title="Go Back"></i>
                           </asp:LinkButton>

                        </div>

                    </asp:Panel>
                    <div class="card-block" style="font-weight:bold;">
                       
                             <asp:Panel ID="Panel9" runat="server" CssClass="pnlsubheading">
                                 
                                 <div class="pull-left">
                                     <h5>
                                         <asp:Label ID="Label45" ForeColor="White" Font-Bold="true" runat="server" Text="ACCOUNT DETAILS"></asp:Label></h5>
                                 </div>
                                 </asp:Panel>
                        <asp:Panel ID="Panel3" runat="server">
                                 <div style="padding-bottom:1%;padding-top:1%">
                                      <table class="table table-condensed" style="width: 100%; padding-top: 17px; font-size: 13px;">
                                     <tr style="font-size: 13px;">

                                         <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                             <asp:Label ID="Label17" runat="server" Text="Name"></asp:Label>
                                             <asp:HiddenField ID="hfdCRM" runat="server" />
                                             <asp:HiddenField ID="hfdMaster" runat="server" />
                                             <asp:HiddenField ID="hfdRelated" Value="5" runat="server" />
                                         </td>
                                         <td style="padding: -1px 5px; width: 10%" class="no-border">
                                             <asp:TextBox ID="txtName" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:TextBox>
                                         </td>
                                         <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                         <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                             <asp:Label ID="Label37" runat="server" Text="Owner"></asp:Label>
                                         </td>
                                         <td style="padding: -1px 5px; width: 10%" class="no-border">
                                             <asp:TextBox ID="txtOwner" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:TextBox>
                                         </td>
                                         <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                         <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                             <asp:Label ID="lblpc" runat="server" Text="Primary Category"></asp:Label>
                                         </td>
                                         <td style="padding: -1px 5px; width: 10%" class="no-border">
                                             <asp:TextBox ID="txtPCategory" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:TextBox>
                                         </td>
                                         <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                         <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                             <asp:Label ID="Label1" runat="server" Text="Sub Category"></asp:Label>
                                         </td>
                                          <td style="padding: -1px 5px; width: 10%" class="no-border">
                                             <asp:TextBox ID="txtSCategory" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:TextBox>
                                         </td>
                                         </tr>
                                          <tr style="font-size: 13px;">
                                              <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                             <asp:Label ID="Label2" runat="server" Text="Phone"></asp:Label>
                                         </td>
                                               <td style="padding: -1px 5px; width: 10%" class="no-border">
                                             <asp:TextBox ID="txtPhone" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:TextBox>
                                         </td>
                                          <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                         <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                             <asp:Label ID="Label3" runat="server" Text="E-Mail"></asp:Label>
                                         </td>
                                               <td style="padding: -1px 5px; width: 10%" class="no-border">
                                             <asp:TextBox ID="txtMail" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:TextBox>
                                         </td>
                                               <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                         <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                             <asp:Label ID="Label4" runat="server" Text="URL"></asp:Label>
                                         </td>
                                                <td style="padding: -1px 5px; width: 10%" class="no-border">
                                             <asp:TextBox ID="txtURL" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:TextBox>
                                         </td>
                                              <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                         <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                             <asp:Label ID="Label5" runat="server" Text="Address"></asp:Label>
                                         </td>
                                               <td style="padding: -1px 5px; width: 10%" class="no-border">
                                             <asp:TextBox ID="txtAddress" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:TextBox>
                                         </td>
                                              </tr>
                                          <tr style="font-size: 13px;">
                                              <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                             <asp:Label ID="Label6" runat="server" Text="Country"></asp:Label>
                                                  <asp:HiddenField ID="hfdOwnerId" runat="server" />
                                         </td>
                                              <td style="padding: -1px 5px; width: 10%" class="no-border">
                                             <asp:TextBox ID="txtCountry" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:TextBox>
                                         </td>
                                               <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                         <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                             <asp:Label ID="Label7" runat="server" Text="City"></asp:Label>
                                         </td>
                                               <td style="padding: -1px 5px; width: 10%" class="no-border">
                                             <asp:TextBox ID="txtCity" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:TextBox>
                                         </td>
                                              </tr>
                                          </table>
                                     </div>
                            </asp:Panel>
                        <asp:Panel ID="pnlRelatedDetails" runat="server" CssClass="pnlsubheading">
                            <div class="pull-left" style="margin-top: -8px;">
                                
                                 <div class="breadcrumb-custom flat" >
                                          <a id="aRelated" runat="server">
                                             <asp:Button ID="btnRelated" runat="server" Text="Related Accounts" Width="224px" BackColor="Transparent" BorderStyle="None" OnClick="btnRelated_Click"/>
                                         </a>
                                         <a id="aContact" runat="server">
                                             <asp:Button ID="btnContact" runat="server" Text="Contact" BackColor="Transparent" Width="235px" BorderStyle="None" OnClick="btnContact_Click"/>
                                         </a>
                                      <a id="aOpportunity" runat="server">
                                             <asp:Button ID="btnOpportunity" runat="server" Text="Opportunity" Width="235px" BackColor="Transparent" BorderStyle="None" OnClick="btnOpportunity_Click"/>
                                         </a>
                                      <%--      <a id="aProject" runat="server">
                                             <asp:Button ID="btnProject" runat="server" Text="Project" Width="235px" BackColor="Transparent" BorderStyle="None" OnClick="btnProject_Click"/>
                                         </a>  --%>
                                         <a id="aRelatedOpp" runat="server">
                                             <asp:Button ID="btnRelatedOpp" runat="server" Text="Related Opportunity" Width="235px" BackColor="Transparent" BorderStyle="None" OnClick="btnRelatedOpp_Click"/>
                                         </a>

                                      <a id="aVisits" runat="server">
                                             <asp:Button ID="btnVisits" runat="server" Text="Visits" Width="235px" BackColor="Transparent" BorderStyle="None" OnClick="btnVisits_Click"/>
                                         </a>
                                             
                                        </div>

                            </div>

                             <div class="pull-right" style="margin-top: -9px; width: 10%; padding-right: 1%;">
                                  <asp:DropDownList ID="ddlStatus" runat="server" CssClass="textBox1 form-control" BackColor="#e8eaed" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                             
                                 </div>
                             <div class="pull-right" style="margin-top: -9px; width: 10%; padding-right: 1%; margin-right:4%;">
                                <asp:DropDownList ID="ddlSubstage" runat="server"  CssClass="textBox1 form-control" OnSelectedIndexChanged="ddlSubstage_SelectedIndexChanged" BackColor="#e8eaed" AutoPostBack="true"></asp:DropDownList> 
                                 </div>
                        </asp:Panel>
                      <div id="Div1" runat="server" style="overflow-y: auto; max-height: calc(100vh - 480px);overflow-x:hidden">
                            
                        
                           <asp:GridView ID="gdvRelated" runat="server" AutoGenerateColumns="False"
                                 CellSpacing="0" BorderWidth="0" AllowSorting="True" EmptyDataText="No Data Found"
                                class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                                <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                <Columns>

                                  

                                    <asp:TemplateField HeaderText="" ItemStyle-Width="15%" Visible="True" SortExpression="LastAssignmentDate">
                                        <ItemTemplate>
                                            <asp:Label ID="lb1" Text='<%#(Eval("col1").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                       <ItemStyle HorizontalAlign="Center" Width="5%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="PrimaryCategory">
                                        <ItemTemplate>
                                            <asp:Label ID="lb2" Text='<%#(Eval("col2").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" SortExpression="SubCategory">
                                        <ItemTemplate>
                                            <asp:Label ID="lb3" Text='<%#(Eval("col3").ToString()) %>' runat="server" />
                                        </ItemTemplate>
                                       <ItemStyle HorizontalAlign="Center" Width="5%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="Phone">
                                        <ItemTemplate>
                                            <asp:Label ID="lb4" Text='<%#(Eval("col4").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>

                                        <ItemStyle HorizontalAlign="Center" Width="10%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Left" SortExpression="Email">
                                        <ItemTemplate>
                                            <asp:Label ID="lb5" Text='<%#(Eval("col5").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>

                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Left" SortExpression="URL">
                                        <ItemTemplate>
                                            <asp:Label ID="lb6" Text='<%#(Eval("col6").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>

                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Left" SortExpression="URL">
                                        <ItemTemplate>
                                            <asp:Label ID="lb7" Text='<%#(Eval("col7").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>

                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                    </asp:TemplateField>
                                   <asp:TemplateField HeaderText="" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Left" SortExpression="URL">
                                        <ItemTemplate>
                                            <asp:Label ID="lb8" Text='<%#(Eval("col8").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>

                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                    </asp:TemplateField>

                                     <asp:TemplateField HeaderText="" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Left" SortExpression="URL">
                                        <ItemTemplate>
                                            <asp:Label ID="lb9" Text='<%#(Eval("col9").ToString()) %>'
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
                        </div>
                    </div>
                


                                         

            </asp:Panel>

            <cc1:ModalPopupExtender ID="mpActionPlan" runat="server" PopupControlID="pnlActionPlan" TargetControlID="btnCloseAction"
                Enabled="true" CancelControlID="btnCloseAction" DropShadow="true" BehaviorID="Mp25" RepositionMode="RepositionOnWindowResizeAndScroll"
                BackgroundCssClass="modalBackground">
            </cc1:ModalPopupExtender>

            <asp:Panel ID="pnlActionPlan" runat="server" CssClass="modalPopup" align="center" Style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 50px !important; display: none; font-family: 'Times New Roman'; font-size: medium" BorderStyle="Solid" BorderWidth="1px">

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
                                <asp:Label ID="Label26" class="subpnlhdg" runat="server" Text="Action Plan"></asp:Label>
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
                                            <asp:Label ID="Label28" runat="server" Text="Account Name"></asp:Label>
                                            <asp:HiddenField ID="hfdActionAccountId" runat="server" />
                                            <asp:HiddenField ID="hfdRelationPercp" runat="server" />
                                            <asp:HiddenField ID="hfdRemarksP" runat="server" />
                                            <asp:HiddenField ID="hfdCustomerStatusP" runat="server" />
                                        </td>
                                        <td style="padding: 3px 5px; width: 8%" class="no-border">
                                            <asp:TextBox ID="txtAccountNameP" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>

                                        </td>
                                        <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>

                                    </tr>
                                    <tr>
                                        <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                            <asp:Label ID="Label32" runat="server" Text="Action Owner"></asp:Label>
                                        </td>

                                        <td style="padding: 3px 5px; width: 10%" class="no-border">

                                           <asp:DropDownList ID="ddlTaggedIn" CssClass="textBox1 form-control " runat="server" OnSelectedIndexChanged="ddlTaggedIn_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                          
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
                                    <asp:LinkButton ID="lbSaveActionPlan" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="lbSaveActionPlan_Click"><i class="fa fa-floppy-o" aria-hidden="true" title="Save"></i></asp:LinkButton>
                                </div>
                            </td>
                           
                        </tr>
                    </table>
                          </div>

                </div>

            </asp:Panel>



            <div class="modal fade" id="mpAccountShowhistory" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content" style="width: 314%; right: 107%;">
                        <div class="modal-header">
                            <h3 class="modal-title" id="h5">History</h3>
                            <button type="button" class="btn btn-close" data-bs-dismiss="modal" aria-label="Close">
                            </button>
                        </div>
                        <div class="card-body" style="margin-top: -2%;">
                            <div class="nav-align-top tab-Inspections" style="padding-top: 1%;">

                                <ul class="nav nav-tabs" role="tablist">

                                    <li class="nav-item">
                                        <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#tab-SalesmanUpdate" aria-controls="tab-SalesmanUpdate" aria-selected="false">Salesman Update</button>
                                    </li>
                                    <li class="nav-item">
                                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-SalesmanagerUpdate" aria-controls="tab-SalesmanagerUpdate" aria-selected="false">Salesmanager Update</button>
                                    </li>





                                </ul>

                                <div class="tab-content">





                                    <div class="tab-pane fade show active" id="tab-SalesmanUpdate" role="tabpanel">

                                        <div class="" style="margin-top: 1%;">

                                            <table class="table table-bordered table-striped Account-table">


                                                <thead>
                                                    <tr>
                                                        <th>Relation Perc </th>
                                                        <th>Customer Status</th>
                                                        <th>Customer Assessment</th>
                                                        <th>UpdatedBy</th>
                                                        <th>Updated Date</th>
                                                       

                                                    </tr>
                                                </thead>


                                                <tbody class="tbody-Salesman">
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>




                                    <div class="tab-pane fade" id="tab-SalesmanagerUpdate" role="tabpanel">

                                        <div class="" style="margin-top: 1%;">

                                            <table class="table table-bordered table-striped Account-table">


                                                <thead>
                                                    <tr>
                                                       <th>Relation Perc </th>
                                                        <th>Customer Status</th>
                                                        <th>Customer Assessment</th>
                                                        <th>UpdatedBy</th>
                                                        <th>Updated Date</th>
                                                    </tr>
                                                </thead>


                                                <tbody class="tbody-Salesmanager">
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            



            

        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="lblExport" />
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

