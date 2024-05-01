<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ModuleMaster.aspx.cs" Inherits="Page_ModuleMaster" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="all-form-wrap">
        <!--Div Started to Wrapping all Forms Fields-->
        <div class="form-fieldset-wrapper">
            <!--Start Div To Wrapping Form Fields Set-->
            <div class="form-fieldset-wrapper-top-left">
        </div>
            <div class="form-fieldset-wrapper-top">
                <!--Div for the form fieldset wrapper top rounded part-->
                <h2>
                    Module Master</h2>
            </div>
            <div class="form-fieldset-wrapper-top-right">
        </div>
            <!--ended Div of Form fieldset wrapper top rounded part-->
            <div class="form-fieldset-wrapper-mid">
                <!--Div for the form fieldset wrapper middle part for the left and right border-->
                <div class="form-fieldset-wrapper-mid-inner">
                    <!--Form fieldset wrapper mid inner inside this Div all form fields inserted here-->

                    <table >
                    <tr>
                    <td > <asp:Label ID ="lblCode" runat ="server" Text ="Module Code"></asp:Label></td>
                    <td ><asp:TextBox ID ="txtCode" runat ="server" CssClass="textBox1 "></asp:TextBox> </td>
                    </tr>
                    <tr >
                    <td>
                    <asp:Label ID ="lblId" runat ="server" Text ="Module Name"></asp:Label>
                    </td>
                    <td ><asp:TextBox ID ="txtModule" runat ="server" CssClass ="textBox1 "></asp:TextBox>
                     </td>
                     </tr>
                     <tr>
                     <td><asp:Label ID ="lblEDate" runat ="server" Text ="EndDate"></asp:Label>
                     </td>
                     <td ><asp:TextBox ID ="txtEDate" runat ="server" CssClass ="textBox1 "></asp:TextBox>
                     <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtEDate">
                                </asp:CalendarExtender>
                      </td>
                      <%--<td colspan="2" ><asp:Calendar ID ="MyCal" runat ="server" BackColor="White" Height="158px" 
                              Width="184px">
                              
                          </asp:Calendar> </td>--%>
                      </tr>
                      <tr>
                      <td>
                                <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" />
                                <asp:Button ID="btnNew" runat="server" Text="New" onclick="btnNew_Click" />
                                
                            </td>
                            
                            <td>
                            <asp:Button ID ="btnUpdate" runat ="server" Text ="Update" 
                                    onclick="btnUpdate_Click" />   
                            </td>

                            <td>
                                
                                    <asp:Button ID ="btnDelete" runat ="server" Text ="Delete" 
                                        onclick="btnDelete_Click"  />

                            </td>
                            <td ><asp:Label ID ="lblMsg" runat ="server" ></asp:Label> </td>
                            </tr>
                            

                    </table>


                                    </div>
                <!--form fieldset wrapper mid inner ended-->
            </div>
            <!--Ended Div of form fieldset wrapper middle part of left and right border-->
           <div class="form-fieldset-wrapper-bottom-left">
        </div>
        <div class="form-fieldset-wrapper-bottom">
        </div>
        </div>
        <div class="form-fieldset-wrapper-bottom-right">
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
                   Module Details of No End Date</h2>
            </div>
             <div class="form-fieldset-wrapper-top-right">
        </div>
            <!--ended Div of Form fieldset wrapper top rounded part-->
            <div class="form-fieldset-wrapper-mid">
                <!--Div for the form fieldset wrapper middle part for the left and right border-->
                <div class="form-fieldset-wrapper-mid-inner">
                    <!--Form fieldset wrapper mid inner inside this Div all form fields inserted here-->

                    <asp:HiddenField ID ="hdnModId" runat ="server" />
                       <asp:GridView ID="GridViewModule" runat="server" AutoGenerateColumns="False" 
                        onrowcommand="EditModule" 
                        onselectedindexchanged="GridViewModule_SelectedIndexChanged" 
                        CellPadding="4" ForeColor="#333333" GridLines="None" >
                           <AlternatingRowStyle BackColor="White" />
                     <Columns>
                            <asp:TemplateField HeaderText="Module Code" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnk_ModCode" CommandArgument='<%#Eval("Module_Id") %>' CommandName="ChangeModule"
                                        runat="server">
                                        <%#Eval("Module_Code") %>
                                        </asp:LinkButton></ItemTemplate>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Module Name">
                                <ItemTemplate>
                                    <asp:Label runat="Server" ID="lblModName"><%#Eval("Module_Name")%></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                     </Columns>
                    
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
        <div class="form-fieldset-wrapper-bottom">
        </div>
        </div>
        <div class="form-fieldset-wrapper-bottom-right">
        </div>
        <!--ended Div of Wrapping Form Fields Set-->
    </div>
</asp:Content>

