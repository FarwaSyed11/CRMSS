<%@ Page Title="" Language="C#" MasterPageFile="~/EconnectCommon.master" AutoEventWireup="true" CodeFile="QuotationReport.aspx.cs" Inherits="CRMQuotation_Report_QuotationReport" %>
<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="dvReport">


                            <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" BestFitPage="True" ToolPanelView="None" HasDrilldownTabs="False" HasToggleGroupTreeButton="False" HasPrintButton="False" />
                        </div>
</asp:Content>

