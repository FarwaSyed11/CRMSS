<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="frmSiteSurvey.aspx.cs" Inherits="CRMSupport_frmSiteSurvey" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
       <link rel="stylesheet" href="../Theme/Modified/modifiedcss.css" type="text/css" />
     <link rel="stylesheet" href="../Template/assets/vendor/libs/toaster/toaster.css" type="text/css" />
     <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>

  
    <script src="../js/jquery-1.11.2.min.js"></script>
    <script src="../CustomSearch/js/jquery-customselect-1.9.1.js"></script>
    


    <script src="../js/jquery-1.11.2.min.js"></script>




    

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

    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB7kR6K3AN6seR70-FSYazMfRaknZaj-H4">


    </script>
   
    <style type="text/css">
        #mapContainer
        {
            height: 500px;
            width: 800px;
            border: 10px solid #eaeaea;
        }
    </style>

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
      
        dataTables_wrapper {
           
            display: inline-block;
                white-space: nowrap;
        }
    </style>
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
        function showPosition(position) {
            //x.innerHTML = "Latitude: " + position.coords.latitude +
            //"<br>Longitude: " + position.coords.longitude;
            document.getElementById('<%=hfdLat.ClientID%>').value = position.coords.latitude;
            document.getElementById('<%=hfdLong.ClientID%>').value = position.coords.longitude;
            
        }
        function getLocation() {
            if (navigator.geolocation) {
         
                navigator.geolocation.getCurrentPosition(showPosition);
            }

        }
    </script>
   

    <style>
 
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
        <ContentTemplate>



            <asp:Panel ID="pnlSurvey" runat="server" Visible="true">

                
               <div class="GridviewDiv" id="pnlSummaryView" runat="server">
                 <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">
                             <asp:Panel ID="Panel2" runat="server" CssClass="pnlheading">
                                 <div class="card-header pnlheading">
                        <h3><asp:Label ID="lbhead" ForeColor="White" Font-Bold="true" runat="server" text="PROJECT LIST"></asp:Label></h3>
                                     </div>

                    </asp:Panel>


                    <div class="card-block">
                        <div class="row" >
                            
                            <div class="pull-left" >
                               
                                    <label class="form-label">
                                        Search by
                              
                                    
                                        <asp:DropDownList ID="ddlSearchBy" runat="server" class="form-control" Visible="true">
                                            <asp:ListItem Text="Project Number" Value="ProjectNo"></asp:ListItem>
                                            <asp:ListItem Text="Project Name" Value="ProjectName"></asp:ListItem>
                                            <asp:ListItem Text="Plot Number" Value="PlotNo"></asp:ListItem>
                                            <asp:ListItem Text="MEP Consultant" Value="MEPConsultant"></asp:ListItem>
                                        </asp:DropDownList>
                                              </label>
                                    </div>
                               
                            
                            <div class="pull-left" >
                         
                                   <label class="form-label">
                                        search value
                                 
                                 
                                        <asp:TextBox ID="txtSearchValue" runat="server" AutoPostBack="true" Font-Names="tahoma" class="form-control " />
                                       </label>
                                    </div>
                              
                       
                            <div class="pull-left" style="padding-top:1%">
                               
                                    
                                    <asp:LinkButton ID="btnSearch" runat="server" CssClass="btn rounded-pill btn-icon btn-round" OnClick="btnSearch_Click" Text="" >
                                        <i class="fa fa-search" title="Search"></i>
                                    </asp:LinkButton>
                                </div>
                                        <div class="pull-left" style="padding-top:1%">
                                 
                                    <asp:LinkButton ID="btnAssignedProject" runat="server"  CssClass="btn rounded-pill btn-icon btn-round" OnClick="btnAssignedProject_Click" Text="">
                                          <i class="fa fa-check-square-o" title="Assigned Project"></i>
                                    </asp:LinkButton>
                                      
                                </div>
                            <asp:Panel ID="pnlProjectList" runat="server"  style="padding-top:1%">
                           
                                  

                                            <asp:LinkButton ID="btnAddProjectNo" runat="server" Text="Add project" OnClick="btnAddProjectNo_Click"
                                               CssClass="btn rounded-pill btn-icon btn-round">
                                                <i class="	fa fa-plus-square" title="Add"></i>
                                            </asp:LinkButton>
                                        

                                          
                                </asp:Panel>
                            </div>
                                  
                                 <div class="row" >
                                   <%--  <asp:Button runat="server" OnClientClick="getLocation()" Text="Click Me"></asp:Button>
                                
                                     <input id="u" type="text" class="searchbox1" name="search" />--%>
                                <asp:Label runat="server" ID="lblError" Text="" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" ForeColor="Red" />
                                   
                            </div>
                        
                        <div>

                                <asp:GridView ID="gdvProjectNo" runat="server" AutoGenerateColumns="False" OnRowCommand="gdvProjectNo_RowCommand"
                                    AllowSorting="True"
                                    EmptyDataText="No Records"
                                    class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                                     <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                        
                                <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                    <Columns>

                                        <asp:TemplateField HeaderText="Project No" ItemStyle-Width="5%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Label ID="lblProjectNo" Text='<%#(Eval("ProjectNo").ToString()) %>'
                                                    runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Project Name" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Label ID="lblProjectName" Text='<%#(Eval("ProjectName").ToString()) %>'
                                                    runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Project Status" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Label ID="lblProjectSatus" Text='<%#(Eval("ProjectStatus").ToString()) %>'
                                                    runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Owner" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Label ID="lblOwner" Text='<%#(Eval("Owner").ToString()) %>'
                                                    runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="MEP Consultant" ItemStyle-Width="15%" Visible="True">
                                            <ItemTemplate>
                                                <asp:Label ID="lblMEPConsultant" Text='<%#(Eval("MEPConsultant").ToString()) %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Client" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">

                                            <ItemTemplate>
                                                <asp:Label ID="lblClient" Text='<%#(Eval("Client").ToString()) %>'
                                                    runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>


                                        <asp:TemplateField HeaderText="View" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lblView" Text='' CommandArgument='<%#Eval("ProjectId")%>' CommandName="View" runat="server"  CssClass="btn rounded-pill btn-icon btn-round">
                                                     <i class="fa fa-eye" title="View"></i>
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
                            </div>
                        
                        <asp:Panel ID="pnllead" runat="server" Visible="false" BorderStyle="Solid" >
                            <table class="table table-condensed ">
                                <tr>



                                    <td class="pull-right no-border">

                                        <asp:Button ID="btnAddLead" runat="server" Text="Add Lead" OnClick="btnAddLead_Click"
                                            CssClass="btn btn-primary" Font-Size="Small" />
                                    </td>



                                </tr>
                            </table>
                            <asp:GridView ID="gdvLeadList" runat="server" AutoGenerateColumns="False" OnRowCommand="gdvLeadList_RowCommand"
                                AllowSorting="True"
                                EmptyDataText="No Records"
                               class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                                <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                        
                                <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Lead Number" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblLeadNumber" Text='<%#(Eval("LeadNumber").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Lead Name" ItemStyle-Width="5%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblLeadName" Text='<%#(Eval("LeadName").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>


                                    <asp:TemplateField HeaderText="Owner" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblOwner" Text='<%#(Eval("Owner").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="MEP Consultant" ItemStyle-Width="15%" Visible="True">
                                        <ItemTemplate>
                                            <asp:Label ID="lblMEPConsultant" Text='<%#(Eval("MEPConsultant").ToString()) %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Plot No" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">

                                        <ItemTemplate>
                                            <asp:Label ID="lblPlotNo" Text='<%#(Eval("PlotNo").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>


                                    <asp:TemplateField HeaderText="View" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lblView" Text='' CommandArgument='<%#Eval("LeadId")%>' CommandName="View" runat="server" CssClass="btn rounded-pill btn-icon btn-round">
                                                <i class="fa fa-eye" title="View"></i>
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

                   </asp:Panel>

                    </div>
                </div>
                   </div>





       
  </asp:Panel>

            <asp:Panel ID="pnlEditProject" runat="server" Visible="false">

               <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">
                    <div class="card-block">
                  <asp:Panel ID="Panel3" runat="server" CssClass="pnlsubheading">
                        <div class="pull-left">
                            <h4>
                                <asp:Label ID="Label14" ForeColor="White" Font-Bold="true" runat="server" Text="Update project Details"></asp:Label></h4>
                        </div>
                        <div class="pull-right" style="margin-top: -9px;margin-right: 10px;">
                            <asp:LinkButton ID="btnUpdate" runat="server" Text="" CssClass="btn rounded-pill btn-icon btn-round"  AccessKey="a" TabIndex="15" Visible="true" OnClick="btnUpdate_Click" >
                                 <i class="fa fa-save" title="Update"></i>
                            </asp:LinkButton>
                            <asp:LinkButton ID="btnBack" runat="server" Text="" CssClass="btn rounded-pill btn-icon btn-round" AccessKey="a" TabIndex="15" Visible="true" OnClick="btnBack_Click" >
                                 <i class="fa fa-arrow-circle-left" title="Back"></i>
                                </asp:LinkButton>

                        </div>
                    </asp:Panel>
                    
                        <div id="Div4" style="width: 100%; overflow: scroll" runat="server">
                            <table class="table table-condensed" style="width: 100%">

                                <tr>
                                    <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border">
                                        <asp:Label ID="Label19" runat="server" Text="Prject No"></asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px; width: 8%" class="no-border">
                                        <asp:TextBox ID="txtProjectno" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="False"></asp:TextBox>
                                        <asp:HiddenField ID="hfdProjectId" runat="server" />

                                    </td>
                                    <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                    <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                        <asp:Label ID="Label20" runat="server" Text="Project Name"></asp:Label>
                                    </td>

                                    <td style="padding: 3px 5px; width: 10%" class="no-border">
                                        <asp:TextBox ID="txtProjectName" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="False"></asp:TextBox>
                                    </td>
                                    <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                    <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                        <asp:Label ID="Label21" runat="server" Text="Project Type"></asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px; width: 8%" class="no-border">
                                        <asp:TextBox ID="txtProjectType" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="False"></asp:TextBox>
                                    </td>
                                    <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>

                                </tr>
                                <tr>
                                    <td style="padding: 3px 5px;" class="label-alignment no-border">
                                        <asp:Label ID="Label1" runat="server" Text="Prject Status"></asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px;" class="no-border">
                                        <asp:TextBox ID="txtProjectStatus" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="False"></asp:TextBox>

                                    </td>
                                    <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                    <td style="padding: 3px 5px;" class="label-alignment no-border">
                                        <asp:Label ID="Label2" runat="server" Text="Owner"></asp:Label>
                                    </td>

                                    <td style="padding: 3px 5px;" class="no-border">
                                        <asp:TextBox ID="txtOwner" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="False"></asp:TextBox>
                                    </td>
                                    <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                    <td style="padding: 3px 5px;" class="label-alignment no-border">
                                        <asp:Label ID="Label3" runat="server" Text="Stage"></asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px;" class="no-border">
                                        <asp:TextBox ID="txtStage" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="False"></asp:TextBox>
                                    </td>
                                    <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>

                                </tr>
                                <tr>
                                    <td style="padding: 3px 5px;" class="label-alignment no-border">
                                        <asp:Label ID="Label4" runat="server" Text="City"></asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px;" class="no-border">
                                        <asp:TextBox ID="txtCity" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="False"></asp:TextBox>

                                    </td>
                                    <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                    <td style="padding: 3px 5px;" class="label-alignment no-border">
                                        <asp:Label ID="Label5" runat="server" Text="Client"></asp:Label>
                                    </td>

                                    <td style="padding: 3px 5px;" class="no-border">
                                        <asp:TextBox ID="txtClient" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="False"></asp:TextBox>
                                    </td>
                                    <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                    <td style="padding: 3px 5px;" class="label-alignment no-border">
                                        <asp:Label ID="Label8" runat="server" Text="MEP Consultant"></asp:Label>
                                    </td>

                                    <td style="padding: 3px 5px;" class="no-border">
                                        <asp:TextBox ID="txtMEPConsultant" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="False"></asp:TextBox>
                                    </td>
                                </tr>

                                <tr>
                                    <td style="padding: 3px 5px;" class="label-alignment no-border">
                                        <asp:Label ID="Label10" runat="server" Text="Current Status"></asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px;" class="no-border">
                                        <asp:DropDownList ID="ddlCurrentStatus" runat="server" CssClass="textBox1 form-control " Font-Bold="True">
                                            <asp:ListItem Text="" Value=""></asp:ListItem>
                                            <asp:ListItem Text="New Project" Enabled="true" Value="New Project"></asp:ListItem>
                                            <asp:ListItem Text="New Customer" Value="New Customer"></asp:ListItem>
                                            <asp:ListItem Text="MEP Awarded" Value="MEP Awarded"></asp:ListItem>
                                            <asp:ListItem Text="Re-Tendered" Value="Re-Tendered"></asp:ListItem>
                                            <asp:ListItem Text="Resumed" Value="Resumed"></asp:ListItem>
                                            <asp:ListItem Text="Hold" Value="Hold"></asp:ListItem>
                                            <asp:ListItem Text="Cancelled" Value="Cancelled"></asp:ListItem>
                                            <asp:ListItem Text="Lost" Value="Lost"></asp:ListItem>
                                            <asp:ListItem Text="Consultant Change" Value="Consultant Change"></asp:ListItem>
                                        </asp:DropDownList>


                                    </td>
                                   
                                    <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                    <td style="padding: 3px 5px;" class="label-alignment no-border">
                                        <asp:Label ID="Label13" runat="server" Text="Comments"></asp:Label>
                                    </td>
                                      
                                    <td style="padding: 3px 5px;" class="no-border" colspan="4" rowspan="2">
                                        <asp:TextBox ID="txtComments" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TextMode="MultiLine" Height="90px" Style="resize: none"></asp:TextBox>
                                    </td>
                                    <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>

                                </tr>
                                <tr>
                                     <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label11" runat="server" Text="Plot No"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 8%" class="no-border">
                                    <asp:TextBox ID="txtPrjPlotNumber" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:TextBox>
                                </td>
                                </tr>
                                 <tr>
                                    <td style="padding: 3px 5px;" class="label-alignment no-border">
                                        <asp:Label ID="Label15" runat="server" Text="Latitude" Visible="false"></asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px;" class="no-border">
                                        <asp:TextBox ID="txtLat" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="False" Visible="false"></asp:TextBox>
                                        <asp:HiddenField ID="hfdLat" runat="server" />

                                    </td>
                                    <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                    <td style="padding: 3px 5px;" class="label-alignment no-border">
                                        <asp:Label ID="Label25" runat="server" Text="longitude" Visible="false"></asp:Label>
                                    </td>

                                    <td style="padding: 3px 5px;" class="no-border">
                                        <asp:TextBox ID="txtLong" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="False" Visible="false"></asp:TextBox>
                                          <asp:HiddenField ID="hfdLong" runat="server" />
                                    </td>
                                    <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                   
                                </tr>

                                <tr>
                                    <td style="padding: 3px 5px;" class="label-alignment no-border" colspan="6">
                                        <asp:Label ID="lblProjectError" runat="server" ForeColor="Red" Text=""></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div id="Div5" style="width: 100%; overflow: scroll" runat="server">
                            <asp:Panel runat="server" ID="pnlUpload">
                           

                                            <asp:GridView ID="dgvProjectFile" runat="server" ShowFooter="true" AutoGenerateColumns="false" 
                                                class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None" Width="100%" HeaderStyle-ForeColor="White"
                                     CellSpacing="0" BorderWidth="0" >
                                                 <FooterStyle CssClass="GridFooter" BackColor="#cba7a7" Font-Bold="True" ForeColor="White" />
                                <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                        
                                <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                            <Columns>
                                                <asp:BoundField DataField="RowNumber" HeaderText="Row Number" />
                                                <asp:TemplateField HeaderText="Remarks" ItemStyle-Width="50%">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txtRemarks" runat="server" placeholder="Enter Description" Width="100%"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                               
                                                <asp:TemplateField HeaderText="File">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txtFileName" runat="server"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Upload">
                                                    <ItemTemplate>
                                                        <asp:FileUpload ID="fuUpload" runat="server" />
                                                        <asp:HiddenField ID="hfFileByte" runat="server" />
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
                                <div style="padding-left:50%">
                                              <asp:LinkButton ID="ButtonAdd" runat="server" Text="" OnClick="ButtonAdd_Click" CssClass="btn rounded-pill btn-icon btn-round">
                                                   <i class="fa fa-plus" title="Add File"></i>
                                              </asp:LinkButton>
                                    </div>

                                        
                            </asp:Panel>

                        </div>
                    </div>
                </div>

            </asp:Panel>



            <asp:Panel ID="pnlEditLead" runat="server" Visible="false">

                <div class="panel panel-default">
                    <div class="panel-heading">
                        <div class="pull-left">
                            <h4>
                                <asp:Label ID="Label7" runat="server" Text="Update Lead Details"></asp:Label></h4>
                        </div>
                        <div class="pull-right">
                            <asp:Button ID="BtnUpdateLead" runat="server" Text="SAVE" CssClass="btn btn-primary" Font-Size="Small" AccessKey="a" TabIndex="15" Visible="true" OnClick="BtnUpdateLead_Click" />
                            <asp:Button ID="btnBacklead" runat="server" Text="Back" CssClass="btn btn-primary" Font-Size="Small" AccessKey="a" TabIndex="15" Visible="true" OnClick="btnBacklead_Click" />

                        </div>
                    </div>
                    <div class="panel-body">
                        <table class="table table-condensed" style="width: 100%">

                            <tr>
                                <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border">
                                    <asp:Label ID="Label9" runat="server" Text="Lead No"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 8%" class="no-border">
                                    <asp:TextBox ID="txtLeadNumber" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:TextBox>
                                    <asp:HiddenField ID="hfdleadId" runat="server" />
                                </td>
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label12" runat="server" Text="Lead Name"></asp:Label>
                                </td>

                                <td style="padding: 3px 5px; width: 10%" class="no-border">
                                    <asp:TextBox ID="txtLeadName" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:TextBox>
                                </td>
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label16" runat="server" Text="Plot No"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 8%" class="no-border">
                                    <asp:TextBox ID="txtPlotNo" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:TextBox>
                                </td>
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>

                            </tr>
                            <tr>
                                <td style="padding: 3px 5px;" class="label-alignment no-border">
                                    <asp:Label ID="Label17" runat="server" Text="Lead Stage"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px;" class="no-border">
                                    <asp:TextBox ID="txtLeadStage" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:TextBox>

                                </td>
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                <td style="padding: 3px 5px;" class="label-alignment no-border">
                                    <asp:Label ID="Label18" runat="server" Text="MEP Consultant"></asp:Label>
                                </td>

                                <td style="padding: 3px 5px;" class="no-border">
                                    <asp:TextBox ID="txtMEPConsultantLead" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:TextBox>
                                </td>
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                <td style="padding: 3px 5px;" class="label-alignment no-border">
                                    <asp:Label ID="Label22" runat="server" Text="Main Contractor"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px;" class="no-border">
                                    <asp:TextBox ID="txtMainContractor" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:TextBox>
                                </td>
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>

                            </tr>
                            <tr>
                                <td style="padding: 3px 5px;" class="label-alignment no-border">
                                    <asp:Label ID="Label23" runat="server" Text="Lead Category"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px;" class="no-border">
                                    <asp:TextBox ID="txtLeadCategory" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:TextBox>

                                </td>
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                <td style="padding: 3px 5px;" class="label-alignment no-border">
                                    <asp:Label ID="Label24" runat="server" Text="Owner"></asp:Label>
                                </td>

                                <td style="padding: 3px 5px;" class="no-border">
                                    <asp:TextBox ID="txtLeadOwner" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:TextBox>
                                </td>
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>

                            </tr>

                            <tr>
                                <td style="padding: 3px 5px;" class="label-alignment no-border">
                                    <asp:Label ID="Label26" runat="server" Text="Current Status"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px;" class="no-border">
                                    <asp:DropDownList ID="ddlLeadcurrentStatus" runat="server" CssClass="textBox1 form-control " Font-Bold="True">
                                        <asp:ListItem Text="" Value=""></asp:ListItem>
                                        <asp:ListItem Text="New Project" Enabled="true" Value="New Project"></asp:ListItem>
                                        <asp:ListItem Text="New Customer" Value="New Customer"></asp:ListItem>
                                        <asp:ListItem Text="MEP Awarded" Value="MEP Awarded"></asp:ListItem>
                                        <asp:ListItem Text="Re-Tendered" Value="Re-Tendered"></asp:ListItem>
                                        <asp:ListItem Text="Resumed" Value="Resumed"></asp:ListItem>
                                        <asp:ListItem Text="Hold" Value="Hold"></asp:ListItem>
                                        <asp:ListItem Text="Cancelled" Value="Cancelled"></asp:ListItem>
                                        <asp:ListItem Text="Lost" Value="Lost"></asp:ListItem>
                                        <asp:ListItem Text="Consultant Change" Value="Consultant Change"></asp:ListItem>
                                    </asp:DropDownList>

                                </td>
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>

                                <td style="padding: 3px 5px;" class="label-alignment no-border">
                                    <asp:Label ID="Label28" runat="server" Text="Comments"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px;" class="no-border">
                                    <asp:TextBox ID="txtLeadComments" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TextMode="MultiLine" Height="100px" Style="resize: none"></asp:TextBox>
                                </td>
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>

                            </tr>
                            <tr>
                                <td style="padding: 3px 5px;" class="label-alignment no-border" colspan="6">
                                    <asp:Label ID="lblLeaderror" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                        </table>

                        <asp:Panel runat="server" ID="Panel1">
                            <table class="table table-condensed" style="width: 50%">
                                <tr>
                                    <td style="padding: 3px 5px;" class="no-border">
                                        <asp:Label ID="Label6" runat="server" Text="Attach File"></asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px;" class="no-border">
                                        <asp:FileUpload ID="fuLeadFileUpload" runat="server" />

                                    </td>

                                    <td style="padding: 3px 5px;" class="no-border">
                                        <asp:Label ID="Label27" runat="server" Text="Remarks"></asp:Label>

                                    </td>
                                    <td style="padding: 3px 5px;" class="no-border">
                                        <asp:TextBox ID="txtLeadFileRemarks" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TextMode="MultiLine" Height="50px" Style="resize: none"></asp:TextBox>
                                    </td>
                                    <td style="padding: 3px 5px; text-align: right" class="no-border">
                                        <asp:Button ID="btnLeadFileUpload" runat="server" Text="Upload" OnClick="btnLeadFileUpload_Click" Visible="true" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 3px 5px;" colspan="6" class="no-border">
                                        <%--<asp:GridView ID="gdvLeadFile" runat="server" AutoGenerateColumns="False" Font-Size="Small" OnRowCommand="gdvLeadFile_RowCommand" RowStyle-BackColor="White" TabIndex="1" Width="100%" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" HorizontalAlign="Center" UseAccessibleHeader="False">
                                            <AlternatingRowStyle CssClass="GridAltItem" HorizontalAlign="Center" />

                                            <Columns>
                                                <asp:TemplateField HeaderText="File Name" Visible="true" HeaderStyle-HorizontalAlign="Center">
                                                    <HeaderStyle Font-Size="Small" Width="30%" HorizontalAlign="Center" />
                                                    <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                                    <ItemTemplate>
                                                        <asp:LinkButton runat="server" ID="lbFileName" Text='<%#Eval("FileName")%>' CommandArgument='<%#Eval("FId")%>' CommandName="DownloadFile"></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Remarks" Visible="true" HeaderStyle-HorizontalAlign="Center">
                                                    <HeaderStyle Font-Size="Small" Width="50%" HorizontalAlign="Center" />
                                                    <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblremarks" runat="server" Text='<%#Eval("Remarks")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Delete" ItemStyle-Width="5%">
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="lnkDeleteFile" runat="server" CommandArgument='<%#Eval("FId")%>' CommandName="DelFile" ImageUrl="~/Icons/delete.png" OnClientClick="javascript: return confirm('Are you sure you want to Delete this record?')" ToolTip="Delete" />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                </asp:TemplateField>

                                            </Columns>

                                            <EditRowStyle HorizontalAlign="Center" />
                                            <EmptyDataRowStyle HorizontalAlign="Center" />
                                            <FooterStyle CssClass="GridFooter" BackColor="#CCCCCC" />

                                            <HeaderStyle HorizontalAlign="Center" BackColor="Black" Font-Bold="True" ForeColor="White" VerticalAlign="Middle" Wrap="False" />

                                            <PagerStyle CssClass="grid-pagination" BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                                            <RowStyle CssClass="GridItem" BackColor="White" HorizontalAlign="Center" />
                                            <SelectedRowStyle CssClass="GridRowOver" BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                            <SortedAscendingHeaderStyle BackColor="#808080" />
                                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                            <SortedDescendingHeaderStyle BackColor="#383838" />

                                        </asp:GridView>--%>


                                        
<br />




                                    </td>
                                </tr>


                            </table>
                        </asp:Panel>
                    </div>
                </div>

            </asp:Panel>

            </div>

            <div id="mapContainer" style="display: none"></div>




        </ContentTemplate>
       <Triggers>
                <%--   <asp:PostBackTrigger ControlID="btnupload" />
              <asp:PostBackTrigger ControlID="btnDownload" />--%>

              
                 <asp:PostBackTrigger ControlID="dgvProjectFile" />

           <asp:PostBackTrigger ControlID="btnLeadFileUpload" />
                 <asp:PostBackTrigger ControlID="ButtonAdd" />

              <asp:PostBackTrigger ControlID="btnUpdate" />

                <asp:PostBackTrigger ControlID="BtnUpdateLead" />

           
            </Triggers>
    </asp:UpdatePanel>

    <asp:UpdateProgress ID="Up1" AssociatedUpdatePanelID="UpdatePanel1" runat="server">
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


