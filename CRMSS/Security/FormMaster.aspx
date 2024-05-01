<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="FormMaster.aspx.cs" Inherits="Pages_FormMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="all-form-wrap">
        <!--Div Started to Wrapping all Forms Fields-->
        <div class="form-fieldset-wrapper">
            <!--Start Div To Wrapping Form Fields Set-->
            <div class="form-fieldset-wrapper-top-left">
        </div>
            <div class="form-fieldset-wrapper-top-page">
                <!--Div for the form fieldset wrapper top rounded part-->
                <h2>
                  Enter Form Details</h2>
            </div>
             <div class="form-fieldset-wrapper-top-right">
        </div>
            <!--ended Div of Form fieldset wrapper top rounded part-->
            <div class="form-fieldset-wrapper-mid">
                <!--Div for the form fieldset wrapper middle part for the left and right border-->
                <div class="form-fieldset-wrapper-mid-inner">
                    <!--Form fieldset wrapper mid inner inside this Div all form fields inserted here-->

                    <table >
                    <tr >
                    <td style="width:150px"><asp:Label ID ="lblFName" runat="server" Text ="Form Name"></asp:Label></td>
                    <td style="width:150px" ><asp:TextBox ID ="txtFName" runat ="server" CssClass ="textBox1 "></asp:TextBox> </td>
                    </tr>
                     <tr >
                    <td  ><asp:Label ID ="lblFDesc" runat="server" Text ="Form Desc"></asp:Label></td>
                    <td  ><asp:TextBox ID ="txtFDesc" runat ="server" CssClass ="textBox1 "></asp:TextBox> </td>
                    </tr>
                    <tr >
                    <td  ><asp:Button ID ="btnAdd" runat ="server" Text ="Add" 
                            onclick="btnAdd_Click" />
                      <asp:Button ID ="btnNew" runat ="server" Text ="New" visible="false" />
                      </td>
                      <td class="style1" ><asp:Button ID ="btnUpdate" runat ="server" Text ="Update" 
                              onclick="btnUpdate_Click" /></td>
                        <td ></td>
                        <td ><asp:Label ID ="lblMsg" runat ="server" Visible ="false" ></asp:Label></td>
                    </tr>
                    </table>

                          </div>
                <!--form fieldset wrapper mid inner ended-->
            </div>
            <!--Ended Div of form fieldset wrapper middle part of left and right border-->
             <div class="form-fieldset-wrapper-bottom-left">
            </div>
            <div class="form-fieldset-wrapper-bottom-page">
            </div>
            <div class="form-fieldset-wrapper-bottom-right">
            </div>
            <!--Div started for the form fieldset wrapper bottom founded-->
        </div>
        <!--ended Div of Wrapping Form Fields Set-->
    </div>

 <div id="Div1">
        <!--Div Started to Wrapping all Forms Fields-->
        <div class="form-fieldset-wrapper">
            <!--Start Div To Wrapping Form Fields Set-->
              <div class="form-fieldset-wrapper-top-left">
        </div>
            <div class="form-fieldset-wrapper-top">
                <!--Div for the form fieldset wrapper top rounded part-->
                <h2>
                    Forms Details</h2>
            </div>  <div class="form-fieldset-wrapper-top-right">
           </div>
            <!--ended Div of Form fieldset wrapper top rounded part-->
            <div class="form-fieldset-wrapper-mid">
                <!--Div for the form fieldset wrapper middle part for the left and right border-->
                <div class="form-fieldset-wrapper-mid-inner">
                    <!--Form fieldset wrapper mid inner inside this Div all form fields inserted here-->
                    <asp:HiddenField ID="hdnId" runat="server" />


                    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" AutoGenerateColumns ="False"
                        GridLines="None" onrowcommand="FormCommand">
                        <Columns >
                          <asp:TemplateField HeaderText="Form Name">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lblFormName" runat="server"  CommandName="EditForm" 
                                              CommandArgument='<%#Bind("Form_Id") %>' 
                                               Text='<%# Bind("Form_Name") %>' ValidationGroup="3"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                     <asp:TemplateField HeaderText="Form Description">
                                        <ItemTemplate>
                                            <asp:Label ID="lblFees_Description" runat="server" 
                                                Text='<%# Bind("Form_Desc") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                           
                        </Columns>


                        <AlternatingRowStyle BackColor="White" />
                        <EditRowStyle BackColor="#7C6F57" />
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                        <SortedDescendingHeaderStyle BackColor="#15524A" />
                    </asp:GridView>

                            </div>
                <!--form fieldset wrapper mid inner ended-->
            </div>
            <!--Ended Div of form fieldset wrapper middle part of left and right border-->
             <div class="form-fieldset-wrapper-bottom-left">
        </div>
        <div class="form-fieldset-wrapper-bottom-page">
        </div>
        <div class="form-fieldset-wrapper-bottom-right">
        </div>
            <!--Div started for the form fieldset wrapper bottom founded-->
        </div>
        <!--ended Div of Wrapping Form Fields Set-->
    </div>

</asp:Content>

