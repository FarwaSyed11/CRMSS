<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="MasterProjectOrLead.aspx.cs" Inherits="CRMAdmin_MasterProjectOrLead" %>



<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <link rel="stylesheet" href="../Theme/Modified/modifiedcss.css" type="text/css" />
     <link rel="stylesheet" href="../Template/assets/vendor/libs/toaster/toaster.css" type="text/css" />

   
    <script src="../CRMAdmin/Script/masterproject.js?v=0.8"></script>
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
    <style>
        .nav-tabs .nav-link.active, .nav-tabs .nav-item.show .nav-link {
    color: #ffffff;
    background-color: #a92828;
    border-color: #fff;
   
}
 .nav-tabs .nav-item .nav-link.active
 {
     color: #ffffff;
    background-color: #a92828;
    border-color: #fff;
 }
 .nav-tabs .nav-item .nav-link:hover
 {
      color: #ffffff;
    background-color: #a92828;
    border-color: #fff;
 }
  .nav-tabs .nav-item .nav-link:not(.active) {
        color: black;
        background-color: #b4b9bf;
          
}

               .PRJ-AdminHistory-table th {
             background-color: #a92828 !important;
             color: white !important;
    }

       .PRJ-AdminHistory-table td {
             color: #333333 !important;
    }

       
       .PRJ-MajorInfo-table th {
             background-color: #a92828 !important;
             color: white !important;
    }

       .PRJ-MajorInfo-table td {
             color: #333333 !important;
    }

        .PRJ-MediaInfo-table th {
             background-color: #a92828 !important;
             color: white !important;
    }

       .PRJ-MediaInfo-table td {
             color: #333333 !important;
    }

         .PRJ-MoreInfo-table th {
             background-color: #a92828 !important;
             color: white !important;
    }

       .PRJ-MoreInfo-table td {
             color: #333333 !important;
    }

       .btnVerify{
          color:white;
          background-color:#62dd15;
          width:133px;
          border-block-color: white;
      }

    </style>
   
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
                                <asp:Label ID="Label13" ForeColor="White" Font-Bold="true" runat="server" Text="MASTER PROJECT OR LEAD"></asp:Label>
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
                                             runat="server"><i class="fa fa-plus" aria-hidden="true" title="Add New Opportunity"></i></asp:LinkButton>   
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
                                <asp:Panel runat="server" ID="pnlRefSearch" style="padding-top:5px" Visible="false">
                                    <div class="row">
                                        <div style="width: 30%">
                                              Ref # 
                                        </div>
                                        <div style="width: 60%">
                                             <asp:TextBox ID="txtRefSearch" CssClass="form-control textBox1" runat="server" ForeColor="Black" ></asp:TextBox>
                                        </div>
                                          <div style="width: 5%">
                                               <asp:Button ID="btnRefSearchClose" runat="server" CssClass="btn btn-close" style="padding: 10px 0px;" OnClick="btnRefSearchClose_Click">
                                        </asp:Button>
                                              </div>
                                    </div>
                                </asp:Panel>
                                <asp:Panel runat="server" ID="pnlCountrySearch" style="padding-top:5px" Visible="false">
                                    <div class="row">

                                        <div style="width: 30%">
                                            Country 
                                        </div>
                                        <div style="width: 60%">
                                            <asp:DropDownList ID="ddlCountrySearch" CssClass="form-control textBox1" runat="server" ForeColor="Black" OnSelectedIndexChanged="ddlCountrySearch_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                        </div>
                                          <div style="width: 5%">
                                               <asp:Button ID="btnCountrySearchClose" runat="server" CssClass="btn btn-close" style="padding: 10px 0px;" OnClick="btnCountrySearchClose_Click">
                                            
                                        </asp:Button>
                                              </div>
                                    </div>
                                </asp:Panel>
                                <asp:Panel runat="server" ID="pnlCitySearch" style="padding-top:5px" Visible="false">
                                    <div class="row">
                                        <div style="width: 30%">
                                            City 
                                        </div>
                                        <div style="width: 60%">
                                            <asp:DropDownList ID="ddlCitySearch"  CssClass="form-control textBox1" runat="server" ForeColor="Black"  style="max-width:100%"></asp:DropDownList>
                                        </div>
                                        <div style="width: 5%">
                                               <asp:Button ID="btnCitySearchClose" runat="server" CssClass="btn btn-close" style="padding: 10px 0px;" OnClick="btnCitySearchClose_Click">
                                            
                                        </asp:Button>
                                              </div>
                                    </div>
                                </asp:Panel>
                                <asp:Panel runat="server" ID="pnlConsultantSearch" style="padding-top:5px" Visible="false">
                                    <div class="row">
                                        <div style="width: 30%">
                                              Consultant 
                                        </div>
                                        <div style="width: 60%">
                                             <asp:TextBox ID="txtConsulatntSearch"  CssClass="form-control textBox1" runat="server" ForeColor="Black" ></asp:TextBox>
                                        </div>
                                        <div style="width: 5%">
                                               <asp:Button ID="btnConsultantSearchClose" runat="server" CssClass="btn btn-close" style="padding: 10px 0px;" OnClick="btnConsultantSearchClose_Click">
                                            
                                        </asp:Button>
                                              </div>
                                    </div>
                                </asp:Panel>

                                <asp:Panel runat="server" ID="pnlPlotSearch" style="padding-top:5px" Visible="false">
                                    <div class="row">
                                        <div style="width: 30%">
                                              Plot # 
                                        </div>
                                        <div style="width: 60%">
                                             <asp:TextBox ID="txtPlotSearch" CssClass="form-control textBox1" runat="server" ForeColor="Black" ></asp:TextBox>
                                        </div>
                                          <div style="width: 5%">
                                               <asp:Button ID="btnPlotCloseSearchClose" runat="server" CssClass="btn btn-close" style="padding: 10px 0px;" OnClick="btnPlotCloseSearchClose_Click">
                                            
                                        </asp:Button>
                                              </div>
                                    </div>
                                </asp:Panel>
                                    <asp:Panel runat="server" ID="pnlTypeSearch" style="padding-top:5px" Visible="false">
                                    <div class="row">
                                        <div style="width: 30%">
                                               Type  
                                        </div>
                                        <div style="width: 60%">
                                            <asp:DropDownList ID="ddlTypeSearch" CssClass="form-control textBox1" runat="server" ForeColor="Black" >
                                                <asp:ListItem Text="ALL" Value="-"></asp:ListItem>
                                                <asp:ListItem Text="LEAD" Value="LEAD"></asp:ListItem>
                                                 <asp:ListItem Text="MASTER PROJECT" Value="MASTER PROJECT"></asp:ListItem>
                                                </asp:DropDownList>
                                        </div>
                                        <div style="width: 5%">
                                               <asp:Button ID="btnTypeSearchClose" runat="server" CssClass="btn btn-close" style="padding: 10px 0px;" OnClick="btnTypeSearchClose_Click">
                                            
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
                                            <asp:DropDownList ID="ddlVerify" CssClass="form-control textBox1" runat="server" ForeColor="Black" >
                                                <asp:ListItem Text="ALL" Value="-1"></asp:ListItem>
                                                <asp:ListItem Text="Verified" Value="1"></asp:ListItem>
                                                 <asp:ListItem Text="Not Verified" Value="0"></asp:ListItem>
                                                </asp:DropDownList>
                                        </div>
                                        <div style="width: 5%">
                                               <asp:Button ID="btnStatusClose" runat="server" CssClass="btn btn-close" style="padding: 10px 0px;" OnClick="btnStatusClose_Click">
                                            
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
                                                 <asp:ListItem Text="Ref #" Value="pnlRefSearch"></asp:ListItem>
                                                <asp:ListItem Text="Country" Value="pnlCountrySearch" ></asp:ListItem>
                                                 <asp:ListItem Text="City" Value="pnlCitySearch"></asp:ListItem>
                                                 <asp:ListItem Text="Consultant" Value="pnlConsultantSearch"></asp:ListItem>
                                                  <asp:ListItem Text="Plot" Value="pnlPlotSearch"></asp:ListItem>
                                                  <asp:ListItem Text="Type" Value="pnlTypeSearch"></asp:ListItem>
                                                  <asp:ListItem Text="Status" Value="pnlStatus"></asp:ListItem>
                                                   
                                              


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
                                OnSorting="gdvSummaryDetails_Sorting"
                                OnRowCommand="gdvSummaryDetails_RowCommand"
                                CellSpacing="0" BorderWidth="0" AllowSorting="True" EmptyDataText="No Data Found"
                                class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                                <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                 <HeaderStyle CssClass="GridHeader-blue" />
                                <Columns>

                                    <asp:TemplateField HeaderText="Ref Number" ItemStyle-Width="5%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="RefNumber">
                                        <ItemTemplate>
                                            <asp:Label ID="lblRefNumber" Text='<%#(Eval("RefNumber").ToString()) %>'
                                                runat="server" />
                                            <asp:HiddenField ID="hfdRefNumber" Value='<%#(Eval("RefNumber").ToString()) %>'
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
                                    <asp:TemplateField HeaderText="Type" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="Type">
                                        <ItemTemplate>
                                            <asp:Label ID="lblType" Text='<%#(Eval("Type").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Consultant" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" SortExpression="Consultant">
                                        <ItemTemplate>
                                            <asp:Label ID="lblConsultant" Text='<%#(Eval("Consultant").ToString()) %>' runat="server" />
                                        </ItemTemplate>
                                        <ItemStyle Width="10%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="ProjectType" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="ProjectType">
                                        <ItemTemplate>
                                            <asp:Label ID="lblProjectType" Text='<%#(Eval("ProjectType").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>

                                        <ItemStyle HorizontalAlign="Center" Width="10%" />
                                    </asp:TemplateField>
                                
                                    <asp:TemplateField HeaderText="Country" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="Country">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCountry" Text='<%#(Eval("Country").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>

                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="PlotNo" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="PlotNo">
                                        <ItemTemplate>
                                            <asp:Label ID="lblPlotNo" Text='<%#(Eval("PlotNo").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>

                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                    </asp:TemplateField>
                               

                                    <asp:TemplateField HeaderText="View">
                                        <HeaderStyle Font-Size="Small" Width="4%" HorizontalAlign="Center" />
                                        <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lblView" runat="server" Text='' CommandName="View" CssClass="btn rounded-pill btn-icon btn-round"
                                                CommandArgument='<%#Eval("MLID")%>' Style="text-align: center"><i class="fa fa-eye" title="View"></i></asp:LinkButton>
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
          

               <cc1:ModalPopupExtender ID="mpAddNew" runat="server" PopupControlID="pnlAddNew" TargetControlID="btnCloseAdd"
                Enabled="true" CancelControlID="btnCloseAdd" DropShadow="true" BehaviorID="ModalPopupExtenderBehavior21" RepositionMode="RepositionOnWindowResizeAndScroll"
                BackgroundCssClass="modalBackground">
            </cc1:ModalPopupExtender>

            <asp:Panel ID="pnlAddNew" runat="server" CssClass="modalPopup" align="center" Style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 50px !important; display: none; font-family: 'Times New Roman'; font-size: medium" BorderStyle="Solid" BorderWidth="1px">

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
                                <asp:Label ID="Label5" class="subpnlhdg" runat="server" Text="NEW PROJECT/LEAD"></asp:Label>
                                 <asp:HiddenField ID="hfdNEWRefNumber" runat="server" ></asp:HiddenField>
                                <asp:HiddenField ID="hfdMasterProjectId" runat="server" ></asp:HiddenField>
                            </h4>

                        </div>


                        <div class="pull-right">
                             <button type="button" class="btn btn-close"  aria-label="Close" runat="server" id="btnCloseAdd"/>
                         <%--   <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="../Icons/deleteData.png" Style="padding-top: 10%;" /></td>--%>
                        </div>

                    </div>
					<div class="popupmaxheight">
						<table class="table table-condensed" style="width: 100%;">

							

                            <tr>
                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label25" runat="server" Text="Name"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 8%" class="no-border">
                                    <asp:TextBox ID="txtName" CssClass="textBox1 form-control " runat="server" />
                                </td>
                                <td style="padding: 3px 5px; width: 1%" class="no-border"></td>
                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label23" runat="server" Text="Type"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 8%" class="no-border">
                                    <asp:DropDownList ID="ddlTypeNew" runat="server" CssClass="textBox1 form-control " Font-Bold="True" OnSelectedIndexChanged="ddlTypeNew_SelectedIndexChanged" AutoPostBack="true">
                                        <asp:ListItem Text="LEAD" Value="LEAD"></asp:ListItem>
                                        <asp:ListItem Text="MASTER PROJECT" Value="MASTER PROJECT"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>

                            </tr>

							<tr>
                                  <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label24" runat="server" Text="Stage"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 8%" class="no-border">
                                    <asp:DropDownList ID="ddlStageNew" runat="server" CssClass="textBox1 form-control " Font-Bold="True">
                                         <asp:ListItem Text="-" Value="-"></asp:ListItem>
                                        <asp:ListItem Text="Feasibility" Value="Feasibility"></asp:ListItem>
                                        <asp:ListItem Text="Concept" Value="Concept"></asp:ListItem>
                                               <asp:ListItem Text="Design" Value="Design"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                 <td style="padding: 3px 5px; width: 1%" class="no-border"></td>
								<td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
									<asp:Label ID="Label27" runat="server" Text="Consultant"></asp:Label>
								</td>
								<td style="padding: 3px 5px; width: 8%" class="no-border">
									<div class="input-group">
										<span class="input-group-text">
											<asp:LinkButton ID="lblConsultantSearchNew" runat="server" Text="" OnClick="lblConsultantSearchNew_Click"><i class="tf-icons bx bx-search"></i></asp:LinkButton></span>
										<asp:TextBox ID="txtConsultantNew" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
										<asp:HiddenField ID="hfdConsultantIDNew" runat="server" />
									</div>
								</td>

							

							</tr>
			
							<tr>
								<td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
									<asp:Label ID="Label10" runat="server" Text="Main Contract"></asp:Label>
								</td>
								<td style="padding: 3px 5px; width: 8%" class="no-border">
									<div class="input-group">
										<span class="input-group-text">
											<asp:LinkButton ID="lblSearchMainContractorNew" runat="server" Text="" OnClick="lblSearchMainContractorNew_Click"><i class="tf-icons bx bx-search"></i></asp:LinkButton></span>
										<asp:TextBox ID="txtMainContrcatorNew" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
										<asp:HiddenField ID="hfdMainContractIDNew" runat="server" />
									</div>
								</td>
                                  <td style="padding: 3px 5px; width: 1%" class="no-border"></td>
                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
									<asp:Label ID="Label12" runat="server" Text="Developer Client"></asp:Label>
								</td>
								<td style="padding: 3px 5px; width: 8%" class="no-border">
									<div class="input-group">
										<span class="input-group-text">
											<asp:LinkButton ID="lbSearchDeveloperClientNew" runat="server" Text="" OnClick="lbSearchDeveloperClientNew_Click"><i class="tf-icons bx bx-search"></i></asp:LinkButton></span>
										<asp:TextBox ID="txtDeveloperClientNew" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
										<asp:HiddenField ID="hfdDeveloperClientIDNew" runat="server" />
									</div>
								</td>
							</tr>
					
								<tr>

									<td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										<asp:Label ID="Label30" runat="server" Text="Scale"></asp:Label>
									</td>
									<td style="padding: 3px 5px; width: 8%" class="no-border">
										<asp:DropDownList ID="ddlCRMScale" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:DropDownList>
									</td>
                                     <td style="padding: 3px 5px; width: 1%" class="no-border"></td>
                                    <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										<asp:Label ID="Label32" runat="server" Text="Construction Type"></asp:Label>
									</td>
									<td style="padding: 3px 5px; width: 8%" class="no-border">
										<asp:DropDownList ID="ddlCRMConstruction" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:DropDownList>
									</td>
								</tr>
							
								<tr>
                                    	<td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										<asp:Label ID="Label31" runat="server" Text="Type"></asp:Label>
									</td>
									<td style="padding: 3px 5px; width: 8%" class="no-border">
										<asp:DropDownList ID="ddlProjectTypeNew" runat="server" CssClass="textBox1 form-control " Font-Bold="True" OnSelectedIndexChanged="ddlProjectTypeNew_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
									</td>
                                      <td style="padding: 3px 5px; width: 1%" class="no-border"></td>
									<td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										<asp:Label ID="Label33" runat="server" Text="Sub Type"></asp:Label>
									</td>
									<td style="padding: 3px 5px; width: 8%" class="no-border">
										<asp:DropDownList ID="ddlSubTypeNew" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:DropDownList>
									</td>
								</tr>
								<tr>
									
								</tr>
                    
                               <tr>
                                     <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										<asp:Label ID="Label44" runat="server" Text="Country"></asp:Label>
									</td>
									<td style="padding: 3px 5px; width: 8%" class="no-border">
										<asp:DropDownList ID="ddlCountryNew" runat="server" CssClass="textBox1 form-control " Font-Bold="True" OnSelectedIndexChanged="ddlCountryNew_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
									</td>
                                       <td style="padding: 3px 5px; width: 1%" class="no-border"></td>
                                   <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										<asp:Label ID="Label45" runat="server" Text="City"></asp:Label>
									</td>
									<td style="padding: 3px 5px; width: 8%" class="no-border">
										<asp:DropDownList ID="ddlCityNew" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:DropDownList>
									</td>
                                    </tr>
                            <tr>
                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label53" runat="server" Text="Plot #"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 8%" class="no-border">
                                    <asp:TextBox ID="txtPlotNew" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:TextBox>
                                </td>
                                <td style="padding: 3px 5px; width: 1%" class="no-border"></td>
                                 <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label54" runat="server" Text="Location"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 8%" class="no-border">
                                    <asp:TextBox ID="txtLocationNew" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label55" runat="server" Text="Deal Size"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 8%" class="no-border">
                                    <asp:TextBox ID="txtDealSizeNew" runat="server" CssClass="textBox1 form-control " Text="0.0" Font-Bold="True"  Type="numeric" onfocus="Focus(this.id,'0.000')" onblur="Blur(this.id,'0.000')"></asp:TextBox>
                                </td>
                                <td style="padding: 3px 5px; width: 1%" class="no-border"></td>
                                 <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label56" runat="server" Text="Currency"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 8%" class="no-border">
                                  	<asp:DropDownList ID="ddlCurrencyNew" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:DropDownList>
                                </td>
                            </tr>
                             <tr>
                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label57" runat="server" Text="Source Of Info"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 8%" class="no-border">
                                    <asp:DropDownList ID="ddlSourceOfInfoNew" runat="server" CssClass="textBox1 form-control " Font-Bold="True"  OnSelectedIndexChanged="ddlSourceOfInfoNew_SelectedIndexChanged" AutoPostBack="true">
                                         <asp:ListItem  Text="-" Value="-" ></asp:ListItem>
                                        <asp:ListItem  Text="Media" Value="Media" ></asp:ListItem>
                                          <asp:ListItem  Text="Sales" Value="Sales" ></asp:ListItem>
                                          <asp:ListItem  Text="Marketing" Value="Marketing" ></asp:ListItem>
                                          <asp:ListItem  Text="Survey" Value="Survey" ></asp:ListItem>
                                          <asp:ListItem  Text="Other" Value="Other" ></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td style="padding: 3px 5px; width: 1%" class="no-border"></td>
                                 <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label58" runat="server" Text="Source Name"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 8%" class="no-border">
                                  	  <asp:TextBox ID="txtSourceNameNew" runat="server" CssClass="textBox1 form-control " Font-Bold="True"  ></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label59" runat="server" Text="More Info"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 8%" class="no-border">
                                    <asp:TextBox ID="txtMajorMoreInfoNew" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:TextBox>
                                </td>
                                  <td style="padding: 3px 5px; width: 1%" class="no-border"></td>
                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label66" runat="server" Text="Image URL"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 8%" class="no-border">
                                    <asp:TextBox ID="txtImageURLNew" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:TextBox>
                                </td>
                            </tr>



                            <asp:Panel ID="pnlMediaInfoNew" runat="server">
                                 <tr>
                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label60" runat="server" Text="Media Name"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 8%" class="no-border">
                                    <asp:TextBox ID="txtMediaNameNew" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:TextBox>
                                </td>
                                       <td style="padding: 3px 5px; width: 1%" class="no-border"></td>
                                     <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label61" runat="server" Text="Media Reference"></asp:Label>
                                </td>
                                     <td style="padding: 3px 5px; width: 8%" class="no-border">
                                    <asp:TextBox ID="txtMediaRefNew" runat="server" CssClass="textBox1 form-control " Font-Bold="True" ></asp:TextBox>
                                </td>
                            </tr>
                                 <tr>
                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label62" runat="server" Text="Media URL"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 8%" class="no-border">
                                    <asp:TextBox ID="txtMediaURLNew" runat="server" CssClass="textBox1 form-control " Font-Bold="True" ></asp:TextBox>
                                </td>
                                       <td style="padding: 3px 5px; width: 1%" class="no-border"></td>
                                     <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label63" runat="server" Text="Media More Info"></asp:Label>
                                </td>
                                     <td style="padding: 3px 5px; width: 8%" class="no-border">
                                    <asp:TextBox ID="txtMediMoreInfo" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:TextBox>
                                </td>
                            </tr>
                            </asp:Panel>

								 
									
							
						</table>

						

						<div style="padding-top: 20px;">
							<asp:LinkButton ID="lbSaveNew" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="lbSaveNew_Click"><i class="fa fa-floppy-o" aria-hidden="true" title="Save"></i></asp:LinkButton>
						</div>
					</div>

                </div>

            </asp:Panel>



            

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
            <asp:Panel ID="pnlDetailView" runat="server" Visible="false">
             
                    <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">
                           <asp:Panel ID="Panel3" runat="server" CssClass="pnlheading">
                        <div class="card-header pnlheading">
                            <div class="pull-left" >
                            <h3>
                                <asp:Label ID="Label8" ForeColor="White" Font-Bold="true" runat="server" Text="MASTER PROJECT/LEAD"></asp:Label>
                                
                            </h3>
                                </div>
                             <div class="pull-right" >
                                   <%--<asp:LinkButton ID="btnAdminHistory" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="btnAdminHistory_Click"
                                             ><i class="fa fa-address-book" title="Admin Remarks"></i></asp:LinkButton>

                                  <asp:LinkButton ID="btnMediaInfo" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="btnMediaInfo_Click"
                                             ><i class="fa fa-newspaper-o" title="Media Information"></i></asp:LinkButton>


                                   <asp:LinkButton ID="btnMajorInfo" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="btnMajorInfo_Click">
                                       <i class="fa  fa-info-circle" title="Major Information"></i></asp:LinkButton>--%>


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
                                         <asp:Label ID="Label2" class="panel-heading" Style="color: white;" runat="server" Text="Master Project/Lead  Details"></asp:Label></h5>
                                 </div>
                                 <div class="pull-right" style="margin-top: -9px;margin-right: 10px;">
                                      <asp:LinkButton ID="lbUpdate" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="lbUpdate_Click"
                                                ><i class="fa fa-save" aria-hidden="true" title="Update Project Details"></i></asp:LinkButton>   
                                 </div>
                               
                             </asp:Panel>
                         

                       
						
							 <table class="table table-condensed" style="width: 100%;background-color:#e7e7e7;">

								 <tr>
									
                                     
									
										 <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border">

											 <asp:Label ID="Label15" runat="server" Text="Reference Number"></asp:Label>
										 </td>
									 <td style="padding: 3px 5px; width: 8%" class="no-border">

										 <asp:TextBox ID="txtRefNumberEdit" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
									 </td>
										
										 <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                     
									 <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										 <asp:Label ID="Label20" runat="server" Text="Name"></asp:Label>
									 </td>

									 <td style="padding: 3px 5px; width: 10%" class="no-border">
										 <asp:TextBox ID="txtNameEdit" runat="server" CssClass="textBox1 form-control " Enabled="true" Font-Bold="True"></asp:TextBox>
									 </td>

									 <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>

                                      <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label3" runat="server" Text="Type"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 8%" class="no-border">
                                    <asp:DropDownList ID="ddlTypeEdit" runat="server" CssClass="textBox1 form-control " Font-Bold="True" OnSelectedIndexChanged="ddlTypeEdit_SelectedIndexChanged" AutoPostBack="true">
                                        <asp:ListItem Text="LEAD" Value="LEAD"></asp:ListItem>
                                        <asp:ListItem Text="MASTER PROJECT" Value="MASTER PROJECT"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>

										 
                                          <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>

                                      <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label7" runat="server" Text="Stage"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 8%" class="no-border">
                                    <asp:DropDownList ID="ddlStageEdit" runat="server" CssClass="textBox1 form-control " Font-Bold="True">
                                         <asp:ListItem Text="-" Value="-"></asp:ListItem>
                                        <asp:ListItem Text="Feasibility" Value="Feasibility"></asp:ListItem>
                                        <asp:ListItem Text="Concept" Value="Concept"></asp:ListItem>
                                               <asp:ListItem Text="Design" Value="Design"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
								
									 
                                     </tr>
                                 <tr>
									 
				                        <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
											 <asp:Label ID="Label6" runat="server" Text="Consultant"></asp:Label>
										 </td>
                                     <td style="padding: 3px 5px; width: 8%" class="no-border">


                                         <div class="input-group">
                                             <span class="input-group-text">
                                                 <asp:LinkButton ID="lbSearchConsultantEdit" runat="server" Text="" OnClick="lbSearchConsultantEdit_Click"><i class="tf-icons bx bx-search"></i></asp:LinkButton></span>
                                             <asp:TextBox ID="txtConsultantEdit" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
                                             <asp:HiddenField ID="hfdConsultantIDEdit" runat="server" />
                                             <span class="input-group-text"> <asp:LinkButton ID="lbClearConsultantEdit" runat="server" Text="" OnClick="lbClearConsultantEdit_Click"><i class="tf-icons bx bx-refresh"></i></asp:LinkButton></span>
                                         </div>
                                     </td>
								<td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                     
										 <td style="padding: 3px 5px;" class="label-alignment no-border">
											 <asp:Label ID="Label1" runat="server" Text="Main Contractor"></asp:Label>
										 </td>
										 <td style="padding: 3px 5px;" class="no-border">
                                           <div class="input-group">
										<span class="input-group-text">
											<asp:LinkButton ID="lbMainContractorEditSearch" runat="server" Text="" OnClick="lbMainContractorEdit_Click"><i class="tf-icons bx bx-search"></i></asp:LinkButton></span>
										<asp:TextBox ID="txtMainContractorEdit" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
										<asp:HiddenField ID="hfdMainContractorIDEdit" runat="server" />
                                                <span class="input-group-text"> <asp:LinkButton ID="lbCLearMainContractor" runat="server" Text="" OnClick="lbCLearMainContractor_Click"><i class="tf-icons bx bx-refresh"></i></asp:LinkButton></span>
									</div>
										 </td>

                                     	<td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
									 <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										 <asp:Label ID="Label16" runat="server" Text="Developer Client"></asp:Label>
									 </td>
									 <td style="padding: 3px 5px; width: 8%" class="no-border">
                                          <div class="input-group">
												 <span class="input-group-text">
													 <asp:LinkButton ID="lblDeveloperClientEditSearch" runat="server" Text="" OnClick="lblDeveloperClientEditSearch_Click"><i class="tf-icons bx bx-search"></i></asp:LinkButton></span>
												 <asp:TextBox ID="txtDeveloperClientEdit" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
                                               <asp:HiddenField ID="hfdDeveloperClientIDEdit" runat="server" />
                                                 <span class="input-group-text"> <asp:LinkButton ID="lbClearDeveloperClient" runat="server" Text="" OnClick="lbClearDeveloperClient_Click"><i class="tf-icons bx bx-refresh"></i></asp:LinkButton></span>
											 </div>
										
									 </td>
                                     <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                     <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                         <asp:Label ID="Label11" runat="server" Text="Currency"></asp:Label>
                                     </td>
                                     <td style="padding: 3px 5px; width: 8%" class="no-border">
                                        <asp:DropDownList ID="ddlCurrencyEdit" runat="server" CssClass="textBox1 form-control " Font-Bold="True" ></asp:DropDownList>
                                     </td>
                                    

						
								 </tr>
								
								<tr>

									<td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										<asp:Label ID="Label38" runat="server" Text="Scale"></asp:Label>
									</td>
									<td style="padding: 3px 5px; width: 8%" class="no-border">
										<asp:DropDownList ID="ddlCRMScaleEdit" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:DropDownList>
									</td>
                                     <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                    <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										<asp:Label ID="Label41" runat="server" Text="Construction Type"></asp:Label>
									</td>
									<td style="padding: 3px 5px; width: 8%" class="no-border">
										<asp:DropDownList ID="ddlCRMConstructionTypeEdit" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:DropDownList>
									</td>
							    <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
									<td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										<asp:Label ID="Label39" runat="server" Text="Type"></asp:Label>
									</td>
									<td style="padding: 3px 5px; width: 8%" class="no-border">
										<asp:DropDownList ID="ddlProjectTypeEdit" runat="server" CssClass="textBox1 form-control " Font-Bold="True" OnSelectedIndexChanged="ddlProjectTypeEdit_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
									</td>
								 <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
									<td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										<asp:Label ID="Label40" runat="server" Text="Sub Type"></asp:Label>
									</td>
									<td style="padding: 3px 5px; width: 8%" class="no-border">
										<asp:DropDownList ID="ddlProjectSubTypeEdit" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:DropDownList>
									</td>
							
							
								</tr>
                                
								 <tr>
                                     <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										<asp:Label ID="Label42" runat="server" Text="Country"></asp:Label>
									</td>
									<td style="padding: 3px 5px; width: 8%" class="no-border">
										<asp:DropDownList ID="ddlCountryEdit" runat="server" CssClass="textBox1 form-control " Font-Bold="True" OnSelectedIndexChanged="ddlCountryEdit_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
									</td>
								 <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
									<td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										<asp:Label ID="Label43" runat="server" Text="City"></asp:Label>
									</td>
									<td style="padding: 3px 5px; width: 8%" class="no-border">
										<asp:DropDownList ID="ddlCityEdit" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:DropDownList>
									</td>
                                     	 <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
									 <td style="padding: 3px 5px;" class="label-alignment no-border">
										 <asp:Label ID="Label22" runat="server" Text="Plot"></asp:Label>
									 </td>
									 <td style="padding: 3px 5px;" class="no-border">
										 <asp:TextBox ID="txtPlotEdit" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="2" Enabled="true"></asp:TextBox>
									 </td>
									 <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
									 <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										 <asp:Label ID="Label4" runat="server" Text="Location"></asp:Label>
									 </td>
									 <td style="padding: 3px 5px; width: 8%" class="no-border">
										 <asp:TextBox ID="txtLocationEdit" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="true"></asp:TextBox>
									 </td>
                               
								 </tr>
                                 <tr>
                                     <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                         <asp:Label ID="Label9" runat="server" Text="Deal Size"></asp:Label>
                                     </td>
                                     <td style="padding: 3px 5px; width: 8%" class="no-border">
                                         <asp:TextBox ID="txtDealSizeEdit" runat="server" CssClass="textBox1 form-control" Text="0.0" Font-Bold="True" Enabled="true" onfocus="Focus(this.id,'0.0')" onblur="Blur(this.id,'0.0')  "></asp:TextBox>
                                     </td>
                                     <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
									 <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										 <asp:Label ID="Label67" runat="server" Text="Image URL"></asp:Label>
									 </td>
									 <td style="padding: 3px 5px; width: 8%" class="no-border">
										 <asp:TextBox ID="txtImageURLEdit" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="true"></asp:TextBox>
									 </td>

                                      <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
									 <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										 <asp:Label ID="Label82" runat="server" Text="CreatedBy"></asp:Label>
									 </td>
									 <td style="padding: 3px 5px; width: 8%" class="no-border">
										 <asp:TextBox ID="txtCreateBy" runat="server" CssClass="textBox1 form-control" Font-Bold="True" Enabled="false"></asp:TextBox>
									 </td>
                                
                                     <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                     <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                            <asp:CheckBox runat="server" Text="NO Media" ID="chkNoMedia" style="font-weight:bold"/>  
                                     </td>
                                      <td style="padding: 3px 5px; width: 8%" class="no-border" >
                                     <asp:LinkButton ID="lblVerifyView" runat="server" Text="" Font-Bold="true" Font-Size="Medium" OnClick="lblVerifyView_Click"></asp:LinkButton>
                                      <asp:LinkButton ID="lblSetVerify" CssClass="btn btnVerify" runat="server" Text="VERIFY" Font-Bold="true" OnClick="lblSetVerify_Click"></asp:LinkButton>
                                          </td>
                                 </tr>
                              
								 <tr>

									 <td style="padding: 3px 5px;" class="label-alignment no-border" colspan="9">
										 <asp:Label ID="lblUpdateError" runat="server" Text="" ForeColor="Red"></asp:Label>
									 </td>
								 </tr>
							 </table>

        

                           <asp:Panel ID="Panel10" runat="server" CssClass="pnlsubheading">
                                 <div class="pull-left">
                                     <h5>
                                         <asp:Label ID="Label46" class="panel-heading" Style="color: white;" runat="server" Text="Project Details"></asp:Label></h5>
                                 </div>
                                <div class="pull-right" style="margin-top: -9px;margin-right: 10px;">
                                      <asp:LinkButton ID="lblAddProject" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="lblAddProject_Click"
                                                ><i class="fa fa-plus" aria-hidden="true" title="Add An Item"></i></asp:LinkButton>   
                                 </div>
                                
                             </asp:Panel>
                             
                            <%-- Projects details --%>
                       <div id="Div1" runat="server" style="overflow-x: auto">
                                 <asp:GridView ID="gdvProjectDetails" runat="server" AutoGenerateColumns="False"
                                     AllowSorting="True" EmptyDataText="No Data Found" AllowPaging="false" Width="100%" 
                                    OnRowCommand="gdvProjectDetails_RowCommand"
                                     class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                                     <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                     <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                     <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                     <Columns>
                    
                                           <asp:TemplateField HeaderText="Project Number" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                             <ItemTemplate>
                                                     <asp:LinkButton  ID="lblProjectNo" Text='<%#(Eval("ProjectNo").ToString()) %>' CommandName="view" CommandArgument='<%#(Eval("ProjectNoLink").ToString()) %>'
                                                     runat="server" />
                                             </ItemTemplate>
                                         </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Project Name" ItemStyle-Width="15%" Visible="True">
                                             <ItemTemplate>
                                                 <asp:Label ID="lblProjectName" Text='<%#(Eval("ProjectName").ToString()) %>'
                                                     runat="server" />
                                                 <asp:HiddenField ID="hfdMasterProjectId" Value='<%#(Eval("MasterProjectId").ToString()) %>' runat="server" />
                                            
                                             </ItemTemplate>
                                         </asp:TemplateField>
                                   
                                             <asp:TemplateField HeaderText="Consultant" ItemStyle-Width="15%" Visible="True" ItemStyle-HorizontalAlign="Center">
                                             <ItemTemplate>
                                                 <asp:Label ID="lblMEPConsultant" Text='<%#(Eval("MEPConsultant").ToString()) %>' runat="server" />
                                             </ItemTemplate>
                                         </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Marketing" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                             <ItemTemplate>
                                                 <asp:Label ID="lblOwner" Text='<%#(Eval("Owner").ToString()) %>' runat="server" />
                                             </ItemTemplate>
                                         </asp:TemplateField>
                                          <asp:TemplateField HeaderText="Company" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                             <ItemTemplate>
                                                   <asp:Label ID="lblCompany" Text='<%#(Eval("Company").ToString()) %>' runat="server" />
                                             </ItemTemplate>
                                         </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Stage" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                             <ItemTemplate>
                                                    <asp:Label ID="lblStage" Text='<%#(Eval("Stage").ToString()) %>' runat="server" />
                                             </ItemTemplate>
                                         </asp:TemplateField>
                                          <asp:TemplateField HeaderText="Project Status" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                             <ItemTemplate>
                                                    <asp:Label ID="lblProjectStatus" Text='<%#(Eval("ProjectStatus").ToString()) %>' runat="server" />
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
                
             
            </asp:Panel>  

                <cc1:ModalPopupExtender ID="mpAddNewProject" runat="server" PopupControlID="pnlAddNewPRJ" TargetControlID="btnCloseAddPRJ"
                Enabled="true" CancelControlID="btnCloseAddPRJ" DropShadow="true" BehaviorID="ModalPopupExtenderBehavior22" RepositionMode="RepositionOnWindowResizeAndScroll"
                BackgroundCssClass="modalBackground">
            </cc1:ModalPopupExtender>

            <asp:Panel ID="pnlAddNewPRJ" runat="server" CssClass="modalPopup" align="center" Style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 50px !important; display: none; font-family: 'Times New Roman'; font-size: medium" BorderStyle="Solid" BorderWidth="1px">

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
                                <asp:Label ID="Label14" class="subpnlhdg" runat="server" Text="NEW PROJECT"></asp:Label>
                                 <asp:HiddenField ID="hfdNEWPRJNUMBER" runat="server" ></asp:HiddenField>
                            </h4>

                        </div>


                        <div class="pull-right">
                             <button type="button" class="btn btn-close"  aria-label="Close" runat="server" id="btnCloseAddPRJ"/>
                         <%--   <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="../Icons/deleteData.png" Style="padding-top: 10%;" /></td>--%>
                        </div>

                    </div>
					<div class="popupmaxheight">
						<table class="table table-condensed" style="width: 100%;">

							

							<tr>
								<td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
									<asp:Label ID="Label17" runat="server" Text="Name"></asp:Label>
								</td>
								<td style="padding: 3px 5px; width: 8%" class="no-border">
									<asp:TextBox ID="txtPRJName" CssClass="textBox1 form-control " runat="server" />
								</td>
							<td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
								  <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label65" runat="server" Text="Currency" Visible="false"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 8%" class="no-border">
                                  	<asp:DropDownList ID="ddlCurrencyNP" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Visible="false"></asp:DropDownList>
                                </td>

							</tr>

							<tr>
								<td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
									<asp:Label ID="Label18" runat="server" Text="Consultant"></asp:Label>
								</td>
								<td style="padding: 3px 5px; width: 8%" class="no-border">
									<div class="input-group">
										<span class="input-group-text">
											<asp:LinkButton ID="lblConsultantSearchNP" runat="server" Text="" OnClick="lblConsultantSearchNP_Click"><i class="tf-icons bx bx-search"></i></asp:LinkButton></span>
										<asp:TextBox ID="txtConsultantNP" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
										<asp:HiddenField ID="hfdConsultantIDNP" runat="server" />
									</div>
								</td>
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
							<td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
									<asp:Label ID="Label19" runat="server" Text="Marketing"></asp:Label>
								</td>
								<td style="padding: 3px 5px; width: 8%" class="no-border">
									<div class="input-group">
										<span class="input-group-text">
											<asp:LinkButton ID="lbSearchMarketingNP" runat="server" Text="" OnClick="lbSearchMarketingNP_Click"><i class="tf-icons bx bx-search"></i></asp:LinkButton></span>
										<asp:TextBox ID="txtMarketingNP" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
										<asp:HiddenField ID="hfdMarketingIDNO" runat="server" />
									</div>
								</td>

							</tr>
							
							<tr>
								<td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
									<asp:Label ID="Label21" runat="server" Text="Main Contract"></asp:Label>
								</td>
								<td style="padding: 3px 5px; width: 8%" class="no-border">
									<div class="input-group">
										<span class="input-group-text">
											<asp:LinkButton ID="lblSearchMainContractorNP" runat="server" Text="" OnClick="lblSearchMainContractorNP_Click"><i class="tf-icons bx bx-search"></i></asp:LinkButton></span>
										<asp:TextBox ID="txtMainContrcatorNP" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
										<asp:HiddenField ID="hfdMainContractIDNP" runat="server" />
									</div>
								</td>
                                 <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
									<asp:Label ID="Label28" runat="server" Text="Main Contract owner"></asp:Label>
								</td>
								<td style="padding: 3px 5px; width: 8%" class="no-border">
									<div class="input-group">
										<span class="input-group-text">
											<asp:LinkButton ID="lbSearchMainContractOwnerNP" runat="server" Text="" OnClick="lbSearchMainContractOwnerNP_Click"><i class="tf-icons bx bx-search"></i></asp:LinkButton></span>
										<asp:TextBox ID="txtMainContractOwnerNP" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
										<asp:HiddenField ID="hfdMainContractOwnerIDNP" runat="server" />
									</div>
								</td>
							</tr>
							
							<tr>
								<td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
									<asp:Label ID="Label29" runat="server" Text="Developer Client"></asp:Label>
								</td>
								<td style="padding: 3px 5px; width: 8%" class="no-border">
									<div class="input-group">
										<span class="input-group-text">
											<asp:LinkButton ID="lbDeveloperClientSearchNP" runat="server" Text="" OnClick="lbDeveloperClientSearchNP_Click"><i class="tf-icons bx bx-search"></i></asp:LinkButton></span>
										<asp:TextBox ID="txtDeveloperClientNP" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
										<asp:HiddenField ID="hfdDeveloperClientNP" runat="server" />
									</div>
								</td>
                                 <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
									<asp:Label ID="Label36" runat="server" Text="Developer Owner"></asp:Label>
								</td>
								<td style="padding: 3px 5px; width: 8%" class="no-border">
									<div class="input-group">
										<span class="input-group-text">
											<asp:LinkButton ID="lbSearchDeveloperOwnerNP" runat="server" Text="" OnClick="lbSearchDeveloperOwnerNP_Click"><i class="tf-icons bx bx-search"></i></asp:LinkButton></span>
										<asp:TextBox ID="txtDeveloperOwnerNP" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
										<asp:HiddenField ID="hfdDeveloperOwnerIDNP" runat="server" />
									</div>
								</td>
							</tr>
							
					
						
								<tr>
									<td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										<asp:Label ID="Label37" runat="server" Text="Project Scale"></asp:Label>
									</td>
									<td style="padding: 3px 5px; width: 8%" class="no-border">
										<asp:TextBox ID="txtProjectScaleNP" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
									</td>
                                     <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                    <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										<asp:Label ID="Label47" runat="server" Text="Project Type"></asp:Label>
									</td>
									<td style="padding: 3px 5px; width: 8%" class="no-border">
										<asp:TextBox ID="txtProjectTypeNP" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
									</td>
								</tr>
							
								<tr>
									<td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										<asp:Label ID="Label48" runat="server" Text="Sub Type"></asp:Label>
									</td>
									<td style="padding: 3px 5px; width: 8%" class="no-border">
										<asp:TextBox ID="txtSubTypeNP" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"> </asp:TextBox>
									</td>

                                     <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                    <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										<asp:Label ID="Label49" runat="server" Text="Construction Type"></asp:Label>
									</td>
									<td style="padding: 3px 5px; width: 8%" class="no-border">
										<asp:TextBox ID="txtConstructionTypeNP" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
									</td>
								</tr>
							
                                <tr>
								
								<td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
									<asp:Label ID="Label50" runat="server" Text="Sales Stage Name"></asp:Label>
								</td>
								<td style="padding: 3px 5px; width: 8%" class="no-border">
									<asp:DropDownList ID="txtSalesStageNP" runat="server"  Enabled="true" CssClass="textBox1 form-control " Font-Bold="True"></asp:DropDownList>
								</td>
                                      <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                     <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
									<asp:Label ID="Label51" runat="server" Text="Status"></asp:Label>
								</td>
								<td style="padding: 3px 5px; width: 8%" class="no-border">
									<asp:TextBox ID="txtStatusNP" runat="server" Text="OPEN" Enabled="false" CssClass="textBox1 form-control " Font-Bold="True"></asp:TextBox>
								</td>
							</tr>
                               
                               <tr>
                                     <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										<asp:Label ID="Label52" runat="server" Text="Country"></asp:Label>
									</td>
									<td style="padding: 3px 5px; width: 8%" class="no-border">
										<asp:TextBox ID="txtCountryNP" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
									</td>
                                    
                                      <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
								 
									<td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										<asp:Label ID="Label64" runat="server" Text="City"></asp:Label>
									</td>
									<td style="padding: 3px 5px; width: 8%" class="no-border">
										<asp:TextBox ID="txtCityNP" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
									</td>
							</tr>
						</table>

						

						<div style="padding-top: 20px;">
							<asp:LinkButton ID="lbSaveNewProject" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="lbSaveNewProject_Click"><i class="fa fa-floppy-o" aria-hidden="true" title="Save"></i></asp:LinkButton>
						</div>
					</div>

                </div>

            </asp:Panel>
                   <cc1:ModalPopupExtender ID="mpMajorInfo" runat="server" PopupControlID="pnlMajorInfo" TargetControlID="ddlMajorInfoType"
                Enabled="true" DropShadow="true" BehaviorID="ModalPopupExtenderBehavior24" RepositionMode="RepositionOnWindowResizeAndScroll"
                BackgroundCssClass="modalBackground">
            </cc1:ModalPopupExtender>

            <asp:Panel ID="pnlMajorInfo" runat="server" CssClass="modalPopup" align="center" Style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 50px !important; display: none; font-family: 'Times New Roman'; font-size: medium" BorderStyle="Solid" BorderWidth="1px">

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
                                <asp:Label ID="Label68" class="subpnlhdg" runat="server" Text="Major information"></asp:Label>
                                 <asp:HiddenField ID="hfdMajorInfoRefID" runat="server" ></asp:HiddenField>
                            </h4>

                        </div>


                        <div class="pull-right">
                             <asp:LinkButton type="button" class="btn btn-close" runat="server" id="btnMajorInfoClose" OnClick="btnMajorInfoClose_Click"/>
                         <%--   <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="../Icons/deleteData.png" Style="padding-top: 10%;" /></td>--%>
                      </div>

                  </div>
					<div class="popupmaxheight">
						<table class="table table-condensed" style="width: 100%">

                            <tr>
                                   <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label69" runat="server" Text="Info Type"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 15%" class="no-border">
                                    <asp:DropDownList ID="ddlMajorInfoType" CssClass="textBox1 form-control " runat="server" >
                                         <asp:ListItem  Text="-" Value="-" ></asp:ListItem>
                                        <asp:ListItem  Text="New Project" Value="New Project" ></asp:ListItem>
                                          <asp:ListItem  Text="New Customer" Value="New Customer" ></asp:ListItem>
                                          <asp:ListItem  Text="MEP Awarded" Value="MEP Awarded" ></asp:ListItem>
                                          <asp:ListItem  Text="Re-Tender" Value="Re-Tender" ></asp:ListItem>
                                          <asp:ListItem  Text="Resumed" Value="Resumed" ></asp:ListItem>
                                          <asp:ListItem  Text="Hold" Value="Hold" ></asp:ListItem>
                                          <asp:ListItem  Text="Cancelled" Value="Cancelled" ></asp:ListItem>
                                         <asp:ListItem  Text="Lost" Value="Lost" ></asp:ListItem>
                                         <asp:ListItem  Text="Consultant Change" Value="Consultant Change" ></asp:ListItem>
                                         <asp:ListItem  Text="Main Contractor Awarded" Value="Main Contractor Awarded" ></asp:ListItem>
                                        </asp:DropDownList>
                                </td>

                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>

                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label70" runat="server" Text="Source of Info"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 15%" class="no-border">
                                       <asp:DropDownList ID="ddlPSourceOfInfo" runat="server" CssClass="textBox1 form-control " Font-Bold="True" >
                                         <asp:ListItem  Text="-" Value="-" ></asp:ListItem>
                                        <asp:ListItem  Text="Media" Value="Media" ></asp:ListItem>
                                          <asp:ListItem  Text="Sales" Value="Sales" ></asp:ListItem>
                                          <asp:ListItem  Text="Marketing" Value="Marketing" ></asp:ListItem>
                                          <asp:ListItem  Text="Survey" Value="Survey" ></asp:ListItem>
                                          <asp:ListItem  Text="Other" Value="Other" ></asp:ListItem>
                                    </asp:DropDownList>
                                </td>

                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label71" runat="server" Text="Source Name"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 15%" class="no-border">
                                    <asp:TextBox ID="txtSourceName" runat="server" CssClass="textBox1 form-control" Font-Bold="True"></asp:TextBox>
                                </td>
                              
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label72" runat="server" Text="More Info"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 15%" class="no-border">
                                    <asp:TextBox ID="txtmajorMoreInfo" runat="server" CssClass="textBox1 form-control" Font-Bold="True"></asp:TextBox>
                                </td>
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <div>
                                        <asp:FileUpload ID="FuFile" runat="server" />
                                        <asp:HiddenField ID="hfdMajorFileId" runat="server" />

                                    </div>
                                </td>
                                 <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                  <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                      <asp:LinkButton ID="lbSaveMajorInfo" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="lbSaveMajorInfo_Click"><i class="fa fa-floppy-o" aria-hidden="true" title="Save"></i></asp:LinkButton>
                                      </td>
                            </tr>
                             <tr>
                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label79" runat="server" Text="Attatcment Comment"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 15%" class="no-border">
                                    <asp:TextBox ID="txtMajInfComment" runat="server" CssClass="textBox1 form-control" Font-Bold="True"></asp:TextBox>
                                </td>
                            </tr>
                          
                          
                      
							
						</table>
                          <div id="Div2" runat="server" style="overflow-y: auto; height: calc(100vh - 500px); overflow-x: hidden">
                            <asp:GridView ID="gdvMajorInfo" runat="server" AutoGenerateColumns="False"
                                CellSpacing="0" BorderWidth="0" AllowSorting="True" EmptyDataText="No Data Found" 
                                class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                                <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                <Columns>

                                    <asp:TemplateField HeaderText="InfoType" ItemStyle-Width="5%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="MediaName">
                                        <ItemTemplate>
                                            <asp:Label ID="lblInfoType" Text='<%#(Eval("InfoType").ToString()) %>'
                                                runat="server" />
                                            <asp:HiddenField ID="hfdMediaInfoID" Value='<%#(Eval("ID").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>

                                        <HeaderStyle HorizontalAlign="Center" />

                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="SourceOfInfo" ItemStyle-Width="15%" Visible="True" >
                                        <HeaderStyle CssClass="gridheadercenter" />
                                        <ItemTemplate>
                                            <asp:Label ID="lblSourceOfInfo" Text='<%#(Eval("SourceOfInfo").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                      
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="SourceName" ItemStyle-Width="12%" Visible="true" ItemStyle-HorizontalAlign="Center" >
                                        <ItemTemplate>
                                            <asp:Label ID="lblSourceName" Text='<%#(Eval("SourceName").ToString()) %>' 
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
                                            <asp:Label ID="lblCreatedBy" Text='<%#(Eval("CreatedBY").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>

                                        <ItemStyle HorizontalAlign="Center" Width="10%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Created Date" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" >
                                        <ItemTemplate>
                                            <asp:Label ID="lblCreatedDate" Text='<%#(Eval("CreationDate").ToString()) %>' 
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
            

           <cc1:ModalPopupExtender ID="mpMediaInfo" runat="server" PopupControlID="pnlMediaInfo" TargetControlID="txtMediaNameP"
                Enabled="true" DropShadow="true" BehaviorID="ModalPopupExtenderBehavior23" RepositionMode="RepositionOnWindowResizeAndScroll"
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
                             <asp:LinkButton type="button" class="btn btn-close" runat="server" id="btnMediInfoClose" OnClick="btnMediInfoClose_Click"/>
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
                                    <div>
                                        <asp:FileUpload ID="FileMedia" runat="server" />
                                        <asp:HiddenField ID="hfdMediaFileId" runat="server" />

                                    </div>
                                </td>
                                 <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                  <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                      <asp:LinkButton ID="btnSaveMediaInfo" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="btnSaveMediaInfo_Click"><i class="fa fa-floppy-o" aria-hidden="true" title="Save"></i></asp:LinkButton>
                                      </td>
                            </tr>
                            <tr>
                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label81" runat="server" Text="Attatcment Comment"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 15%" class="no-border">
                                    <asp:TextBox ID="txtMediaComment" runat="server" CssClass="textBox1 form-control" Font-Bold="True"></asp:TextBox>
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


                       <%-- ----------- Master Project History ---------------- --%>


              <div class="modal fade" id="mpProjecthistory" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
           <div class="modal-dialog" role="document">
               <div class="modal-content" style="width:315%;right: 108%;">
                    <div class="modal-header">
                              <h3 class="modal-title" id="h5">History</h3>
                                   <button type="button" class="btn btn-close" data-bs-dismiss="modal" aria-label="Close">
                                            
                                   </button>
                     </div>
                <div class="card-body" style="margin-top: -2%;">
            <div class="nav-align-top tab-Inspections" style="padding-top: 1%;">

                <ul class="nav nav-tabs" role="tablist">
                 
                    <li class="nav-item">
                        <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#tab-MoreInfo" aria-controls="tab-MoreInfo" aria-selected="false">More Information</button>
                    </li>
                    
                     <li class="nav-item">
                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-PRJRemarks" aria-controls="tab-PRJRemarks" aria-selected="false">Admin History</button>
                    </li>

                     <li class="nav-item">
                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-PRJMajorInfo" aria-controls="tab-PRJMajorInfo" aria-selected="false">Major Information</button>
                    </li>

                     <li class="nav-item">
                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-PRJMediaInfo" aria-controls="tab-PRJMediaInfo" aria-selected="false">Media Information</button>
                    </li>
                     <li class="nav-item">
                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-Attatchment" aria-controls="tab-Attatchment" aria-selected="false">Attachments</button>
                    </li>

                      
                     
                    

                  </ul> 

                <div class="tab-content">


                     <div class="tab-pane fade show active" id="tab-MoreInfo" role="tabpanel">
                       
                          <div class="" style="margin-top: 1%;">

                            <table class="table table-bordered table-striped PRJ-MoreInfo-table">


                                <thead>
                                    <tr>
                                        <%--<th>Id</th>--%>
                                       <th>Created By</th>
                                        <th>Created Date</th>
                                        <th>LastUpdatedBy</th>
                                        <th>LastUpdated Date </th>
                                        <%--<th>Status</th>--%>

                                       
                                    </tr>
                                </thead>


                                <tbody class="tbody-moreInfo">
                                </tbody>
                            </table>
                        </div>
                    </div>



                   <div class="tab-pane fade" id="tab-PRJRemarks" role="tabpanel">
                       
                          <div class="" style="margin-top: 1%;">

                               <asp:LinkButton ID="lbRemarks" runat="server" Style="text-align: center;float:right;margin-top:-3%;" CssClass="btn rounded-pill btn-icon btn-round" OnClick="lbRemarks_Click"
                                                ><i class="fa fa-plus" title="Major Info"></i></asp:LinkButton>

                            <table class="table table-bordered table-striped PRJ-AdminHistory-table">


                                <thead>
                                    <tr>
                                        <%--<th>Id</th>--%>
                                        <th style="display:none;">Ref.No</th>
                                        <th>Remarks</th>
                                        <th>UpdatedBy</th>
                                        <th>Updated Date</th>
                                        <th style="display:none;">URL</th>
                                        <th>Attatcments</th>
                                        <%--<th>Status</th>--%>
                                    </tr>
                                </thead>


                                <tbody class="tbody-PRJadminhistory">
                                </tbody>
                            </table>
                        </div>
                    </div>


                     <div class="tab-pane fade" id="tab-PRJMajorInfo" role="tabpanel">
                       
                          <div class="" style="margin-top: 1%;">

                              <asp:LinkButton ID="lbMajorInfo" runat="server" Style="text-align: center;float:right;margin-top:-3%;" CssClass="btn rounded-pill btn-icon btn-round" OnClick="lbMajorInfo_Click" 
                                                ><i class="fa fa-plus" title="Major Info"></i></asp:LinkButton>

                            <table class="table table-bordered table-striped PRJ-MajorInfo-table">


                                <thead>
                                    <tr>
                                        <%--<th>Id</th>--%>
                                        <th style="display:none;">Ref.No</th>
                                        <th>Type</th>
                                        <th>Source Of Info</th>
                                        <th>Source Name</th>
                                        <th>More Info</th>
                                        <th>CreatedBy</th>
                                        <th>Created Date</th>
                                        <th style="display:none;">URL</th>
                                        <th>Attatchments</th>
                                        <%--<th>Status</th>--%>
                                    </tr>
                                </thead>


                                <tbody class="tbody-PRmajorInfo">
                                </tbody>
                            </table>
                        </div>
                    </div>


                     <div class="tab-pane fade" id="tab-PRJMediaInfo" role="tabpanel">
                       
                          <div class="" style="margin-top: 1%;">

                               <asp:LinkButton ID="lbMedia" runat="server" Style="text-align: center;float:right;margin-top:-3%;" CssClass="btn rounded-pill btn-icon btn-round" OnClick="lbMedia_Click" 
                                                ><i class="fa fa-plus" title="Major Info"></i></asp:LinkButton>

                            <table class="table table-bordered table-striped PRJ-MediaInfo-table">


                                <thead>
                                    <tr>
                                        <%--<th>Id</th>--%>
                                        <th style="display:none;">Ref.No</th>
                                        <th>Instance Name</th>
                                        <th>Media Name</th>
                                        <th>Media Reference</th>
                                        <th>More Info</th>
                                        <th>CreatedBy</th>
                                        <th>Created Date</th>
                                        <th style="display:none;">URL</th>
                                        <th>Attatchments</th>
                                        <%--<th>Status</th>--%>
                                    </tr>
                                </thead>


                                <tbody class="tbody-PRmediaInfo">
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="tab-Attatchment" role="tabpanel">

                        <div class="" style="margin-top: 1%;">

                            <table class="table table-bordered table-striped PRJ-MediaInfo-table">


                                <thead>
                                    <tr>
                                        <%--<th>Id</th>--%>
                                        <th style="display: none;">Ref.No</th>
                                        <th>Instance Name</th>
                                        <th>Comments</th>
                                        <th style="display: none">URL</th>
                                        <th>Download</th>
                                        <%--<th>Status</th>--%>
                                    </tr>
                                </thead>


                                <tbody class="tbody-Attatchment">
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





             <cc1:ModalPopupExtender ID="mpAdminRemarks" runat="server" PopupControlID="pnlAdminRemarks" TargetControlID="txtAdminRemarks"
                Enabled="true" DropShadow="true" BehaviorID="ModalPopupExtenderBehavior25" RepositionMode="RepositionOnWindowResizeAndScroll"
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
                             <asp:LinkButton type="button" class="btn btn-close" runat="server" id="btnCloseAdminRemarks" OnClick="btnCloseAdminRemarks_Click"/>
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
                                <td style="padding: 3px 5px; width: 15%" class="no-border">
                                     <div>
                                        <asp:FileUpload ID="FileUpload" runat="server" />
                                        <asp:HiddenField ID="hfdRemarksFile" runat="server" />
                                    </div>
                                    <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                    <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                        <asp:Label ID="Label80" runat="server" Text="Attatcment Comment"></asp:Label>
                                    </td>
                                <td style="padding: 3px 5px; width: 15%" class="no-border">
                                    <asp:TextBox ID="txtRemarksComment" runat="server" CssClass="textBox1 form-control" Font-Bold="True"></asp:TextBox>
                                </td>
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

               <div class="modal fade" id="mpForVerifyDataView" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content" style="width: 250%;right: 400px;">
                                            <div class="modal-header">
                                                <h3 class="modal-title">VERIFICATION DETAILS</h3>
                                                <button type="button" class="btn btn-close" data-bs-dismiss="modal" aria-label="Close">
                                                   
                                                </button>
                                            </div>
                                            <div class="modal-body">

                                                <asp:GridView ID="gdvVerifiedView" runat="server" EmptyDataText="No Other Updates Found.." AutoGenerateColumns="False" CellSpacing="0" BorderWidth="0" AllowSorting="True"
                                                    class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4">
                                                    <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                                    <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                                    <Columns>


                                                        <asp:TemplateField HeaderText="Name" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblName" Text='<%#(Eval("Name").ToString()) %>'
                                                                    runat="server" />

                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Status" ItemStyle-Width="8%" Visible="True" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblVerifyStatus" runat="server" Text='<%#(Eval("VerifiedStatus").ToString()) %>' Font-Bold="true" Font-Size="Medium" CssClass='<%#(Eval("VerifiedIcon").ToString()) %>'></asp:Label>
                                                                  

                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="VerifiedBy" ItemStyle-Width="8%" Visible="True" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblVerifiedBy" Text='<%#(Eval("Verifiedby").ToString()) %>' runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Verified Date" ItemStyle-Width="5%" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblVerifiedDate" Text='<%#(Eval("VerifiedDate").ToString()) %>'
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

   <div class="modal fade" id="ConfirmActivityPopup" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" style="background: #19191973;padding-bottom:15%;">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">

                <div class="modal-body" style="text-align: center;">
                    <div><i class="bx bx bx-check-circle fa-del-kpi" title="View More" style="cursor: pointer; padding-right: 10px; font-size: 80px; color: #e14b4b;color:#0dcb0d;"></i></div>
                    <div>
                        <h3>Are you sure?</h3>
                    </div>
                      Do You Really Want To Verify All The Details Regarding of This Master Project
                </div>
                <div class="modal-footer">
                    <div style="margin-right: 165px;">
                        <asp:LinkButton ID="btnNo" runat="server" class="btn btn-secondary" data-bs-dismiss="modal">NO</asp:LinkButton>
                        <asp:LinkButton ID="btnYes" runat="server" class="btn btn-primary btn-delete-act" OnClick="btnYes_Click">YES</asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>
    </div>



        </ContentTemplate>
      
        <Triggers>
            <asp:PostBackTrigger ControlID="btnExport" />
            <asp:PostBackTrigger ControlID="btnSaveAdminRemakrs" />
            <asp:PostBackTrigger ControlID="lbSaveMajorInfo" />
            <asp:PostBackTrigger ControlID="btnSaveMediaInfo" />
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
