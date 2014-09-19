<%@ Page 
    Language="C#" 
    MasterPageFile="~/MasterReportes.Master" 
    AutoEventWireup="true" 
    CodeBehind="R_PER_PERSONAL.aspx.cs" 
    Inherits="WKA_Rep.PER.R_PER_PERSONAL" 
    Title="Untitled Page" %>

<%@ Register 
    Assembly="Microsoft.ReportViewer.WebForms, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" 
        TagPrefix="rsweb" %>
<asp:Content 
    ID="Content1" 
    ContentPlaceHolderID="ContentPlaceHolder1" 
    runat="server">
    &nbsp;<rsweb:ReportViewer 
        ID="rpv_Per_Personal" 
        runat="server" 
        Font-Names="Verdana"
        Font-Size="8pt" 
        Height="21cm" 
        Width="29.7cm">
        <LocalReport 
            ReportPath="PER\R_PER_PERSONAL.rdlc" EnableExternalImages="true">
            <DataSources>
                <rsweb:ReportDataSource 
                    DataSourceId="odsPer_Personal" 
                    Name="Per_Personal" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:ObjectDataSource 
        ID="odsPer_Personal" 
        runat="server" 
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetByEmpresa" 
        TypeName="REL.PER.RO_Per_Personal">
        <SelectParameters>
            <asp:SessionParameter
                Name="s" 
                SessionField="Scope" 
                Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
