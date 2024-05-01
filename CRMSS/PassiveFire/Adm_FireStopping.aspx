<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="Adm_FireStopping.aspx.cs" Inherits="PassiveFire_Default" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="../Theme/Modified/modifiedcss.css" type="text/css" />
      <link rel="stylesheet" href="../PassiveFire/CSS/Passivefire.css" type="text/css" />


    <style>
        .pnlheading {
            border-color: Silver;
            padding:none !important ;
             background-color: #364150;
        }

        .btn-default
        {
            background-color:dimgray;
                    color: #fff;
        }
        .btn-success{

            background-color:forestgreen;
             color: #fff;
        }
    </style>



</asp:Content>
 <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

   
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
        <ContentTemplate>

  


    <script language="javascript" type="text/javascript">
        function confirmSave() {
            var message = document.getElementById("MainContent_hdnConfirmSaveMessage").value;
            return confirm(message);
        }
        function confirmDelete() {
            var message = document.getElementById("MainContent_hdnConfirmDeleteMessage").value;
            return confirm(message);
        }

        $(document).ready(function () {
            $("#addEmployeeModal").validate();
        });

    </script>

    <script type="text/javascript">
        $(document).ready(function () {
            // Activate tooltip
            $('[data-toggle="tooltip"]').tooltip();
            // Select/Deselect checkboxes
            var checkbox = $('table tbody input[type="checkbox"]');
            $("#selectAll").click(function () {
                if (this.checked) {
                    checkbox.each(function () {
                        this.checked = true;
                    });
                } else {
                    checkbox.each(function () {
                        this.checked = false;
                    });
                }
            });
            checkbox.click(function () {
                if (!this.checked) {
                    $("#selectAll").prop("checked", false);
                }
            });
        });
    </script>

    <script>
        $('#addEmployeeModal').on('hidden.bs.modal', function () {
            $(this).find('form').trigger('reset');
        })
    </script>

    

            <%--<h4><asp:Label ID="Label3" class="hdigfnt" runat="server" Text="PASSIVE FIRE DEPARTMENT"></asp:Label></h4>--%>

            <asp:Panel ID="pnlItem" runat="server" Visible="true">

                 <div class="GridviewDiv" id="pnlSummaryView" runat="server">
                    <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">


                        <asp:Panel ID="Panel1" runat="server" CssClass="pnlheading">
                            <div class="pnlheading">
                                <div class="pull-left">

                                    <h4> <asp:Label ID="Label18" class="hdigfnt" Style="color: white;" runat="server" Text="Fire Stopping"></asp:Label></h4>

                                </div>



                                <div class="pull-right">

                                <%-- <asp:Button runat="server" ID="btnAddNewProject" CssClass="btn btn btn-addnew" OnClick="btnAddNewProject_Click" Text="Add New Project"></asp:Button>--%>
                                    <asp:Button runat="server" ID="ButtonNewProject" CssClass="btn btn btn-addnew"  Text="Add New Project" OnClick ="ButtonNewProject_Click"></asp:Button>

                                </div>

                                <%-- ******NEW ASP MODAL POUP --%>

                       </div>

            
            



                                                
            <cc1:ModalPopupExtender ID="mpNewItemAdd" runat="server" PopupControlID="pnlNewItem" TargetControlID="btnCloseAddOPT"
                Enabled="true" DropShadow="true" BehaviorID="ModalPopupExtenderBehavior9" RepositionMode="RepositionOnWindowResizeAndScroll"
                CancelControlID="btnCloseAddOPT" BackgroundCssClass="modalBackground">


            </cc1:ModalPopupExtender>



            <asp:Panel ID="pnlNewItem" runat="server" CssClass="modalPopup modal-newproject2" align="center"
                Style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 13px !important; display: none; font-family: 'Times New Roman'; font-size: medium" BorderStyle="Solid" BorderWidth="1px">

               
                 <div style="border-radius: 13px !important; background-color: #ffffff !important; padding-left: 7px; padding-top: 7px; float: left; padding-right: 7px; width: 40%; padding-bottom: 7px; position: fixed; z-index: 100001; left: 22%; top: 25.5px; border: solid; border-color: silver; padding-bottom: 0px">
                   <%-- <div class="row" style="height: 55px">

                        <div class="pull-left" style="border-radius: 50px !important; padding-left: 20px;">
                            <img src="../masters/images/ec.png" style="height: 30px;" />
                            <img src="../masters/images/ec1.png" style="height: 50px;" />

                        </div>
                        <div>
                        </div>
                    </div>--%>

                       <div class="modal-header" style="font-family: system-ui;">

                        <div class="pull-left">

                            <h4>
                                <asp:Label ID="ldbprojectheading" class="" runat="server" Text="Create New  Project "></asp:Label>
                                 <%--<asp:Label ID="ldbprojectheading" CssClass="popupHeader" Style="color: white; float: left" runat="server" Text="Create New  Project"></asp:Label></h4>--%>
                                 <asp:HiddenField ID="hfdNEWOPTNUMBER" runat="server" ></asp:HiddenField>
                            </h4>

                        </div>


                        <div class="pull-right">
                             <button type="button" class="btn btn-close"  aria-label="Close" runat="server" id="btnCloseAddOPT"/>
                         <%--   <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="../Icons/deleteData.png" Style="padding-top: 10%;" /></td>--%>
                        </div>

                    </div>


              
                         <table class="table table-condensed">

                           

                             <tr>
                                <td style="padding: 3px 5px;" class="label-alignment no-border">
                                        <asp:Label runat="server" Text="Select Category" ID="LblCategory" CssClass="formlbl labelsp no-border"></asp:Label>
                                                        
                                        <asp:DropDownList runat="server" ID="DDLCategory" CssClass="drowscop input-small form-control mdlwidth" OnSelectedIndexChanged="DDLCategory_SelectedIndexChanged"  AutoPostBack="true">
                                        <asp:ListItem Text="Fire Stopping" Value="FireStopping" ></asp:ListItem>
                                        <asp:ListItem Text="Fire Proofing" Value="FireProofing"></asp:ListItem>

                                        </asp:DropDownList>
                                </td>
                             </tr>

                             <tr>
                                 <td style="padding: 3px 5px;" class="label-alignment no-border">
                                       <asp:Label runat="server" Text="Project  Number" ID="lblprojrctno" CssClass="formlbl labelsp"></asp:Label>
                                       <asp:TextBox type="text" ID="txtprojcetnum" name="prjNumber" placeholder="Enter Number Only (eg:5653582)" runat="server" CssClass="form-control" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                     <asp:HiddenField ID="hfdProjectId" runat="server" />

                                 </td>
                             </tr>
                             <tr>
                                 <td style="padding: 3px 5px;" class="label-alignment no-border">
                                      <asp:Label runat="server" Text="Project Name" CssClass="formlbl labelsp" ID="lblprojectname"></asp:Label>
                                       <asp:TextBox type="text" ID="txtprjctname"  name="prjName" runat="server" class="form-control" />
                                 </td>
                             </tr>

                             <tr>
                                 <td style="padding: 3px 5px;" class="label-alignment no-border">
                                      <asp:Label runat="server" Text="Location" CssClass="formlbl labelsp" ID="lbllocation"></asp:Label>

                                       <asp:TextBox runat="server" type="text" name="location" ID="txtprjctlocation" class="form-control" />
                                 </td>
                             </tr>

                             <tr>
                                 <td style="padding: 3px 5px;" class="label-alignment no-border">
                                     <asp:Label runat="server" Text="Emirate" CssClass="formlbl labelsp" ID="lblemirates"></asp:Label>

                                     <asp:TextBox runat="server" type="text" name="txtemirates" ID="txtemirates" class="form-control" />
                                 </td>
                             </tr>

                             <tr>
                                 <td style="padding: 3px 5px;" class="label-alignment no-border">
                                     <asp:Label runat="server" Text="Scope Of Work" CssClass="formlbl labelsp" ID="lblscopofwork"> </asp:Label>
                                       <asp:DropDownList runat="server" ID="drwpdnscop" CssClass="drowscop input-small form-control">

                                                                <asp:ListItem Text="Construction" Value="Construction"></asp:ListItem>
                                                                <asp:ListItem Text="MEP" Value="MEP"></asp:ListItem>
                                                                <asp:ListItem Text="Joints" Value="Joints"></asp:ListItem>
                                                                <asp:ListItem Text="CJ+MEP" Value="CJ+MEP"></asp:ListItem>
                                                                <asp:ListItem Text="Cementitious" Value="Cementitious"></asp:ListItem>
                                                                <asp:ListItem Text="Intumescent" Value="Intumescent"></asp:ListItem>
                                                                <asp:ListItem Text="Cementitious+Intumescent" Value="Cementitious+Intumescent"></asp:ListItem>
                                     </asp:DropDownList>
                                 </td>
                             </tr>

                             <tr>
                                 <td style="padding: 3px 5px;" class="label-alignment no-border">
                                  <asp:Label runat="server" Text="Contract Value" CssClass="formlbl labelsp" ID="lblcontractvalue"></asp:Label>
                                    <asp:TextBox runat="server" type="text" class="form-control" placeholder="EnterContract Amount Only(eg: 750000)" ID="txtctrvalue" name="contactValue" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                     </td> 
                             </tr>

                             <tr>
                                 <td style="padding: 3px 5px;" class="label-alignment no-border">
                                  <asp:Label runat="server" CssClass="formlbl labelsp" Text="Contract Area(Fire Proofing)" ID="LblContractArea"></asp:Label>
                                  <asp:TextBox runat="server" type="text" class="form-control" ID="TxtContractArea" name="ContractArea" Placeholder="Enter The Area Value Only(eg:8000)" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                     </td>

                             </tr>
                             <tr>
                                 <td style="padding: 3px 5px;" class="label-alignment no-border">
                                       <asp:Label runat="server" Text="Contract Type" CssClass="formlbl labelsp" ID="lblcomtratcttype"> </asp:Label>
                                     <asp:DropDownList runat="server" ID="Dropdncontracttype" CssClass="drowscop input-small form-control">

                                                                <asp:ListItem Text="Lumpsum" Value="Lumpsum"></asp:ListItem>
                                                                <asp:ListItem Text="Remeasurable" Value="Remeasurable"></asp:ListItem>

                                     </asp:DropDownList>
                                 </td>
                             </tr>
                             <tr>
                                 <td style="padding: 3px 5px;" class="label-alignment no-border">
                                        <asp:Label runat="server"  Text="Estimated Invoice For Particular Month" CssClass="formlbl labelsp" ID="Label1"></asp:Label>
                                        <asp:TextBox runat="server" type="text" name="EstimatedInvoice" ID="txtEstimatedInvoice" class="form-control" placeholder="Enter Invoice Amount Only(eg:45000)" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                 </td>
                             </tr>
                             <tr>
                                 <td style="padding: 3px 5px;" class="label-alignment no-border">
                                        <asp:Label runat="server"  Text="Remarks" CssClass="formlbl labelsp" ID="lblremarks"></asp:Label>
                                        <asp:TextBox runat="server" type="text" name="Remarks" ID="txtremarks" class="form-control"  />
                                 </td>
                             </tr>

                             <tr>
                              <td>
                             <asp:Button runat="server" ID="btnclose" Text="Close" class="btn btn-update" data-dismiss="modal" CssClass="btn btn-default"></asp:Button>
                             <asp:Button runat="server" ID="btnSave" CssClass="btn btn-success" OnClick="btnSave_Click" Text="Submit" data-Submit="modal"></asp:Button>
                             </td> 


                            </tr>
                              
                         </table>
                        
                     <%--</div>--%>
           
            </asp:Panel>

                            </div>
                        </asp:Panel>



                        <div class="card-block gdv-overflow" >
                            <br />

                            <asp:GridView ID="gdvList" runat="server" AutoGenerateColumns="False" DataSourceID="sqlDataList"
                                RowStyle-BackColor="White" Width="100%" OnRowCommand="gdvList_RowCommand"
                                CellSpacing="0" BorderWidth="0" AllowSorting="True" EmptyDataText="No Data Found"
                                class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                                <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                <Columns>
                                    
                                    <asp:BoundField DataField="ProjectNumber" HeaderText="Project Number" ControlStyle-Width="15%" SortExpression="ProjectNumber" ItemStyle-HorizontalAlign="Center" InsertVisible="False" ReadOnly="true" />
                                    <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" ControlStyle-Width="15%" ItemStyle-HorizontalAlign="Center" InsertVisible="False" ReadOnly="true" />
                                    <asp:BoundField DataField="ProjectName" HeaderText="Project Name" SortExpression="ProjectName" ControlStyle-Width="15%" ItemStyle-HorizontalAlign="Center" InsertVisible="False" ReadOnly="true" />
                                    <asp:BoundField DataField="Location" HeaderText="Location" SortExpression="Location" ControlStyle-Width="15%" ItemStyle-HorizontalAlign="Center" InsertVisible="False" ReadOnly="true" />
                                    <asp:BoundField DataField="Emirates" HeaderText="Emirates" SortExpression="Emirates" ControlStyle-Width="15%" ItemStyle-HorizontalAlign="Center" InsertVisible="False" ReadOnly="true" />
                                    <asp:BoundField DataField="ContractValue" HeaderText="Contract Value" SortExpression="ContractValue" ControlStyle-Width="15%" ItemStyle-HorizontalAlign="Center" InsertVisible="False" ReadOnly="true" />
                                    <asp:BoundField DataField="ScopeOfWork" HeaderText="Scope Of Work" SortExpression="ScopeOfWork" ControlStyle-Width="15%" ItemStyle-HorizontalAlign="Center" InsertVisible="False" ReadOnly="true" />
                                    <asp:BoundField DataField="ContractType" HeaderText="Contract Type/Area" SortExpression="ContractType" ControlStyle-Width="15%" ItemStyle-HorizontalAlign="Center" InsertVisible="False" ReadOnly="true" />
                                    <asp:BoundField DataField="UnitRate" HeaderText="Remarks" SortExpression="UnitRate" ControlStyle-Width="15%" ItemStyle-HorizontalAlign="Center" InsertVisible="False" ReadOnly="true" />

                                    <asp:BoundField DataField="UpdatedDate" HeaderText="Created Date" SortExpression="UpdatedDate" ControlStyle-Width="15%" ItemStyle-HorizontalAlign="Center" InsertVisible="False" ReadOnly="true" />



                                    <asp:TemplateField HeaderText="Actions" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>

                                            <asp:LinkButton ID="lbDelete" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" CommandName="DeleteData" CommandArgument='<%#Eval("Id")%>'><i class="fa fa-trash" title="Delete"></i></asp:LinkButton>
                                            <asp:LinkButton ID="lbEdit" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" CommandName="Edit" CommandArgument='<%#Eval("Id")+";"+Eval("ProjectNumber")+";"+Eval("ProjectName")+";"+Eval("Emirates")+";"+Eval("ContractValue")+";"+Eval("ScopeOfWork")+";"+Eval("ContractType")+";"+Eval("Location")+";"+Eval("Category")+";"+Eval("Location")%>'><i class="fa fa-pencil" title="Edit"></i></asp:LinkButton>

                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="10%" />
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

                            <asp:SqlDataSource ID="sqlDataList" runat="server" ConnectionString="<%$ ConnectionStrings:PASSIVEFIRECon %>"
                                SelectCommand="sp_PassiveProjectMaster"
                                SelectCommandType="StoredProcedure">


                                <SelectParameters>

                                    <asp:Parameter Name="Oper" DefaultValue="1" />
                                </SelectParameters>
                            </asp:SqlDataSource>

                        </div>
                    </div>

                    <!-- Delete Modal HTML -->
                     <%--Modal for Sucess message--%>


                         <div id="DeleteModal" class="modal fade">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <form>
                                   
                                    <div class="modal-body">
                                        <h4 class="modal-title">Delete Your Project Sucessfully..
                                        </h4>
                                      
                                    </div>
                                    <div class="modal-footer">
                                        <input type="button" class="btn btn-default" data-dismiss="modal" value="OK">
                                        
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <%-- ******End grid and popup************ --%>
                </div>
                </div>
                            </div>
            </asp:Panel>


            <asp:Panel ID="pnlEditDetails" runat="server" CssClass="modalPopup" align="center" Style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important; display: none; font-family: 'Century Gothic'" BorderStyle="Solid" BorderWidth="1px" BorderColor="Black" Font-Bold="true">
                <div style="box-shadow: 1px -1px 4px 5px #7c7c7c !important; border-radius: 5px !important; background-color: #ffffff !important; padding-left: 7px; padding-top: 7px; float: left; padding-right: 7px; padding-bottom: 7px">
                </div>
            </asp:Panel>


        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSave" />

        </Triggers>
    </asp:UpdatePanel>

    <asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="UpdatePanel1" runat="server">
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





