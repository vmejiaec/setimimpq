<%@ Page Language="C#" 
         AutoEventWireup="true" 
         CodeBehind="APU_RUBRO_INSUMO_REPORTE.aspx.cs" 
         Inherits="WKA_Rep.APU_RUBRO_INSUMO_REPORTE" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>
         
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
             Namespace="Microsoft.Reporting.WebForms" 
             TagPrefix="rsweb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
            <table>
            <tr>
                <td>
                    <table 
                           id="TABLE1" 
                           
                           >
                        <%--<tr>
                            <td style="width: 100px">
                                </td>
                            <td style="width: 100px">
                                <asp:Label ID="lblTituloReporte" runat="server" 
                                            meta:resourcekey="lblTituloReporteResource1"
                                            Style="position: relative" 
                                            Width="153px"></asp:Label></td>
                            <td style="width: 100px">
                            </td>
                        </tr>--%>
                        <tr>
                            <td>
                                <asp:Label ID="LblEscojerProyecto" runat="server" 
                                           Style="position: relative; top: 1px;" 
                                           Text="Rubro" Font-Names="Arial" Font-Size="Small"></asp:Label></td>
                            <td>
                               
                                <asp:TextBox ID="Txt_Apu_Rubro_Codigo" runat="server" 
                                             Width="80px" 
                                             style="text-align:right"
                                             meta:resourcekey="Txt_Apu_Proyecto_CodigoResource1"></asp:TextBox></td>
                            <td>
                                <asp:Button
                                id="btn_Consultar"
                                runat="server"
                                Text="Consultar" />
                            </td>
                            <td>
                                <asp:Label ID="lblMensaje" runat="server" Style="position: relative" Width="200px" Font-Names="Arial" Font-Size="Small">
                                </asp:Label></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="width: 100px; height: 21px;">
                    <rsweb:ReportViewer ID="rptRubroInsumo" runat="server" Font-Names="Verdana" Font-Size="8pt"
                        Height="29.7cm" Style="position: relative" Width="21cm">
                        <LocalReport ReportPath="APU/APU_RUBRO_INSUMO_REPORTE.rdlc" EnableExternalImages="true">
                            <DataSources>
                                <rsweb:ReportDataSource DataSourceId="odsRubroInsumo" Name="Apu_Rubro_Insumo" />
                            </DataSources>
                        </LocalReport>
                    </rsweb:ReportViewer>
                    <asp:ObjectDataSource ID="odsRubroInsumo" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetByRubro" TypeName="REL.APU.RO_Apu_Rubro_Insumo">
                        <SelectParameters>
                            <asp:SessionParameter DefaultValue="" Name="s" SessionField="Scope" Type="Object" />
                            <asp:SessionParameter DefaultValue="" Name="apu_rubro_id" SessionField="Apu_Rubro_Id"
                                Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
