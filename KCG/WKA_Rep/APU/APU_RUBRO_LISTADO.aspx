<%@ Page 
        Language="C#" 
        AutoEventWireup="true" 
        CodeBehind="APU_RUBRO_LISTADO.aspx.cs" 
        Inherits="WKA_Rep.APU_RUBRO_LISTADO" 
        Culture="auto" 
        Title="APU ANALISIS DE PRECIOS UNITARIOS - LISTADO DE RUBROS GENERALES"
        UICulture="auto"%>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

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
                    <td 
                        style="width: 100%; text-align:center; height: 80px;">
                        <table 
                            border="1" 
                            id="TABLE1" >
                            <tr>
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
                            </tr>
                            <tr>
                                <td 
                                    style="width: 100px">
                                    <asp:Label 
                                        ID="LblEscojerProyecto" 
                                        runat="server" 
                                        Style="position: relative; top: 1px;" 
                                        Width="160px" 
                                        Text="Codigo del Rubro">
                                    </asp:Label>
                                </td>
                                <td 
                                    style="width: 100px">
                                    <asp:TextBox 
                                        ID="Txt_Apu_Rubro_Codigo" 
                                        runat="server" 
                                        Style="position: relative" 
                                        Text="">
                                    </asp:TextBox>
                                </td>
                                <td 
                                    style="width: 100px">
                                    <asp:Label 
                                        ID="lblMensaje" 
                                        runat="server" 
                                        Style="position: relative" 
                                        Width="116px" 
                                        meta:resourcekey="lblMensajeResource1">
                                    </asp:Label>
                                </td>
                            </tr>
                        </table>                        
                    </td>
                </tr>
                <tr>
                    <td>
                        <rsweb:reportviewer 
                            id="rpApuListadoRubro" 
                            runat="server" 
                            Height="29.7cm" 
                            Width="21cm" Font-Names="Verdana" Font-Size="8pt">
                            <LocalReport ReportPath="APU/APU_RUBRO_LISTADO.rdlc" EnableExternalImages="true">
                                <DataSources>
                                    <rsweb:ReportDataSource DataSourceId="odsApuRubro" Name="Apu_Rubro" />
                                </DataSources>
                            </LocalReport>
                        </rsweb:reportviewer>
                        <asp:ObjectDataSource ID="odsApuRubro" runat="server" OldValuesParameterFormatString="original_{0}"
                            SelectMethod="GetByEmpresa" TypeName="CEL.APU.DO_Apu_Rubro">
                            <SelectParameters>
                                <asp:SessionParameter DefaultValue="" Name="s" SessionField="Scope" Type="Object" />
                                <asp:SessionParameter DefaultValue="" Name="Int_Empresa_Id" SessionField="Int_Empresa_Id"
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
