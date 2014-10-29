<%@ Page Title="" 
Language="C#" 
MasterPageFile="~/MasterReportes.Master" 
AutoEventWireup="true" 
CodeBehind="PLA_Poa_Partidas.aspx.cs" 
Inherits="WKA_Rep.PLA.PLA_Poa_Partidas" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" 
namespace="Microsoft.Reporting.WebForms" 
tagprefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
    
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
            Font-Size="8pt" InteractiveDeviceInfos="(Collection)" 
            WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt"
            SizeToReportContent="true" >
            <LocalReport ReportPath="PLA\Rep_PLA_Poa_Partidas.rdlc" 
                EnableExternalImages="true">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSet1" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
    
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
            SelectMethod="GetByAnio" 
            TypeName="REL.PLA.RO_PLa_Poa"  >            
            <SelectParameters>
                <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
                <asp:QueryStringParameter Name="p_Anio" QueryStringField="v_Anio" 
                    Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
    
    </div>
</asp:Content>
