<%@ Page Title="" Language="C#" 
MasterPageFile="~/MasterReportes.Master" 
AutoEventWireup="true" 
CodeBehind="Pla_Cta_Rep_Niveles.aspx.cs" 
Inherits="WKA_Rep.VAR.Pla_Cta_Rep_Niveles" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" 
namespace="Microsoft.Reporting.WebForms" 
tagprefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
            Font-Size="8pt" InteractiveDeviceInfos="(Collection)" 
            WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt"
            SizeToReportContent="true" >
            <LocalReport ReportPath="VAR\Rep_Pla_Cta_Rep_Niveles.rdlc" 
                EnableExternalImages="true">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSet1" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>

        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
            SelectMethod="Get" 
            TypeName="REL.VAR.RO_Pla_Cta_Niveles" 
            OldValuesParameterFormatString="original_{0}" >            
            <SelectParameters>
                <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />                
                <asp:QueryStringParameter DefaultValue="2014" Name="p_Anio" QueryStringField="v_Anio" Type="String" />                
            </SelectParameters>
        </asp:ObjectDataSource>

</asp:Content>
