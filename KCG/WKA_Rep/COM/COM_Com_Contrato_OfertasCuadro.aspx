﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterReportes.Master" AutoEventWireup="true" CodeBehind="COM_Com_Contrato_OfertasCuadro.aspx.cs" Inherits="WKA_Rep.COM.COM_Com_Contrato_OfertasCuadro" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" 
namespace="Microsoft.Reporting.WebForms" 
tagprefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>    
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
            Font-Size="8pt" InteractiveDeviceInfos="(Collection)" 
            WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt"
            Height="780px" Width="725px">
            <LocalReport ReportPath="COM\Rep_Com_Contrato_OfertasCuadro.rdlc" 
                EnableExternalImages="true">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSet1" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
    
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
            SelectMethod="GetByCom_Contrato_Id" 
            TypeName="REL.COM.RO_Com_Contrato_Oferente"  >            
            <SelectParameters>
                <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
                <asp:QueryStringParameter Name="p_Com_Contrato_Id" QueryStringField="v_Com_Contrato_Id" Type="Int32" DefaultValue="" />
            </SelectParameters>
        </asp:ObjectDataSource>    
    </div>

</asp:Content>