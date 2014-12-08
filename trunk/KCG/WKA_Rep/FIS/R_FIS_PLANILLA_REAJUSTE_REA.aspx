<%@ Page 
    Language="C#" 
    MasterPageFile="~/MasterReportes.Master" 
    AutoEventWireup="true" 
    CodeBehind="R_FIS_PLANILLA_REAJUSTE_REA.aspx.cs" 
    Inherits="WKA_Rep.FIS.R_FIS_PLANILLA_REAJUSTE_REA" 
    Title="Untitled Page" %>

<%@ Register 
    Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" 
    TagPrefix="rsweb" %>
<asp:Content 
    ID="Content1" 
    ContentPlaceHolderID="ContentPlaceHolder1" 
    runat="server">
    <rsweb:reportviewer 
        id="rpv_Fis_Planilla_Reajuste" 
        runat="server" 
        font-names="Verdana"
        font-size="8pt" 
        height="29.7cm" 
        width="21cm">
        <LocalReport ReportPath="FIS\R_FIS_PLANILLA_REAJUSTE_REA.rdlc" EnableExternalImages="True">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="odsFis_Planilla_Resumen" Name="Fis_Planilla_Resumen" />
            </DataSources>
        </LocalReport>
    </rsweb:reportviewer>
    <asp:ObjectDataSource   
        ID="odsFis_Planilla_Resumen" 
        runat="server" 
        SelectMethod="GetById"
        TypeName="REL.FIS.RO_Fis_Planilla_Resumen" 
        OldValuesParameterFormatString="original_{0}">
        <SelectParameters>
            <asp:SessionParameter 
                Name="s" SessionField="Scope" 
                Type="Object" />
            <asp:QueryStringParameter 
                Name="Fis_Planilla_Id" 
                QueryStringField="Fis_Planilla_Id"
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
