<%@ Page Language="C#" 
         AutoEventWireup="true" 
         CodeBehind="APU_RUBRO_ANALISIS_UNITARIO.aspx.cs" 
         Inherits="WKA_Rep.APU_RUBRO_ANALISIS_UNITARIO"
         Culture="auto" 
         Title="APU ANALISIS DE PRECIOS UNITARIOS"
         UICulture="auto" %>

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
    <form 
        id="form1" 
        runat="server">
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
                                        Text="Titulo del Reporte"
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
                                        Text="Rubro" Font-Names="Arial" Font-Size="Small">
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Txt_Apu_Rubro_Codigo" 
                                        runat="server" 
                                        Width="80px" 
                                        style="text-align:right">
                                    </asp:TextBox>
                                </td>
                                <td>
                                    <asp:Button
                                        id="btn_Consultar"
                                        runat="server"
                                        Text="Consultar" />
                                </td>
                                <td>
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
                        style="width: 100px; height: 21px;">
                        <rsweb:reportviewer 
                            id="rpApuAnalisisPrecioUnitario" 
                            runat="server" 
                            Font-Names="Verdana" 
                            Font-Size="8pt"
                            Height="29.7cm" 
                            Width="21cm">                            
                            <localreport 
                                reportpath="APU/APU_RUBRO_ANALISIS_UNITARIO.rdlc" EnableExternalImages="true">
                                <DataSources>
                                    <rsweb:ReportDataSource 
                                        Name="Apu_Rubro_Tecnica" 
                                        DataSourceId="odsApuRubroTecnica">
                                    </rsweb:ReportDataSource>
                                    <rsweb:ReportDataSource 
                                        Name="Apu_Rubro_Equipo" 
                                        DataSourceId="odsApuRubroEquipo">
                                    </rsweb:ReportDataSource>
                                    <rsweb:ReportDataSource 
                                        Name="Apu_Rubro_Mano_Obra" 
                                        DataSourceId="odsApuRubroManoObra">
                                    </rsweb:ReportDataSource>
                                    <rsweb:ReportDataSource 
                                        Name="Apu_Rubro_Material" 
                                        DataSourceId="odsApuRubroMaterial">
                                    </rsweb:ReportDataSource>
                                </DataSources>
                            </localreport>
                        </rsweb:reportviewer>
                            <asp:ObjectDataSource 
                                ID="odsApuRubroMaterial" 
                                runat="server"
                                OldValuesParameterFormatString="original_{0}" 
                                SelectMethod="GetByRubro" 
                                TypeName="REL.APU.RO_Apu_Rubro_Material">
                            <SelectParameters>
                                <asp:SessionParameter 
                                    DefaultValue="" 
                                    Name="s" 
                                    SessionField="Scope" 
                                    Type="Object" />
                                <asp:SessionParameter 
                                    DefaultValue="" 
                                    Name="Apu_Rubro_Id" 
                                    SessionField="Apu_Rubro_Id"
                                    Type="String" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                        <asp:ObjectDataSource 
                            ID="odsApuRubroManoObra" 
                            runat="server" 
                            OldValuesParameterFormatString="original_{0}"
                            SelectMethod="GetByRubro" 
                            TypeName="REL.APU.RO_Apu_Rubro_Mano_Obra">
                            <SelectParameters>
                                <asp:SessionParameter 
                                    DefaultValue="" 
                                    Name="s" 
                                    SessionField="Scope" 
                                    Type="Object" />
                                <asp:SessionParameter 
                                    DefaultValue="" 
                                    Name="Apu_Rubro_Id" 
                                    SessionField="Apu_Rubro_Id"
                                    Type="String" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                        <asp:ObjectDataSource 
                            ID="odsApuRubroEquipo" 
                            runat="server" 
                            OldValuesParameterFormatString="original_{0}"
                            SelectMethod="GetByRubro" 
                            TypeName="REL.APU.RO_Apu_Rubro_Equipo">
                            <SelectParameters>
                                <asp:SessionParameter 
                                    DefaultValue="" 
                                    Name="s" 
                                    SessionField="Scope" 
                                    Type="Object" />
                                <asp:SessionParameter 
                                    DefaultValue="" 
                                    Name="Apu_Rubro_Id" 
                                    SessionField="Apu_Rubro_Id"
                                    Type="String" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                        <asp:ObjectDataSource 
                            ID="odsApuRubroTecnica" 
                            runat="server" 
                            OldValuesParameterFormatString="original_{0}"
                            SelectMethod="GetByRubro" 
                            TypeName="REL.APU.RO_Apu_Rubro_Tecnica">
                            <SelectParameters>
                                <asp:SessionParameter 
                                    DefaultValue="" 
                                    Name="s" 
                                    SessionField="Scope" 
                                    Type="Object" />
                                <asp:SessionParameter 
                                    DefaultValue="" 
                                    Name="Apu_Rubro_Id" 
                                    SessionField="Apu_Rubro_Id"
                                    Type="String" />
                                <asp:SessionParameter 
                                    DefaultValue="" 
                                    Name="par_servidor_Id" 
                                    SessionField="Par_Servidor_Id"
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
