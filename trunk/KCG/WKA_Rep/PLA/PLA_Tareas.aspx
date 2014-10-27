<%@ Page Title="" Language="C#" 
MasterPageFile="~/MasterReportes.Master" 
AutoEventWireup="true" 
CodeBehind="PLA_Tareas.aspx.cs" 
Inherits="WKA_Rep.PLA.PLA_Tareas" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
        Font-Size="8pt" InteractiveDeviceInfos="(Collection)" 
        WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt"
        SizeToReportContent="true"
        >
        <LocalReport ReportPath="PLA\Rep_PLA_Tareas.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSet1" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="Get" 
        TypeName="REL.PLA.RO_Pla_Tarea">
        <SelectParameters>
            <asp:Parameter Name="s" Type="Object" />
            <asp:Parameter DefaultValue="2014" Name="p_Anio" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
