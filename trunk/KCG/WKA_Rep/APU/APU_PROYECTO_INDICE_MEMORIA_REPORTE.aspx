<%@ Page 
    Language="C#" 
    AutoEventWireup="true" 
    CodeBehind="APU_PROYECTO_INDICE_MEMORIA_REPORTE.aspx.cs" 
    Inherits="WKA_Rep.APU_PROYECTO_INDICE_MEMORIA_REPORTE" %>

<%@ Register 
        Assembly="Microsoft.ReportViewer.WebForms, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
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
                        id="TABLE1" >
                        <%--<tr>
                            <td 
                                style="width: 100px">
                            </td>
                            <td 
                                style="width: 100px">
                                <asp:Label 
                                    ID="lblTituloReporte" 
                                    runat="server" 
                                    meta:resourcekey="lblTituloReporteResource1"
                                    Style="position: relative" 
                                    Width="153px">
                                </asp:Label>
                            </td>
                            <td 
                                style="width: 100px">
                            </td>
                        </tr>--%>
                        <tr>
                            <td>
                                <asp:Label 
                                    ID="LblEscojerProyecto" 
                                    runat="server" 
                                    Style="position: relative; top: 1px;" 
                                    Text="Proyecto" Font-Names="Arial" Font-Size="Small">
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Txt_Apu_Proyecto_Codigo" 
                                    runat="server" 
                                    Width="80px" 
                                    style="text-align:right"
                                    meta:resourcekey="Txt_Apu_Proyecto_CodigoResource1">
                                </asp:TextBox>
                            </td>
                            <td>
                                <asp:Button
                                id="btn_Consultar"
                                runat="server"
                                Text="Consultar" />
                            </td>
                            <td 
                                style="width: 100px">
                                <asp:Label 
                                    ID="lblMensaje" 
                                    runat="server" 
                                    Style="position: relative" 
                                    Width="200px" Font-Names="Arial" Font-Size="Small">
                                </asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td 
                    style="width: 797px; height: 21px;">
                    <rsweb:reportviewer id="rptMemoriaTecnica" runat="server" font-names="Verdana" font-size="8pt"
                        height="29.7cm" width="21cm">
                        <LocalReport 
                            ReportPath="APU/APU_PROYECTO_INDICE_MEMORIA_REPORTE.rdlc" EnableExternalImages="true">
                            <DataSources>
                                <rsweb:ReportDataSource 
                                    Name="Apu_Proyecto_Material" 
                                    DataSourceId="odsApuProyectoMaterial">
                                </rsweb:ReportDataSource>
                                <rsweb:ReportDataSource 
                                    Name="Apu_Proyecto" 
                                    DataSourceId="odsApuProyecto">
                                </rsweb:ReportDataSource>
                                <rsweb:ReportDataSource 
                                    Name="Apu_Proyecto_Equipo_Indice" 
                                    DataSourceId="odsApuProyectoEquipoIndice">
                                </rsweb:ReportDataSource>
                                <rsweb:ReportDataSource 
                                    Name="Apu_Proyecto_Transporte_Indice" 
                                    DataSourceId="odsApuProyectoTransporteIndice">
                                </rsweb:ReportDataSource>
                            </DataSources>
                        </LocalReport>
                    </rsweb:reportviewer>
                    <asp:ObjectDataSource 
                        ID="odsApuProyectoTransporteIndice" 
                        runat="server" 
                        OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetByProyecto" 
                        TypeName="REL.APU.RO_Apu_Proyecto_Transporte_Indice">
                        <SelectParameters>
                            <asp:SessionParameter 
                                DefaultValue="" 
                                Name="s" 
                                SessionField="Scope" 
                                Type="Object" />
                            <asp:SessionParameter 
                                DefaultValue="" 
                                Name="apu_proyecto_Id" 
                                SessionField="Apu_Proyecto_Id"
                                Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource 
                        ID="odsApuProyectoEquipoIndice" 
                        runat="server" 
                        OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetByProyecto" 
                        TypeName="REL.APU.RO_Apu_Proyecto_Equipo_Indice">
                        <SelectParameters>
                            <asp:SessionParameter 
                                DefaultValue="" 
                                Name="s" 
                                SessionField="Scope" 
                                Type="Object" />
                            <asp:SessionParameter 
                                DefaultValue="" 
                                Name="Apu_Proyecto_Id" 
                                SessionField="Apu_Proyecto_Id"
                                Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource 
                        ID="odsApuProyecto" 
                        runat="server" 
                        OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetByCodigo" 
                        TypeName="REL.APU.RO_Apu_Proyecto">
                        <SelectParameters>
                            <asp:SessionParameter 
                                DefaultValue="" 
                                Name="s" 
                                SessionField="Scope" 
                                Type="Object" />
                            <asp:SessionParameter 
                                DefaultValue="" 
                                Name="Codigo" 
                                SessionField="Apu_Proyecto_Id"
                                Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource 
                        ID="odsApuProyectoMaterial" 
                        runat="server" 
                        OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetByProyecto" 
                        TypeName="REL.APU.RO_Apu_Proyecto_Material">
                        <SelectParameters>
                            <asp:SessionParameter 
                                DefaultValue="" 
                                Name="s" 
                                SessionField="Scope" 
                                Type="Object" />
                            <asp:SessionParameter 
                                DefaultValue="" 
                                Name="apu_proyecto_Id" 
                                SessionField="Apu_Proyecto_Id"
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