<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="ChangePassword.aspx.cs" Inherits="Security_ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
<link rel="stylesheet" href="../media/css/bootstrap/bootstrap.css" type="text/css" />
<link rel="stylesheet" href="../media/css/bootstrap/bootstrap-custom.css" type="text/css" />

    <style type="text/css">
        .style1
        {
            width: 256px;
        }
    </style>
   
    <script type="text/javascript" >
        function ComparePassword() {

            var todo = document.getElementById('txtOldPassword').value;
            var todo2 = document.getElementById('lblpassword').value;
            alert('a');

            if (todo != todo2) { // Oops
                alert('a');
                var lblmsg = document.getElementById('lblMessage');


                todo.style.backgroundColor = goodColor;

                lblmsg.innerHTML = "Passwords Match!"

            }
        }

        


    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always" >
         <ContentTemplate>
<div class="breadcrumb-custom flat">
                <a href="../Masters/Home.aspx"><%=Resources.Resource.Breadcrumb_Home %> </a>
                <a href="#"><%=Resources.Resource.AM_Security %></a>
                <a href="ChangePassword.aspx" class="active"><%=Resources.Resource.CP_Change_Password %></a>
            </div>
         <br />
    <div class="panel panel-default">
    <div class="panel-heading">
    <div class="pull-left">
     <h4><%=Resources.Resource.CP_Enter_Password %></h4>
     </div>
              </div>
   <div class="panel-body panel-margin">
                    <table  class="table table-condensed">
                        <tr>
                             <td class=" no-border label-alignment"  >
                                <asp:Label ID="lblUName" runat="server" Text="<%$Resources:Resource, CP_Old_Password %>"></asp:Label>
                            </td>
                              <td  class="no-border">
                                <asp:TextBox CssClass="textBox1 form-control" ID="txtOldPassword" AutoPostBack="true" TextMode="Password" runat="server" OnTextChanged="txtOldPassword_TextChanged" ></asp:TextBox>
                                <asp:TextBox CssClass="textBox1 form-control" ID="lblpassword" runat="server" Visible="false"></asp:TextBox>
                            </td>
                            <td class="pull-right no-border label-alignment">
                                <asp:Label ID="lblPass" runat="server" Text="<%$Resources:Resource, CP_New_Password %>"></asp:Label>
                            </td>
                               
                            <td  class="no-border">
                                <asp:TextBox CssClass="textBox1 form-control" ID="txtNewPassword" TextMode="Password" runat="server"  ></asp:TextBox>
                            </td>

                              <td class="pull-right no-border label-alignment">
                                <asp:Label ID="Label1" runat="server" Text="Conform Password"></asp:Label>
                            </td>
                               
                            <td  class="no-border">
                                <asp:TextBox CssClass="textBox1 form-control" ID="txtConformP"  runat="server" TextMode="Password"  AutoPostBack="true" OnTextChanged="txtConformP_TextChanged"></asp:TextBox>
                            </td>
                              
                            <td  class="no-border">
                                <asp:Button class="btn btn-primary" ID="btnUpdate" runat="server" Text="<%$Resources:Resource, Button_Update %>" OnClick="btnUpdate_Click" />
                            </td>

                         
                          
                           
                             
                          
                        </tr>
                        <tr>
                              <td class="no-border">
                               
                            </td>
                             <td class="no-border" colspan="6" >
                                <asp:Label ID="lblMessage" runat="server" ClientIDMode="Static" ></asp:Label>
                            </td>
                        </tr>
                    </table>
               
    </div>
    </div>

              </ContentTemplate>

    </asp:UpdatePanel >
</asp:Content>
