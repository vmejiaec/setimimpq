<%@ Page 
    Language="C#" 
    MasterPageFile="~/MasterReportes.Master" 
    AutoEventWireup="true" 
    CodeBehind="R_FIS_CATALOGO.aspx.cs" 
    Inherits="WKA_Rep.FIS.R_FIS_CATALOGO" 
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
        id="rpv_Fis_Catalogo" 
        runat="server" 
        font-names="Verdana" 
        font-size="8pt"
        height="29.7cm" 
        width="21cm">
        <LocalReport 
            ReportPath="FIS\R_FIS_CATALOGO.rdlc" EnableExternalImages="true">
            <DataSources>
                <rsweb:ReportDataSource 
                    Name="Fis_Catalogo" 
                    DataSourceId="ods_Fis_Catalogo">
                </rsweb:ReportDataSource>
            </DataSources>
        </LocalReport>
    </rsweb:reportviewer>
    <asp:ObjectDataSource 
        ID="ods_Fis_Catalogo" 
        runat="server" 
        OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetById" 
        TypeName="REL.FIS.RO_Fis_Catalogo">
        <SelectParameters>
            <asp:SessionParameter 
                DefaultValue="" 
                Name="s" 
                SessionField="Scope" 
                Type="Object" />
            <asp:QueryStringParameter 
                DefaultValue="" 
                Name="Id" 
                QueryStringField="Id" 
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
