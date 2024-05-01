<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Forcasted.aspx.cs" Inherits="Sales_Forcasted" %>



<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    
    <link rel="stylesheet" href="../media/css/bootstrap/bootstrap.css" type="text/css" />
    <link rel="stylesheet" href="../media/css/bootstrap/bootstrap-custom.css" type="text/css" />
    <link href="../CustomSearch/css/jquery-customselect-1.9.1.css" rel="stylesheet" />

  
    <link rel="stylesheet" href="../Sales/css/sales.css" type="text/css" />
   

      
   
    <script type="text/javascript">

<!--
    function Check_Click1(objRef) {
        //Get the Row based on checkbox
        var row = objRef.parentNode.parentNode;

        //Get the reference of GridView
        var GridView = row.parentNode;

        //Get all input elements in Gridview
        var inputList = GridView.getElementsByTagName("input");

        for (var i = 0; i < inputList.length; i++) {
            //The First element is the Header Checkbox
            var headerCheckBox = inputList[0];

            //Based on all or none checkboxes
            //are checked check/uncheck Header Checkbox
            var checked = true;
            if (inputList[i].type == "checkbox" && inputList[i] != headerCheckBox) {
                if (!inputList[i].checked) {
                    checked = false;
                    break;
                }
            }
        }
        headerCheckBox.checked = checked;

    }
    function checkAll1(objRef, cellIndex) {

        var GridView = objRef.parentNode.parentNode.parentNode;
        var inputList = GridView.getElementsByTagName("input");

        for (var i = 0; i < inputList.length; i++) {
            if ((inputList[i].parentNode.cellIndex) == cellIndex) {
                var row = inputList[i].parentNode.parentNode;
                if (inputList[i].type == "checkbox" && objRef != inputList[i]) {
                    if (objRef.checked) {
                        inputList[i].checked = true;
                    }
                    else {

                        inputList[i].checked = false;
                    }
                }
            }
        }
    }
       
        function checkAll2(objRef, cellIndex) {

        var GridView = objRef.parentNode.parentNode.parentNode;
        var inputList = GridView.getElementsByTagName("input");

        for (var i = 0; i < inputList.length; i++) {
            if ((inputList[i].parentNode.cellIndex) == cellIndex) {
                var row = inputList[i].parentNode.parentNode;
                if (inputList[i].type == "checkbox" && objRef != inputList[i]) {
                    if (objRef.checked) {
                        inputList[i].checked = true;
                    }
                    else {

                        inputList[i].checked = false;
                    }
                }
            }
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
        .fa {
            font-size: large !important;
        }
        .updateprogressbg {
         background-color: #000000;
            filter: alpha(opacity=70);
            opacity: 0.6;
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <asp:Panel ID="pnl" runat="server">

                <div class="breadcrumb-custom" id="toptabbuttons">

                    <a class="active" id="aLOITOSO" runat="server">
                        <asp:Button ID="btnLOIToSo" runat="server" Text="LOI/LPO to SO" BackColor="Transparent" BorderStyle="None" OnClick="btnLOIToSo_Click" />
                    </a>

                    <a id="aHOTToSo" runat="server">
                        <asp:Button ID="btnHOTToSo" runat="server" Text="HOT to SO" BackColor="Transparent" BorderStyle="None" OnClick="btnHOTToSo_Click" />
                    </a>
                    <a id="aHOTtoLOI" runat="server">
                        <asp:Button ID="btnHOTtoLOI" runat="server" Text="HOT to LOI" BackColor="Transparent" BorderStyle="None" OnClick="btnHOTtoLOI_Click" />

                    </a>


                </div>
                <div class="breadcrumb-customnew flatnew">
                    <a>
                        <div class="pull-left">
                            <asp:Label ID="Label6" runat="server" class="col-form-label" Text="Salesman" Font-Bold="true" ForeColor="White"></asp:Label>
                        </div>
                        <div class="pull-right" style="padding-left: 10px">
                            <asp:DropDownList ID="ddlSalesman" class="form-control" runat="server" Font-Bold="true" AutoPostBack="true" OnSelectedIndexChanged="ddlSalesman_SelectedIndexChanged"></asp:DropDownList>
                            <asp:HiddenField ID="UserType" runat="server" />

                        </div>
                    </a>
                    <a>
                        <div class="pull-left">
                            <asp:Label ID="Label2" runat="server" class="col-form-label" Text="Forcast for" Font-Bold="true" ForeColor="White"></asp:Label>
                        </div>
                        <div class="pull-right" style="padding-left: 10px">
                            <asp:TextBox ID="txtForeCastMonth" class="form-control" runat="server" Font-Bold="true" OnTextChanged="txtForeCastMonth_TextChanged" AutoPostBack="true"></asp:TextBox>

                            <ajax:CalendarExtender ID="CalendarExtender1" runat="server" CssClass="MyCalendar"
                                OnClientShown="onCalendarShown"
                                TargetControlID="txtForeCastMonth"
                                BehaviorID="Calendar1"
                                Format="yyyy-MM" />
                        </div>
                    </a>
                </div>


                <div class="pull-right">

                    <asp:Button runat="server" ID="btnSaveDetails" class="btn btn-Search" Text="SAVE" OnClick="btnSaveDetails_Click" />

                    <asp:Button runat="server" ID="btnSubmitDetails" class="btn btn-Search" Text="SUBMIT" OnClick="btnSubmitDetails_Click" />
                </div>


                <%--Modal for Sucess message--%>


                <div id="SuccessModal" class="modal fade">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form>

                                <div class="modal-body">
                                    <h4 class="modal-title">Data Saved Succussfully 
                                    </h4>

                                </div>
                                <div class="modal-footer">
                                    <input type="button" class="btn btn-default" data-dismiss="modal" value="OK">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <div id="SubmitModal" class="modal fade">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form>

                                <div class="modal-body">
                                    <h4 class="modal-title">Data Submitted Succussfully 
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


                <asp:Panel ID="pnlLOITOSO" runat="server">
                    <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">


                        <asp:Panel ID="Panel2" runat="server" CssClass="panl14">
                            <div class="card-header" style="margin-bottom: 53px;">
                                <div class="pull-left">
                                    <h3 style="color: White; font-weight: bold;">
                                        <asp:Label ID="lblPanelHeader" ForeColor="White" Font-Bold="true" runat="server" Text="LOI/LPO TO SO"></asp:Label>
                                        <asp:HiddenField ID="hfdOper" runat="server" Value="1" />
                                </div>

                                <div class="pull-right" style="padding-top: 10px;">

                                    <asp:Button runat="server" ID="btnListOfHoTOpts" class="btn btn-Update" Text="+ Add" OnClick="btnListOfHoTOpts_Click" />
                                </div>

                            </div>

                        </asp:Panel>
                        <div class="card-block" style="font-weight: bold; overflow-x: auto">

                            <asp:GridView ID="gdvSelectedLOIList" runat="server" CellPadding="4" AutoGenerateColumns="False" CellSpacing="0" BorderWidth="0" AllowSorting="True"
                                OnRowCommand="gdvSelectedLOIList_RowCommand" OnRowDataBound="gdvSelectedLOIList_RowDataBound"
                                class="table table-striped table-bordered nowrap" ForeColor="#333333" GridLines="None">
                                <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                <Columns>

                                    <asp:TemplateField HeaderText="" Visible="true">
                                        <HeaderStyle Font-Size="Small" Width="3%" />
                                        <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                        <ItemTemplate>

                                            <asp:HiddenField ID="hfdOrderNo" runat="server" Value='<%#Eval("OrderNumber")%>' />
                                            <asp:HiddenField ID="hfdOptId" runat="server" Value='<%#Eval("OpportunityID")%>' />
                                            <asp:Button ID="btnCollapse" runat="server" BackColor="White" Font-Bold="true" Font-Size="Larger" ForeColor="Black" Text="-" Style="text-align: center" CommandArgument='<%#Eval("OpportunityID")%>' CommandName="Collaps" CssClass="fa fa-plus-circle"></asp:Button>

                                        </ItemTemplate>
                                    </asp:TemplateField>


                                    <asp:TemplateField HeaderText="Include">
                                        <HeaderStyle Font-Size="Small" Width="7px" HorizontalAlign="Center" />
                                        <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                        <ItemTemplate>

                                            <asp:CheckBox ID="chkSelectIn" onclick="Check_Click1(this)" Checked='<%#Eval("Include")%>' runat="server" OnCheckedChanged="chkSelectIn_CheckedChanged" AutoPostBack="true" />
                                        </ItemTemplate>
                                    </asp:TemplateField>



                                    <asp:TemplateField HeaderText="Salesman Include">
                                        <HeaderStyle Font-Size="Small" Width="7px" HorizontalAlign="Center" />
                                        <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                        <ItemTemplate>

                                            <asp:CheckBox ID="chkSelectInS" Checked='<%#Eval("SInclude")%>' runat="server" Enabled="false" />
                                        </ItemTemplate>
                                    </asp:TemplateField>


                                    <asp:TemplateField HeaderText="Remarks" Visible="true">

                                        <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                        <ItemTemplate>

                                            <asp:TextBox ID="txtRemarks" runat="server" TextMode="MultiLine" Text='<%#Eval("Remarks") %>' Style="vertical-align: middle; color: black; height: 50px; resize: none"></asp:TextBox>

                                            <div class="form-group">
                                                <asp:Label runat="server" ID="lblRemarkError" Font-Bold="true" ForeColor="Red" Text="" class="col-form-label"></asp:Label>

                                            </div>

                                        </ItemTemplate>
                                        <ItemStyle Width="10%" />

                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Salesman Remarks" Visible="true">

                                        <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                        <ItemTemplate>

                                            <asp:TextBox ID="txtRemarksS" runat="server" TextMode="MultiLine" Text='<%#Eval("SRemarks") %>' Style="vertical-align: middle; color: black; height: 50px; resize: none" Enabled="false"></asp:TextBox>


                                        </ItemTemplate>
                                        <ItemStyle Width="10%" />

                                    </asp:TemplateField>




                                    <asp:TemplateField HeaderText="Opportunity Number" Visible="true">

                                        <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                        <ItemTemplate>

                                            <asp:Label ID="lblOpportunityNumber" runat="server" Text='<%#Eval("OpportunityNumber") %>'></asp:Label>
                                        </ItemTemplate>

                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Name" Visible="true">

                                        <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                        <ItemTemplate>

                                            <asp:Label ID="lblName" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                                        </ItemTemplate>

                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Customer" Visible="true">

                                        <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                        <ItemTemplate>

                                            <asp:Label ID="lblCustomer" runat="server" Text='<%#Eval("Customer") %>'></asp:Label>
                                        </ItemTemplate>

                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Consultant" Visible="true">

                                        <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                        <ItemTemplate>

                                            <asp:Label ID="lblConsultant" runat="server" Text='<%#Eval("Consultant") %>'></asp:Label>
                                        </ItemTemplate>

                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Win%" Visible="true">

                                        <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                        <ItemTemplate>

                                            <asp:Label ID="lblWin" runat="server" Text='<%#Eval("Win%") %>'></asp:Label>
                                        </ItemTemplate>

                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Marketing" Visible="true">

                                        <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                        <ItemTemplate>

                                            <asp:Label ID="lblMarketing" runat="server" Text='<%#Eval("Marketing") %>'></asp:Label>
                                        </ItemTemplate>

                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Value" Visible="true">

                                        <ItemStyle Font-Size="Small" HorizontalAlign="Right" />
                                        <ItemTemplate>

                                            <asp:Label ID="lblValue" runat="server" Text='<%#Eval("Value") %>'></asp:Label>
                                        </ItemTemplate>

                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Forcast Amount" Visible="true">

                                        <ItemStyle Font-Size="Small" />
                                        <ItemTemplate>

                                            <asp:TextBox ID="txtForcastAmount" runat="server" Text='<%#Eval("ForcastAmount") %>' Style="vertical-align: middle; text-align: right; color: black" OnTextChanged="txtForcastAmount_TextChanged" AutoPostBack="true"></asp:TextBox>
                                        </ItemTemplate>


                                    </asp:TemplateField>

                                    <%--<asp:TemplateField HeaderText="Delete" Visible="true">
                                    <HeaderStyle Font-Size="Small" Width="4%" HorizontalAlign="Center" />
                                    <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                    <ItemTemplate>--%>
                                    <%--<asp:LinkButton ID="lblDelete" runat="server" Text="Delete" Style="text-align: center" CommandArgument='<%#Eval("OpportunityID")+";"+Eval("Name")%>' CommandName="DeleteDet"><i class="fa fa-trash" title="Delete"></i></asp:LinkButton>--%>
                                    <%--  </ItemTemplate>
                                </asp:TemplateField>--%>
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





                <cc1:ModalPopupExtender ID="mpLOIOpprtunities" runat="server" PopupControlID="pnlLOIopportnities" TargetControlID="txtSearchHotopt" 
                    Enabled="true" DropShadow="true" BehaviorID="ModalPopupExtenderBehavior9" RepositionMode="RepositionOnWindowResizeAndScroll"
                    CancelControlID="btnClose2" BackgroundCssClass="modalBackground">
                </cc1:ModalPopupExtender>
                <asp:Panel ID="pnlLOIopportnities" runat="server" CssClass="modalPopup" align="center" Style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important; display: none; font-family: 'Century Gothic'" BorderStyle="Solid" BorderWidth="1px" BorderColor="Black">
                    <div style="border-radius: 5px !important; background-color: white !important; padding-left: 7px; padding-top: 7px; float: left; padding-right: 7px; padding-bottom: 7px;">
                        <div class="modal-header panl14" style="font-family: system-ui;">

                            <h4>
                                <asp:Label ID="lblPopupHeader" CssClass="popupHeader" Style="color: white; float: left" runat="server" Text="LOI/LPO Opportunities"></asp:Label></h4>

                        </div>
                        <table class="table table-condensed">
                            <tr>
                                <td style="padding: 3px 5px;" colspan="11" class="no-border"></td>
                                <td style="padding: 3px 5px;" class="no-border" align="right">
                                    <asp:ImageButton ID="btnClose2" runat="server" Text="Close" ImageUrl="~/Icons/Cancel.png" /></td>
                            </tr>
                            <tr>
                                <td style="padding: 3px 5px;"  class="no-border">Search</td>
                                <td style="padding: 3px 5px;" class="no-border" align="right">
                                   <asp:TextBox ID="txtSearchHotopt" runat="server"  CssClass="textBox1 form-control" OnTextChanged="txtSearchHotopt_TextChanged" AutoPostBack="true"></asp:TextBox> </td>
                            </tr>


                        </table>

                        <div id="Div2" runat="server" style="height: 500px; width: 1100px; overflow-y: scroll">
                            <asp:GridView ID="gdvLOIOpportunities" runat="server" CellPadding="4" AutoGenerateColumns="False" RowStyle-BackColor="red" OnRowDataBound="gdvLOIOpportunities_RowDataBound"
                                CellSpacing="0" BorderWidth="0" AllowSorting="True" EmptyDataText="There are no records to display." CssClass="grid-view"
                                class="table table-striped table-bordered nowrap" ForeColor="#333333" GridLines="None">
                                <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />

                                <Columns>


                                    <asp:TemplateField>
                                        <HeaderStyle Font-Size="XX-Small" Width="5px" />
                                        <ItemStyle Font-Size="XX-Small" />
                                        <HeaderTemplate>

                                            <asp:CheckBox ID="chkAll" runat="server" onclick="checkAll1(this,0);" />
                                        </HeaderTemplate>
                                        <ItemTemplate>

                                            <asp:HiddenField ID="hfdOpportunityIDId" runat="server" Value='<%#Eval("OpportunityID")%>' />
                                            <asp:CheckBox ID="chkSelectIn" onclick="Check_Click1(this)" Checked='<%#Eval("chk")%>'
                                                runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:BoundField DataField="OpportunityNumber" HeaderText="OpportunityNumber" SortExpression="OpportunityNumber" />
                                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                                    <asp:BoundField DataField="Customer" HeaderText="Customer" SortExpression="Customer" />
                                    <asp:BoundField DataField="Consultant" HeaderText="Consultant" SortExpression="Consultant" />
                                    <asp:BoundField DataField="Win%" HeaderText="Win%" SortExpression="Win%" />
                                    <asp:BoundField DataField="Marketing" HeaderText="Marketing" SortExpression="Marketing" />
                                    <asp:BoundField DataField="Value" HeaderText="Value" ReadOnly="True" SortExpression="Value" />


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
                        <div style="float: right;">
                            <asp:Button runat="server" ID="btnLOIListSelected" class="btn btn-Update" Text="SUBMIT" OnClick="btnLOIListSelected_Click"></asp:Button>
                        </div>
                        <div style="float: right;">
                            <asp:Button ID="btnmpLOIOpprtunitiesClose" runat="server" Text="CLOSE" Visible="true" CssClass="btn-Cancel btn" />
                        </div>


                    </div>

                </asp:Panel>


            </asp:Panel>
        </ContentTemplate>
        <Triggers>
        </Triggers>
    </asp:UpdatePanel>


    <asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="UpdatePanel2" runat="server" >
        <ProgressTemplate >
         <div style="z-index:100002 !important;position: absolute; top: 0px; left: 0px; width: 100%; height: 100%;" class="updateprogressbg">
                <div class="CenterPB" style="height: 100%; width: 100%;position: absolute;">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Icons/TestGif.gif" Height="150px" 
                        Width="150px" />
                    <asp:Label ID="Label1"  runat="server" Text="Loading ..." ForeColor="Red" Font-Bold="true"></asp:Label>
                </div>
           </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
</asp:Content>

