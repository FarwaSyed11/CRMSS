﻿<%@ Page Title="" Language="C#" MasterPageFile="~/EconnectNew.master" AutoEventWireup="true" CodeFile="SalarySlip.aspx.cs" Inherits="SSHR_SalarySlip" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../FireDuctWork/Scripts/jspdf.min.js"></script>
    <script src="../FireDuctWork/Scripts/html2pdf.bundle.min.js"></script>

    <style>
        .salary-slip{
      margin: 15px;
      .empDetail {
        width: 100%;
        text-align: left;
        border: 2px solid black;
        border-collapse: collapse;
        table-layout: fixed;
      }
      
      .head {
        margin: 10px;
        margin-bottom: 50px;
        width: 100%;
      }
      
      .companyName {
        text-align: right;
        font-size: 25px;
        font-weight: bold;
      }
      
      .salaryMonth {
        text-align: center;
      }
      
      .table-border-bottom {
        border-bottom: 1px solid;
      }
      
      .table-border-right {
        border-right: 1px solid;
      }
      
      .myBackground {
        padding-top: 10px;
        text-align: left;
        border: 1px solid black;
        height: 40px;
      }
      
      .myAlign {
        text-align: center;
        border-right: 1px solid black;
      }
      
      .myTotalBackground {
        padding-top: 10px;
        text-align: left;
        background-color: #EBF1DE;
        border-spacing: 0px;
      }
      
      .align-4 {
        width: 25%;
        float: left;
      }
      
      .tail {
        margin-top: 35px;
      }
      
      .align-2 {
        margin-top: 25px;
        width: 50%;
        float: left;
      }
      
      .border-center {
        text-align: center;
      }
      .border-center th, .border-center td {
        border: 1px solid black;
      }
      
      th, td {
        padding-left: 6px;
      }
}
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

  <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">

        <div style="padding-left: 2%; padding-top: 1%;">

           <div class="salary-slip" >
            <table class="empDetail">
              <tr height="100px" style='background-color: #c2d69b'>
                <td colspan='4'>
                  <img height="90px" src='https://organisationmedia.toggleflow.com/demo/logo.png' /></td>
                <td colspan='4' class="companyName"> Co-Operative Bank Ltd.</td>
              </tr>
              <tr>
                <th>
                  Name
      </th>
                <td>
                  Example
      </td>
                <td></td>
                <th>
                  Bank Code
      </th>
                <td>
                  ABC123
      </td>
                <td></td>
                <th>
                  Branch Name
      </th>
                <td>
                  ABC123
      </td>
              </tr>
              <tr>
                <th>
                  Employee Code
      </th>
                <td>
                  XXXXXXXXXXX
      </td>
                <td></td>
                <th>
                  Bank Name
      </th>
                <td>
                  XXXXXXXXXXX
      </td>
                <td></td>
                <th>
                  Payslip no.
      </th>
                <td>
                  XXXXXXXXXX
      </td>
              </tr>
              <tr>
                <th>
                  Cost Centre
      </th>
                <td>
                  XXXXXXXXXXX
      </td><td></td>
                <th>
                  Bank Branch
      </th>
                <td>
                  XXXXXXXXXX
      </td><td></td>
                <th>
                  Pay Period
      </th>
                <td>
                  XXXXXXXXXXX
      </td>
              </tr>
              <tr>
                <th>
                  CC Description:
      </th>
                <td>
                  XXXXXXXXXXX
      </td><td></td>
                <th>
                  Bank A/C no.
      </th>
                <td>
                  XXXXXXXXXX
      </td><td></td>
                <th>
                  Personel Area
      </th>
                <td>
                  XXXXXXXXXX
      </td>
              </tr>
              <tr>
                <th>
                  Grade:
      </th>
                <td>
                  18
      </td><td></td>
                <th>
                  Employee Group
      </th>
                <td>
                  Sales Manager
      </td><td></td>
                <th>
                  PAN No:
      </th>
                <td>
                  MOP72182E
      </td>
              </tr>
              <tr class="myBackground">
                <th colspan="2">
                  Payments
      </th>
                <th >
                  Particular
      </th>
                <th class="table-border-right">
                  Amount (Rs.)
      </th>
                <th colspan="2">
                  Deductions
      </th>
                <th >
                  Particular
      </th>
                <th >
                  Amount (Rs.)
      </th>
              </tr>
              <tr>
                <th colspan="2">
                  Basic Salary
      </th>
                <td></td>
                <td class="myAlign">
                  4935.00
      </td>
                <th colspan="2" >
                  Provident Fund
      </th >
                <td></td>

                <td class="myAlign">
                  00.00
      </td>
              </tr >
              <tr>
                <th colspan="2">
                  Fixed Dearness Allowance
      </th>
                <td></td>

                <td class="myAlign">
                  00.00
      </td>
                <th colspan="2" >
                  LIC
      </th >
                <td></td>

                <td class="myAlign">
                  00.00
      </td>
              </tr >
              <tr>
                <th colspan="2">
                  Variable Dearness Allowance
      </th>
                <td></td>

                <td class="myAlign">
                  00.00
      </td>
                <th colspan="2" >
                  Loan
      </th >
                <td></td>

                <td class="myAlign">
                  00.00
      </td>
              </tr >
              <tr>
                <th colspan="2">
                  House Rent Allowance
      </th>
                <td></td>
                <td class="myAlign">
                  00.00
      </td>
                <th colspan="2" >
                  Professional Tax
      </th >
                <td></td>
                <td class="myAlign">
                  00.00
      </td>
              </tr >
              <tr>
                <th colspan="2">
                  Graduation Allowance
      </th>
                <td></td>

                <td class="myAlign">
                  00.00
      </td>
                <th colspan="2" >
                  Security Deposite(SD)
      </th >
                <td></td>

                <td class="myAlign">
                  00.00
      </td>
              </tr >
              <tr>
                <th colspan="2">
                  Conveyance Allowance
      </th> <td></td>
                <td class="myAlign">
                  00.00
      </td>
                <th colspan="2" >
                  Staff Benefit(SB)
      </th >
                <td></td>
                <td class="myAlign">
                  00.00
      </td>
              </tr >
              <tr>
                <th colspan="2">
                  Post Allowance
      </th>
                <td></td>
                <td class="myAlign">
                  00.00
      </td>
                <th colspan="2" >
                  Labour Welfare Fund
      </th >
                <td></td>
                <td class="myAlign">
                  00.00
      </td>
              </tr >
              <tr>
                <th colspan="2">
                  Special Allowance
      </th>
                <td></td>
                <td class="myAlign">
                  00.00
      </td>
                <th colspan="2" >
                  NSC
      </th >
                <td></td>
                <td class="myAlign">
                  00.00
      </td>
              </tr >
              <tr>
                <td colspan="4" class="table-border-right"></td>
                <th colspan="2" >
                  Union Thanco Officer(UTO)
      </th >
                <td></td>
                <td class="myAlign">
                  00.00
      </td>
              </tr >
              <tr>
                <td colspan="4" class="table-border-right"></td>
                <th colspan="2" >
                  Advance
      </th >
                <td></td>
                <td class="myAlign">
                  00.00
      </td>
              </tr >
              <tr>
                <td colspan="4" class="table-border-right"></td>
                <th colspan="2" >
                  Income Tax
      </th > <td></td>
                <td class="myAlign">
                  00.00
      </td>
              </tr >
              <tr class="myBackground">
                <th colspan="3">
                  Total Payments
      </th>
                <td class="myAlign">
                  10000
      </td>
                <th colspan="3" >
                  Total Deductions
      </th >
                <td class="myAlign">
                  1000
      </td>
              </tr >
              <tr height="40px">
                <th colspan="2">
                  Projection for Financial Year:
                </th>
                <th>
                </th>
                <td class="table-border-right">
                </td>
                <th colspan="2" class="table-border-bottom" >
                  Net Salary
                </th >
                <td >
                </td>
                <td >
                  XXXXXXXXXX
                </td>
              </tr >
              <tr>
                <td colspan="2">
                  Gross Salary
                </td> <td></td>
                <td class="myAlign">
                  00.00
      </td><td colspan="4"></td>
              </tr >
              <tr>
                <td colspan="2">
                  Aggr. Dedu - P.Tax & Std Ded
      </td> <td></td>
                <td class="myAlign">
                  00.00
      </td>
                <th colspan="2" >
                  Cumulative
      </th >
                <td colspan="2"></td>
              </tr >
              <tr>
                <td colspan="2">
                  Gross Total Income
      </td> <td></td>
                <td class="myAlign">
                  00.00
      </td>
                <td colspan="2" >
                  Empl PF Contribution
      </td > <td></td>
                <td class="myAlign">
                  00.00
      </td>
              </tr >
              <tr>
                <td colspan="2">
                  Aggr of Chapter "PF"
      </td> <td></td>
                <td class="myAlign">
                  00.00
      </td><td colspan="4"></td>
              </tr >
              <tr>
                <td colspan="2">
                  Total Income
      </td> <td></td>
                <td class="myAlign">
                  00.00
      </td>
                <td colspan="4"></td>
              </tr >
              <tbody class="border-center">
                <tr>
                  <th>
                    Attend/ Absence
      </th>
                  <th>
                    Days in Month
      </th>
                  <th>
                    Days Paid
      </th>
                  <th>
                    Days Not Paid
      </th>
                  <th>
                    Leave Position
      </th>
                  <th>
                    Privilege Leave
      </th>
                  <th>
                    Sick Leave
      </th>
                  <th>
                    Casual Leave
      </th>
                </tr>
                <tr>
                  <td ></td>
                  <td ></td>
                  <td ></td>
                  <td ></td>
                  <td>Yrly Open Balance</td>
                  <td>0.0</td> <td>0.0</td>
                  <td>0.0</td>
                </tr >
                <tr>
                  <th >Current Month</th>
                  <td >31.0</td>
                  <td >31.0</td>
                  <td >31.0</td>
                  <td>Availed</td>
                  <td>0.0</td> <td>0.0</td>
                  <td>0.0</td>
                </tr >
                <tr>
                  <td colspan="4"></td>
                  <td>Closing Balance</td>
                  <td>0.0</td> <td>0.0</td>
                  <td>0.0</td>
                </tr >
                <tr>
                  <td colspan="4"> &nbsp; </td>
                  <td > </td>
                  <td > </td>
                  <td > </td>
                  <td > </td>
                </tr >
                <tr>
                  <td colspan="4"></td>
                  <td>Company Pool Leave Balance</td>
                  <td>1500</td>
                  <td ></td>
                  <td ></td>
                </tr >
              </tbody>
            </table >

          </div >
     
        </div>
   </div>

    <script type="text/javascript">




            function generatePDF() {

                // Choose the element id which you want to export.
                var element = document.getElementById('divToExport');
                element.style.width = '700px';
                element.style.height = '100%';
           
                var opt = { 
                    margin: 0.5,
                    filename: 'InspectionReport.pdf',
                    image: { type: 'jpeg', quality: 1 },
                    html2canvas: { scale: 2 },
                  
                    

                  
                    jsPDF: { unit: 'in', format: 'a4', orientation: 'portrait', precision: '12' }
                };

                var doc = new jsPDF();
                 doc.rect(20, 20, doc.internal.pageSize.width - 40, doc.internal.pageSize.height - 40, 'S');

               
                // choose the element and pass it to html2pdf() function and call the save() on it to save as pdf.
                html2pdf().set(opt).from(element).save();


            }

            

    </script>

</asp:Content>

