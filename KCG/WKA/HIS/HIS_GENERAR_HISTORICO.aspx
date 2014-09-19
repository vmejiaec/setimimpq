<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="HIS_GENERAR_HISTORICO.aspx.cs" 
    Inherits="HIS_HIS_GENERAR_HISTORICO" 
    Title="Untitled Page" %>

<asp:Content 
    ID="Content1" 
    ContentPlaceHolderID="ContentPlaceHolder1" 
    Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Panel 
                ID="Panel1" 
                runat="server"
                GroupingText='Datos del Historico'>
                <table>
                    <tr>
                        <td>
                            <asp:Label
                                id="lblfecha"
                                runat="server"
                                Text='Fecha'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox 
                                id="txtfecha"
                                runat="server">
                            </asp:TextBox>                                
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label
                                id="lblpersonal"
                                runat="server"                                
                                Text='Personal'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox 
                                id="txtpersonal"
                                Width="400px"
                                runat="server">
                            </asp:TextBox>                                
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label
                                id="lblmotivo"
                                runat="server"
                                Text='Motivo'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox 
                                id="txtmotivo"
                                Width="400px"
                                Height="50px"
                                TextMode="MultiLine" 
                                runat="server">
                            </asp:TextBox>                                
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <table>
        <tr>
            <td colspan="2">
                <asp:Button
                    id="Aceptar"
                    runat="server"
                    Text='Aceptar'
                    OnClick="Aceptar_Click" />
               <asp:Button
                    id="Cancelar"
                    runat="server"
                    Text='Cancelar'
                    OnClick="Cancelar_Click" />      
            </td>            
        </tr>
    </table>
</asp:Content>

