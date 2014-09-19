<%@ Page 
    Language="C#" 
    MasterPageFile="~/MasterReportes.Master" 
    AutoEventWireup="true" 
    CodeBehind="R_APU_PRESUPUESTO_CUADRILLA.aspx.cs" 
    Inherits="WKA_Rep.APU.R_APU_PRESUPUESTO_CUADRILLA" 
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
        ID="estado_txt"
        runat="server"
        style="display:none">
    </asp:TextBox>
        <rsweb:reportviewer 
            id="rpv_Apu_Presupuesto_Cuadrilla" 
            runat="server" 
            font-names="Verdana" 
            font-size="8pt"
            height="29.7cm" 
            width="21cm">
        <LocalReport 
            ReportPath="APU\R_APU_PRESUPUESTO_CUADRILLA.rdlc"
            EnableExternalImages ="true">
            <DataSources>
                <rsweb:ReportDataSource 
                    Name="Apu_Presupuesto_Cuadrilla" 
                    DataSourceId="ods_Apu_Presupuesto_Cuadrilla">
                </rsweb:ReportDataSource>
            </DataSources>
        </LocalReport>
    </rsweb:reportviewer>
        <asp:ObjectDataSource 
            ID="ods_Apu_Presupuesto_Cuadrilla" 
            runat="server" 
            OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetByPresupuesto" 
            TypeName="REL.APU.RO_Apu_Presupuesto_Cuadrilla">
            <SelectParameters>
                <asp:SessionParameter 
                    DefaultValue="" 
                    Name="s" 
                    SessionField="Scope" 
                    Type="Object" />
                <asp:QueryStringParameter 
                    DefaultValue="" 
                    Name="Apu_Presupuesto_Id" 
                    QueryStringField="Apu_Presupuesto_Id"
                    Type="String" />
                <asp:ControlParameter 
                    ControlID="estado_txt" 
                    Name="Estado" 
                    PropertyName="Text" 
                    Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
</asp:Content>
