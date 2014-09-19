<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="INT_USUARIO_CLAVE.aspx.cs" 
    Inherits="INT_INT_USUARIO_CLAVE" 
    Theme="EstiloKCG"
    StylesheetTheme="EstiloKCG"
    meta:resourcekey="Tit_Int_Usuario_ClaveRecursoKCG" %>

<%@ Register 
    Src="../WebUserControls/wucMensajeEliminar.ascx" 
    TagName="wucMensajeEliminar"
    TagPrefix="uc1" %>
    
<%@ Register 
    Src="../WebUserControls/wucMensajeActualizar.ascx" 
    TagName="wucMensajeActualizar"
    TagPrefix="uc2" %>
    
<%@ Register tagprefix="koala" 
    assembly="KoalaWebControls" 
    namespace="Koala.KoalaWebControls" %> 
<%@ Register 
    Assembly="AjaxControlToolkit" 
    Namespace="AjaxControlToolkit" 
    TagPrefix="AjaxControlToolkit" %>

<asp:Content 
    ID="Content1" 
    ContentPlaceHolderID="ContentPlaceHolder1" 
    Runat="Server">
    <asp:UpdatePanel 
        ID="UpdatePanel1"
        runat="server">
        <ContentTemplate>
            <asp:Panel 
                ID="Rec_Int_Usuario_Clave_Usuario" 
                runat="server" 
                meta:resourcekey="Rec_Int_Usuario_Clave_UsuarioRecursoKCG">
                <asp:FormView 
                    ID="fvIntUsuarioClave" 
                    runat="server" 
                    DataSourceID="odsIntUsuarioClave" 
                    DefaultMode="ReadOnly">
                    <EditItemTemplate>
                        <table>
                            <tr>
                                <td
                                    align="right" 
                                    colspan="2" >
                                    <asp:Label 
                                        ID="estado_nombre" 
                                        runat="server" 
                                        CssClass="ESTADO"
                                        Text='<%# Bind("estado_nombre") %>'>
                                    </asp:Label>                                                                
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lblUsuario" 
                                        runat="server"                                                                     
                                        Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'>                                     
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Nombre" 
                                        runat="server" 
                                        TabIndex="-1"                                   
                                        ReadOnly="true"                                
                                        ToolTip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lblContrasenia" 
                                        runat="server"                                                                     
                                        Text='<%# GetLocalResourceObject("PasswordRecursoKCG.Text").ToString() %>'>                                     
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Password" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG"
                                        TextMode="Password"                                
                                        ToolTip='<%# GetLocalResourceObject("PasswordRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Password") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lblConfirmarContrasenia" 
                                        runat="server"                                                                     
                                        Text='<%# GetLocalResourceObject("ConfirmacionRecursoKCG.Text").ToString() %>'>                                     
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="txtConfirmarContrasenia" 
                                        runat="server"
                                        CssClass="TEXTO_EDICION_KCG"
                                        TextMode="Password" 
                                        ToolTip='<%# GetLocalResourceObject("ConfirmacionRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:TextBox>
                                    <asp:CompareValidator 
                                        ID="valCompare" 
                                        runat="server" 
                                        ControlToValidate="txtConfirmarContrasenia"
                                        ControlToCompare="Password"
                                        Operator="Equal"  
                                        ValidationGroup="I"                                      
                                        Display="dynamic" 
                                        ErrorMessage="Contraseña y Confirmación no coinciden"
                                        Text="*">          
                                    </asp:CompareValidator>
                                    <AjaxControlToolkit:validatorcalloutextender 
                                        runat="Server" 
                                        id="vcevalCompare"
                                        targetcontrolid="valCompare"/>
                                </td>
                            </tr>
                            <tr align="left">
                                <td colspan="2" >
                                    <asp:Button 
                                        ID="UpdateButton" 
                                        runat="server"
                                        ValidationGroup="I" 
                                        CausesValidation="True" 
                                        CommandName="Update"
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_ActualizarRecursoKCG.AccesKey").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_UpdateRecursoKCG.Text").ToString() %>'
                                        ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_UpdateRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:Button>
                                    <asp:Button 
                                        ID="UpdateCancelButton" 
                                        runat="server"
                                        CausesValidation="False" 
                                        CommandName="Cancel"
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_CancelarRecursoKCG.AccesKey").ToString() %>' 
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_CancelRecursoKCG.Text").ToString() %>'
                                        ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_CancelRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:Button>
                                    <uc2:wucMensajeActualizar ID="WucMensajeActualizar1" runat="server" />
                                </td>
                            </tr> 
                        </table>
                        
                      <%--  Ids--%>
                      <asp:TextBox 
                            ID="Pred_Ver_Version_Id" 
                            runat="server"
                            style="display:none" 
                            Text='<%# Bind("Pred_Ver_Version_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Usuario_Id_Ref" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Usuario_Id_Ref") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Id" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Pred_Int_Sucursal_Id" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Pred_Int_Sucursal_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="int_empresa_id" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("int_empresa_id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Per_Personal_Id" 
                            runat="server"
                            style="display:none" 
                            Text='<%# Bind("Per_Personal_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Pred_Seg_Rol_Id" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Pred_Seg_Rol_Id") %>'>
                        </asp:TextBox>
                        
                       <%-- Ocultos--%>
                        <asp:TextBox 
                            ID="Codigo" 
                            runat="server"
                            visible="false" 
                            Text='<%# Bind("Codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Pred_Ver_Version_Abreviatura" 
                            runat="server"
                            visible="false" 
                            Text='<%# Bind("Pred_Ver_Version_Abreviatura") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Per_Personal_Codigo" 
                            runat="server" 
                            visible="false"
                            Text='<%# Bind("Per_Personal_Codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Per_Personal_Nombre" 
                            runat="server" 
                            visible="false"
                            Text='<%# Bind("Per_Personal_Nombre") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Codigo_int" 
                            runat="server"
                            visible="false" 
                            Text='<%# Bind("Codigo_int") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Pred_ver_version_nombre" 
                            runat="server"
                            visible="false"
                            Text='<%# Bind("Pred_ver_version_nombre") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Estado"
                            runat="server" 
                            visible="false"
                            Text='<%# Bind("Estado") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Salt" 
                            runat="server" 
                            visible="false" 
                            Text='<%# Bind("Salt") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="int_empresa_codigo" 
                            runat="server" 
                            visible="false" 
                            Text='<%# Bind("int_empresa_codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Pred_ver_version_codigo" 
                            runat="server" 
                            visible="false" 
                            Text='<%# Bind("Pred_ver_version_codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="int_empresa_nombre" 
                            runat="server" 
                            visible="false" 
                            Text='<%# Bind("int_empresa_nombre") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Pred_seg_Rol_Codigo" 
                            runat="server" 
                            visible="false" 
                            Text='<%# Bind("Pred_seg_Rol_Codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Pred_int_Usuario_codigo" 
                            runat="server" 
                            visible="false" 
                            Text='<%# Bind("Pred_int_Usuario_codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Pred_Int_Usuario_nombre" 
                            runat="server" 
                            visible="false" 
                            Text='<%# Bind("Pred_Int_Usuario_nombre") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Pred_seg_Rol_Nombre" 
                            runat="server" 
                            visible="false" 
                            Text='<%# Bind("Pred_seg_Rol_Nombre") %>'>
                        </asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                       <table>
                            <tr>
                                <td
                                    align="right" 
                                    colspan="2" >
                                    <asp:Label 
                                        ID="estado_nombre" 
                                        runat="server" 
                                        CssClass="ESTADO"
                                        Text='<%# Bind("estado_nombre") %>'>
                                    </asp:Label>                                                                
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lblUsuario" 
                                        runat="server"                                                                     
                                        Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'>                                     
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Nombre" 
                                        runat="server" 
                                        TabIndex="-1"                                   
                                        ReadOnly="true"                                
                                        ToolTip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lblContrasenia" 
                                        runat="server"                                                                     
                                        Text='<%# GetLocalResourceObject("PasswordRecursoKCG.Text").ToString() %>'>                                     
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Password" 
                                        runat="server" 
                                        TabIndex="-1"                                   
                                        ReadOnly="true"
                                        TextMode="Password"                                
                                        ToolTip='<%# GetLocalResourceObject("PasswordRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Password") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lblConfirmarContrasenia" 
                                        runat="server"                                                                     
                                        Text='<%# GetLocalResourceObject("ConfirmacionRecursoKCG.Text").ToString() %>'>                                     
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="txtConfirmarContrasenia" 
                                        runat="server"
                                        TabIndex="-1"                                   
                                        ReadOnly="true"
                                        TextMode="Password" 
                                        ToolTip='<%# GetLocalResourceObject("ConfirmacionRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:TextBox>
                                    <asp:CompareValidator 
                                        ID="valCompare" 
                                        runat="server" 
                                        ControlToValidate="txtConfirmarContrasenia"
                                        ControlToCompare="Password"
                                        Operator="Equal"  
                                        ValidationGroup="I"                                      
                                        Display="dynamic" 
                                        ErrorMessage="Contraseña y Confirmación no coinciden"
                                        Text="*">          
                                    </asp:CompareValidator>
                                    <AjaxControlToolkit:validatorcalloutextender 
                                        runat="Server" 
                                        id="vcevalCompare"
                                        targetcontrolid="valCompare"/>
                                </td>
                            </tr>
                        </table>
                        
                      <%--  Ids--%>
                      <asp:TextBox 
                            ID="Pred_Ver_Version_Id" 
                            runat="server"
                            style="display:none" 
                            Text='<%# Bind("Pred_Ver_Version_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Usuario_Id_Ref" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Usuario_Id_Ref") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Id" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Pred_Int_Sucursal_Id" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Pred_Int_Sucursal_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="int_empresa_id" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("int_empresa_id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Per_Personal_Id" 
                            runat="server"
                            style="display:none" 
                            Text='<%# Bind("Per_Personal_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Pred_Seg_Rol_Id" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Pred_Seg_Rol_Id") %>'>
                        </asp:TextBox>
                        
                       <%-- Ocultos--%>
                        <asp:TextBox 
                            ID="Codigo" 
                            runat="server"
                            visible="false" 
                            Text='<%# Bind("Codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Pred_Ver_Version_Abreviatura" 
                            runat="server"
                            visible="false" 
                            Text='<%# Bind("Pred_Ver_Version_Abreviatura") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Per_Personal_Codigo" 
                            runat="server" 
                            visible="false"
                            Text='<%# Bind("Per_Personal_Codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Per_Personal_Nombre" 
                            runat="server" 
                            visible="false"
                            Text='<%# Bind("Per_Personal_Nombre") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Codigo_int" 
                            runat="server"
                            visible="false" 
                            Text='<%# Bind("Codigo_int") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Pred_ver_version_nombre" 
                            runat="server"
                            visible="false"
                            Text='<%# Bind("Pred_ver_version_nombre") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Estado"
                            runat="server" 
                            visible="false"
                            Text='<%# Bind("Estado") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Salt" 
                            runat="server" 
                            visible="false" 
                            Text='<%# Bind("Salt") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="int_empresa_codigo" 
                            runat="server" 
                            visible="false" 
                            Text='<%# Bind("int_empresa_codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Pred_ver_version_codigo" 
                            runat="server" 
                            visible="false" 
                            Text='<%# Bind("Pred_ver_version_codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="int_empresa_nombre" 
                            runat="server" 
                            visible="false" 
                            Text='<%# Bind("int_empresa_nombre") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Pred_seg_Rol_Codigo" 
                            runat="server" 
                            visible="false" 
                            Text='<%# Bind("Pred_seg_Rol_Codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Pred_int_Usuario_codigo" 
                            runat="server" 
                            visible="false" 
                            Text='<%# Bind("Pred_int_Usuario_codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Pred_Int_Usuario_nombre" 
                            runat="server" 
                            visible="false" 
                            Text='<%# Bind("Pred_Int_Usuario_nombre") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Pred_seg_Rol_Nombre" 
                            runat="server" 
                            visible="false" 
                            Text='<%# Bind("Pred_seg_Rol_Nombre") %>'>
                        </asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <table>
                            <tr>
                                <td
                                    align="right" 
                                    colspan="2" >
                                    <asp:Label 
                                        ID="estado_nombre" 
                                        runat="server" 
                                        CssClass="ESTADO"
                                        Text='<%# Bind("estado_nombre") %>'>
                                    </asp:Label>                                                                
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lblUsuario" 
                                        runat="server"                                                                     
                                        Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'>                                     
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Nombre" 
                                        runat="server" 
                                        TabIndex="-1"                                   
                                        ReadOnly="true"                                
                                        ToolTip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lblContrasenia" 
                                        runat="server"                                                                     
                                        Text='<%# GetLocalResourceObject("PasswordRecursoKCG.Text").ToString() %>'>                                     
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Password" 
                                        runat="server" 
                                        TabIndex="-1"                                   
                                        TextMode="Password"                                
                                        ToolTip='<%# GetLocalResourceObject("PasswordRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Password") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lblConfirmarContrasenia" 
                                        runat="server"                                                                     
                                        Text='<%# GetLocalResourceObject("ConfirmacionRecursoKCG.Text").ToString() %>'>                                     
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="txtConfirmarContrasenia" 
                                        runat="server"
                                        TabIndex="-1"                                   
                                        ReadOnly="true"
                                        TextMode="Password" 
                                        ToolTip='<%# GetLocalResourceObject("ConfirmacionRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr align="left">
                                <td colspan="2">
                                    <asp:Button 
                                        ID="EditButton" 
                                        runat="server"
                                        CausesValidation="False" 
                                        CommandName="Edit"
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_EditarRecursoKCG.AccesKey").ToString() %>'  
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_EditRecursoKCG.Text").ToString() %>'
                                        ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_EditRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:Button>
                                    <%--<asp:Button 
                                        ID="DeleteButton" 
                                        runat="server" 
                                        CausesValidation="False" 
                                        CommandName="Delete"
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_EliminarRecursoKCG.AccesKey").ToString() %>'  
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_DeleteRecursoKCG.Text").ToString() %>'
                                        ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_DeleteRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:Button>--%>
                                    <%--<uc1:wucMensajeEliminar ID="WucMensajeEliminar1" runat="server" />--%>
                                </td>
                            </tr>
                        </table>
                        
                      <%--  Ids--%>
                      <asp:TextBox 
                            ID="Pred_Ver_Version_Id" 
                            runat="server"
                            style="display:none" 
                            Text='<%# Bind("Pred_Ver_Version_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Usuario_Id_Ref" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Usuario_Id_Ref") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Id" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Pred_Int_Sucursal_Id" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Pred_Int_Sucursal_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="int_empresa_id" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("int_empresa_id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Per_Personal_Id" 
                            runat="server"
                            style="display:none" 
                            Text='<%# Bind("Per_Personal_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Pred_Seg_Rol_Id" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Pred_Seg_Rol_Id") %>'>
                        </asp:TextBox>
                        
                       <%-- Ocultos--%>
                        <asp:TextBox 
                            ID="Codigo" 
                            runat="server"
                            visible="false"
                            Text='<%# Bind("Codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Pred_Ver_Version_Abreviatura" 
                            runat="server"
                            visible="false" 
                            Text='<%# Bind("Pred_Ver_Version_Abreviatura") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Per_Personal_Codigo" 
                            runat="server" 
                            visible="false"
                            Text='<%# Bind("Per_Personal_Codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Per_Personal_Nombre" 
                            runat="server" 
                            visible="false"
                            Text='<%# Bind("Per_Personal_Nombre") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Codigo_int" 
                            runat="server"
                            visible="false" 
                            Text='<%# Bind("Codigo_int") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Pred_ver_version_nombre" 
                            runat="server"
                            visible="false"
                            Text='<%# Bind("Pred_ver_version_nombre") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Estado"
                            runat="server" 
                            visible="false"
                            Text='<%# Bind("Estado") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Salt" 
                            runat="server" 
                            visible="false" 
                            Text='<%# Bind("Salt") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="int_empresa_codigo" 
                            runat="server" 
                            visible="false" 
                            Text='<%# Bind("int_empresa_codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Pred_ver_version_codigo" 
                            runat="server" 
                            visible="false" 
                            Text='<%# Bind("Pred_ver_version_codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="int_empresa_nombre" 
                            runat="server" 
                            visible="false" 
                            Text='<%# Bind("int_empresa_nombre") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Pred_seg_Rol_Codigo" 
                            runat="server" 
                            visible="false" 
                            Text='<%# Bind("Pred_seg_Rol_Codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Pred_int_Usuario_codigo" 
                            runat="server" 
                            visible="false" 
                            Text='<%# Bind("Pred_int_Usuario_codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Pred_Int_Usuario_nombre" 
                            runat="server" 
                            visible="false" 
                            Text='<%# Bind("Pred_Int_Usuario_nombre") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Pred_seg_Rol_Nombre" 
                            runat="server" 
                            visible="false" 
                            Text='<%# Bind("Pred_seg_Rol_Nombre") %>'>
                        </asp:TextBox>
                    </ItemTemplate>
                </asp:FormView>
                <asp:ObjectDataSource 
                    ID="odsIntUsuarioClave" 
                    runat="server" 
                    ConflictDetection="CompareAllValues" 
                    OldValuesParameterFormatString="original{0}" 
                    SelectMethod="GetById" 
                    SortParameterName="SortExpression" 
                    TypeName="FEL.INT.BO_Int_Usuario" 
                    UpdateMethod="Update">
                    <SelectParameters>
                        <asp:SessionParameter 
                            Name="s" 
                            SessionField="Scope" 
                            Type="Object" />
                        <asp:Parameter 
                            Name="Id" 
                            Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

