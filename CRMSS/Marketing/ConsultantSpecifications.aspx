<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="ConsultantSpecifications.aspx.cs" Inherits="Marketing_ConsultantSpecifications" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <link rel="stylesheet" href="../Theme/Modified/modifiedcss.css" type="text/css" />
     <link rel="stylesheet" href="../Template/assets/vendor/libs/toaster/toaster.css" type="text/css" />
      <link rel="stylesheet" href="../Theme/Modified/modifiedcss.css" type="text/css" />
     <link rel="stylesheet" href="../Template/assets/vendor/libs/toaster/toaster.css" type="text/css" />

   

    <script src="../js/jquery-1.11.2.min.js"></script>
    
    <script src="../CustomSearch/js/jquery-customselect-1.9.1.js"></script>
    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
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
  
  <%--  <style type="text/css">
      
        
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

        .emptyhistory {
            color: red;
            /* height: 16px; */
            font-size: large;
            border-color: white;
        }
  
        .pnlheading {
            height:60px;
        }
        h1, .h1, h2, .h2, h3, .h3 {
    margin-top: 10px;
    margin-bottom: 10px;
}

    </style>--%>


   <%-- <script src="../js/jquery-1.11.2.min.js"></script>
    <script src="../CustomSearch/js/jquery-customselect-1.9.1.js"></script>
    <script language="javascript" type="text/javascript">
        function Focus(objname, waterMarkText) {
            obj = document.getElementById(objname);
            if (obj.value == waterMarkText) {
                obj.value = "";
                obj.className = "NormalTextBox";
            }
        }
        function Blur(objname, waterMarkText) {
            obj = document.getElementById(objname);
            if (obj.value == "") {
                obj.value = waterMarkText;
                obj.className = "WaterMarkedTextBox";
            }
            else {
                obj.className = "NormalTextBox";
            }
        }


    </script>
  
    
</asp:Content>--%>
<%--<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
        <ContentTemplate>--%>




            <div class="GridviewDiv" id="pnlSummaryView" runat="server">

              <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">

                     <asp:Panel ID="Panel1" runat="server" CssClass="pnlheading">
                       <div class="card-header pnlheading">
                          
                            <h3>
                                <asp:Label ID="Label13" ForeColor="White" Font-Bold="true" runat="server" Text="Consultant Specifications"></asp:Label>
                                <asp:HiddenField ID="hfdSummaryRowCount" Value="50" runat="server" />
                            </h3>
                            


                        </div>
                    </asp:Panel>
                    <div class="card-block">

                        <div class="row">
                             <div class="pull-right">
                                <label class="form-label">
                                    Company : 
                                                <asp:DropDownList ID="ddlOrganization" CssClass="form-control textBox1" runat="server" ForeColor="Black" AutoPostBack="true" OnSelectedIndexChanged="ddlOrganization_SelectedIndexChanged"></asp:DropDownList>
                                </label>
                            </div>
                              &nbsp;&nbsp;  &nbsp;&nbsp;
                            
                               <div class="pull-right">
                                <label class="form-label">
                                    Owner : 
                                                <asp:DropDownList ID="ddlOwner" CssClass="form-control textBox1" runat="server" ForeColor="Black" AutoPostBack="true" OnSelectedIndexChanged="ddlOwner_SelectedIndexChanged"></asp:DropDownList>
                                </label>
                            </div>
                              &nbsp;&nbsp;  &nbsp;&nbsp;
                             <div class="pull-right">
                                <label class="form-label">
                                    Consultant : 
                                                <asp:TextBox ID="txtConsultant" CssClass="form-control textBox1" runat="server" ForeColor="Black" AutoPostBack="true" OnTextChanged="txtConsultant_TextChanged"></asp:TextBox>
                                </label>
                            </div>
                              &nbsp;&nbsp;  &nbsp;&nbsp;
                             <div class="pull-right">
                                   <label class="form-label">
                                      Status  : 
                                                <asp:DropDownList ID="ddlStatus" CssClass="form-control textBox1" runat="server" ForeColor="Black" AutoPostBack="true" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged">
                                                    <asp:ListItem Text="ALL" Value="-1" Selected="True"></asp:ListItem>
                                                <asp:ListItem Text="REJECTED" Value="3"></asp:ListItem>
                                                </asp:DropDownList>
                                   </label>
                               </div>


                               &nbsp;&nbsp;  &nbsp;&nbsp;
                            
                            
                                <div class="pull-right">
                                   <label class="form-label" style="padding-top:25px;">
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
                         <div id="Div1" runat="server" style="overflow-x:auto">
                        <asp:GridView ID="gdvSummary" runat="server" AutoGenerateColumns="False" 
                         OnPageIndexChanging="gdvSummary_PageIndexChanging" OnRowDataBound="gdvSummary_RowDataBound"
                            OnRowCommand="gdvSummary_RowCommand" OnRowEditing="gdvSummary_RowEditing" OnRowUpdating="gdvSummary_RowUpdating"
                          
                            CellSpacing="0" BorderWidth="0" AllowSorting="True" EmptyDataText="No Data Found"
                            class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                                <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                            <Columns>

                                <asp:TemplateField HeaderText="Consultant Name" ItemStyle-Width="5%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="ConsultantName">
                                    <ItemTemplate>
                                        <asp:Label ID="lblConsultantName" Text='<%#(Eval("ConsultantName").ToString()) %>'
                                            runat="server" />
                                        <asp:HiddenField ID="hfdConsultantID" Value='<%#(Eval("ConsultantID").ToString()) %>'
                                            runat="server" />
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" />

                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Owner Name" ItemStyle-Width="15%" Visible="True" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lblOwnerName" Text='<%#(Eval("OwnerName").ToString()) %>'
                                            runat="server" />
                                    </ItemTemplate>

                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Relationship Perc" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtRelationPerc" Text='<%#(Eval("RelationPerc").ToString()) %>' onfocus="Focus(this.id,'0.00')" onblur="Blur(this.id,'0.00')"
                                            runat="server" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Can We Reject" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:DropDownList ID="ddlReject" runat="server">
                                            <asp:ListItem Text="SELECT" Value="-"></asp:ListItem>
                                            <asp:ListItem Text="YES" Value="Yes"></asp:ListItem>
                                            <asp:ListItem Text="NO" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="RejectOthers" ItemStyle-Width="10%" Visible="false" ItemStyle-HorizontalAlign="Center" >
                                    <ItemTemplate>
                                        <asp:Label ID="lblRejectOthers" Text='<%#(Eval("RejectOthers").ToString()) %>'
                                            runat="server" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                                </asp:TemplateField>
                                   <asp:TemplateField HeaderText="Remaks" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtRemarks" runat="server" Height="75px" Style="resize:none" TextMode="MultiLine" Text='<%#(Eval("MarketRemarks").ToString()) %>'/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Update" Visible="true">

                                    <ItemStyle Font-Size="Small" HorizontalAlign="Center" Width="4%" />
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
                                            CommandArgument='<%#Eval("ConsultantID")%>' Style="text-align: center"><i class="fa fa-eye" title="View"></i></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                  <asp:TemplateField HeaderText="History">
                                    <HeaderStyle Font-Size="Small" Width="4%" HorizontalAlign="Center" />
                                    <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lblHistory" runat="server" Text='' CssClass="btn rounded-pill btn-icon btn-round"
                                            CommandArgument='<%#Eval("ConsultantID")%>' CommandName="History" Style="text-align: center"><i class="fa fa-history" title="History"></i></asp:LinkButton>
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
                          <div class="row">
                                <asp:Button runat="server" ID="btnLoadMoreSummary" OnClick="btnLoadMoreSummary_Click" Width="100%" Text="Load More"></asp:Button>
                            </div>

                    </div>


                </div>

            </div>
            <div class="modal fade" id="mpShowhistory" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content" style="width: 136%">
                        <div class="modal-header">
                            <h3 class="modal-title" id="H1">History</h3>
                            <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close">
                    </button>
                        </div>
                        <div class="modal-body">

                             <div id="dvupdate" runat="server" style="overflow-y: auto; height: calc(100vh - 210px);overflow-x:hidden">
                            <asp:GridView ID="gdvHistory" runat="server" EmptyDataText="No History Found..." AutoGenerateColumns="False"
                                CellSpacing="0" BorderWidth="0" AllowSorting="True"
                                 class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                                <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />

                                <HeaderStyle HorizontalAlign="Center" />
                                <Columns>

                                    <asp:TemplateField HeaderText="Product Group" ItemStyle-Width="15%" Visible="True" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblProductType" Text='<%#(Eval("ProductName").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="VLStatus" ItemStyle-Width="15%" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblVLStatus" Text='<%#(Eval("VLStatus").ToString()) %>'
                                                runat="server" />

                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Marketing Comments" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="txtMarketingComments" runat="server" Text='<%#(Eval("MarketingComments").ToString()) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Updated By" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblUpdatedBy" runat="server" Text='<%#(Eval("UpdatedBy").ToString()) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Updated Date" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblUpdateDate" runat="server" Text='<%#(Eval("UpdateDate").ToString()) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                        <asp:TemplateField HeaderText="VL Status" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblUVLStatus" runat="server" Text='<%#(Eval("VLStatus").ToString()) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Audit Status" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblUAuditStatus" runat="server" Text='<%#(Eval("AuditStatus").ToString()) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                   <%-- <asp:TemplateField HeaderText="Audit Status" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblUAuditStatus" runat="server" Text='<%#(Eval("AuditStatus").ToString()) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>--%>
                                       <asp:TemplateField HeaderText="Audit Date" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblUAuditDate" runat="server" Text='<%#(Eval("AuditDate").ToString()) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                       <asp:TemplateField HeaderText="Audit By" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblUAuditBy" runat="server" Text='<%#(Eval("AuditBy").ToString()) %>' />
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

            <div class="modal fade" id="mpConsultantMTUpdateHistory" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content" style="width: 136%">
                        <div class="modal-header">
                            <h3 class="modal-title" id="H2">History</h3>
                           <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close">
                    </button>
                        </div>
                        <div class="modal-body">


                            <asp:GridView ID="gdvCMTUpdateHistory" runat="server" EmptyDataText="No History Found..." AutoGenerateColumns="False"
                                CellSpacing="0" BorderWidth="0" AllowSorting="True"
                                 class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                                <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />

                                <HeaderStyle HorizontalAlign="Center" />
                                <Columns>

                                 
                                    <asp:TemplateField HeaderText="Relationship %" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblRelationshipPerc" Text='<%#(Eval("RelationPerc").ToString()) %>'
                                                runat="server" />

                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Can We Reject" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCanWeReject" runat="server" Text='<%#(Eval("RejectOthers").ToString()) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Marketing Comments" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblComments" runat="server" Text='<%#(Eval("MarketRemarks").ToString()) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Updated By" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblUpdatedBy" runat="server" Text='<%#(Eval("UpdatedBy").ToString()) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Updated Date" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblUpdateDate" runat="server" Text='<%#(Eval("MarketUpdateDate").ToString()) %>' />
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
                   <asp:Panel ID="pnlDetailView" runat="server" Visible="false">
             
                    <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">
                            <asp:Panel ID="Panel3" runat="server" CssClass="pnlheading">
                        <div class="card-header pnlheading">
                            <div class="pull-left" >
                            <h3>
                                <asp:Label ID="Label8" ForeColor="White" Font-Bold="true" runat="server" Text="Consultant Specifications"></asp:Label>
                                
                            </h3>
                                </div>
                             <div class="pull-right" >
                                
                               <asp:LinkButton ID="btnBackPage" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="btnBackPage_Click"
                                                ><i class="fa fa-arrow-circle-left" aria-hidden="true" title="Go Back"></i></asp:LinkButton>   
                                </div>


                        </div>
                    </asp:Panel>
                         <div class="card-block">
                            <asp:Panel ID="Panel2" runat="server" CssClass="pnlsubheading">
                                 <div class="pull-left">
                                     <h5>
                                         <asp:Label ID="Label2" class="panel-heading" Style="color: white;" runat="server" Text="Consultant Details"></asp:Label></h5>
                                 </div>
                                
                             </asp:Panel>
                         

                       
                            <table class="table table-condensed" style="width: 100%">

                                <tr>
                                
                                    <td style="padding: 10px 5px; width: 5%" class="label-alignment no-border">
                                        <asp:Label ID="Label20" runat="server" Text="Consultant Name"></asp:Label>
                                          <asp:HiddenField ID="hfdConsultantID" runat="server" />
                                    </td>

                                    <td style="padding: 3px 5px; width: 10%" class="no-border">
                                        <asp:TextBox ID="txtConsultantName"  runat="server" CssClass="textBox1 form-control" Enabled="false" Font-Bold="True"></asp:TextBox>
                                    </td>

                                    <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                    <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                        <asp:Label ID="Label21" runat="server" Text="Owner"></asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px; width: 8%" class="no-border">
                                        <asp:TextBox ID="txtOwner" runat="server" CssClass="textBox1 form-control" Font-Bold="True" Enabled="false"></asp:TextBox>
                                    </td>
                                   
                                </tr>
                                <tr>
                                
                                    <td style="padding: 10px 5px; width: 5%" class="label-alignment no-border">
                                        <asp:Label ID="Label1" runat="server" Text="Attachment"></asp:Label>
                                        
                                    </td>

                                    <td style="padding: 3px 5px; width: 10%" class="no-border">
                                        <div class="pull-left">
                                              <asp:FileUpload ID="FuFile" runat="server" />
                                        </div>
                                       <asp:LinkButton ID="btnUpload" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="btnUpload_Click"
                                                ><i class="fa fa-upload" aria-hidden="true" title="Upload"></i></asp:LinkButton>   
                                    </td>

                                    <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                    <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                        <asp:Label ID="lbluploaded" runat="server" Text="UploadedFile"></asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px; width: 8%" class="no-border">
                                         <asp:LinkButton ID="lblUploadedFileName" runat="server" Text="" OnClick="lblUploadedFileName_Click"></asp:LinkButton>
                                    </td>
                                   
                                </tr>
                                <tr>
                                      <td style="padding: 3px 5px;" class="label-alignment no-border" colspan="6">
                                        <asp:Label ID="lblUpdateError" runat="server" Text="" ForeColor="Red"></asp:Label>
                                    </td>
                                </tr>
                            </table>

                           <asp:Panel ID="Panel10" runat="server" CssClass="pnlsubheading">
                                 <div class="pull-left">
                                     <h5>
                                         <asp:Label ID="Label46" class="panel-heading" Style="color: white;" runat="server" Text="Specifications"></asp:Label></h5>
                                 </div>
                                
                             </asp:Panel>
                      

                            <%-- consultant Specifications--%>
                            <asp:GridView ID="gdvSpec" runat="server" AutoGenerateColumns="False"
                                AllowSorting="True" EmptyDataText="No Data Found" AllowPaging="true" PageSize="10" OnPageIndexChanging="gdvSpec_PageIndexChanging"
                                OnRowCommand="gdvSpec_RowCommand" OnRowDataBound="gdvSpec_RowDataBound"
                                OnRowEditing="gdvSpec_RowEditing" OnRowUpdating="gdvSpec_RowUpdating"
                                class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                               <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Product Group" ItemStyle-Width="15%" Visible="True" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblProductType" Text='<%#(Eval("ProductName").ToString()) %>'
                                                runat="server" />
                                            <asp:HiddenField ID="hfdSpecId" Value='<%#(Eval("CRMId").ToString()) %>' runat="server" />
                                            <asp:HiddenField ID="hfdConsultantId" Value='<%#(Eval("CRMAccountId").ToString()) %>' runat="server" />
                                                <asp:HiddenField ID="hfdCommitmentQuoter" Value='<%#(Eval("commitmentQuoter").ToString()) %>' runat="server" />
                                                <asp:HiddenField ID="hfdCommitmentyear" Value='<%#(Eval("CommitmentYear").ToString()) %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="VLStatus" ItemStyle-Width="15%" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblVLStatus" Text='<%#(Eval("VLStatus").ToString()) %>'
                                                runat="server" />
                                       
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                  
                                    <asp:TemplateField HeaderText="VL Status" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:DropDownList ID="ddlVLStatus" runat="server">
                                                <asp:ListItem Text="SELECT" Value="-" ></asp:ListItem>
                                                <asp:ListItem Text="NOT APPROVED" Value="Not Approved"></asp:ListItem>
                                                <asp:ListItem Text="NOT AVAILABLE" Value="Not Available"></asp:ListItem>
                                                <asp:ListItem Text="NOT REQUIRED" Value="Not Required"></asp:ListItem>
                                                <asp:ListItem Text="APPROVED" Value="Approved"></asp:ListItem>
                                                <asp:ListItem Text="SPECS" Value="Specs"></asp:ListItem>
                                                <asp:ListItem Text="PARTIALLY" Value="Partially"></asp:ListItem>
                                            </asp:DropDownList>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                      
                                    <asp:TemplateField HeaderText="Marketing Comments" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtMarketingComments" runat="server"  Text='<%#(Eval("MarketingComments").ToString()) %>'/>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Commitment Quarter" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:DropDownList ID="ddlCommitmentQuoter" runat="server">
                                                <asp:ListItem Text="SELECT" Value="-" ></asp:ListItem>
                                                <asp:ListItem Text="Q1" Value="3"></asp:ListItem>
                                                <asp:ListItem Text="Q2" Value="6"></asp:ListItem>
                                                <asp:ListItem Text="Q3" Value="9"></asp:ListItem>
                                                <asp:ListItem Text="Q4" Value="12"></asp:ListItem>
                                            </asp:DropDownList>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Commitment Year" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                          <asp:DropDownList ID="ddlCommitmentYear" runat="server">
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
                                                CommandArgument='<%#Eval("CRMId")%>' CommandName="History" Style="text-align: center"><i class="fa fa-history" title="History"></i></asp:LinkButton>
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


        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnUpload" />
             <asp:PostBackTrigger ControlID="lblUploadedFileName" />
            
        </Triggers>

    </asp:UpdatePanel>
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
