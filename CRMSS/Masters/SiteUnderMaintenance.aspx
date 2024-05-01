<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="SiteUnderMaintenance.aspx.cs" Inherits="Masters_SiteUnderMaintenance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style>
        /*.card {
            position: relative;
            display: flex;
            flex-direction: column;
            min-width: 0;
            word-wrap: break-word;*/
            /*background: radial-gradient(ellipse at center, #19438b 17%, #0d285a 70%);*/

            /*background: #fff;
            background-clip: border-box;
            border: 0 solid #d9dee3;
            border-radius: 0.5rem;
        }*/

        .card {
            position: relative;
            display: flex;
            flex-direction: column;
            min-width: 0;
            word-wrap: break-word;
            /*background: radial-gradient(ellipse at center, #19438b 17%, #0d285a 70%);*/

            background: #fff;
            background-clip: border-box;
            border: 0 solid #d9dee3;
            border-radius: 0.5rem;
            padding: 41px;
            margin-top:10%;
        }

        .h5 {
            margin-top: 20px!important;
            margin-bottom: 0.5rem;
            font-weight: 500;
            line-height: 1.1;
            color: #566a7f;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="ecard">
    <div class="row" style="padding-left:2%">

        <div class="col-4">
            
        </div>
        <div class="col-4 card">
            <div class="row">

                <div class="col-6">
                    <img src="../Images/naffco-logo.png" style="width:177px">
                </div>

                <%--<div class="col-4">

                </div>--%>

                <div class="col-6">
                     <img style="float:right;width:122px" src="../Images/e-connect-removebg-preview.png" />
                </div>
                 
               
            </div>
           <br />
            <div class="row">
                <div class="col-3">
                    <img src="../Images/icons8-alert.gif" style="float:inline-end" />
                </div>
                <div class="col-7">
                    <h4 style="margin-top:20px!important">Site Under Maintenance</h4>
                </div>
                
            </div>
           

            <hr />
            <p>We sincerely apologize for the inconvenience. Our site is currently undergoing scheduled maintenance and upgrades, 
                but will return shortly. Thank you for your patience.</p>
            <div>
              <h6 style="float:right">IT Department <br /> Development team</h6>
                
            </div>
        </div>

        <div class="col-4">
           
        </div>

    </div>
        </div>
</asp:Content>

