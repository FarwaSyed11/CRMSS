<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CustomerAssessment.aspx.cs" Inherits="CRMAccounts_CustomerAssessment" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
        <link rel="stylesheet" href="../media/css/bootstrap/bootstrap.css" type="text/css" />
        <link rel="stylesheet" href="../media/css/bootstrap/bootstrap-custom.css" type="text/css" />

    <style type="text/css">
      
        
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
     
    
    </style>


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
  
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    
     <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
         <ContentTemplate>




             <div class="GridviewDiv">

                  <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">
                           <div class="card-header">

                         <h4> <asp:Label ID="lblHeader" Text="Customer Assessment" runat="server" Font-Size="Large" Font-Bold="true" Font-Names="Century Gothic" /> </h4>
                               <asp:HiddenField ID="hfdOper" runat="server" />
                     </div>
                         <div class="card-block">

                    
                         <table class="table table-condensed " style="width: 100%">
                             <tr>
                                   <td class="no-border label-alignment" style="width:5%">
                                     <asp:Label ID="Label1" Text="Company" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                                        </td>
                                      <td class="no-border" style="width:20%">
                                     <asp:DropDownList ID="ddlCompany" runat="server" Font-Names="tahoma"
                                         CssClass="textBox11 form-control" Visible="true" AutoPostBack="true" OnSelectedIndexChanged="ddlCompany_SelectedIndexChanged"/>
                                          </td>
                                    <td class="no-border label-alignment" style="width:3%">
                                 <td class="no-border label-alignment" style="width: 5%">
                                     <asp:Label ID="Label2" Text="Salesman" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                                 </td>
                                 <td class="no-border">
                                     <asp:DropDownList ID="ddlSalesman" runat="server" Font-Names="tahoma"
                                         CssClass="textBox11 form-control" Visible="true" AutoPostBack="true"  />
                                 </td>
                                   <td class="no-border label-alignment" style="width:3%">
                                 <td class="no-border label-alignment" style="width:5%">
                                     <asp:Label ID="Label29" Text="Search" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                                 </td>
                                 <td class="no-border" style="width:25%">
                                     <asp:TextBox ID="txtSearch" runat="server" Font-Names="tahoma" CssClass ="textBox11 form-control" />
                                  
                                 </td>
                                 <td class="no-border">
                                     <asp:Button ID="btnFind" Text="Search" CssClass="btn btn-Search" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" OnClick="btnFind_Click"/>
                                     <asp:Button ID="btnRequested" Text="Requested Customer" CssClass="btn btn-Search" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" OnClick="btnRequested_Click"/>
                                 </td>
                                


                             </tr>
                             <tr>
                                 <td class="no-border label-alignment" colspan="6">
                                     <asp:Label ID="lblErrormsg"  runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" ForeColor="Red"/>
                                 </td>
                                 </tr>
                         </table>
                         <br />
                         <asp:GridView ID="gdvCustomer" runat="server" AutoGenerateColumns="False" 
                             AllowPaging="True" OnPageIndexChanging="gdvCustomer_PageIndexChanging"
                             AllowSorting="True" PageSize="5" OnSelectedIndexChanged="gdvCustomer_SelectedIndexChanged"
                             OnRowEditing="gdvCustomer_RowEditing" OnRowUpdating="gdvCustomer_RowUpdating"
                             Width="100%" EmptyDataText="There are no records to display." CellPadding="4" ForeColor="#333333" GridLines="None"
                      
                             PagerSettings-LastPageText="Last">
                             <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                             <RowStyle CssClass="GridItem" HorizontalAlign="Center" BackColor="#E3EAEB" />

                             <Columns>
                                 <asp:TemplateField HeaderText="Sl No." Visible="true">
                                 
                                     <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                     <ItemTemplate>
                                         <%#Eval("SlNo")%>
                                     </ItemTemplate>

                                 </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Customer Name" Visible="true">
                                   
                                     <HeaderStyle Font-Bold="True" />
                                   
                                     <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                     <ItemTemplate>
                                          <asp:Label ID="lblCustomerName" runat="server" Text='<%#Eval("AccountName")%>' ></asp:Label>
                                        
                                     </ItemTemplate>

                                 </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Owner Name">
                                    
                                     <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                     <ItemTemplate>

                                         <asp:Label ID="lblOwner" runat="server" Text='<%#Eval("OwnerName") %>' ></asp:Label>
                                          <asp:HiddenField ID="hfdAccountId" runat="server" Value='<%#Eval("CRMAccountId") %>' ></asp:HiddenField>
                                     </ItemTemplate>
                                 </asp:TemplateField>
                                
                                


                                
                                 <asp:TemplateField HeaderText="Remarks" Visible="true">
                                    
                                     <ItemStyle Font-Size="Small" />
                                     <ItemTemplate>

                                         <asp:TextBox ID="txtRemarksGrid" runat="server" Text='<%#Eval("remarks") %>' Width="300px" Height="100px" TextMode="MultiLine" style="resize:none;vertical-align:middle;text-align:center;align-items:center;vertical-align:central;align-content:center" ></asp:TextBox>
                                     </ItemTemplate>

                                 </asp:TemplateField>
                                 <asp:TemplateField HeaderText="" Visible="true">
                                  
                                     <ItemStyle Font-Size="Small" />
                                     <ItemTemplate>
                                         <asp:Button ID="btn_Update2" runat="server" Text="Update" CommandName="Update"  CssClass="btn btn-Update"/>
                                     </ItemTemplate>

                                 </asp:TemplateField>



                             </Columns>
                             <HeaderStyle CssClass="GridHeader-blue"  Font-Bold="True" ForeColor="White" Font-Size="Medium" Font-Names="Century Gothic"/>
                             <PagerSettings LastPageText="Last" />
                             <PagerStyle CssClass="GridItem" HorizontalAlign="Right" Font-Bold="true"   />
                             <SelectedRowStyle CssClass="GridItem" BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                             <EditRowStyle BackColor="#7C6F57" />
                             <AlternatingRowStyle CssClass="GridAltItem" BackColor="White" />

                          

                         </asp:GridView>

                     </div>
                    
                      </div>

                 </div>



             
         
         </ContentTemplate>
         <Triggers>
             <asp:PostBackTrigger ControlID="gdvCustomer" />
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
