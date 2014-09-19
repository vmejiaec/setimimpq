<%@ Page 
    Language="C#" 
    AutoEventWireup="true"
    CodeFile="VER_Generador_Recursos.aspx.cs" 
    Inherits="WKC.REC.VER_Generador_Recursos"     
    Culture="auto" 
    meta:resourcekey="PageResource1" 
    UICulture="auto" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Generador Recursos</title>
    <script language="javascript" type="text/javascript">
        function AbrirVentana()
        {
         window.open("drives.aspx",toolbar=0,menubar=0);
         
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Panel 
            runat="server" 
            ID="pnlObtencioDatos" 
            meta:resourcekey="pnlObtencioDatosResource1">
            <table border="0" width="700">
                <tr>
                        <td colspan="2" 
                            align="right">
                            <asp:Menu 
                                ID="mnuPrincipal" 
                                runat="server"
                                meta:resourcekey="mnuPrincipalResource1" 
                                CssClass="FILAPAGINADOR">
                            
                            </asp:Menu>
                            
                        </td>
                
                </tr>
                <tr>
                    <td >
                        <asp:Label 
                            ID="lblVersion" 
                            runat="server" 
                            Text="Versión" 
                            meta:resourcekey="lblVersionResource1" 
                            CssClass="LABEL">
                        </asp:Label>
                    </td>
                    <td >
                        <asp:DropDownList 
                            runat="server" 
                            ID="ddlVersion" 
                            DataTextField="Nombre" 
                            DataValueField="Id" 
                            meta:resourcekey="ddlVersionResource1" 
                            CssClass="DROPDOWNLIST">
                          </asp:DropDownList>
                    </td>
                    
                </tr>
                <tr>
                    <td >
                        <asp:Label 
                            ID="Label1" 
                            runat="server" 
                            Text="Escoja el tipo  de generación">
                         </asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList 
                            ID="DropDownList1" 
                            runat="server" 
                            AutoPostBack="True" 
                            OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                            <asp:ListItem Value="Master">Master</asp:ListItem>
                            <asp:ListItem Value="2">Recursos Especificos</asp:ListItem>
                        </asp:DropDownList> 
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Panel 
                            runat="server"  
                            Id="pnlEspecifico" 
                            Visible="False">
                             <table >
                               <tr>
                                    <td  >
                                        <asp:Label ID="lblModulo" runat="server" Text="Módulo" meta:resourcekey="lblModuloResource1" CssClass="LABEL"></asp:Label>
                                    </td>
                                     <td >
                                          <asp:DropDownList runat="server" ID="ddlModulo" DataTextField="Nombre" DataValueField="Id" AutoPostBack="True" OnSelectedIndexChanged="ddlModulo_SelectedIndexChanged" meta:resourcekey="ddlModuloResource1" CssClass="DROPDOWNLIST"></asp:DropDownList>
                                    </td>
                    
                                </tr>
                                <tr>
                                    <td >
                                        <asp:Label ID="lblContenedor" runat="server" Text="Contenedor" meta:resourcekey="lblContenedorResource1" CssClass="LABEL"></asp:Label>
                                    </td>
                                    <td >
                                        <asp:DropDownList runat="server" ID="ddlContenedor" DataTextField="Nombre" OnSelectedIndexChanged="ddlContenedor_SelectedIndexChanged" AutoPostBack="True" DataValueField="Id" meta:resourcekey="ddlContenedorResource1" CssClass="DROPDOWNLIST"></asp:DropDownList>
                                    </td>
                                </tr> 
                                <tr>
                                    <td colspan="2" align="center">
                                        <asp:GridView ID="dgDatos" runat="server" meta:resourcekey="dgDatosResource2" AutoGenerateColumns="False">
                                        <Columns>
                                                <asp:BoundField DataField="Tipo" HeaderText="Tipo" meta:resourcekey="BoundFieldResource1" >
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Nombre" HeaderText="Nombre" meta:resourcekey="BoundFieldResource2" >
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Ver_Etiqueta_Nombre" HeaderText="Etiqueta" meta:resourcekey="BoundFieldResource3" >
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Tool_Ver_Etiqueta_nombre" HeaderText="Tool Tips" meta:resourcekey="BoundFieldResource4" >
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="orden" HeaderText="Orden" meta:resourcekey="BoundFieldResource5" >
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="dic_objeto_nombre" HeaderText="Objeto" meta:resourcekey="BoundFieldResource6" >
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Origen" HeaderText="Origen" meta:resourcekey="BoundFieldResource7" >
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:BoundField>
                                        </Columns>
                                        <RowStyle CssClass="TEXTOGRID" />
                                        <HeaderStyle CssClass="CABECERA_GRID" />
                                    </asp:GridView>
                        
                                </td>
                            </tr> 
                            <tr>
                                <td >
                                    <asp:Label ID="lblArchivo" runat="server" Text="Archivo" meta:resourcekey="lblArchivoResource1" CssClass="LABEL"></asp:Label>
                                </td>
                                <td>
                                      <asp:TextBox ID="txtArchivo" runat="server" ReadOnly="True" meta:resourcekey="txtArchivoResource1" CssClass="TEXTBOX"></asp:TextBox>    
                                </td>
                            </tr>
                            <tr>
                                <td   >
                                        <asp:Label ID="lblDirectorio" runat="server" Text="Directorio" meta:resourcekey="lblDirectorioResource1" CssClass="LABEL"></asp:Label>
                                </td>
                                <td >
                                        <asp:TextBox ID="txtDirectorio" runat="server" Width="366px" CssClass="TEXTBOX" ReadOnly="True"></asp:TextBox>
                                        <input id="btnEscogerArchivo" class="BUTTON" title="Escoger Directorio" type="button" value="Escoger Archivo" onclick="AbrirVentana()" />
                                        <asp:Button ID="btnGenerar" runat="server" Text="Generar" OnClick="btnGenerar_Click" meta:resourcekey="btnGenerarResource1" CssClass="BUTTON" />
                        
                                </td>
                                </tr>
                         </table>
                        </asp:Panel>
                        <asp:Panel runat="server" ID="pnlGeneral" Visible="False">  
                                <table>
                                    <tr align="center">
                                        <td colspan="2">
                                            <asp:GridView ID="gvGeneral" runat="server" AutoGenerateColumns="False">
                                                <Columns>
                                                    <asp:BoundField DataField="Origen" HeaderText="Origen" />
                                                    <asp:BoundField DataField="Tipo" HeaderText="Tipo" />
                                                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                                                    <asp:BoundField DataField="Ver_Etiqueta_Nombre" HeaderText="Version" />
                                                    <asp:BoundField DataField="Tool_Ver_Etiqueta_Nombre" HeaderText="Tool Tip" />
                                                    <asp:BoundField DataField="Ver_Etiqueta_Imagen_Activa" HeaderText="Ver_Imagen_Activa" />
                                                    <asp:BoundField DataField="Ver_Etiqueta_Imagen_Desactiva" HeaderText="Ver_Imagen_Desactiva" />
                                                </Columns>
                                                
                                            </asp:GridView> 
                                        </td>
                                    
                                    </tr>
                                   <tr>
                                    <td>
                                    <asp:Label 
                                        ID="Label2" 
                                        runat="server" 
                                        Text="Archivo" 
                                        meta:resourcekey="lblArchivoResource1" 
                                        CssClass="LABEL">
                                    </asp:Label>
                                    </td>
                                     <td>
                                      <asp:TextBox 
                                            ID="TextBox1" 
                                            runat="server" 
                                            ReadOnly="True"
                                            meta:resourcekey="txtArchivoResource1" 
                                            CssClass="TEXTBOX">
                                       </asp:TextBox>    
                                </td>
                                </tr>
                            <tr>
                                <td>
                                        <asp:Label 
                                            ID="Label3" 
                                            runat="server" 
                                            Text="Directorio" 
                                            meta:resourcekey="lblDirectorioResource1" 
                                            CssClass="LABEL">
                                          </asp:Label>
                                </td>
                                <td >
                                        <asp:TextBox 
                                            ID="TextBox2" 
                                            runat="server" 
                                            Width="366px" 
                                            CssClass="TEXTBOX" 
                                            ReadOnly="True">
                                         </asp:TextBox>
                                        <input 
                                            id="Button1" 
                                            class="BUTTON" 
                                            title="Escoger Directorio" 
                                            type="button" 
                                            value="Escoger Archivo" 
                                            onclick="AbrirVentana()" />
                                        <asp:Button 
                                            ID="Button2" 
                                            runat="server" 
                                            Text="Generar" 
                                            OnClick="btnGenerar_Click" 
                                            meta:resourcekey="btnGenerarResource1" 
                                            CssClass="BUTTON" />
                        
                                </td>
                                </tr>
                               </table>
                        
                        </asp:Panel>
                    </td>
                </tr>
               
            </table>        
        
        </asp:Panel>
        
    </div>
    </form>
</body>
</html>
