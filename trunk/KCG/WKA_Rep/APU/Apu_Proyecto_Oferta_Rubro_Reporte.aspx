<%@ Page 
    Language="C#" 
    AutoEventWireup="true" 
    CodeBehind="Apu_Proyecto_Oferta_Rubro_Reporte.aspx.cs" 
    Inherits="WKA_Rep.APU.Apu_Proyecto_Oferta_Rubro_Reporte" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
             Namespace="Microsoft.Reporting.WebForms" 
             TagPrefix="rsweb" %>

<!DOCTYPE html 
    PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Reporte unificado de Proyectos y Ofertas</title>
</head>
<body>
<form id="form1" runat="server">
            <asp:ScriptManager 
                ID="ScriptManager1" 
                runat="server" 
                EnableScriptLocalization="true" 
                EnableScriptGlobalization="true"
                AsyncPostBackTimeout="900"         
                ScriptMode="Auto">
            </asp:ScriptManager>
    <div>
    <table>
            <tr>
                <td>
                    <table id="TABLE1" >
                        <tr>
                            <td style="width: 100px">
                                <asp:Label ID="lblProyectoA" runat="server" 
                                    Text="Proyecto A:" >
                                </asp:Label>
                            </td>
                            <td >
                                <asp:TextBox ID="Txt_Apu_Proyecto_Codigo_A" runat="server" 
                                    Width="80px" 
                                    style="text-align:right">
                                </asp:TextBox>
                            </td>
                            <td style="width: 100px">
                                <asp:Label ID="lblProyectoB" runat="server" 
                                    Text="Proyecto B:" >
                                </asp:Label>
                            </td>
                            <td >
                                <asp:TextBox ID="Txt_Apu_Proyecto_Codigo_B" runat="server" 
                                    Width="80px" 
                                    style="text-align:right">
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 100px">
                                <asp:Label ID="lblOferta_A" runat="server" 
                                    Text="Oferta A:" >
                                </asp:Label>
                            </td>
                            <td >
                                <asp:TextBox ID="Txt_Apu_Oferta_Codigo_A" runat="server" 
                                    Width="80px" 
                                    style="text-align:right">
                                </asp:TextBox>
                            </td>
                            <td style="width: 100px">
                                <asp:Label ID="lblOferta_B" runat="server" 
                                    Text="Oferta B:" >
                                </asp:Label>
                            </td>
                            <td >
                                <asp:TextBox ID="Txt_Apu_Oferta_Codigo_B" runat="server" 
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
                        </tr>
                    </table> 
                    <asp:TextBox ID="Txt_Capitulo" runat="server" 
                        Width="98%" 
                        Text="Nombre" 
                        Height="80px" TextMode="MultiLine" ></asp:TextBox>         
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblMensaje" runat="server" 
                        Style="position: relative; left: 3px; top: 0px;" 
                        Width="100%" 
                        Font-Names="Arial" 
                        Font-Size="Small">
                    </asp:Label>  
                </td>
            </tr>
            <tr>
                <td style="width: 100px; height: 21px;">
                    <rsweb:reportviewer id="rptRubro" runat="server" 
                                        Visible ="true"
                                        font-names="Verdana" 
                                        font-size="8pt"
                                        height="29.7cm" 
                                        style="position: relative" 
                                        width="21cm">
                            <LocalReport ReportPath="APU\Apu_Proyecto_Oferta_Rubro_Reporte.rdlc" EnableExternalImages="True">
                                    <DataSources>
                                        <rsweb:ReportDataSource DataSourceId="SqlDataSource1" 
                                        Name="DataSet1_Apu_Proyecto_Oferta_Rubro_ByPryOfr" />
                                    </DataSources>
                            </LocalReport>
                    </rsweb:reportviewer>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:APUConnectionString %>" 
                        SelectCommand="Apu_Proyecto_Oferta_Rubro_ByPryOfr" 
                        SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter DefaultValue="1" Name="p_Ver_Version_Id" SessionField="Ver_Version_Id"
                                Type="String" />
                            <asp:ControlParameter DefaultValue="1" ControlID="Txt_Apu_Proyecto_Codigo_A" Name="p_Apu_Proyecto_Codigo_A"
                                PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="Txt_Apu_Proyecto_Codigo_B" Name="p_Apu_Proyecto_Codigo_B"
                                PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="Txt_Apu_Oferta_Codigo_A" Name="p_Apu_Oferta_Codigo_A"
                                PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="Txt_Apu_Oferta_Codigo_B" Name="p_Apu_Oferta_Codigo_B"
                                PropertyName="Text" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
