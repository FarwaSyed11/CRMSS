<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ModuleDetails.aspx.cs" Inherits="Pages_ModuleDetails" %>

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
                    Module Details</h2>
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
                    <td><asp:Label ID ="lblModuleName" runat ="server" Text ="Module Name"></asp:Label> </td>
                    <td ><asp:DropDownList ID ="ddlModName" runat ="server" cssClass="textBox11" ></asp:DropDownList> </td>
                    </tr>
                    <tr >
                    <td><asp:Label ID ="lblFormName" runat ="server" Text ="Form Name"></asp:Label> </td>
                    <td ><asp:DropDownList ID ="ddlFormName" runat ="server" CssClass ="textBox11"></asp:DropDownList> </td>
                    </tr>
                    <tr >
                    <td ><asp:Button ID ="btnAdd" runat="server" Text ="Add" onclick="btnAdd_Click" /></td>
                    <td ><asp:Button ID ="btnUpdate" runat="server" Text ="Update" 
                            onclick="btnUpdate_Click" /></td>
                    <td ><asp:Button ID ="btnDelete" runat="server" Text ="Delete" 
                            onclick="btnDelete_Click" /></td>
                    </tr>
                    <tr >
                    <td ><asp:Label ID ="lblMsg" runat ="server" Visible ="false" ></asp:Label> </td>
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
                   Module Details</h2>
            </div>
             <div class="form-fieldset-wrapper-top-right">
        </div>
            <!--ended Div of Form fieldset wrapper top rounded part-->
            <div class="form-fieldset-wrapper-mid">
                <!--Div for the form fieldset wrapper middle part for the left and right border-->
                <div class="form-fieldset-wrapper-mid-inner">
                    <!--Form fieldset wrapper mid inner inside this Div all form fields inserted here-->

                    <asp:HiddenField ID="hdnId" runat="server" />

                    <asp:GridView ID="GDVModDetails" runat="server" CellPadding="4" ForeColor="#333333" 
                        GridLines="None" AutoGenerateColumns ="False" onrowcommand="EditModDet" >
                        <AlternatingRowStyle BackColor="White" />
                       <Columns >
                       <asp:TemplateField headerText="Module Name">
                       <ItemTemplate >
                       <asp:LinkButton ID ="lnkModName" runat ="server" CommandName ="ModuleDetails" CommandArgument='<%#Bind("Module_Det_Id") %>' 
                       text ='<%#Bind("Module_Name") %>' ></asp:LinkButton>
                       </ItemTemplate>
                       </asp:TemplateField>
                       <asp:TemplateField headerText="Form Name">
                       <ItemTemplate ><asp:Label ID ="lblFormName" runat ="server" Text ='<%#Bind("Form_Name") %>'></asp:Label> </ItemTemplate>
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

