<%@ Page Language="C#" 
    AutoEventWireup="true" 
    CodeBehind="APU_RUBRO_REPORTE.aspx.cs" 
    Inherits="WKA_Rep.APU_RUBRO_REPORTE" 
    Culture="auto" 
    meta:resourcekey="PageResource1" 
    UICulture="auto" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
            Namespace="Microsoft.Reporting.WebForms" 
            TagPrefix="rsweb" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Listado de Rubros de Datos Generales</title>
<script language="javascript" type="text/javascript">
</script>
</head>
<body>
    <form id="form1" runat="server">
        <table>
            <tr>
               <td>
                    <table
                           id="TABLE1">
                        <%--<tr>
                            <td style="width: 100px">
                                </td>
                            <td style="width: 100px">
                                      <asp:Label ID="lblTituloReporte" runat="server" 
                                        Width="153px" 
                                        meta:resourcekey="lblTituloReporteResource1">
                                      </asp:Label></td>
                            <td style="width: 100px">
                            </td>
                        </tr>--%>
                        <tr>
                            <td>
                                <asp:Label ID="lblEscojerTitulo" runat="server" 
                                    Text="Titulo" Font-Names="Arial" Font-Size="Small">
                                </asp:Label>
                            </td>
                            <td style="width: 100px">
                                
                                <asp:DropDownList ID="ddlTitulo" runat="server" 
                                    DataSourceID="odsTitulo" 
                                    DataTextField="Nombre"
                                    DataValueField="Id" 
                                    meta:resourcekey="ddlTituloResource1" 
                                    Width="162px" 
                                    OnDataBound="ddlTitulo_DataBound" 
                                    AutoPostBack="True" >
                                </asp:DropDownList>
                                <asp:ObjectDataSource ID="odsTitulo" runat="server" 
                                    OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="Get" 
                                    TypeName="REL.APU.RO_Apu_Titulo" 
                                    EnableCaching="True">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="s" 
                                            SessionField="Scope" 
                                            Type="Object" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                                
                            </td>                                                   
                            <td>
                                <asp:Label ID="lblEscojerSubTitulo" runat="server" 
                                    Text="Subtitulo" Font-Names="Arial" Font-Size="Small">
                                </asp:Label></td>
                            <td style="width: 100px; height: 45px;">
                                
                                <asp:DropDownList ID="ddlSubTitulo" runat="server" 
                                    DataSourceID="odsSubtitulo" 
                                    DataTextField="Nombre" 
                                    DataValueField="Id" 
                                    meta:resourcekey="ddlSubTituloResource1" 
                                    Width="162px" 
                                    OnDataBound="ddlSubTitulo_DataBound" 
                                    AutoPostBack="True" 
                                    >
                                    
                                </asp:DropDownList>
                                <asp:ObjectDataSource ID="odsSubtitulo" runat="server" 
                                    OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetByTitulo" 
                                    TypeName="REL.APU.RO_Apu_Subtitulo" 
                                    EnableCaching="True">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="s" 
                                                              SessionField="Scope" 
                                                              Type="Object" />
                                        <asp:ControlParameter ControlID="ddlTitulo" 
                                                              Name="Apu_Titulo_Id" 
                                                              PropertyName="SelectedValue"
                                                              Type="String" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                            </td>
                        </tr>
                    </table>
                   
                    <rsweb:ReportViewer ID="ReportViewer1" runat="server" 
                                        Font-Size="8pt"
                                        Height="21cm" 
                                        Width="29.7cm" 
                                        Font-Names="Verdana" 
                                        meta:resourcekey="ReportViewer1Resource2">
                        <LocalReport ReportPath="APU/APU_RUBRO_REPORTE.rdlc" EnableExternalImages="true">
                                <DataSources>
                                    <rsweb:ReportDataSource DataSourceId="odsDatos" Name="Apu_Rubro" />
                    </DataSources>
                </LocalReport>
                    </rsweb:ReportViewer>
                    
                    <asp:ObjectDataSource ID="odsDatos" runat="server" 
                        EnableCaching="True" 
                        SelectMethod="GetByEmpresa" 
                        TypeName="REL.APU.RO_Apu_Rubro" OldValuesParameterFormatString="original_{0}" 
                        >
                       
                        <SelectParameters>
                            <asp:SessionParameter Name="s" 
                                                  SessionField="Scope" 
                                                  Type="Object" />
                            <asp:Parameter Name="Int_Empresa_Id" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                    
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
