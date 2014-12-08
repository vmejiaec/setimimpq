<%@ Page 
    Language="C#" 
    MasterPageFile="~/MasterReportes.Master" 
    AutoEventWireup="true" 
    CodeBehind="R_FIS_PLANILLA_REAJUSTE.aspx.cs" 
    Inherits="WKA_Rep.FIS.R_FIS_PLANILLA_REAJUSTE"%>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content 
    ID="Content1" 
    ContentPlaceHolderID="ContentPlaceHolder1" 
    runat="server">
    <asp:TextBox 
        ID="Planilla_Id" 
        runat="server">
    </asp:TextBox>
    <rsweb:reportviewer 
        id="rpv_Fis_Planilla_Reajuste" 
        runat="server" 
        font-names="Verdana" 
        font-size="8pt"
        height="29.7cm" 
        width="21cm">
        <LocalReport 
            ReportPath="FIS\R_FIS_PLANILLA_REAJUSTE.rdlc"
            EnableExternalImages="true">
            <DataSources>
                <rsweb:ReportDataSource 
                    Name="Fis_Planilla_Resumen" 
                    DataSourceId="odsGv_Fis_Planilla_Reajuste">
                </rsweb:ReportDataSource>                
            </DataSources>
        </LocalReport>
    </rsweb:reportviewer>
    <asp:ObjectDataSource 
        ID="odsGv_Fis_Planilla_Reajuste" 
        runat="server" 
        SelectMethod="GetByPresupuesto"
        TypeName="REL.FIS.RO_Fis_Planilla_Resumen" 
        OldValuesParameterFormatString="original_{0}">
        <SelectParameters>
            <asp:SessionParameter 
                DefaultValue="" 
                Name="s" 
                SessionField="Scope" 
                Type="Object" />
            <asp:QueryStringParameter 
                Name="Apu_Presupuesto_Id" 
                QueryStringField="Apu_Presupuesto_Id"
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
