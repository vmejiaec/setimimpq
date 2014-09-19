<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="APU_CLONAR.aspx.cs" 
    Inherits="APU_APU_CLONAR" 
    StylesheetTheme="EstiloKCG"
    Theme="EstiloKCG"
    meta:resourcekey="Tit_Apu_ClonarRecursoKCG" %>

<asp:Content 
    ID="Content1" 
    ContentPlaceHolderID="ContentPlaceHolder1" 
    Runat="Server">
    <asp:Panel 
        id="Panel1"
        runat="server" 
        meta:resourcekey="Rec_Apu_ClonarRecursoKCG">
        <table>
            <tr>
                <td colspan="3">
                    <asp:Label 
                        id="lblactual"
                        runat="server">                        
                    </asp:Label> 
                    <asp:TextBox 
                        id="txtcodigo"
                        runat="server" >
                    </asp:TextBox>
                    <asp:TextBox 
                        id="txtnombre"
                        runat="server"
                        width="400px">
                    </asp:TextBox>  
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:Label 
                        id="lblnuevo"
                        runat="server">                        
                    </asp:Label>                
                    <asp:TextBox 
                        id="txtnuevo"
                        runat="server"
                        width="400px">
                    </asp:TextBox>    
                </td>   
            </tr>
            <tr>
                <td style="white-space:nowrap">
                    <asp:Button 
                        ID="BtnDenominacion" 
                        runat="server"                                                     
                        OnClick="BtnDenominacion_Click"/> 
                </td>
                <td>                                                             
                    <asp:ListBox 
                        ID="lbxdenominacion" 
                        runat="server"
                        width="300px"
                        Height="50px">
                    </asp:ListBox>
                </td>
            </tr>            
        </table>
    </asp:Panel>
    <table>
        <tr>
            <td>
                <asp:Button 
                    ID="Aceptar" 
                    runat="server"                                                     
                    OnClick="Aceptar_Click"/>
                <asp:Button 
                    ID="Cancelar" 
                    runat="server"                                                     
                    OnClick="Cancelar_Click"/>    
            </td>
        </tr>
    </table>
</asp:Content>

