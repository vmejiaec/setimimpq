<%@ Page Language="C#" 
         AutoEventWireup="true" 
         CodeBehind="Default.aspx.cs" 
         Inherits="WKA_Rep._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <div>
    <table>
        <tr>
            <td style="height: 21px">
            </td>
            <td style="height: 21px; width: 365px;">
            </td>
            <td style="width: 139px; height: 21px">
            </td>
            <td style="height: 21px">
            </td>
        </tr>
            <tr>
                <td>
                    No de Orden</td>
                <td style="width: 365px">
                    Reporte</td>
                <td style="width: 139px">
                    Id Proyecto</td>
                <td >
                    Llamada</td>
            </tr>
            <tr>
                <td style="width: 100px">
                    D00116</td>
                <td style="width: 365px">
                    APU_RUBRO_REPORTE</td>
                <td style="width: 139px">
                </td>
                <td style="width: 100px">
                    <asp:Button ID="Button1" runat="server" 
                                Text="Reporte" 
                                OnClick="Button1_Click" />
                </td>
            </tr>
                        <tr>
                <td style="width: 100px">
                    D00116</td>
                <td style="width: 365px">
                    APU_RUBRO_LISTADO</td>
                <td style="width: 139px">
                </td>
                <td style="width: 100px">
                    <asp:Button ID="Button17" runat="server" 
                                Text="Reporte" 
                                OnClick="Button17_Click" />
                </td>
            </tr>
        <tr>
            <td style="width: 100px; height: 21px">
                D0017</td>
            <td style="width: 365px; height: 21px">
               APU_PROYECTO_RUBRO_TECNICA_REPORTE</td>
            <td style="width: 139px; height: 21px">
                <asp:TextBox ID="tb_Apu_Proyecto_Id" runat="server" 
                             AutoCompleteType="Disabled" 
                             Style="position: relative"
                             Width="74px">
                </asp:TextBox></td>
            <td>
                <asp:Button ID="Button4" runat="server" 
                            Text="Reporte" 
                            OnClick="Button4_Click" />
            </td>
            <td style="width: 100px; height: 21px">
            </td>
        </tr>
            <tr>
                <td style="width: 100px; height: 21px;">
                    D0018</td>
                    <td style="width: 365px; height: 21px;">
                     APU_PROYECTO_RUBRO_REPORTE
                    </td>
                <td style="width: 139px; height: 21px">
                    </td>
                <td> 
                    <asp:Button ID="Button2" runat="server" 
                                OnClick="Button2_Click1" 
                                Text="Reporte" />
                </td>
                <td style="width: 100px; height: 21px;">
                    </td>
            </tr>
        <tr>
            <td style="width: 100px; height: 26px">
                D0019</td>
                <td style="width: 365px; height: 26px">
                    APU_PROYECTO_RUBRO_BASICO_REPORTE
                </td>
            <td style="width: 139px; height: 26px">
                </td>
            <td style="height: 26px">
                <asp:Button ID="Button3" runat="server" 
                            OnClick="Button3_Click" 
                            Text="Reporte" />
            </td>
            <td style="width: 100px; height: 26px">
            </td>
        </tr>
        <tr>
            <td style="width: 100px; height: 26px">
                D0020</td>
                <td style="width: 365px; height: 26px">
                 APU_PROYECTO_RUBRO_MATERIAL_REPORTE
               </td>
            <td style="width: 139px; height: 26px">
                </td>
            <td style="height: 26px">
                <asp:Button ID="Button5" runat="server" 
                            OnClick="Button5_Click" 
                            Text="Reporte" />
            </td>
            <td style="width: 100px; height: 26px">
            </td>
        </tr>
        <tr>
            <td style="width: 100px; height: 21px">
                D00125</td>
                <td style="width: 365px; height: 21px">
                    APU_PROYECTO_RUBRO_INSUMO_REPORTE
                </td>
            <td style="width: 139px; height: 21px">
                </td>
            <td>
                <asp:Button ID="Button6" runat="server" 
                            OnClick="Button6_Click" 
                            Style="position: relative"
                            Text="Reporte" />
            </td>
            <td style="width: 100px; height: 21px">
            </td>
        </tr>
        <tr>
            <td style="width: 100px; height: 21px">
                D00126</td>
                <td style="width: 365px; height: 21px">
                 APU_PROYECTO_INDICE_REPORTE
                </td>
            <td style="width: 139px; height: 21px">
                </td>
            <td>
                <asp:Button ID="Button7" runat="server" 
                            OnClick="Button7_Click" 
                            Style="position: relative"
                            Text="Reporte" />
            </td>
            <td style="width: 100px; height: 21px">
            </td>
        </tr>
        <tr>
            <td style="width: 100px; height: 23px">
                D00127</td>
            <td style="width: 365px; height: 23px">
                APU_PROYECTO_CUADRILLA_REPORTE</td>
            <td style="width: 139px; height: 23px">
                </td>
            <td style="height: 23px">
                <asp:Button ID="Button8" runat="server" 
                            OnClick="Button8_Click" 
                            Style="position: relative"
                            Text="Reporte" />
            </td>
            <td style="width: 100px; height: 23px">
            </td>
        </tr>
        <tr>
            <td style="width: 100px; height: 23px">
            </td>
            <td style="width: 365px; height: 23px; text-align: center">
                <strong>
                    <span style="font-size: 14pt">
                            REPORTES&nbsp; APU OFERTA
                    </span>
                </strong>
            </td>
            <td style="width: 139px; height: 23px">
            </td>
            <td style="height: 23px">
            </td>
            <td style="width: 100px; height: 23px">
            </td>
        </tr>
        <tr>
            <td style="width: 100px; height: 23px">
                D00128</td>
            <td style="width: 365px; height: 23px">
                APU_OFERTA_RUBRO_REPORTE</td>
            <td style="width: 139px; height: 23px">
                <asp:TextBox ID="tb_Apu_Oferta_Id" runat="server" 
                             Style="position: relative" 
                             Width="75px">
                </asp:TextBox></td>
            <td style="height: 23px">
                <asp:Button ID="Button9" runat="server" 
                            OnClick="Button9_Click" 
                            Style="position: relative"
                            Text="Reporte" /></td>
            <td style="width: 100px; height: 23px">
            </td>
        </tr>
        <tr>
            <td style="width: 100px; height: 23px">
                D00129</td>
            <td style="width: 365px; height: 23px">
                APU_OFERTA_RUBRO_REPORTE_BASIC</td>
            <td style="width: 139px; height: 23px">
            </td>
            <td style="height: 23px">
                <asp:Button ID="Button10" runat="server" 
                            OnClick="Button10_Click" 
                            Style="position: relative"
                            Text="Reporte" /></td>
            <td style="width: 100px; height: 23px">
            </td>
        </tr>
        <tr>
            <td style="width: 100px; height: 23px">
                D00130</td>
            <td style="width: 365px; height: 23px">
                APU_OFERTA_RUBRO_MATERIAL_REPORTE</td>
            <td style="width: 139px; height: 23px">
            </td>
            <td style="height: 23px">
                <asp:Button ID="Button11" runat="server" 
                            OnClick="Button11_Click" 
                            Style="position: relative"
                            Text="Reporte" /></td>
            <td style="width: 100px; height: 23px">
            </td>
        </tr>
        <tr>
            <td style="width: 100px; height: 23px">
                D00131</td>
            <td style="width: 365px; height: 23px">
                APU_OFERTA_RUBRO_INSUMO_REPORTE</td>
            <td style="width: 139px; height: 23px">
            </td>
            <td style="height: 23px">
                <asp:Button ID="Button12" runat="server" 
                            OnClick="Button12_Click" 
                            Style="position: relative"
                            Text="Reporte" /></td>
            <td style="width: 100px; height: 23px">
            </td>
        </tr>
        <tr>
            <td style="width: 100px; height: 23px">
                D00132</td>
            <td style="width: 365px; height: 23px">
                APU_OFERTA_INDICE_REPORTE</td>
            <td style="width: 139px; height: 23px">
            </td>
            <td style="height: 23px">
                <asp:Button ID="Button13" runat="server" OnClick="Button13_Click" Style="position: relative"
                    Text="Reporte" /></td>
            <td style="width: 100px; height: 23px">
            </td>
        </tr>
        <tr>
            <td style="width: 100px; height: 23px">
                D00133</td>
            <td style="width: 365px; height: 23px">
                APU_OFERTA_CUADRILLA_REPORTE</td>
            <td style="width: 139px; height: 23px">
            </td>
            <td style="height: 23px">
                <asp:Button ID="Button14" runat="server" OnClick="Button14_Click" Style="position: relative"
                    Text="Reporte" /></td>
            <td style="width: 100px; height: 23px">
            </td>
        </tr>
        <tr>
            <td style="width: 100px; height: 23px">
                D00134</td>
            <td style="width: 365px; height: 23px">
                APU_RUBRO_INSUMO_REPORTE</td>
            <td style="width: 139px; height: 23px">
            </td>
            <td style="height: 23px">
                <asp:Button ID="Button15" runat="server" OnClick="Button15_Click" Style="position: relative"
                    Text="Reporte" /></td>
            <td style="width: 100px; height: 23px">
            </td>
        </tr>
        <tr>
            <td style="width: 100px; height: 23px">
                D00135</td>
            <td style="width: 365px; height: 23px">
                APU_RUBRO_INSUMO_BASICO_REPORTE</td>
            <td style="width: 139px; height: 23px">
            </td>
            <td style="height: 23px">
                <asp:Button ID="Button16" runat="server" OnClick="Button16_Click" Style="position: relative"
                    Text="Reporte" /></td>
            <td style="width: 100px; height: 23px">
            </td>
        </tr>
        </table>
    </div>
    </form>
</body>
</html>
