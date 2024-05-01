<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="GetCRMData.aspx.cs" Inherits="CRMAdmin_GetCRMData" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <link rel="stylesheet" href="../Theme/Modified/modifiedcss.css" type="text/css" />
     <link rel="stylesheet" href="../Template/assets/vendor/libs/toaster/toaster.css" type="text/css" />

   
    <script src="../CRMAdmin/Script/opt.js"></script>
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
    
</asp:Content> 
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
        <ContentTemplate>
          
       


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
                                       <asp:Label ID="Label26" runat="server" Text="ReferenceNumber"></asp:Label>
                                    </label>
                                  </div>
                              <div class="pull-right" style="padding-top: 5px;">
                               <asp:TextBox ID="txtRefNumber" runat="server" ForeColor="Black" CssClass="form-control textBox1"></asp:TextBox>
                             </div>
                             <div class="pull-right" style="padding-top: 5px;">
                                <label class="form-label">
                                       <asp:Label ID="Label1" runat="server" Text="Instance"></asp:Label>
                                    </label>
                                  </div>
                              <div class="pull-right" style="padding-top: 5px;">
                               <asp:DropDownList ID="ddlInstance" runat="server" ForeColor="Black" CssClass="form-control textBox1">
                                   <asp:ListItem Text="PROJECT" Value="PROJECT"></asp:ListItem>
                                   <asp:ListItem Text="OPPORTUNITY" Value="OPPORTUNITY"></asp:ListItem>
                                    <asp:ListItem Text="ACCOUNT" Value="ACCOUNT"></asp:ListItem>

                               </asp:DropDownList>
                             </div>

                                <div class="pull-right" style="padding-top: 5px;">
                                      <asp:LinkButton ID="lblGetFromCRM" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="lblGetFromCRM_Click"
                                                ><i class="fa fa-search" aria-hidden="true" title="Search"></i></asp:LinkButton>   
           
                            
                               <div class="pull-right">
                                   <label class="form-label">
                                       <asp:Label ID="lblMessage" runat="server" Text="" ForeColor="Red"></asp:Label>

                                   </label>
                               </div>
                         </div>
               


                    
                    </div>


                </div>
                

            </div>
                </div>
          


            
        </ContentTemplate>
      
        <Triggers>
          
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
