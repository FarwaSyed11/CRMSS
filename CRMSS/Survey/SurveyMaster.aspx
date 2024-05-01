<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="SurveyMaster.aspx.cs" Inherits="Survey_SurveyMaster" %>



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
            width: 6px;
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
          .salesmanagerUpdates{
            background-color:#99cccc !important;
        }

        .salesmanUpdates
        {
            background-color:#369 !important;
        }
        .marketingUpdates
        {
            background-color:#69c !important;
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




            <div class="GridviewDiv" id="pnlSurveyDetails" runat="server">

                <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">

                    <asp:Panel ID="Panel1" runat="server" CssClass="pnlheading">
                        <div class="card-header pnlheading">
                              <div class="pull-left" >
                            <h3>
                                <asp:Label ID="Label13" ForeColor="White" Font-Bold="true" runat="server" Text="SURVEY MASTER"></asp:Label>
                            </h3>
                                  </div>
                               <div class="pull-right" >
                             <asp:Button ID="btnNewSurvey" runat="server" Text="New Survey" CssClass="btn btn-Update" Font-Size="Small" AccessKey="a" TabIndex="15" Visible="true" OnClick="btnNewSurvey_Click" />
                        
                               </div>

                        </div>
                    </asp:Panel>
                    <div class="card-block">

                       
                        <div id="Div1" runat="server" style="overflow-x: auto">
                            <asp:GridView ID="gdvSurvey" runat="server" AutoGenerateColumns="False"
                                OnRowCommand="gdvSurvey_RowCommand"
                                CellSpacing="0" BorderWidth="0" AllowSorting="True" EmptyDataText="No Data Found" AllowPaging="true" PageSize="5"
                                class="table table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                                <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                <Columns>

                                    <asp:TemplateField HeaderText="Survey Name" ItemStyle-Width="5%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="SurveyName">
                                        <ItemTemplate>
                                            <asp:Label ID="lblSurveyName" Text='<%#(Eval("SurveyName").ToString()) %>'
                                                runat="server" />
                                          
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />

                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Survey Description" ItemStyle-Width="15%" Visible="True" SortExpression="SurveyDescription">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDescription" Text='<%#(Eval("SurveyDescription").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>

                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Company Name" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="Company">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCompany" Text='<%#(Eval("Company").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Department" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" SortExpression="Department">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDepartment" Text='<%#(Eval("Department").ToString()) %>' runat="server" />
                                        </ItemTemplate>
                                        <ItemStyle Width="10%" />
                                    </asp:TemplateField>
                               
                                    <asp:TemplateField HeaderText="Status" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="Status">
                                        <ItemTemplate>
                                            <asp:Label ID="lbStatus" Text='<%#(Eval("Status").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>

                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="View">
                                        <HeaderStyle Font-Size="Small" Width="4%" HorizontalAlign="Center" />
                                        <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lblView" runat="server" Text='' CommandName="View"
                                                CommandArgument='<%#Eval("SurveyID")%>' Style="text-align: center"><i class="fa fa-eye" title="View"></i></asp:LinkButton>
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
         
                   <asp:Panel ID="pnlDetailView" runat="server" Visible="true">
             
                    <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">
                           <asp:Panel ID="Panel3" runat="server" CssClass="pnlheading">
                        <div class="card-header pnlheading">
                            <div class="pull-left" >
                            <h3>
                                <asp:Label ID="Label8" ForeColor="White" Font-Bold="true" runat="server" Text="SURVEY MASTER"></asp:Label>
                                
                            </h3>
                                </div>
                             <div class="pull-right" >
                                <asp:Button ID="btnSave" runat="server" Text="SAVE" CssClass="btn btn-Update" Font-Size="Small" AccessKey="a" TabIndex="15" Visible="true" OnClick="btnSave_Click" />
                                <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btn btn-Cancel" Font-Size="Small" AccessKey="a" TabIndex="15" Visible="true" OnClick="btnBack_Click" />
                                     
                                </div>


                        </div>
                    </asp:Panel>
                         <div class="card-block">
                            <asp:Panel ID="Panel2" runat="server" CssClass="pnlsubheading">
                                 <div class="pull-left">
                                     <h5>
                                         <asp:Label ID="Label2" class="panel-heading" Style="color: white;" runat="server" Text="SURVEY DETAILS"></asp:Label></h5>
                                 </div>
                                
                             </asp:Panel>
                         

                       
                            <table class="table table-condensed" style="width: 100%">

                                <tr>
                                    <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border">
                                        <asp:Label ID="Label19" runat="server" Text="Survey Name"></asp:Label>
                                        <asp:HiddenField ID="hfdSurveyId" runat="server" value="0"/>
                                    </td>
                                    <td style="padding: 3px 5px; width: 8%" class="no-border">
                                        <asp:TextBox ID="txtSurveyName" runat="server" CssClass="textBox1 form-control " Font-Bold="True" ></asp:TextBox>

                                    </td>
                                    <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                    <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                        <asp:Label ID="Label20" runat="server" Text="Survey Description"></asp:Label>
                                    </td>

                                    <td style="padding: 3px 5px; width: 10%" class="no-border">
                                        <asp:TextBox ID="txtSurveyDescription" runat="server" CssClass="textBox1 form-control"  Font-Bold="True"></asp:TextBox>
                                    </td>
                                    <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                    <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                        <asp:Label ID="Label21" runat="server" Text="Company"></asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px; width: 8%" class="no-border">
                                        <asp:DropDownList ID="ddlCompany" runat="server" CssClass="textBox1 form-control " Font-Bold="True"  OnSelectedIndexChanged="ddlCompany_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                    </td>
                                    <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                    <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                        <asp:Label ID="Label4" runat="server" Text="Department"></asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px; width: 8%" class="no-border">
                                        <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="textBox1 form-control " Font-Bold="True" ></asp:DropDownList>
                                    </td>
                                </tr>
                                
                                <tr>
                                    
                                    <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                        <asp:Label ID="Label11" runat="server" Text="Status"></asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px; width: 8%" class="no-border">
                                        <asp:DropDownList ID="ddlStatus" runat="server" CssClass="textBox1 form-control " Font-Bold="True"  >
                                            <asp:ListItem Value="PUBLISHED" Text="PUBLISHED"></asp:ListItem>
                                            <asp:ListItem Value="DRAFT" Text="DRAFT" Selected="True"></asp:ListItem>
                                        </asp:DropDownList>
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
                                         <asp:Label ID="Label46" class="panel-heading" Style="color: white;" runat="server" Text="Questions"></asp:Label></h5>
                                 </div>
                                
                             </asp:Panel>
                               <table class="table table-condensed" style="width: 100%">

                                <tr>
                                    <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border">
                                        <asp:Label ID="Label1" runat="server" Text="Question"></asp:Label>
                                        <asp:HiddenField ID="QuestionId" runat="server" />
                                          <asp:HiddenField ID="hfdSLNO" runat="server" />
                                    </td>
                                    <td style="padding: 3px 5px; width: 10%" class="no-border">
                                        <asp:TextBox ID="txtQuestion" runat="server" Height="100px" Style="resize: none" TextMode="MultiLine" />

                                    </td>
                                    <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                    <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                        <asp:Label ID="Label3" runat="server" Text="Question Type"></asp:Label>
                                    </td>

                                    <td style="padding: 3px 5px; width: 10%" class="no-border">
                                        <asp:DropDownList ID="ddlQuestionType" runat="server" CssClass="textBox1 form-control"  Font-Bold="True">
                                            <asp:ListItem Value="LIST VALUES" Text="LIST VALUES"></asp:ListItem>
                                            <asp:ListItem Value="FREE TEXT" Text="FREE TEXT"></asp:ListItem>
                                             <asp:ListItem Value="OPTIONS" Text="OPTIONS"></asp:ListItem>
                                             <asp:ListItem Value="CHECK LIST" Text="CHECK LIST"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                    <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                        <asp:Label ID="Label5" runat="server" Text="Enter the values with Delimitter(;)" ></asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px; width: 10%" class="no-border">
                                    <asp:TextBox ID="txtValues" runat="server" Height="100px" Style="resize: none" TextMode="MultiLine" />
                                    </td>
                                    <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                    <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                        <asp:Label ID="Label6" runat="server" Text="Your Answer" ></asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px; width: 10%" class="no-border">
                                    <asp:TextBox ID="txtAnswer" runat="server" Height="100px" Style="resize: none" TextMode="MultiLine" />
                                    </td>
                                   <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                    
                                    <td style="padding: 3px 5px; width: 10%" class="no-border">
                                    <asp:CheckBox ID="chkReason" runat="server" Text="Reason" OnCheckedChanged="chkReason_CheckedChanged" AutoPostBack="true"/>
                                    </td>
                                </tr>
                                   <tr>
                                    <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border">
                                        <asp:Label ID="lblRQuestion" runat="server" Text="Reason Question"></asp:Label>
                                      
                                    </td>
                                    <td style="padding: 3px 5px; width: 10%" class="no-border">
                                        <asp:TextBox ID="txtReasonQuestion" runat="server" Height="100px" Style="resize: none" TextMode="MultiLine" />

                                    </td>
                                    <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                    <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                        <asp:Label ID="lblRQuestionType" runat="server" Text="Reason Question Type"></asp:Label>
                                    </td>

                                    <td style="padding: 3px 5px; width: 10%" class="no-border">
                                        <asp:DropDownList ID="ddlReasonQuestionType" runat="server" CssClass="textBox1 form-control"  Font-Bold="True">
                                            <asp:ListItem Value="LIST VALUES" Text="LIST VALUES"></asp:ListItem>
                                            <asp:ListItem Value="FREE TEXT" Text="FREE TEXT"></asp:ListItem>
                                             <asp:ListItem Value="OPTIONS" Text="OPTIONS"></asp:ListItem>
                                             <asp:ListItem Value="CHECK LIST" Text="CHECK LIST"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                    <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                        <asp:Label ID="lblRQuestionValues" runat="server" Text="Enter the Reason values with Delimitter(;)" ></asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px; width: 10%" class="no-border">
                                    <asp:TextBox ID="txtReasonAnswerValue" runat="server" Height="100px" Style="resize: none" TextMode="MultiLine" />
                                    </td>
                                    <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                    
                                    
                                   
                                    <td style="padding: 3px 5px; width: 8%" class="no-border">
                                         <asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="btn btn-Update" Font-Size="Small"   Visible="true" OnClick="btnAdd_Click" />
                                    </td>
                                </tr>
                                <tr>
                                      <td style="padding: 3px 5px;" class="label-alignment no-border" colspan="9">
                                        <asp:Label ID="Label7" runat="server" Text="" ForeColor="Red"></asp:Label>
                                    </td>
                                </tr>
                            </table>

                            <%-- REvenue details --%>
                             <div id="Div2" runat="server" style="overflow-x: auto">
                                 <asp:GridView ID="gdvQuestion" runat="server" AutoGenerateColumns="False"
                                     AllowSorting="True" EmptyDataText="No Data Found" AllowPaging="true" PageSize="10" 
                                     OnRowCommand="gdvQuestion_RowCommand"
                                     OnRowEditing="gdvQuestion_RowEditing" OnRowUpdating="gdvQuestion_RowUpdating"
                                     class="table table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                                     <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                     <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                     <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                     <Columns>
                                         <asp:TemplateField HeaderText="SLNO" ItemStyle-Width="5%" Visible="True" ItemStyle-HorizontalAlign="Center">
                                             <ItemTemplate>
                                                 <asp:Label ID="lblSLNO" Text='<%#(Eval("SLNO").ToString()) %>'
                                                     runat="server" />
                                           
                                             </ItemTemplate>
                                         </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Question" ItemStyle-Width="15%" Visible="True" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="left">
                                             <ItemTemplate>
                                                 <asp:Label ID="lblQuestion" Text='<%#(Eval("Question").ToString()) %>'
                                                     runat="server" />
                                                 <asp:HiddenField ID="hfdQuestionId" Value='<%#(Eval("QuestionId").ToString()) %>' runat="server" />
                                             </ItemTemplate>
                                         </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Question Type" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center">
                                             <ItemTemplate>
                                                 <asp:Label ID="lblQuestionType" Text='<%#(Eval("QuestionType").ToString()) %>' runat="server" />
                                             </ItemTemplate>
                                         </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Question Values" ItemStyle-Width="6%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                             <ItemTemplate>
                                                 <asp:Label ID="lblValues" Text='<%#(Eval("OptionalValues").ToString()) %>'
                                                     runat="server" />
                                             </ItemTemplate>
                                         </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Your Answer" ItemStyle-Width="15%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                             <ItemTemplate>
                                                 <asp:Label ID="lblAnswer" Text='<%#(Eval("AnswerValue").ToString()) %>'
                                                     runat="server" />
                                             </ItemTemplate>
                                         </asp:TemplateField>
                                          <asp:TemplateField HeaderText="Reason" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                             <ItemTemplate>
                                                 <asp:CheckBox ID="chkReason" Checked='<%#(Eval("Reason")) %>'
                                                     runat="server" />
                                             </ItemTemplate>
                                         </asp:TemplateField>
                                          <asp:TemplateField HeaderText="Reason Question" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                             <ItemTemplate>
                                                 <asp:Label ID="lblReasonQuestion" Text='<%#(Eval("ReasonQuestion").ToString()) %>'
                                                     runat="server" />
                                             </ItemTemplate>
                                         </asp:TemplateField>
                                           <asp:TemplateField HeaderText="Reason Question Type" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                             <ItemTemplate>
                                                 <asp:Label ID="lblReasonQuestionType" Text='<%#(Eval("ReasonQuestionType").ToString()) %>'
                                                     runat="server" />
                                             </ItemTemplate>
                                         </asp:TemplateField>
                                           <asp:TemplateField HeaderText="Reason Question Value" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                             <ItemTemplate>
                                                 <asp:Label ID="lblReasonQuestionValue" Text='<%#(Eval("ReasonQuestionValue").ToString()) %>'
                                                     runat="server" />
                                             </ItemTemplate>
                                         </asp:TemplateField>
                                       <asp:TemplateField HeaderText="Delete">
                                        <HeaderStyle Font-Size="Small" Width="4%" HorizontalAlign="Center" />
                                        <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lblDelete" runat="server" Style="text-align: center" CommandArgument='<%#Eval("SLNO")%>' CommandName="DeleteDet"><i class="fa fa-trash" ></i></asp:LinkButton>
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


        </ContentTemplate>
        <Triggers>
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
