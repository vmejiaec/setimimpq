<%@ Page Title="" 
Language="C#" 
MasterPageFile="~/MasterReportes.Master"
 AutoEventWireup="true" 
 CodeBehind="PLA_FormatoMemoAutorizacion.aspx.cs" 
 Inherits="WKA_Rep.PLA.PLA_FormatoMemoAutorizacion" %>

 <%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" 
namespace="Microsoft.Reporting.WebForms" 
tagprefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel runat="server" ID="pnParametros" GroupingText="Datos del reporte">
        <table>
        <tr>
            <td>
                Memorando Nro :
            </td>
            <td>
                <asp:TextBox ID="tbMemorandoNo" runat="server" Width="450px" CssClass="edicion" Text = "123 - USIST - 2014"/>
            </td>
        </tr>
        <tr>
            <td>
                Procedimiento:
            </td>
            <td>
                <asp:TextBox ID="tbProcedimiento" runat="server" Width="450px" CssClass="edicion" Text = "BIENES NORMALIZADOS"/>
            </td>
            <td>
                <asp:Button ID="btActualizarReporte" runat="server" Text="Actualizar" onclick="btActualizarReporte_Click" />
            </td>
        </tr>
        </table>
    </asp:Panel>
    <div>
    
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
            Font-Size="8pt" InteractiveDeviceInfos="(Collection)" 
            WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt"
            SizeToReportContent="true" >
            <LocalReport ReportPath="PLA\Rep_PLA_FormatoMemoAutorizacion.rdlc" 
                EnableExternalImages="true">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSet1" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
    
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
            SelectMethod="Get" 
            TypeName="REL.PLA.RO_PLa_Doc" >            
            <SelectParameters>
                <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
                <asp:QueryStringParameter Name="p_Id" QueryStringField="v_Pla_Doc_Id" Type="Int32" DefaultValue="" />
            </SelectParameters>
        </asp:ObjectDataSource>
    
    </div>
</asp:Content>
