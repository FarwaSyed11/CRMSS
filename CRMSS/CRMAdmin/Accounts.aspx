<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="Accounts.aspx.cs" Inherits="CRMAdmin_Accounts" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <link rel="stylesheet" href="../Theme/Modified/modifiedcss.css" type="text/css" />
     <link rel="stylesheet" href="../Template/assets/vendor/libs/toaster/toaster.css" type="text/css" />

     
   
 <%--   <script src="../CRMAdmin/Script/opt.js"></script>--%>
     <script src="../CRMAdmin/Script/account.js?v=1.7"></script>
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

     .btn-Style{
     color: #fff;
    background-color: #d14f42;
    border-color: #ffffff;
    box-shadow: 0 0.125rem 0.25rem 0 rgba(105, 108, 255, 0.4);
}
    .btn-Style.active, .btn-Style:hover{
    color: #fff;
    background-color: green;
    border-color: #ffffff;
    box-shadow: 0 0.125rem 0.25rem 0 rgba(105, 108, 255, 0.4);
    }

    .imgShow{
    border: 4px solid #ddd;
    border-radius: 4px;
    box-shadow: 1px 1px 9px 3px rgb(19 20 20 / 50%);

    }

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

       .Account-Assessment-table th {
             background-color: #a92828 !important;
             color: white !important;
    }

      .Account-Assessment-table td {
             color: #333333 !important;
    }

       .Account-Visits-table th {
             background-color: #a92828 !important;
             color: white !important;
    }

      .Account-Visits-table td {
             color: #333333 !important;
    }

         .Account-ADMhistory-table th {
             background-color: #a92828 !important;
             color: white !important;
    }

      .Account-ADMhistory-table td {
             color: #333333 !important;
    }

      .btnVerify{
          color:white;
          background-color:#62dd15;
          width:133px;
          border-block-color: white;
      }

/*       .SOorg-item-list-table th {
             background-color: #a92828 !important;
             color: white !important;
         }

         .SOorg-item-list-table td {
             color: #333333 !important;
         }
*/
.select2-container--default .select2-selection--single .select2-selection__rendered {
padding-top:5px !important;
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
                Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function (evt, args) {
                    $('.ddlcc').on('change', function () {

                        let s = "test";
                        Country = $('#ddlc option:selected').val();
                        cityDDL();

                    });
                    $('#btnAddContactInfo').on('click', function () {
                        AddContact();

                    });

                    $('#btnYesForStatus').on('click', function () {

                        SendRequest();

                    });

                });

            </script>


            <div class="GridviewDiv" id="pnlSummaryView" runat="server">

                <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">

                    <asp:Panel ID="Panel1" runat="server" CssClass="pnlheading">
                        <div class="card-header pnlheading">
                            <h3>
                                <asp:Label ID="Label13" ForeColor="White" Font-Bold="true" runat="server" Text="Accounts"></asp:Label>
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
                                      
                                   <asp:LinkButton ID="lbkAddNew"  Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="lbkAddNew_Click"  Visible="false"
                                             runat="server"><i class="fa fa-plus" aria-hidden="true" title="Add New Account" ></i></asp:LinkButton>   
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
                                <asp:Panel runat="server" ID="pnlOwnerSearch" style="padding-top:5px" Visible="false">
                                    <div class="row">
                                        <div style="width: 30%">
                                            Owner 
                                        </div>
                                        <div style="width: 60%">
                                            <asp:DropDownList ID="ddlOwnerSearch"  CssClass="form-control textBox1" runat="server" ForeColor="Black"  style="max-width:100%"></asp:DropDownList>
                                        </div>
                                        <div style="width: 5%">
                                               <asp:Button ID="btnOwnerSearchClose" runat="server" CssClass="btn btn-close" style="padding: 10px 0px;" OnClick="btnOwnerSearchClose_Click">
                                            
                                        </asp:Button>
                                              </div>
                                    </div>
                                </asp:Panel>
  
                                    <asp:Panel runat="server" ID="pnlCategorySearch" style="padding-top:5px" Visible="false">
                                    <div class="row">
                                        <div style="width: 30%">
                                               Category  
                                        </div>
                                        <div style="width: 60%">
                                            <asp:DropDownList ID="ddlCategorySearch" CssClass="form-control textBox1" runat="server" ForeColor="Black" >


                                                </asp:DropDownList>
                                        </div>
                                        <div style="width: 5%">
                                               <asp:Button ID="btnCategorySearchClose" runat="server" CssClass="btn btn-close" style="padding: 10px 0px;" OnClick="btnCategorySearchClose_Click">
                                            
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
                                            <asp:DropDownList ID="ddlCountrySearch" CssClass="form-control textBox1" runat="server" ForeColor="Black" >

                                                </asp:DropDownList>
                                        </div>
                                        <div style="width: 5%">
                                               <asp:Button ID="btnCountrySearchClose" runat="server" CssClass="btn btn-close" style="padding: 10px 0px;" OnClick="btnCountrySearchClose_Click">
                                            
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
                                                 <asp:ListItem Value="-1">ALL</asp:ListItem>
                                                <asp:ListItem Value="1">Verified</asp:ListItem>
                                                <asp:ListItem Value="0">Not Verified</asp:ListItem>
                                                </asp:DropDownList>
                                        </div>
                                        <div style="width: 5%">
                                               <asp:Button ID="btnStatusClose" runat="server" CssClass="btn btn-close" OnClick="btnStatusClose_Click" style="padding: 10px 0px;">
                                            
                                        </asp:Button>
                                              </div>
                                    </div>
                                </asp:Panel>

                                    <asp:Panel runat="server" ID="Panel4" style="padding-top:5px">
                                    <div class="row">
                                        
                                        <div style="width: 100%">
                                            <div class="pull-left">
                                            <asp:DropDownList ID="ddlSearchField" CssClass="form-control textBox1" runat="server" ForeColor="Black" AutoPostBack="true" OnSelectedIndexChanged="ddlSearchField_SelectedIndexChanged" style="align-items:center" >
                                           
                                                 <asp:ListItem Text="ADD FIELD" Value="ADD"  Selected="True"></asp:ListItem>    
                                                <asp:ListItem Text="Company" Value="Company" ></asp:ListItem>
                                                 <asp:ListItem Text="Owner" Value="Owner"></asp:ListItem>
                                                 <asp:ListItem Text="Category" Value="Category"></asp:ListItem>
                                                  <asp:ListItem Text="Country" Value="Country"></asp:ListItem>
                                                 <asp:ListItem Text="Status" Value="Status"></asp:ListItem>
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
                                <Columns>

                                    <asp:TemplateField HeaderText="Account Number" ItemStyle-Width="5%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="AccountNumber">
                                        <ItemTemplate>
                                            <asp:Label ID="lblAccountNumber" Text='<%#(Eval("AccountNumber").ToString()) %>'
                                                runat="server" />
                                            <asp:HiddenField ID="hfdAccountID" Value='<%#(Eval("AccountID").ToString()) %>'
                                                runat="server" />
                                         
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />

                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Account Name" ItemStyle-Width="15%" Visible="True" SortExpression="Name">
                                        <HeaderStyle CssClass="gridheadercenter" />
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

                                     <asp:TemplateField HeaderText="Company" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="Owner">
                                        <ItemTemplate>
                                            <asp:Label ID="iblComp" Text='<%#(Eval("Company").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Primary Category" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" SortExpression="PrimaryCategory">
                                        <ItemTemplate>
                                            <asp:Label ID="lblPrimaryCategory" Text='<%#(Eval("PrimaryCategory").ToString()) %>' runat="server" />
                                        </ItemTemplate>
                                        <ItemStyle Width="10%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Sub Category" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="SubCategory">
                                        <ItemTemplate>
                                            <asp:Label ID="lblSubCategory" Text='<%#(Eval("SubCategory").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>

                                        <ItemStyle HorizontalAlign="Center" Width="10%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Relationship Perc" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="RelationshipPerc">
                                        <ItemTemplate>
                                            <asp:Label ID="lblRelationshipPerc" Text='<%#(Eval("RelationshipPerc").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>

                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                    </asp:TemplateField>
                              

                                    <asp:TemplateField HeaderText="View">
                                        <HeaderStyle Font-Size="Small" Width="4%" HorizontalAlign="Center" />
                                        <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lblView" runat="server" Text='' CommandName="View" CssClass="btn rounded-pill btn-icon btn-round"
                                                CommandArgument='<%#(Eval("AccountNumber").ToString())%>' Style="text-align: center"><i class="fa fa-eye" title="View"></i></asp:LinkButton>
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
                

            </div>
                    </div>
                </div>
               <cc1:ModalPopupExtender ID="mpAddNew" runat="server" PopupControlID="pnlAddNew" TargetControlID="btnCloseAddNew"
                Enabled="true" CancelControlID="btnCloseAddNew" DropShadow="true" BehaviorID="ModalPopupExtenderBehavior21" RepositionMode="RepositionOnWindowResizeAndScroll"
                BackgroundCssClass="modalBackground">
            </cc1:ModalPopupExtender>

            <asp:Panel ID="pnlAddNew" runat="server" CssClass="modalPopup" align="center" Style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 50px !important; display: none; font-family: 'Times New Roman'; font-size: medium" BorderStyle="Solid" BorderWidth="1px">

                <div style="border-radius: 50px !important; background-color: #ffffff !important; padding-left: 7px; padding-top: 7px; float: left; padding-right: 7px; width: 40%; padding-bottom: 7px; position: fixed; z-index: 100001; left: 30%; top: 64.5px; border: solid; border-color: silver; padding-bottom: 20px">
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
                                <asp:Label ID="Label5" class="subpnlhdg" runat="server" Text="NEW ACCOUNT "></asp:Label>
                                 <asp:HiddenField ID="hfdNewAccountNumber" runat="server" ></asp:HiddenField>
                            </h4>

                        </div>


                        <div class="pull-right">
                             <button type="button" class="btn btn-close"  aria-label="Close" runat="server" id="btnCloseAddNew"/>
                         <%--   <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="../Icons/deleteData.png" Style="padding-top: 10%;" /></td>--%>
                        </div>

                    </div>
					<div class="popupmaxheight">
						<table class="table table-condensed" style="width: 100%">

							<tr>
							
                                <td style="padding: 3px 5px; width: 25%" class="label-alignment no-border">
									<asp:Label ID="Label25" runat="server" Text="Name"></asp:Label>
								</td>
								<td style="padding: 3px 5px; width:75%" class="no-border">
									<asp:TextBox ID="txtNameNew" CssClass="textBox1 form-control " runat="server" />
								</td>
								
							</tr>

							<tr>
								<td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
									<asp:Label ID="Label27" runat="server" Text="Owner"></asp:Label>
								</td>
								<td style="padding: 3px 5px; width: 8%" class="no-border">
									<div class="input-group">
										<span class="input-group-text">
											<asp:LinkButton ID="lblOwnerNewSearch" runat="server" Text="" OnClick="lblOwnerNewSearch_Click"><i class="tf-icons bx bx-search"></i></asp:LinkButton></span>
										<asp:TextBox ID="txtOwnerNew" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
										<asp:HiddenField ID="hfdOwnerIDNew" runat="server" />
									</div>
								</td>
								
                               

							</tr>

                            <tr>
									<td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										<asp:Label ID="Label31" runat="server" Text="Primary Category"></asp:Label>
									</td>
									<td style="padding: 3px 5px; width: 8%" class="no-border">
										<asp:DropDownList ID="ddlPrimaryCategoryNew" runat="server" CssClass="textBox1 form-control " Font-Bold="True" OnSelectedIndexChanged="ddlprimaryCategoryNew_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
									</td>
								</tr>
								<tr>
									<td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										<asp:Label ID="Label33" runat="server" Text="Sub Catagory "></asp:Label>
									</td>
									<td style="padding: 3px 5px; width: 8%" class="no-border">
										<asp:DropDownList ID="ddlSubCatagoryNew" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:DropDownList>
									</td>
								</tr>
				
							<tr>
								<td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
									<asp:Label ID="Label24" runat="server" Text="Phone"></asp:Label>
								</td>
								<td style="padding: 3px 5px; width: 8%" class="no-border">
									<asp:TextBox ID="txtPhoneNew" runat="server" CssClass="textBox1 form-control" Font-Bold="True"></asp:TextBox>
								</td>
							</tr>
							
								<tr>
									<td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										<asp:Label ID="Label30" runat="server" Text="Mail"></asp:Label>
									</td>
									<td style="padding: 3px 5px; width: 8%" class="no-border">
									<asp:TextBox ID="txtMailNew" runat="server" CssClass="textBox1 form-control" Font-Bold="True"></asp:TextBox>
									</td>
								</tr>
								
								<tr>
									<td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										<asp:Label ID="Label32" runat="server" Text="URL"></asp:Label>
									</td>
									<td style="padding: 3px 5px; width: 8%" class="no-border">
									<asp:TextBox ID="txtUrlNew" runat="server" CssClass="textBox1 form-control" Font-Bold="True"></asp:TextBox>
									</td>
								</tr>
                            <tr>
									<td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										<asp:Label ID="Label9" runat="server" Text="Address"></asp:Label>
									</td>
									<td style="padding: 3px 5px; width: 8%" class="no-border">
									<asp:TextBox ID="txtAddressNew" runat="server" CssClass="textBox1 form-control" Font-Bold="True" TextMode="MultiLine" style="resize:none" Height="80px"></asp:TextBox>
									</td>
								</tr>
                                 <tr>
                                     <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										<asp:Label ID="Label44" runat="server" Text="Country"></asp:Label>
									</td>
									<td style="padding: 3px 5px; width: 8%" class="no-border">
										<asp:DropDownList ID="ddlCountryNew" runat="server" CssClass="textBox1 form-control " Font-Bold="True" OnSelectedIndexChanged="ddlCountryNew_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
									</td>
                                    </tr>
                                     <tr>

								 
									<td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										<asp:Label ID="Label45" runat="server" Text="City"></asp:Label>
									</td>
									<td style="padding: 3px 5px; width: 8%" class="no-border">
										<asp:DropDownList ID="ddlCityNew" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:DropDownList>
									</td>
                                     </tr>
							
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
                    <div style="padding-top: 10px; max-height:calc(100vh - 300px); overflow-x: hidden"">
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
                                <asp:Label ID="Label8" ForeColor="White" Font-Bold="true" runat="server" Text="Accounts"></asp:Label>
                                
                            </h3>
                                </div>
                             <div class="pull-right" >
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
                                         <asp:Label ID="Label2" class="panel-heading" Style="color: white;" runat="server" Text="Account Details"></asp:Label></h5>
                                 </div>
                                 <div class="pull-right" style="margin-top: -9px;margin-right: 10px;">
                                      <asp:LinkButton ID="lbUpdate" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="lbUpdate_Click"
                                                ><i class="fa fa-save" aria-hidden="true" title="Update Account Details"></i></asp:LinkButton>   

                                     <%-- <asp:ImageButton runat="server" src="images/active-user.png" title="Upload File" class="fa-icon-hover" style="cursor: pointer; width: 36px; margin-top: -10px;" id="btnUserInactive" />--%>
                                      <asp:LinkButton ID="btnUserInactive" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="btnUserInactive_Click"
                                                ><i class="fa fa-user" aria-hidden="true" title="Active Account"></i></asp:LinkButton>   

                                      <asp:LinkButton ID="btnInactive" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="btnInactive_Click"
                                                ><i class="fa fa-user-times" aria-hidden="true" title="Inactive Account"></i></asp:LinkButton>   
                                     <asp:HiddenField ID="hfdAccountStatus" runat="server" />
                                 </div>
                               
                             </asp:Panel>
                         
                             	
                       
						
							 <table class="table table-condensed" style="width: 100%;background-color:#e7e7e7;">

								 <tr>






                                    
									
									 <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										 <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>
									 </td>
									 <td style="padding: 3px 5px; width: 8%" class="no-border">
										 <asp:TextBox ID="txtNameEdit" CssClass="textBox1 form-control " runat="server" />
                                          <asp:HiddenField ID="hfdCRMACCID" runat="server" />
                                         <asp:HiddenField ID="hfdCRM" runat="server" />
                                         <asp:HiddenField ID="hfdRelated" Value="2" runat="server" />
									 </td>

									 <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
									 <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										 <asp:Label ID="Label3" runat="server" Text="Owner"></asp:Label>
									 </td>
									 <td style="padding: 3px 5px; width: 8%" class="no-border">
										 <div class="input-group">
											 <span class="input-group-text">
												 <asp:LinkButton ID="lbOwnerEditSearch" runat="server" Text="" OnClick="lbOwnerEditSearch_Click"><i class="tf-icons bx bx-search"></i></asp:LinkButton></span>
											 <asp:TextBox ID="txtOwnerEdit" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
											 <asp:HiddenField ID="hfdOwnerIDEdit" runat="server" />
										 </div>
									 </td>

									 <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
									 <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										 <asp:Label ID="Label4" runat="server" Text="Primary Category"></asp:Label>
									 </td>
									 <td style="padding: 3px 5px; width: 8%" class="no-border">
										 <asp:DropDownList ID="ddlPrimaryCategoryEdit" runat="server" CssClass="textBox1 form-control " Font-Bold="True" OnSelectedIndexChanged="ddlPrimaryCategoryEdit_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
									 </td>

									 <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
									 <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										 <asp:Label ID="Label6" runat="server" Text="Sub Catagory "></asp:Label>
									 </td>
									 <td style="padding: 3px 5px; width: 8%" class="no-border">
										 <asp:DropDownList ID="ddlSubCategoryEdit" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:DropDownList>
									 </td>
								 </tr>

								 <tr>
									 <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										 <asp:Label ID="Label7" runat="server" Text="Phone"></asp:Label>
									 </td>
									 <td style="padding: 3px 5px; width: 8%" class="no-border">
										 <asp:TextBox ID="txtPhoneEdit" runat="server" CssClass="textBox1 form-control" Font-Bold="True"></asp:TextBox>
                                         <asp:HiddenField ID="hfdConsultant" runat="server" />
									 </td>

									 <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
									 <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										 <asp:Label ID="Label10" runat="server" Text="Mail"></asp:Label>
									 </td>
									 <td style="padding: 3px 5px; width: 8%" class="no-border">
										 <asp:TextBox ID="txtMailEdit" runat="server" CssClass="textBox1 form-control" Font-Bold="True"></asp:TextBox>
									 </td>

								 	 <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
									 <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										 <asp:Label ID="Label11" runat="server" Text="URL"></asp:Label>
									 </td>
									 <td style="padding: 3px 5px; width: 8%" class="no-border">
										 <asp:TextBox ID="txtURLEdit" runat="server" CssClass="textBox1 form-control" Font-Bold="True"></asp:TextBox>
									 </td>
								
                                    	 <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
									 <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										 <asp:Label ID="Label12" runat="server" Text="Address"></asp:Label>
									 </td>
									 <td style="padding: 3px 5px; width: 8%" class="no-border" rowspan="2">
										 <asp:TextBox ID="txtAddressEdit" runat="server" CssClass="textBox1 form-control" Font-Bold="True" TextMode="MultiLine" Style="resize: none" Height="80px"></asp:TextBox>
									 </td>
								 </tr>
								 <tr>
									 <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										 <asp:Label ID="Label14" runat="server" Text="Country"></asp:Label>
									 </td>
									 <td style="padding: 3px 5px; width: 8%" class="no-border">
										 <asp:DropDownList ID="ddlCountryEdit" runat="server" CssClass="textBox1 form-control " Font-Bold="True" OnSelectedIndexChanged="ddlCountryEdit_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
									 </td>
								 	 <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>


									 <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										 <asp:Label ID="Label15" runat="server" Text="City"></asp:Label>
									 </td>
									 <td style="padding: 3px 5px; width: 8%" class="no-border">
										 <asp:DropDownList ID="ddlCityEdit" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:DropDownList>
									 </td>

                                     <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
									 <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border" rowspan="5">
										 <asp:Label ID="Label17" runat="server" Text="Company Logo"></asp:Label>
									 </td>

                                      <td style="padding: 9px 5px; width: 8%;" colspan="3" rowspan="5" class="no-border">
                                            <div>
                                                 <asp:FileUpload ID="FuFile" runat="server" />
                                             </div>
                                           <div>
                                                <asp:Image ID="imgLogo" runat="server" ImageUrl="" Width="230px" Height="124px" CssClass="imgShow" />
                                               <asp:Button ID="btnChange" runat="server" Text="Change" OnClick="btnChange_Click" />
                                             </div>
                                         </td>
                                      
                                     </tr>
                                    
                                     <tr>
                                      <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border" >
										<asp:Label ID="Label16" runat="server" Text="Master Account"></asp:Label>
									    </td>
									    <td style="padding: 3px 5px; width: 8%;" class="no-border" colspan="4">
										 <div class="input-group">
												 <span class="input-group-text">
													 <asp:LinkButton ID="lbMasterAccountSearch" runat="server" Text="" OnClick="lbMasterAccountSearch_Click"><i class="tf-icons bx bx-search"></i></asp:LinkButton></span>
												
                                              <a href="#" runat="server" id="aMasterAccount" style="width:560px"> <asp:Label ID="txtAccountMaster" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false" style="min-height:38px;min-width:200px;"></asp:Label></a>
                                               <asp:HiddenField ID="hfdMasterAccountId" runat="server" />
											 </div>
									</td>
                                         <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                         <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border" colspan="2">
                                             <asp:LinkButton ID="lblVerifyView" runat="server" Text="" Font-Bold="true" Font-Size="Medium" OnClick="lblVerifyView_Click"></asp:LinkButton>
                                             <asp:LinkButton ID="lblSetVerify" CssClass="btn btnVerify" runat="server" Text="VERIFY" Font-Bold="true" OnClick="lblSetVerify_Click"></asp:LinkButton>
                                         </td>
                                        
								 </tr>
							 </table>
                             <asp:Panel ID="pnlRealted" runat="server" CssClass="pnlsubheading">
                                 
                                    <div class="pull-left" style="margin-top: -13px;">
                                     <div class="breadcrumb-custom flat" style="padding-top:0px;" >
                                          <a id="aOpportunity" runat="server" style="border-style:inset;border-color:#364150;border-width:3px;">
                                             <asp:Button ID="btnOpportunity" runat="server" Text="Opportunity" Width="224px" BackColor="Transparent" BorderStyle="None" OnClick="btnOpportunity_Click"/>
                                         </a>
                                         <a id="aContract" runat="server" style="border-style:inset;border-color:#364150;border-width:3px;">
                                             <asp:Button ID="btnContract" runat="server" Text="Contact" BackColor="Transparent" Width="235px" BorderStyle="None" OnClick="btnContract_Click"/>
                                         </a>
                                        
                                             
                                         <a id="aProject" runat="server" style="border-style:inset;border-color:#364150;border-width:3px;">
                                             <asp:Button ID="btnProject" runat="server" Text="Project" BackColor="Transparent" Width="235px" BorderStyle="None" OnClick="btnProject_Click"/>
                                         </a>
                                          <a id="aRelated" runat="server"  style="border-style:inset;border-color:#364150;border-width:3px;">
                                             <asp:Button ID="btnRelated" runat="server" Text="Related Accounts" Width="224px" BackColor="Transparent" BorderStyle="None" OnClick="btnRelated_Click"/>
                                         </a>
                                          <a id="aVendorL" runat="server"  style="border-style:inset;border-color:#364150;border-width:3px;">
                                             <asp:Button ID="btnVenderL" runat="server" Text="Vendor List" Width="224px" BackColor="Transparent" BorderStyle="None" OnClick="btnVenderL_Click"/>
                                         </a>
                                     </div>
                                       </div>
                                  <div class="pull-right" style="margin-top: -9px; width: 10%; padding-right: 1%;">
                                  <asp:DropDownList ID="ddlStatus" runat="server" CssClass="textBox1 form-control" BackColor="#e8eaed" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                             
                                 </div>
                             <div class="pull-right" style="margin-top: -9px; width: 10%; padding-right: 1%; margin-right:4%;">
                                <asp:DropDownList ID="ddlSubstage" runat="server"  CssClass="textBox1 form-control" BackColor="#e8eaed" OnSelectedIndexChanged="ddlSubstage_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList> 
                                 </div>
                                  <div class="pull-right" style="margin-top: -9px; width: 10%; padding-right: 1%;">
                                <asp:DropDownList ID="ddlProjectStatus" runat="server"  CssClass="textBox1 form-control" BackColor="#e8eaed" OnSelectedIndexChanged="ddlProjectStatus_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList> 
                                 </div>
                                  <div class="pull-right" style="margin-top: -9px;padding-right: 7px;">
                                  <asp:LinkButton ID="lbAddContact" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="lbAddContact_Click"
                                                ><i class="fa fa-plus" aria-hidden="true" title="Add Contact"></i></asp:LinkButton> 
                                      </div>
                                 
                             </asp:Panel>
                             
                  <div id="Div4" runat="server" style="overflow-x:auto;margin-top:5px;">

                            <asp:GridView ID="RelatedDetails" runat="server" AutoGenerateColumns="False" OnRowCommand="RelatedDetails_RowCommand" 
                                AllowSorting="True" EmptyDataText="No Data Found" Width="100%" OnSorting="RelatedDetails_Sorting"
                                class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                               <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                     <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                   <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                <Columns>

                                      <asp:TemplateField HeaderText="" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="col9">
                                        <ItemTemplate>
                                           
                                                 <asp:LinkButton ID="lblOPTNumber" Text='<%#(Eval("col10").ToString()) %>' CommandName="view" CommandArgument='<%#(Eval("Link").ToString()) %>'
                                                     runat="server" />
                                         
                                        </ItemTemplate>
                                    </asp:TemplateField>


                                    <asp:TemplateField HeaderText="" ItemStyle-Width="5%" Visible="True" SortExpression="col1" >
                                        <ItemTemplate>
                                            <asp:Label ID="lb1" Text='<%#(Eval("col1").ToString()) %>'
                                                runat="server" />
                                           
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" SortExpression="col2" >
                                        <ItemTemplate>
                                            <asp:Label ID="lb2" Text='<%#(Eval("col2").ToString()) %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="col3" >
                                        <ItemTemplate>
                                            <asp:Label ID="lb3" Text='<%#(Eval("col3").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="col4">
                                        <ItemTemplate>
                                            <asp:Label ID="lb4" Text='<%#(Eval("col4").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                  
                                    <asp:TemplateField HeaderText="" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="col5">
                                        <ItemTemplate>
                                            <asp:Label ID="lb5" Text='<%#(Eval("col5").ToString()) %>' runat="server">

                                            </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                   
                                    <asp:TemplateField HeaderText="" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="col6">
                                        <ItemTemplate>
                                            <asp:Label ID="lb6" Text='<%#(Eval("col6").ToString()) %>' runat="server">

                                            </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    
                                    <asp:TemplateField HeaderText="" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="col7">
                                        <ItemTemplate>
                                            <asp:Label ID="lb7" Text='<%#(Eval("col7").ToString()) %>' runat="server">

                                            </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    
                                    <asp:TemplateField HeaderText="" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="col8">
                                        <ItemTemplate>
                                            <asp:Label ID="lb8" Text='<%#(Eval("col8").ToString()) %>' runat="server">

                                            </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    
                                    <asp:TemplateField HeaderText="" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="col9">
                                        <ItemTemplate>
                                            <asp:Label ID="lb9" Text='<%#(Eval("col9").ToString()) %>' runat="server">

                                            </asp:Label>
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



            
             <div class="modal fade" id="mpContact" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" oncancel="btnCloseContact" aria-hidden="true">
           <div class="modal-dialog" role="document">
               <div class="modal-content" style="width: 140%;right: 12%;">
                    <div class="modal-header">
                              <h3 class="modal-title" id="h6">Contact</h3>
                                   <button type="button" id="btnCloseContact" class="btn btn-close" data-bs-dismiss="modal" aria-label="Close">
                                   </button>

                       

                     </div>
                <div class="card-body" style="margin-top: 0%;">
           

                    <table class="table table-condensed" style="width: 100%">
                            <tr> 
                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label48" runat="server" Text="Name"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 15%" class="no-border">
                                   <input type="text" id="txtCname" class="textBox1 form-control" />
                                </td>
                            </tr>
                            <tr>
                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label49" runat="server" Text="Job Title"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 15%" class="no-border">
                                   <input type="text" id="tctJobTitle" class="textBox1 form-control" />
                                </td>
                            </tr>
                            <tr>
                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label50" runat="server" Text="Gender"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 15%" class="no-border">
                                   <select class="form-select placement-dropdown" id="dlGender" >
                                    <option value="-1" selected>-- Select --</option>
                                    <option value="0">Male</option>
                                    <option value="1">Female</option>
                                   </select>
                                </td>
                            </tr>
                         <tr>
                                 <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label55" runat="server" Text="Phone-Number"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 15%" class="no-border">
                                   <input type="text" id="txtPhoneNumber" class="textBox1 form-control" />
                                </td>
                            </tr>
                            <tr>
                                 <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label51" runat="server" Text="E-mail"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 15%" class="no-border">
                                   <input type="text" id="txtEmail" class="textBox1 form-control" />
                                </td>
                            </tr>
                            <tr>
                                 <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label52" runat="server" Text="Country"></asp:Label>
                                </td>
                               
                                       <td style="padding: 3px 5px; width: 15%" class="no-border">
                                   <input type="text" id="txtCountry" class="textBox1 form-control" disabled />
                                </td>
                            </tr>
                            <tr>
                                 <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label53" runat="server" Text="City"></asp:Label>
                                </td>
                                 <td style="padding: 3px 5px; width: 15%" class="no-border">
                                   <input type="text" id="txtCity" class="textBox1 form-control" disabled />
                                </td>
                            </tr>
                        <tr>
                            <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label54" runat="server" Text="Nationality"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 15%" class="no-border">
                                   <input type="text" id="txtNationality" class="textBox1 form-control" />
                                </td>
                        </tr>

                        </table>
                    <div class="modal-footer" style="margin-top:3%;">
                      <%-- <asp:LinkButton ID="lbAddContactInfo" runat="server" CssClass="btn rounded-pill btn-icon btn-round" Text="Add" OnClick="lbAddContactInfo_Click"></asp:LinkButton>--%>
                        <a href="#" type="button" id="btnAddContactInfo" class="btn btn-Style">Add</a>
                    </div>


             </div>
           </div>
        </div>
     </div>



                        <div class="modal fade" id="mpOPPShowhistory" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                                        <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#tab-MoreInfo" aria-controls="tab-MoreInfo" aria-selected="false">More Information</button>
                                    </li>
                                  
                                    <li class="nav-item">
                                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-Assessment" aria-controls="tab-Assessment" aria-selected="false">Assessment</button>
                                    </li>
                                    <li class="nav-item">
                                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-Visits" aria-controls="tab-Visits" aria-selected="false">Visits</button>
                                    </li>
                                    <li class="nav-item">
                                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-AdminHistory" aria-controls="tab-AdminHistory" aria-selected="false">History</button>
                                    </li>
                                    
                                    <li class="nav-item">
                                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-AccRemarks" aria-controls="tab-AccRemarks" aria-selected="false">Admin History</button>
                                    </li>
                                    <li class="nav-item">
                                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-AccMajorInfo" aria-controls="tab-AccMajorInfo" aria-selected="false">Major Information</button>
                                    </li>
                                     <li class="nav-item">
                                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-PRJMediaInfo" aria-controls="tab-PRJMediaInfo" aria-selected="false">Media Information</button>
                                    </li>
                                   <%-- <li class="nav-item">
                                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-OPPAdminRemarks" aria-controls="tab-OPPAdminRemarks" aria-selected="false">Admin History</button>
                                    </li>--%>
                                      <li class="nav-item">
                                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-Attatchment" aria-controls="tab-Attatchment" aria-selected="false">Attachment</button>
                                    </li>

                                      <li class="nav-item">
                                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-StatusReq" aria-controls="tab-StatusReq" aria-selected="false">Status Requests</button>
                                    </li>






                                </ul>

                                <div class="tab-content" style="overflow-y: auto; max-height: calc(100vh - 225px); overflow-x: hidden">


                                     <div class="tab-pane fade show active" id="tab-MoreInfo" role="tabpanel">

                                        <div class="" style="margin-top: 1%;">

                                            <table class="table table-bordered table-striped Account-Assessment-table">


                                                <thead>
                                                    <tr>
                                                        <%--<th>Id</th>--%>
                                                        <th>Remarks</th>
                                                        <th>CreatedBy</th>
                                                        <th>Created Date</th>
                                                        <th>Grade</th>
                                                        <th>Class</th> 
                                                        <th>Account Status</th>
                                                        <th>Operation Status</th>
                                                        <%--<th>Status</th>--%>
                                                    </tr>
                                                </thead>


                                                <tbody class="tbody-AccMoreInfo">
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>





                                    <div class="tab-pane fade" id="tab-Assessment" role="tabpanel">

                                        <div class="" style="margin-top: 1%;">

                                            <table class="table table-bordered table-striped Account-Assessment-table">


                                                <thead>
                                                    <tr>
                                                        <%--<th>Id</th>--%>
                                                        <th>Customer Status</th>
                                                        <th>Customer Assessment</th>
                                                        <th>Relation Perc</th>
                                                        <th>UpdatedBy</th>
                                                        <th>Updated Date</th>
                                                        <%--<th>Status</th>--%>
                                                    </tr>
                                                </thead>


                                                <tbody class="tbody-AccAssesment">
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>


                                    <div class="tab-pane fade" id="tab-Visits" role="tabpanel">

                                        <div class="" style="margin-top: 1%;">

                                            <table class="table table-bordered table-striped Account-Visits-table">


                                                <thead>
                                                    <tr>
                                                        <%--<th>Id</th>--%>
                                                        <th>Type</th>
                                                        <th>Subject</th>
                                                        <th style="width:8%;">Sub Type</th>
                                                        <th>Start Date</th>
                                                        <th style="width:18%;">Minutes Of Meating</th>
                                                        <th>Remarks</th>
                                                        <th>Status</th>
                                                        <th>UpdatedBy</th>
                                                        <th>Updated Date</th>
                                                        <%--<th>Status</th>--%>
                                                    </tr>
                                                </thead>


                                                <tbody class="tbody-AccVisits">
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>



                                    <div class="tab-pane fade" id="tab-AdminHistory" role="tabpanel">

                                        <div class="" style="margin-top: 1%;">

                                            <table class="table table-bordered table-striped Account-ADMhistory-table">


                                                <thead>
                                                    <tr>
                                                        <th>Account Name</th>
                                                       <th>Owner Name</th>
                                                        <th>LastAssignment Date</th>
                                                        <th>UpdatedBy</th>
                                                        <th>Updated Date</th>
                                                        <th>Primary category</th>
                                                        <th>Sub Category</th>
                                                        <th>Phone</th>
                                                        <th>Email</th>
                                                        <th>MasterAccount Name</th>
                                                    </tr>
                                                </thead>


                                                <tbody class="tbody-AccAdmHistory">
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>




                                



                                   <div class="tab-pane fade" id="tab-AccMajorInfo" role="tabpanel">

                                        <div style="margin-top: 2%;">
                                           <%-- <a href="#" id="btnbtn" style="float:right;"><i class="fa fa-plus" aria-hidden="true" style="font-size: 50px;color:green" title="Add Information"></i></a>--%>

                                           <asp:LinkButton ID="btnAddMjInfo" runat="server" Style="text-align: center; float: right; margin-top: -3%;" CssClass="btn rounded-pill btn-icon btn-round" OnClick="btnAddMjInfo_Click"><i class="fa fa-plus" title="Major Info"></i></asp:LinkButton>

                                        </div>
                                        <div class="" style="margin-top: 1%;">
                                            <table class="table table-bordered table-striped Account-ADMhistory-table">


                                                <thead>
                                                      <tr>
                                                        <%--<th>Id</th>--%>
                                                         <th style="display:none;">RefNo</th>
                                                        <th>Type</th>
                                                        <th>Source of Info</th>
                                                        <th>Source Name</th>
                                                        <th>More Information</th>
                                                        <th>CreatedBy</th>
                                                        <th>Created Date</th>
                                                        <th style="display:none;">URL</th>
                                                        <th>Attatchment</th>
                                                        <%--<th>Status</th>--%>
                                                    </tr>
                                                </thead>


                                                <tbody class="tbody-AccmajorInfo">
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>




                                    <div class="tab-pane fade" id="tab-AccRemarks" role="tabpanel">

                                        <div class="" style="margin-top: 2%;">
                                           <%--   <a href="#" id="btnAddAdminRemarks" style="float:right;"><i class="fa fa-plus" aria-hidden="true" style="font-size: 50px;color:green" title="Add Information"></i></a>--%>

                                            <asp:LinkButton ID="btnAddAdminRemarks" runat="server" Style="text-align: center; float: right; margin-top: -3%;" CssClass="btn rounded-pill btn-icon btn-round" OnClick="btnAddAdminRemarks_Click"><i class="fa fa-plus" aria-hidden="true" title="Major Info"></i></asp:LinkButton>

                                            <table class="table table-bordered table-striped Account-ADMhistory-table">


                                                <thead>
                                                     <tr>
                                                        <%--<th>Id</th>--%>
                                                        <th style="display:none;">RefNo</th>
                                                        <th>Remarks</th>
                                                        <th>UpdateBy</th>
                                                        <th>Updated Date</th>
                                                         <th style="display:none;">URL</th>
                                                        <th>Attatchment</th>
                                                        <%--<th>Status</th>--%>
                                                    </tr>
                                                </thead>


                                                <tbody class="tbody-AccRemarks">
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>





                                    <div class="tab-pane fade" id="tab-PRJMediaInfo" role="tabpanel">

                                        <div class="" style="margin-top: 2%;">

                                           <asp:LinkButton ID="lbMedia" runat="server" Style="text-align: center; float: right; margin-top: -3%;" CssClass="btn rounded-pill btn-icon btn-round" OnClick="lbMedia_Click"><i class="fa fa-plus" title="Major Info"></i></asp:LinkButton>

                                            <table class="table table-bordered table-striped Account-ADMhistory-table">


                                                <thead>
                                                    <tr>
                                                        <%--<th>Id</th>--%>
                                                        <th style="display: none;">Ref.No</th>
                                                        <th>Instance Name</th>
                                                        <th>Media Name</th>
                                                        <th>Media Reference</th>
                                                        <th>More Info</th>
                                                        <th>CreatedBy</th>
                                                        <th>Created Date</th>
                                                        <th style="display: none;">URL</th>
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

                                            <table class="table table-bordered table-striped Account-ADMhistory-table">


                                                <thead>
                                                    <tr>
                                                        <%--<th>Id</th>--%>
                                                        <th style="display:none;">Ref.No</th>
                                                        <th>Instance Name</th>
                                                        <th>Comments</th>
                                                        <th style="display:none">URL</th>
                                                        <th>Download</th>
                                                        <%--<th>Status</th>--%>
                                                    </tr>
                                                </thead>


                                                <tbody class="tbody-Attatchment">
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>


                                      <div class="tab-pane fade" id="tab-StatusReq" role="tabpanel">

                                        <div class="" style="margin-top: 1%;">

                                            <table class="table table-bordered table-striped Account-ADMhistory-table">


                                                <thead>
                                                    <tr>
                                                        <%--<th>Id</th>--%>
                                                        <th style="display:none;">CrmAccountId</th>
                                                        <th>Current Status</th>
                                                        <th>Requested For</th>
                                                        <th>Request Status</th>
                                                        <th>CreatedBy</th>
                                                        <th>Created Date</th>
                                                        <th>UpdatedBy</th>
                                                        <th>Updated Date</th>
                                                        <th>Reason</th>
                                                        <th>Admin Remarks</th>
                                                        <%--<th>Status</th>--%>
                                                    </tr>
                                                </thead>


                                                <tbody class="tbody-StatusRequest">
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

    <%-- <div class="modal fade" id="ModalContactDet" tabindex="-2" aria-hidden="true" style="background-color: #13131466"  data-bs-backdrop="static">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalContact">SALESORDER</h5>
                   
                </div>


                <div class="modal-body">

                     <table class="table table-bordered table-striped SOorg-item-list-table" style="width:100%;">


                    <thead>
                        <tr><th style="display:none;">Order.No</th>
                            
                             
                            <th style="display:none;">Contact Id</th>
                            <th>Contact Name</th>
                            <th>Email</th>
                            <th>Phone</th>

                            
                           
                           
                            
                        </tr>
                    </thead>


                    <tbody class="tbody-ContactDet">
                    </tbody>
                </table>


                    <div class="modal-footer">

                    </div>
                </div>
            </div>
        </div>

    </div>--%>

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


                                                        <asp:TemplateField HeaderText="Account Name" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblAccountName" Text='<%#(Eval("AccountName").ToString()) %>'
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

           

<%--        <div class="modal fade" id="ModalConfirm" tabindex="-2" aria-hidden="true" style="background-color: #13131466;padding-top:3%;">
           <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header" style="background-color:#d3d1d1;">
                    <h5 class="modal-title" id="modalConfirm" style="text-shadow: 1px -1px 8px; color: #a92828;"> CONFIRMATION </h5>
                    <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close">
                    </button>
                </div>


                <div class="modal-body" style="background-color:#e5e5e5;">
                       

                    <label id="lblcnfrmClose" class="col-form-label label-custom" style="color:red;margin-left:0px;font-size:15px;text-align:center;">Are You Sure You Want To Verify All The Details Regarding of This Account</label>
                  
                 
                    <div class="modal-footer">
                        <div>
                            <asp:LinkButton ID="lbConfYes" class="btn btn-primary" runat="server" OnClick="lbConfYes_Click" Text="YES"></asp:LinkButton>
                        </div>
                        <div style="margin-right:64px;">
                            <asp:LinkButton ID="lbConfNo" class="btn btn-primary" runat="server" OnClick="lbConfNo_Click" Text="NO"></asp:LinkButton>
                        </div>

                    </div>
                    </div>
                </div>
            </div>
        </div>

    </div>--%>

   <div class="modal fade" id="ConfirmActivityPopup" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" style="background: #19191973;padding-bottom:15%;">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">

                <div class="modal-body" style="text-align: center;">
                    <div><i class="bx bx bx-check-circle fa-del-kpi" title="View More" style="cursor: pointer; padding-right: 10px; font-size: 80px; color: #e14b4b;color:#0dcb0d;"></i></div>
                    <div>
                        <h3>Are you sure?</h3>
                    </div>
                      Do You Really Want To Verify All The Details Regarding of This Account
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
                                <asp:HiddenField ID="hfdMajorFileId" runat="server" />
                            </h4>

                        </div>


                        <div class="pull-right">
                           <asp:LinkButton ID="btnMajorInform" runat="server" CssClass="btn btn-close" OnClick="btnMajorInform_Click"></asp:LinkButton>
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
                                    <asp:FileUpload ID="FuFileMajor" runat="server" />
                                </div>
                                    </td>

                                 <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                  <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                      <asp:LinkButton ID="lbSaveMajorInfo" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="lbSaveMajorInfo_Click"><i class="fa fa-floppy-o" aria-hidden="true" title="Save"></i></asp:LinkButton>
                                      </td>
                            </tr>
                            <tr>
                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label56" runat="server" Text="Attatcment Comment"></asp:Label>
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
                            <asp:LinkButton type="button" class="btn btn-close" OnClick="btnCloseAdminRemarks_Click" runat="server" id="btnCloseAdminRemarks" />
                            <%--   <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="../Icons/deleteData.png" Style="padding-top: 10%;" /></td>--%>
                        </div>

                    </div>
                    <div class="popupmaxheight">
                        <table class="table table-condensed" style="width: 100%">

                            <tr>

                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label78" runat="server" Text="Admin Remarks"></asp:Label>
                                    <asp:HiddenField ID="hfdRemarksFileId" runat="server" />
                                </td>
                                <td style="padding: 3px 5px; width: 15%" class="no-border">
                                    <asp:TextBox ID="txtAdminRemarks" CssClass="textBox1 form-control" runat="server" />
                                </td>

                                 <td style="padding: 3px 5px; width: 15%" class="no-border">
                                     <div>
                                         <asp:FileUpload ID="FileUploadRemarks" runat="server" />
                                     </div>
                                </td>

                                 <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label57" runat="server" Text="Attatcment Comment"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 15%" class="no-border">
                                    <asp:TextBox ID="txtRemarksComment" runat="server" CssClass="textBox1 form-control" Font-Bold="True"></asp:TextBox>
                                </td>
                              

                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:LinkButton ID="btnSaveAdminRemakrs" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="btnSaveAdminRemakrs_Click"><i class="fa fa-floppy-o" aria-hidden="true" title="Save"></i></asp:LinkButton>
                                </td>

                            </tr>




                        </table>
                        <div id="Div1" runat="server" style="overflow-y: auto; height: calc(100vh - 500px); overflow-x: hidden">
                            <asp:GridView ID="gdvAdminRemarksHistory" runat="server" AutoGenerateColumns="False"
                                CellSpacing="0" BorderWidth="0" AllowSorting="True" EmptyDataText="No Data Found"
                                class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                                <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                <Columns>

                                    <asp:TemplateField HeaderText="Admin Remarks" ItemStyle-Width="25%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblAdminHistory" Text='<%#(Eval("AdminHistory").ToString()) %>'
                                                runat="server" />

                                        </ItemTemplate>

                                        <HeaderStyle HorizontalAlign="Center" />

                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Update Date" ItemStyle-Width="12%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">

                                        <ItemTemplate>
                                            <asp:Label ID="lblUpdateDate" Text='<%#(Eval("UpdatedDate").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>

                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Updated By" ItemStyle-Width="12%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
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
                                    <asp:HiddenField ID="hfdUser" runat="server" />
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
                                 <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                  <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                      <asp:LinkButton ID="btnSaveMediaInfo" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="btnSaveMediaInfo_Click"><i class="fa fa-floppy-o" aria-hidden="true" title="Save"></i></asp:LinkButton>
                                      </td>
                            </tr>
                              <tr>
                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label46" runat="server" Text="Attatcment Comment"></asp:Label>
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


     <div class="modal fade" id="ConfirmStatusReqPopup" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" style="background: #19191973;padding-bottom:15%;">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">

                <div class="modal-body" style="text-align: center;">
                    <div><i class="bx bx bx-check-circle fa-del-kpi" title="View More" style="cursor: pointer; padding-right: 10px; font-size: 80px; color: #e14b4b;color:#0dcb0d;"></i></div>

                    
                    <div>
                        <h3>Are you sure?</h3>
                    </div>
                    <div class="Label-Inactive">
                      Click Yes to send a Request to admin for Inactive this Account
                   </div>

                     <div class="Label-active">
                      Click Yes to send a Request to admin for Active this Account
                   </div>
                    
                </div>
                <div class="row">

                    <label Font-Size="Medium" Font-Bold="true" style="margin-left:3%">Comment</label>
                     <input type="text" id="txtActionReq" class="form-control" style="margin-left:5%; width:90%;"/>

                </div>

                 <div class="row Select-Owner" style="padding-top:1%;">
                     <div style="width:5%;"></div>
                     <div style="width:90%;">
                     <label Font-Size="Medium" Font-Bold="true" style="margin-left:3%">Owner</label>
                     <select id="txtActionOwner" class="abc" style="color: black; height: 40px; font-size: inherit; border-bottom: outset;"></select>
                         </div>
                      <div style="width:5%;"></div>
                 </div>


                <div class="modal-footer">
                    <div style="margin-right: 165px;padding-top:18px;">
                        <asp:LinkButton ID="LinkButton1" runat="server" class="btn btn-secondary" data-bs-dismiss="modal">NO</asp:LinkButton>
                        <button type="button" ID="btnYesForStatus" class="btn btn-primary btn-delete-act">YES</button>
                    </div>
                </div>
            </div>
        </div>
    </div>


            
        </ContentTemplate>
      
        <Triggers>
            <asp:PostBackTrigger ControlID="btnExport" />
            <asp:PostBackTrigger ControlID="lbUpdate" />
             <asp:PostBackTrigger ControlID="lbSaveMajorInfo"/>
            <asp:PostBackTrigger ControlID="btnSaveAdminRemakrs"/>
            <asp:PostBackTrigger ControlID="btnSaveMediaInfo"/>
            

        </Triggers>
        
    </asp:UpdatePanel>

    <link href="../Calendar/dist/select2.css" rel="stylesheet" />
    <script src="../Calendar/dist/select2.js"></script>
     <script src="../KPI/Flatpickr/js/flatpickr.js"></script>

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
