<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="AUD_AUDITORIA.aspx.cs" 
    Inherits="AUD_AUD_AUDITORIA" 
    Theme="EstiloKCG"
    StylesheetTheme="EstiloKCG"
    meta:resourcekey="Tit_Aud_AuditoriaRecursoKCG" 
    ValidateRequest="false"%>
    
<%@ Register tagprefix="koala" 
    assembly="KoalaWebControls" 
    namespace="Koala.KoalaWebControls" %>
    
<asp:Content 
    ID="Content1"
    ContentPlaceHolderID="ContentPlaceHolder1" 
    Runat="Server">
 <asp:UpdatePanel 
    ID="UpdatePanel1" 
    runat="server" 
    UpdateMode="Conditional">
    <ContentTemplate>
    <asp:Panel 
        runat="server" 
        ID="Datos" 
        meta:resourcekey="Rec_Aud_AuditoriaRecursoKCG">
        <asp:FormView 
            ID="fvAudAuditoria" 
            runat="server" 
            DataSourceID="odsFVAudAuditoria" 
            DefaultMode="Insert">
        <EditItemTemplate>
            <table>
                <tr align="right">
                    <td colspan="4">
                        <asp:Label 
                            ID="estado_Nombre" 
                            runat="server" 
                            Text='<%# Bind("estado_Nombre") %>'>
                        </asp:Label> 
                    </td>    
                </tr>
                <tr align="left">
                    <td>
                        <asp:Label 
                            ID="Label1" 
                            runat="server" 
                            meta:resourcekey="CodigoRecursoKCG">
                        </asp:Label>
                    </td>
                    <td colspan="3">
                        <asp:TextBox 
                            ID="Codigo" 
                            runat="server"
                            ReadOnly="true" 
                            Text='<%# Bind("Codigo") %>'>
                        </asp:TextBox>
                    </td>
                </tr>
                <tr align="left">
                    <td>
                       <asp:Label 
                            ID="Label2" 
                            runat="server"
                            AccessKey="F" 
                            AssociatedControlID="Accion_Nombre"
                            meta:resourcekey="AccionRecursoKCG">
                        </asp:Label> 
                    </td>
                    <td>
                            <asp:TextBox 
                                ID="Accion_Nombre" 
                                runat="server" Text='<%# Bind("Accion_Nombre") %>'>
                            </asp:TextBox>
                    </td>
                    <td>
                    <asp:Label 
                            ID="Label3" 
                            runat="server" 
                            meta:resourcekey="Codigo_OrigenRecursoKCG">
                        </asp:Label> 
                    </td>
                    <td>
                         <asp:TextBox 
                            ID="Codigo_Origen" 
                            runat="server" 
                            Text='<%# Bind("Codigo_Origen") %>'>
                          </asp:TextBox>
                    </td>
                </tr>
                <tr align="left">
                        <td>
                            <asp:Label 
                            ID="Label4" 
                            runat="server" 
                            meta:resourcekey="FechaRecursoKCG">
                            </asp:Label> 
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="Fecha" 
                                runat="server" 
                                Text='<%# Bind("Fecha") %>'>
                            </asp:TextBox>
                        </td>
                        <td>
                             <asp:Label 
                            ID="Label5" 
                            runat="server" 
                            meta:resourcekey="Id_OrigenRecursoKCG">
                            </asp:Label> 
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="Id_Origen" 
                                runat="server" 
                                Text='<%# Bind("Id_Origen") %>'>
                            </asp:TextBox>
                        </td>
                </tr>
                <tr align="left">
                    <td>
                        <asp:Label 
                            ID="Label6" 
                            runat="server" 
                            meta:resourcekey="Dic_Modulo_NombreRecursoKCG">
                        </asp:Label> 
                    </td>
                    <td>
                         <asp:TextBox 
                            ID="dic_modulo_codigo" 
                            runat="server" 
                            Text='<%# Bind("dic_modulo_codigo") %>'>
                         </asp:TextBox>
                    </td>
                    <td colspan="2">
                        <asp:TextBox 
                            ID="dic_modulo_nombre" 
                            runat="server" 
                            Text='<%# Bind("dic_modulo_nombre") %>'>
                        </asp:TextBox>
                    </td>
                </tr>
                <tr align="left">
                    <td>
                        <asp:Label 
                            ID="Label7" 
                            runat="server" 
                            meta:resourcekey="Dic_Objeto_NombreRecursoKCG">
                        </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox 
                            ID="Dic_Objeto_Codigo" 
                            runat="server" 
                            Text='<%# Bind("Dic_Objeto_Codigo") %>'>
                        </asp:TextBox>
                    </td>
                    <td colspan="2">
                        <asp:TextBox 
                            ID="Dic_objeto_Nombre" 
                            runat="server" 
                            Text='<%# Bind("Dic_objeto_Nombre") %>'>
                        </asp:TextBox>
                    </td>
                </tr>
                <tr align="left">
                    <td>
                         <asp:Label 
                            ID="Label8" 
                            runat="server" 
                            meta:resourcekey="Seg_Rol_NombreRecursoKCG">
                        </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox 
                            ID="Seg_Rol_Codigo" 
                            runat="server" 
                            Text='<%# Bind("Seg_Rol_Codigo") %>'>
                        </asp:TextBox>
                    </td>
                    <td colspan="2">
                        <asp:TextBox 
                            ID="Seg_Rol_Nombre" 
                            runat="server" 
                            Text='<%# Bind("Seg_Rol_Nombre") %>'>
                        </asp:TextBox>
                    </td>
                </tr>
                <tr align="left">
                    <td>
                     <asp:Label 
                            ID="Label9" 
                            runat="server" 
                            meta:resourcekey="Int_Usuario_NombreRecursoKCG">
                        </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox 
                            ID="Int_Usuario_Codigo" 
                            runat="server" 
                            Text='<%# Bind("Int_Usuario_Codigo") %>'>
                        </asp:TextBox>
                    </td>
                    <td colspan="2">
                        <asp:TextBox 
                            ID="Int_Usuario_Nombre" 
                            runat="server" 
                            Text='<%# Bind("Int_Usuario_Nombre") %>'>
                        </asp:TextBox>
                    </td>
                </tr>
                <tr align="left">
                    <td colspan="4">
                        <asp:Button 
                            ID="UpdateButton" 
                            runat="server" 
                            CausesValidation="True" 
                            CommandName="Update"
                            Visible="false"
                            Text="Update">
                        </asp:Button>
                        <asp:Button 
                            ID="UpdateCancelButton" 
                            runat="server"
                            Visible="false" 
                            CausesValidation="False" 
                            CommandName="Cancel"
                            Text="Cancel">
                        </asp:Button>
                    </td>
                    
                </tr>
            </table>
            <!--BLOQUE DE CAMPOS NO VISIBLES -->
            <asp:Label 
                ID="Label10" 
                runat="server" 
                Visible="false"
                Text="Campos:">
            </asp:Label>
            <asp:TextBox 
                ID="Campos" 
                Visible="false"
                runat="server" 
                Text='<%# Bind("Campos") %>'>
            </asp:TextBox>
            <asp:Label 
                ID="Label11" 
                runat="server" 
                Visible="false"
                Text=" Dic_Objeto_Id:">
            </asp:Label>
            <asp:TextBox 
                ID="Dic_Objeto_Id" 
                Visible="true"
                Style="visibility:hidden"
                runat="server" 
                Text='<%# Bind("Dic_Objeto_Id") %>'>
            </asp:TextBox>
           <asp:Label 
                ID="Label12" 
                runat="server" 
                Visible="false"
                Text="Nombre:">
            </asp:Label>
            <asp:TextBox 
                ID="Nombre" 
                runat="server" 
                Visible="false"
                Text='<%# Bind("Nombre") %>'>
            </asp:TextBox>
             <asp:Label 
                ID="Label13" 
                runat="server" 
                Visible="false"
                Text="Id:">
            </asp:Label>
            <asp:TextBox 
                ID="Id" 
                Visible="true"
                Style="visibility:hidden"
                runat="server" 
                Text='<%# Bind("Id") %>'>
            </asp:TextBox>
              <asp:Label 
                ID="Label14" 
                runat="server" 
                Visible="false"
                Text="Int_Usuario_Id:">
            </asp:Label>
            <asp:TextBox 
                ID="Int_Usuario_Id" 
                runat="server" 
                Visible="true"
                Style="visibility:hidden"
                Text='<%# Bind("Int_Usuario_Id") %>'>
            </asp:TextBox>
              <asp:Label 
                ID="Label15" 
                runat="server" 
                Visible="false"
                Text="Seg_Rol_Id:">
            </asp:Label>
            <asp:TextBox 
                ID="Seg_Rol_Id" 
                runat="server" 
                Visible="true"
                Style="visibility:hidden"
                Text='<%# Bind("Seg_Rol_Id") %>'>
            </asp:TextBox>
            <asp:Label 
                ID="Label16" 
                runat="server" 
                Visible="false"
                Text="Estado:">
            </asp:Label>
            <asp:TextBox 
                ID="Estado" 
                runat="server"
                Visible="false" 
                Text='<%# Bind("Estado") %>'>
            </asp:TextBox>
           <asp:Label 
                ID="Label17" 
                runat="server" 
                Visible="false"
                Text="Dic_Modulo_Id:">
            </asp:Label>
            <asp:TextBox 
                ID="Dic_Modulo_Id" 
                runat="server"
                Visible="true"
                Style="visibility:hidden" 
                Text='<%# Bind("Dic_Modulo_Id") %>'>
            </asp:TextBox>
             <asp:Label 
                ID="Label18" 
                runat="server" 
                Visible="false"
                Text="Accion:">
            </asp:Label>
            <asp:TextBox 
                ID="Accion" 
                Visible="false"
                runat="server" 
                Text='<%# Bind("Accion") %>'>
            </asp:TextBox>
           <!--FIN DEL  BLOQUE DE LOS  CAMPOS NO VISIBLES -->
        </EditItemTemplate>
        <InsertItemTemplate>
            <table>
                <tr align="right">
                    <td colspan="4">
                        <asp:Label 
                            ID="estado_Nombre" 
                            runat="server" 
                            Text='<%# Bind("estado_Nombre") %>'>
                        </asp:Label> 
                    </td>    
                </tr>
                <tr align="left">
                    <td>
                        <asp:Label 
                            ID="Label1" 
                            runat="server" 
                            meta:resourcekey="CodigoRecursoKCG">
                        </asp:Label>
                    </td>
                    <td colspan="3">
                        <asp:TextBox 
                            ID="Codigo" 
                            runat="server"
                            ReadOnly="true" 
                            Text='<%# Bind("Codigo") %>'>
                        </asp:TextBox>
                    </td>
                </tr>
                <tr align="left">
                    <td>
                       <asp:Label 
                            ID="Label2" 
                            runat="server"
                            AccessKey="F" 
                            AssociatedControlID="Accion_Nombre"
                            meta:resourcekey="AccionRecursoKCG">
                        </asp:Label> 
                    </td>
                    <td>
                            <asp:TextBox 
                                ID="Accion_Nombre"
                                ReadOnly="true" 
                                runat="server" Text='<%# Bind("Accion_Nombre") %>'>
                            </asp:TextBox>
                    </td>
                    <td>
                    <asp:Label 
                            ID="Label3" 
                            runat="server" 
                            meta:resourcekey="Codigo_OrigenRecursoKCG">
                        </asp:Label> 
                    </td>
                    <td>
                         <asp:TextBox 
                            ID="Codigo_Origen" 
                            runat="server"
                            ReadOnly="true" 
                            Text='<%# Bind("Codigo_Origen") %>'>
                          </asp:TextBox>
                    </td>
                </tr>
                <tr align="left">
                        <td>
                            <asp:Label 
                            ID="Label4" 
                            runat="server"
                            meta:resourcekey="FechaRecursoKCG">
                            </asp:Label> 
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="Fecha" 
                                runat="server"
                                ReadOnly="true" 
                                Text='<%# Bind("Fecha") %>'>
                            </asp:TextBox>
                        </td>
                        <td>
                             <asp:Label 
                            ID="Label5" 
                            runat="server"
                            meta:resourcekey="Id_OrigenRecursoKCG">
                            </asp:Label> 
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="Id_Origen" 
                                runat="server"
                                ReadOnly="true" 
                                Text='<%# Bind("Id_Origen") %>'>
                            </asp:TextBox>
                        </td>
                </tr>
                <tr align="left">
                    <td>
                        <asp:Label 
                            ID="Label6" 
                            runat="server" 
                            meta:resourcekey="Dic_Modulo_NombreRecursoKCG">
                        </asp:Label> 
                    </td>
                    <td>
                         <asp:TextBox 
                            ID="dic_modulo_codigo" 
                            runat="server"
                            ReadOnly="true" 
                            Text='<%# Bind("dic_modulo_codigo") %>'>
                         </asp:TextBox>
                    </td>
                    <td colspan="2">
                        <asp:TextBox 
                            ID="dic_modulo_nombre" 
                            runat="server"
                            ReadOnly="true" 
                            Text='<%# Bind("dic_modulo_nombre") %>'>
                        </asp:TextBox>
                    </td>
                </tr>
                <tr align="left">
                    <td>
                        <asp:Label 
                            ID="Label7" 
                            runat="server" 
                            meta:resourcekey="Dic_Objeto_NombreRecursoKCG">
                        </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox 
                            ID="Dic_Objeto_Codigo" 
                            runat="server"
                            ReadOnly="true" 
                            Text='<%# Bind("Dic_Objeto_Codigo") %>'>
                        </asp:TextBox>
                    </td>
                    <td colspan="2">
                        <asp:TextBox 
                            ID="Dic_objeto_Nombre" 
                            runat="server"
                            ReadOnly="true" 
                            Text='<%# Bind("Dic_objeto_Nombre") %>'>
                        </asp:TextBox>
                    </td>
                </tr>
                <tr align="left">
                    <td>
                         <asp:Label 
                            ID="Label8" 
                            runat="server" 
                            meta:resourcekey="Seg_Rol_NombreRecursoKCG">
                        </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox 
                            ID="Seg_Rol_Codigo" 
                            runat="server"
                            ReadOnly="true" 
                            Text='<%# Bind("Seg_Rol_Codigo") %>'>
                        </asp:TextBox>
                    </td>
                    <td colspan="2">
                        <asp:TextBox 
                            ID="Seg_Rol_Nombre" 
                            ReadOnly="true"
                            runat="server" 
                            Text='<%# Bind("Seg_Rol_Nombre") %>'>
                        </asp:TextBox>
                    </td>
                </tr>
                <tr align="left">
                    <td>
                     <asp:Label 
                            ID="Label9" 
                            runat="server" 
                            meta:resourcekey="Int_Usuario_NombreRecursoKCG">
                        </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox 
                            ID="Int_Usuario_Codigo" 
                            runat="server"
                            ReadOnly="true" 
                            Text='<%# Bind("Int_Usuario_Codigo") %>'>
                        </asp:TextBox>
                    </td>
                    <td colspan="2">
                        <asp:TextBox 
                            ID="Int_Usuario_Nombre" 
                            runat="server"
                            ReadOnly="true" 
                            Text='<%# Bind("Int_Usuario_Nombre") %>'>
                        </asp:TextBox>
                    </td>
                </tr>
                <tr align="left">
                    <td>
                        <asp:Label 
                        ID="Label10" 
                        runat="server" 
                        meta:resourcekey="CampoRecursoKCG">
                    </asp:Label>
            
                    </td>
                    <td colspan="3">
                        <asp:TextBox 
                            ID="Campos" 
                            TextMode="MultiLine"
                            Width="600"
                            Height="60"
                            ReadOnly="true"
                            runat="server" 
                            Text='<%# Bind("Campos") %>'>
                        </asp:TextBox>
                    </td>
                
                </tr>
                <tr align="left">
                    <td colspan="4">
                        <asp:Button 
                            ID="InsertButton" 
                            runat="server" 
                            CausesValidation="True" 
                            CommandName="Insert"
                            Visible="false"
                            Text="Insert">
                    </asp:Button>
                    <asp:Button 
                            ID="InsertCancelButton" 
                            runat="server" 
                            CausesValidation="False" 
                            CommandName="Cancel"
                            Visible="false"
                            Text="Cancel">
                    </asp:Button>
                    </td>
                    
                </tr>
            </table>
            <!--BLOQUE DE CAMPOS NO VISIBLES -->
            
            <asp:Label 
                ID="Label11" 
                runat="server" 
                Visible="false"
                Text=" Dic_Objeto_Id:">
            </asp:Label>
            <asp:TextBox 
                ID="Dic_Objeto_Id" 
                Visible="true"
                Style="visibility:hidden"
                runat="server" 
                Text='<%# Bind("Dic_Objeto_Id") %>'>
            </asp:TextBox>
           <asp:Label 
                ID="Label12" 
                runat="server" 
                Visible="false"
                Text="Nombre:">
            </asp:Label>
            <asp:TextBox 
                ID="Nombre" 
                runat="server" 
                Visible="false"
                Text='<%# Bind("Nombre") %>'>
            </asp:TextBox>
             <asp:Label 
                ID="Label13" 
                runat="server" 
                Visible="false"
                Text="Id:">
            </asp:Label>
            <asp:TextBox 
                ID="Id" 
                Visible="true"
                Style="visibility:hidden"
                runat="server" 
                Text='<%# Bind("Id") %>'>
            </asp:TextBox>
              <asp:Label 
                ID="Label14" 
                runat="server" 
                Visible="false"
                Text="Int_Usuario_Id:">
            </asp:Label>
            <asp:TextBox 
                ID="Int_Usuario_Id" 
                runat="server" 
                Visible="true"
                Style="visibility:hidden"
                Text='<%# Bind("Int_Usuario_Id") %>'>
            </asp:TextBox>
              <asp:Label 
                ID="Label15" 
                runat="server" 
                Visible="false"
                Text="Seg_Rol_Id:">
            </asp:Label>
            <asp:TextBox 
                ID="Seg_Rol_Id" 
                runat="server" 
                Visible="true"
                Style="visibility:hidden"
                Text='<%# Bind("Seg_Rol_Id") %>'>
            </asp:TextBox>
            <asp:Label 
                ID="Label16" 
                runat="server" 
                Visible="false"
                Text="Estado:">
            </asp:Label>
            <asp:TextBox 
                ID="Estado" 
                runat="server"
                Visible="false" 
                Text='<%# Bind("Estado") %>'>
            </asp:TextBox>
           <asp:Label 
                ID="Label17" 
                runat="server" 
                Visible="false"
                Text="Dic_Modulo_Id:">
            </asp:Label>
            <asp:TextBox 
                ID="Dic_Modulo_Id" 
                runat="server"
                Visible="true"
                Style="visibility:hidden" 
                Text='<%# Bind("Dic_Modulo_Id") %>'>
            </asp:TextBox>
             <asp:Label 
                ID="Label18" 
                runat="server" 
                Visible="false"
                Text="Accion:">
            </asp:Label>
            <asp:TextBox 
                ID="Accion" 
                Visible="false"
                runat="server" 
                Text='<%# Bind("Accion") %>'>
            </asp:TextBox>
           <!--FIN DEL  BLOQUE DE LOS  CAMPOS NO VISIBLES -->
            
        </InsertItemTemplate>
        <ItemTemplate>
             <table>
                <tr align="right">
                    <td colspan="4">
                        <asp:Label 
                            ID="estado_Nombre" 
                            runat="server" 
                            Text='<%# Bind("estado_Nombre") %>'>
                        </asp:Label> 
                    </td>    
                </tr>
                <tr align="left">
                    <td>
                        <asp:Label 
                            ID="Label1" 
                            runat="server" 
                            meta:resourcekey="CodigoRecursoKCG">
                        </asp:Label>
                    </td>
                    <td colspan="3">
                        <asp:TextBox 
                            ID="Codigo" 
                            runat="server"
                            ReadOnly="true" 
                            Text='<%# Bind("Codigo") %>'>
                        </asp:TextBox>
                    </td>
                </tr>
                <tr align="left">
                    <td>
                       <asp:Label 
                            ID="Label2" 
                            runat="server"
                            AccessKey="F" 
                            AssociatedControlID="Accion_Nombre"
                            meta:resourcekey="AccionRecursoKCG">
                        </asp:Label> 
                    </td>
                    <td>
                            <asp:TextBox 
                                ID="Accion_Nombre"
                                ReadOnly="true" 
                                runat="server" Text='<%# Bind("Accion_Nombre") %>'>
                            </asp:TextBox>
                    </td>
                    <td>
                    <asp:Label 
                            ID="Label3" 
                            runat="server" 
                            meta:resourcekey="Codigo_OrigenRecursoKCG">
                        </asp:Label> 
                    </td>
                    <td>
                         <asp:TextBox 
                            ID="Codigo_Origen" 
                            runat="server"
                            ReadOnly="true" 
                            Text='<%# Bind("Codigo_Origen") %>'>
                          </asp:TextBox>
                    </td>
                </tr>
                <tr align="left">
                        <td>
                            <asp:Label 
                            ID="Label4" 
                            runat="server"
                            meta:resourcekey="FechaRecursoKCG">
                            </asp:Label> 
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="Fecha" 
                                runat="server"
                                ReadOnly="true" 
                                Text='<%# Bind("Fecha") %>'>
                            </asp:TextBox>
                        </td>
                        <td>
                             <asp:Label 
                            ID="Label5" 
                            runat="server"
                            meta:resourcekey="Id_OrigenRecursoKCG">
                            </asp:Label> 
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="Id_Origen" 
                                runat="server"
                                ReadOnly="true" 
                                Text='<%# Bind("Id_Origen") %>'>
                            </asp:TextBox>
                        </td>
                </tr>
                <tr align="left">
                    <td>
                        <asp:Label 
                            ID="Label6" 
                            runat="server" 
                            meta:resourcekey="Dic_Modulo_NombreRecursoKCG">
                        </asp:Label> 
                    </td>
                    <td>
                         <asp:TextBox 
                            ID="dic_modulo_codigo" 
                            runat="server"
                            ReadOnly="true" 
                            Text='<%# Bind("dic_modulo_codigo") %>'>
                         </asp:TextBox>
                    </td>
                    <td colspan="2">
                        <asp:TextBox 
                            ID="dic_modulo_nombre" 
                            runat="server"
                            ReadOnly="true" 
                            Text='<%# Bind("dic_modulo_nombre") %>'>
                        </asp:TextBox>
                    </td>
                </tr>
                <tr align="left">
                    <td>
                        <asp:Label 
                            ID="Label7" 
                            runat="server" 
                            meta:resourcekey="Dic_Objeto_NombreRecursoKCG">
                        </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox 
                            ID="Dic_Objeto_Codigo" 
                            runat="server"
                            ReadOnly="true" 
                            Text='<%# Bind("Dic_Objeto_Codigo") %>'>
                        </asp:TextBox>
                    </td>
                    <td colspan="2">
                        <asp:TextBox 
                            ID="Dic_objeto_Nombre" 
                            runat="server"
                            ReadOnly="true" 
                            Text='<%# Bind("Dic_objeto_Nombre") %>'>
                        </asp:TextBox>
                    </td>
                </tr>
                <tr align="left">
                    <td>
                         <asp:Label 
                            ID="Label8" 
                            runat="server" 
                            meta:resourcekey="Seg_Rol_NombreRecursoKCG">
                        </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox 
                            ID="Seg_Rol_Codigo" 
                            runat="server"
                            ReadOnly="true" 
                            Text='<%# Bind("Seg_Rol_Codigo") %>'>
                        </asp:TextBox>
                    </td>
                    <td colspan="2">
                        <asp:TextBox 
                            ID="Seg_Rol_Nombre" 
                            ReadOnly="true"
                            runat="server" 
                            Text='<%# Bind("Seg_Rol_Nombre") %>'>
                        </asp:TextBox>
                    </td>
                </tr>
                <tr align="left">
                    <td>
                     <asp:Label 
                            ID="Label9" 
                            runat="server" 
                            meta:resourcekey="Int_Usuario_NombreRecursoKCG">
                        </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox 
                            ID="Int_Usuario_Codigo" 
                            runat="server"
                            ReadOnly="true" 
                            Text='<%# Bind("Int_Usuario_Codigo") %>'>
                        </asp:TextBox>
                    </td>
                    <td colspan="2">
                        <asp:TextBox 
                            ID="Int_Usuario_Nombre" 
                            runat="server"
                            ReadOnly="true" 
                            Text='<%# Bind("Int_Usuario_Nombre") %>'>
                        </asp:TextBox>
                    </td>
                </tr>
                <tr align="left">
                    <td>
                        <asp:Label 
                        ID="Label19" 
                        runat="server" 
                        meta:resourcekey="CampoRecursoKCG">
                    </asp:Label>
            
                    </td>
                    <td colspan="3">
                        <asp:TextBox 
                            ID="TextBox1" 
                            TextMode="MultiLine"
                            Width="600"
                            Height="60"
                            ReadOnly="true"
                            runat="server" 
                            Text='<%# Bind("Campos") %>'>
                        </asp:TextBox>
                    </td>
                
                </tr>
                <tr align="left">
                    <td colspan="4">
                        <asp:Button 
                            ID="InsertButton" 
                            runat="server" 
                            CausesValidation="True" 
                            CommandName="Insert"
                            Visible="false"
                            Text="Insert">
                    </asp:Button>
                    <asp:Button 
                            ID="InsertCancelButton" 
                            runat="server" 
                            CausesValidation="False" 
                            CommandName="Cancel"
                            Visible="false"
                            Text="Cancel">
                    </asp:Button>
                        
                    
                </tr>
            </table>
            <!--BLOQUE DE CAMPOS NO VISIBLES -->
           
            <asp:Label 
                ID="Label11" 
                runat="server" 
                Visible="false"
                Text=" Dic_Objeto_Id:">
            </asp:Label>
            <asp:TextBox 
                ID="Dic_Objeto_Id" 
                Visible="true"
                Style="visibility:hidden"
                runat="server" 
                Text='<%# Bind("Dic_Objeto_Id") %>'>
            </asp:TextBox>
           <asp:Label 
                ID="Label12" 
                runat="server" 
                Visible="false"
                Text="Nombre:">
            </asp:Label>
            <asp:TextBox 
                ID="Nombre" 
                runat="server" 
                Visible="false"
                Text='<%# Bind("Nombre") %>'>
            </asp:TextBox>
             <asp:Label 
                ID="Label13" 
                runat="server" 
                Visible="false"
                Text="Id:">
            </asp:Label>
            <asp:TextBox 
                ID="Id" 
                Visible="true"
                Style="visibility:hidden"
                runat="server" 
                Text='<%# Bind("Id") %>'>
            </asp:TextBox>
              <asp:Label 
                ID="Label14" 
                runat="server" 
                Visible="false"
                Text="Int_Usuario_Id:">
            </asp:Label>
            <asp:TextBox 
                ID="Int_Usuario_Id" 
                runat="server" 
                Visible="true"
                Style="visibility:hidden"
                Text='<%# Bind("Int_Usuario_Id") %>'>
            </asp:TextBox>
              <asp:Label 
                ID="Label15" 
                runat="server" 
                Visible="false"
                Text="Seg_Rol_Id:">
            </asp:Label>
            <asp:TextBox 
                ID="Seg_Rol_Id" 
                runat="server" 
                Visible="true"
                Style="visibility:hidden"
                Text='<%# Bind("Seg_Rol_Id") %>'>
            </asp:TextBox>
            <asp:Label 
                ID="Label16" 
                runat="server" 
                Visible="false"
                Text="Estado:">
            </asp:Label>
            <asp:TextBox 
                ID="Estado" 
                runat="server"
                Visible="false" 
                Text='<%# Bind("Estado") %>'>
            </asp:TextBox>
           <asp:Label 
                ID="Label17" 
                runat="server" 
                Visible="false"
                Text="Dic_Modulo_Id:">
            </asp:Label>
            <asp:TextBox 
                ID="Dic_Modulo_Id" 
                runat="server"
                Visible="true"
                Style="visibility:hidden" 
                Text='<%# Bind("Dic_Modulo_Id") %>'>
            </asp:TextBox>
             <asp:Label 
                ID="Label18" 
                runat="server" 
                Visible="false"
                Text="Accion:">
            </asp:Label>
            <asp:TextBox 
                ID="Accion" 
                Visible="false"
                runat="server" 
                Text='<%# Bind("Accion") %>'>
            </asp:TextBox>
           <!--FIN DEL  BLOQUE DE LOS  CAMPOS NO VISIBLES -->
        </ItemTemplate>
    </asp:FormView>
    </asp:Panel>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger 
                ControlID="gvAudAuditoria" 
                EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:ObjectDataSource 
        ID="odsFVAudAuditoria" 
        runat="server" 
        ConflictDetection="CompareAllValues"
        OldValuesParameterFormatString="original{0}" 
        SelectMethod="GetById" 
        SortParameterName="sortExpression"
        TypeName="FEL.AUD.BO_Aud_Auditoria" DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
        <SelectParameters>
            <asp:SessionParameter 
                Name="s" 
                SessionField="Scope" 
                Type="Object" />
            <asp:Parameter Name="Id" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:UpdatePanel 
        ID="UpdatePanel2" 
        runat="server">
        <ContentTemplate>
            <asp:Button 
                ID="Atras" 
                runat="server" 
                Text="Atras"
                meta:resourcekey="Btn_Atras"
                AccessKey="B" 
                Visible="False" />
             <asp:Button
                ID="Seleccionar" 
                runat="server"
                AccessKey="S" 
                meta:resourcekey="Btn_Seleccion"
                Visible="False" />
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel 
        ID="UpdatePanel3" 
        runat="server">
        <ContentTemplate>
        
        <koala:KFiltro ID="kftFiltro" 
            runat="server" 
            Contenedor="AUD_AUDITORIA" 
            Objeto="AUD_AUDITORIA" 
            IndiceScope ="Scope"
            Orden="1" ObjectDataSourceID="odsGVAudAuditoria"/> 
        
        
        <asp:Panel 
            runat="server" 
            ID="pnlGrid"
            meta:resourcekey="Rec_Listado_Aud_Par_AuditoriaRecursoKCG">
        
            <koala:KGrid 
                ID="gvAudAuditoria" 
                runat="server" 
                AllowPaging="True" 
                AllowSorting="True"
                AutoGenerateColumns="False" 
                DataKeyNames="Id" 
                AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>'
                DataSourceID="odsGVAudAuditoria">
                
                <AlternatingRowStyle CssClass="alternatingrowstyle" />
                <HeaderStyle CssClass="headerstyle" />
                <PagerStyle CssClass="pagerstyle" />
                
                <Columns>
                    <asp:CommandField 
                        ButtonType="Button" 
                        SelectText="..." 
                        ShowSelectButton="True" />
                    <asp:BoundField 
                        DataField="Codigo" 
                        meta:resourcekey="BoundCodigoRecursoKCG"
                        SortExpression="Codigo_int" >
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField 
                        DataField="Fecha" 
                        meta:resourcekey="BoundFechaRecursoKCG" 
                        SortExpression="Fecha" >
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField 
                        DataField="Accion_Nombre" 
                        meta:resourcekey="BoundAccion_NombreRecursoKCG" 
                        SortExpression="Accion_Nombre" >
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField 
                        DataField="Codigo_Origen" 
                        meta:resourcekey="BoundCodigo_OrigenRecursoKCG"  
                        SortExpression="Codigo_Origen" >
                        <HeaderStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField 
                        DataField="Id_Origen" 
                        meta:resourcekey="BoundId_OrigenRecursoKCG"  
                        SortExpression="Id_Origen" >
                        <HeaderStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField 
                        DataField="Dic_objeto_Nombre" 
                        meta:resourcekey="BoundDic_Objeto_NombreRecursoKCG" 
                        SortExpression="Dic_objeto_Nombre" >
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField 
                        DataField="Int_Usuario_Nombre" 
                        meta:resourcekey="BoundInt_Usuario_NombreRecursoKCG" 
                        SortExpression="Int_Usuario_Nombre" >
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField 
                        DataField="Seg_Rol_Nombre" 
                        meta:resourcekey="BoundSeg_Rol_NombreRecursoKCG"  
                        SortExpression="Seg_Rol_Nombre" >
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField 
                        DataField="dic_modulo_nombre" 
                         meta:resourcekey="BoundDic_Modulo_NombreRecursoKCG"
                        SortExpression="dic_modulo_nombre" >
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField 
                        DataField="estado_Nombre" 
                        HeaderText="estado_Nombre" 
                        SortExpression="estado_Nombre" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Campos" 
                        HeaderText="Campos" 
                        SortExpression="Campos" Visible="False" />
                    <asp:BoundField 
                        DataField="dic_modulo_codigo" 
                        HeaderText="dic_modulo_codigo" 
                        SortExpression="dic_modulo_codigo" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Int_Usuario_Codigo" 
                        HeaderText="Int_Usuario_Codigo" 
                        SortExpression="Int_Usuario_Codigo" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Dic_Objeto_Id" 
                        HeaderText="Dic_Objeto_Id" 
                        SortExpression="Dic_Objeto_Id" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Nombre" 
                        HeaderText="Nombre" 
                        SortExpression="Nombre" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Id" 
                        HeaderText="Id" 
                        SortExpression="Id" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Int_Usuario_Id" 
                        HeaderText="Int_Usuario_Id" 
                        SortExpression="Int_Usuario_Id" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Seg_Rol_Id" 
                        HeaderText="Seg_Rol_Id" 
                        SortExpression="Seg_Rol_Id" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Estado" 
                        HeaderText="Estado" 
                        SortExpression="Estado" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Dic_Modulo_Id" 
                        HeaderText="Dic_Modulo_Id" 
                        SortExpression="Dic_Modulo_Id" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Dic_Objeto_Codigo" 
                        HeaderText="Dic_Objeto_Codigo" 
                        SortExpression="Dic_Objeto_Codigo" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Accion" 
                        HeaderText="Accion" 
                        SortExpression="Accion" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Seg_Rol_Codigo" 
                        HeaderText="Seg_Rol_Codigo" 
                        SortExpression="Seg_Rol_Codigo" 
                        Visible="False" />
                </Columns>
                </koala:KGrid>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:ObjectDataSource 
        ID="odsGVAudAuditoria" 
        runat="server" 
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="Get" 
        TypeName="FEL.AUD.BO_Aud_Auditoria">
        <SelectParameters>
            <asp:SessionParameter 
                Name="s" 
                SessionField="Scope" 
                Type="Object" />
           <asp:Parameter 
                DefaultValue="0000000000000000" 
                Name="Id_Inicial" 
                Type="String" />
            <asp:Parameter 
                DefaultValue="9999999999999999" 
                Name="Id_Final" 
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    
</asp:Content>

