<%@ Page 
    Language="C#" 
    MasterPageFile="~/MasterReportes.Master" 
    AutoEventWireup="true" 
    CodeBehind="R_FIS_LISTADO_FISCALIZACION.aspx.cs" 
    Inherits="WKA_Rep.FIS.R_FIS_LISTADO_FISCALIZACION" 
    Title="Untitled Page" %>

<%@ Register 
    Assembly="Microsoft.ReportViewer.WebForms, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" 
    TagPrefix="rsweb" %>
<asp:Content 
    ID="Content1" 
    ContentPlaceHolderID="ContentPlaceHolder1" 
    runat="server">
    <asp:TextBox
        ID="Codigo_Desde"
        runat="server"
        style="display:none">
    </asp:TextBox>
    <asp:TextBox
        ID="Codigo_Hasta"
        runat="server"
        style="display:none">
    </asp:TextBox>
    <asp:TextBox
        ID="Codigo_Institucion"
        runat="server"
        style="display:none">
    </asp:TextBox>
    <asp:TextBox
        ID="Nombre_Proyecto"
        runat="server"
        style="display:none">
    </asp:TextBox>
    <asp:TextBox
        ID="Estado"
        runat="server"
        style="display:none">
    </asp:TextBox>
    <asp:TextBox
        ID="Contratista"
        runat="server"
        style="display:none">
    </asp:TextBox>
    <asp:TextBox
        ID="Fiscalizador"
        runat="server"
        style="display:none">
    </asp:TextBox>
    <rsweb:reportviewer 
        id="rpv_Listado_Fiscalizacion" 
        runat="server" 
        font-names="Verdana"
        font-size="8pt" 
        height="29.7cm" 
        width="21cm">
        <LocalReport 
            ReportPath="FIS\R_FIS_LISTADO_FISCALIZACION.rdlc" EnableExternalImages="True"> 
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="ods_Listado_Fiscalizacion" Name="Fis_Fiscalizacion" />
            </DataSources>
        </LocalReport>
    </rsweb:reportviewer>
    <asp:ObjectDataSource 
        ID="ods_Listado_Fiscalizacion" 
        runat="server" 
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetBySucursal" 
        TypeName="REL.FIS.RO_Fis_Fiscalizacion">
        <SelectParameters>
            <asp:SessionParameter 
                DefaultValue="" 
                Name="s" 
                SessionField="Scope" 
                Type="Object" />
            <asp:ControlParameter 
                ControlID="Codigo_Desde" 
                DefaultValue="" 
                Name="Codigo_Desde"
                PropertyName="Text" 
                Type="String" />
            <asp:ControlParameter 
                ControlID="Codigo_Hasta" 
                DefaultValue="" 
                Name="Codigo_Hasta"
                PropertyName="Text" 
                Type="String" />
            <asp:ControlParameter 
                ControlID="Codigo_Institucion" 
                DefaultValue="" 
                Name="Codigo_Institucion"
                PropertyName="Text" 
                Type="String" />
            <asp:ControlParameter 
                ControlID="Nombre_Proyecto" 
                DefaultValue="" 
                Name="nombre_proyecto"
                PropertyName="Text" 
                Type="String" />
            <asp:ControlParameter 
                ControlID="Estado" 
                DefaultValue="" 
                Name="estado" 
                PropertyName="Text"
                Type="String" />
            <asp:ControlParameter 
                ControlID="Contratista" 
                DefaultValue="" 
                Name="contratista"
                PropertyName="Text" 
                Type="String" />
            <asp:ControlParameter 
                ControlID="Fiscalizador" 
                DefaultValue="" 
                Name="fiscalizador"
                PropertyName="Text" 
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
