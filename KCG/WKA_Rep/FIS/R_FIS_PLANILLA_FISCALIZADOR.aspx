<%@ Page 
    Language="C#" 
    MasterPageFile="~/MasterReportes.Master" 
    AutoEventWireup="true" 
    CodeBehind="R_FIS_PLANILLA_FISCALIZADOR.aspx.cs" 
    Inherits="WKA_Rep.FIS.R_FIS_PLANILLA_FISCALIZADOR" 
    %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content 
    ID="Content1" 
    ContentPlaceHolderID="ContentPlaceHolder1" 
    runat="server">
    <rsweb:ReportViewer 
        ID="rpvFis_Planilla_Fisc" 
        runat="server" 
        Font-Names="Verdana" 
        Font-Size="8pt"
        Height="29.7cm" 
        Width="21cm">
        <LocalReport 
            ReportPath="FIS\R_FIS_PLANILLA_FISCALIZADOR.rdlc"
            EnableExternalImages="true" >
            <DataSources>
                <rsweb:ReportDataSource 
                    Name="Fis_Fiscalizacion" 
                    DataSourceId="odsFis_Planilla_Fiscalizacion">
                </rsweb:ReportDataSource>
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:ObjectDataSource 
        ID="odsFis_Planilla_Fiscalizacion" 
        runat="server" 
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetById" 
        TypeName="REL.FIS.RO_Fis_Fiscalizacion">
        <SelectParameters>
            <asp:SessionParameter 
                DefaultValue="" 
                Name="s" 
                SessionField="Scope" 
                Type="Object" />
            <asp:QueryStringParameter 
                DefaultValue="" 
                Name="Id" 
                QueryStringField="Fis_Fiscalizacion_Id" 
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
