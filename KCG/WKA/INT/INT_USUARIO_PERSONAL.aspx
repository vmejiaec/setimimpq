<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="INT_USUARIO_PERSONAL.aspx.cs" 
    Inherits="INT_INT_USUARIO_PERSONAL" 
    Theme="EstiloKCG"
    StylesheetTheme="EstiloKCG"
    meta:resourcekey="Tit_Int_Usuario_PersonalRecursoKCG" %>
    
<%@ Register 
    Src="../WebUserControls/wucMensajeEliminar.ascx" 
    TagName="wucMensajeEliminar"
    TagPrefix="uc1" %>
    
<%@ Register 
    Src="../WebUserControls/wucMensajeActualizar.ascx" 
    TagName="wucMensajeActualizar"
    TagPrefix="uc2" %>
    
 <%@ Register 
    Assembly="AjaxControlToolkit" 
    Namespace="AjaxControlToolkit" 
    TagPrefix="AjaxControlToolkit" %>

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
                ID="pnlDatos"
                meta:resourcekey="Rec_Int_Usuario_PersonalRecursoKCG"> 
                <asp:FormView 
                    ID="fvint_usuario_personal" 
                    runat="server" 
                    DataSourceID="odsint_usuario_personal"
                    DefaultMode="Insert">
                    <EditItemTemplate>
                        <table>
                            <tr align="right">
                                <td colspan="2">
                                    <asp:Label 
                                        ID="lblestadonombre" 
                                        runat="server" 
                                        Text='<%# Bind("estado_nombre") %>'>
                                    </asp:Label> 
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblcodigo" 
                                        runat="server"                                                                     
                                        Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Codigo" 
                                        runat="server" 
                                        TabIndex="-1"                                   
                                        ReadOnly="true"                                
                                        ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Codigo") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblpersonal" 
                                        runat="server" 
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                        AssociatedControlID="Per_Personal_Codigo"                                                                    
                                        Text='<%# GetLocalResourceObject("Per_Personal_NombreRecursoKCG.Text").ToString() %>'>                                       
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Per_Personal_Codigo" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG"
                                        ToolTip='<%# GetLocalResourceObject("Per_Personal_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Per_Personal_Codigo") %>'>
                                    </asp:TextBox>                        
                                    <asp:TextBox 
                                        ID="Per_Personal_Nombre" 
                                        runat="server"
                                        Width="400px"
                                        CssClass="TEXTO_EDICION_KCG"
                                        ToolTip='<%# GetLocalResourceObject("Per_Personal_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Per_Personal_Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:Button 
                                        ID="Button3" 
                                        runat="server" 
                                        CommandArgument="RutaDestino: ~/PER/PER_PERSONAL.aspx; Filtro: Per_Personal_Nombre; Obtener: Pred_seg_Rol_Nombre|Par_Razon_Social_Nombre, Per_Personal_Codigo|Codigo, Per_Personal_Id|Id;"
                                        CommandName="Zoom" 
                                        Text="..." />
                                </td>
                            </tr> 
                            <tr align="left"> 
                                <td>
                                    <asp:Label 
                                        ID="lblnombre" 
                                        runat="server"                                                                     
                                        Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'>                                                                              
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Nombre" 
                                        runat="server"
                                        Width="400px"
                                        CssClass="TEXTO_EDICION_KCG"
                                        ToolTip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Nombre") %>'>
                                    </asp:TextBox>
                                   <asp:RequiredFieldValidator 
                                        ID="rqvNombre"
                                        runat="server" 
                                        ControlToValidate="Nombre"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="caValidator"
                                        TargetControlID="rqvNombre"/>
                                </td>
                            </tr> 
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblcontraseña" 
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
                                    <asp:RequiredFieldValidator 
                                        ID="rfvPassword"
                                        runat="server" 
                                        ControlToValidate="Password"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="vcePassword"
                                        TargetControlID="rfvPassword"/>
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
                        
                        <%--Id's--%>
                        
                        <asp:TextBox 
                            ID="Pred_Ver_Version_Id" 
                            runat="server"
                            Style="display:none"
                            Visible="true" 
                            Text='<%# Bind("Pred_Ver_Version_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Id" 
                            runat="server" 
                            Style="display:none"
                            Visible="true"
                            Text='<%# Bind("Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Pred_Int_Sucursal_Id" 
                            runat="server" 
                            Style="display:none"
                            Visible="true"
                            Text='<%# Bind("Pred_Int_Sucursal_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="int_empresa_id" 
                            runat="server" 
                            Style="display:none"
                            Visible="true"
                            Text='<%# Bind("int_empresa_id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Per_Personal_Id" 
                            runat="server" 
                            Style="display:none"
                            Visible="true"
                            Text='<%# Bind("Per_Personal_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Pred_Seg_Rol_Id" 
                            runat="server" 
                            Style="display:none"
                            Visible="true"
                            Text='<%# Bind("Pred_Seg_Rol_Id") %>'>
                        </asp:TextBox>
                        <%--CAMPOS NO VISIBLES--%>
                    
                        <asp:TextBox 
                            ID="Pred_Ver_Version_Abreviatura" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Pred_Ver_Version_Abreviatura") %>'>
                        </asp:TextBox>                                        
                        <asp:TextBox 
                            ID="Usuario_Id_Ref" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Usuario_Id_Ref") %>'>
                        </asp:TextBox>                    
                        <asp:TextBox 
                            ID="Pred_ver_version_nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Pred_ver_version_nombre") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Estado" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Estado") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Salt" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Salt") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="int_empresa_codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("int_empresa_codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Pred_ver_version_codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Pred_ver_version_codigo") %>'>
                        </asp:TextBox>                    
                        <asp:TextBox 
                            ID="int_empresa_nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("int_empresa_nombre") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Pred_seg_Rol_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Pred_seg_Rol_Codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Pred_int_Usuario_codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Pred_int_Usuario_codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="estado_nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("estado_nombre") %>'>
                        </asp:TextBox>                    
                        <asp:TextBox 
                            ID="Pred_Int_Usuario_nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Pred_Int_Usuario_nombre") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Pred_seg_Rol_Nombre" 
                            runat="server"
                            Visible="false"
                            Text='<%# Bind("Pred_seg_Rol_Nombre") %>'>
                        </asp:TextBox>     
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <table>
                            <tr align="right">
                                <td colspan="2">
                                    <asp:Label 
                                        ID="lblestadonombre" 
                                        runat="server" 
                                        Text='<%# Bind("estado_nombre") %>'>
                                    </asp:Label> 
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblcodigo" 
                                        runat="server" 
                                        Visible="false"                                    
                                        Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Codigo" 
                                        runat="server"
                                        ReadOnly="true"
                                        Visible="false"
                                        ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Codigo") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblpersonal" 
                                        runat="server" 
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                        AssociatedControlID="Per_Personal_Codigo"                                                                    
                                        Text='<%# GetLocalResourceObject("Per_Personal_NombreRecursoKCG.Text").ToString() %>'>                                       
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Per_Personal_Codigo" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG"
                                        ToolTip='<%# GetLocalResourceObject("Per_Personal_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Per_Personal_Codigo") %>'>
                                    </asp:TextBox>                        
                                    <asp:TextBox 
                                        ID="Per_Personal_Nombre" 
                                        runat="server"
                                        Width="400px"
                                        CssClass="TEXTO_EDICION_KCG" 
                                        ToolTip='<%# GetLocalResourceObject("Per_Personal_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Per_Personal_Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:Button 
                                        ID="Button3" 
                                        runat="server" 
                                        CommandArgument="RutaDestino: ~/PER/PER_PERSONAL.aspx; Filtro: Per_Personal_Nombre; Obtener: Pred_seg_Rol_Nombre|Par_Razon_Social_Nombre, Per_Personal_Codigo|Codigo, Per_Personal_Id|Id;"
                                        CommandName="Zoom" 
                                        Text="..." />
                                </td>
                            </tr> 
                            <tr align="left"> 
                                <td>
                                    <asp:Label 
                                        ID="lblnombre" 
                                        runat="server"                                                                     
                                        Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'>                                      
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Nombre" 
                                        runat="server"
                                        Width="400px"
                                        CssClass="TEXTO_EDICION_KCG"
                                        ToolTip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        ID="rqvNombre"
                                        runat="server" 
                                        ControlToValidate="Nombre"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="caValidator"
                                        TargetControlID="rqvNombre"/>
                                </td>
                            </tr> 
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblcontraseña" 
                                        runat="server"                                                                     
                                        Text='<%# GetLocalResourceObject("PasswordRecursoKCG.Text").ToString() %>'>                                       
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Password" 
                                        runat="server"
                                        CssClass="TEXTO_EDICION_KCG" 
                                        ToolTip='<%# GetLocalResourceObject("PasswordRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Password") %>'
                                        TextMode="Password"> 
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        ID="rfvPassword"
                                        runat="server" 
                                        ControlToValidate="Password"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="vcePassword"
                                        TargetControlID="rfvPassword"/>
                                </td>
                            </tr> 
                        </table> 
                        <table>   
                            <tr>
                                <td colspan="2">
                                    <asp:Button 
                                            ID="InsertButton" 
                                            runat="server" 
                                            CausesValidation="True" 
                                            CommandName="Insert"
                                            ValidationGroup="I"
                                            AccessKey="I"
                                            Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_InsertRecursoKCG.Text").ToString() %>'
                                            ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_InsertRecursoKCG.ToolTip").ToString() %>'>
                                     </asp:Button>
                                    <asp:Button 
                                            ID="InsertCancelButton" 
                                            runat="server" 
                                            CausesValidation="False" 
                                            CommandName="Cancel"
                                            AccessKey="C"
                                            Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_CancelRecursoKCG.Text").ToString() %>'
                                            ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_CancelRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:Button>
                                </td>
                            </tr>
                        </table>
                             
                        <%--Id's--%>
                        
                        <asp:TextBox 
                            ID="Pred_Ver_Version_Id" 
                            runat="server"
                            Style="display:none"
                            Visible="true" 
                            Text='<%# Bind("Pred_Ver_Version_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Id" 
                            runat="server" 
                            Style="display:none"
                            Visible="true"
                            Text='<%# Bind("Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Pred_Int_Sucursal_Id" 
                            runat="server" 
                            Style="display:none"
                            Visible="true"
                            Text='<%# Bind("Pred_Int_Sucursal_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="int_empresa_id" 
                            runat="server" 
                            Style="display:none"
                            Visible="true"
                            Text='<%# Bind("int_empresa_id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Per_Personal_Id" 
                            runat="server" 
                            Style="display:none"
                            Visible="true"
                            Text='<%# Bind("Per_Personal_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Pred_Seg_Rol_Id" 
                            runat="server" 
                            Style="display:none"
                            Visible="true"
                            Text='<%# Bind("Pred_Seg_Rol_Id") %>'>
                        </asp:TextBox>
                        <%--CAMPOS NO VISIBLES--%>
                    
                        <asp:TextBox 
                            ID="Pred_Ver_Version_Abreviatura" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Pred_Ver_Version_Abreviatura") %>'>
                        </asp:TextBox>                                        
                        <asp:TextBox 
                            ID="Usuario_Id_Ref" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Usuario_Id_Ref") %>'>
                        </asp:TextBox>                    
                        <asp:TextBox 
                            ID="Pred_ver_version_nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Pred_ver_version_nombre") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Estado" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Estado") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Salt" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Salt") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="int_empresa_codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("int_empresa_codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Pred_ver_version_codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Pred_ver_version_codigo") %>'>
                        </asp:TextBox>                    
                        <asp:TextBox 
                            ID="int_empresa_nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("int_empresa_nombre") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Pred_seg_Rol_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Pred_seg_Rol_Codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Pred_int_Usuario_codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Pred_int_Usuario_codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="estado_nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("estado_nombre") %>'>
                        </asp:TextBox>                    
                        <asp:TextBox 
                            ID="Pred_Int_Usuario_nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Pred_Int_Usuario_nombre") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Pred_seg_Rol_Nombre" 
                            runat="server"
                            Visible="false"
                            Text='<%# Bind("Pred_seg_Rol_Nombre") %>'>
                        </asp:TextBox> 
                    </InsertItemTemplate>
                    <ItemTemplate>                
                        <table>
                            <tr align="right">
                                <td colspan="2">
                                    <asp:Label 
                                        ID="lblestadonombre" 
                                        runat="server" 
                                        Text='<%# Bind("estado_nombre") %>'>
                                    </asp:Label> 
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblcodigo" 
                                        runat="server"                                                                     
                                        Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Codigo" 
                                        TabIndex="-1"
                                        runat="server"                                
                                        ReadOnly="true"                                
                                        ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Codigo") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblpersonal" 
                                        runat="server"                                                                     
                                        Text='<%# GetLocalResourceObject("Per_Personal_NombreRecursoKCG.Text").ToString() %>'>                                       
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Per_Personal_Codigo" 
                                        runat="server"
                                        TabIndex="-1"
                                        ReadOnly="true" 
                                        ToolTip='<%# GetLocalResourceObject("Per_Personal_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Per_Personal_Codigo") %>'>
                                    </asp:TextBox>                        
                                    <asp:TextBox 
                                        ID="Per_Personal_Nombre" 
                                        runat="server" 
                                        TabIndex="-1"
                                        ReadOnly="true"
                                        Width="400px"
                                        ToolTip='<%# GetLocalResourceObject("Per_Personal_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Per_Personal_Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:Button 
                                        ID="Button3" 
                                         TabIndex="-1"
                                        runat="server" 
                                        CommandArgument="RutaDestino: ~/PER/PER_PERSONAL.aspx; Filtro: Per_Personal_Nombre; Obtener: Pred_seg_Rol_Nombre|Par_Razon_Social_Nombre, Per_Personal_Codigo|Codigo, Per_Personal_Id|Id;"
                                        CommandName="Zoom"
                                        Enabled="false"
                                        Text="..." />                                 
                                </td>
                            </tr> 
                            <tr align="left"> 
                                <td>
                                    <asp:Label 
                                        ID="lblnombre" 
                                        runat="server"                                                                     
                                        Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'>                                      
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Nombre" 
                                        TabIndex="-1"
                                        runat="server" 
                                        ReadOnly="true"
                                        Width="400px"
                                        ToolTip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Nombre") %>'>
                                    </asp:TextBox>                                  
                                </td>
                            </tr> 
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblcontraseña" 
                                        runat="server"                                                                     
                                        Text='<%# GetLocalResourceObject("PasswordRecursoKCG.Text").ToString() %>'>                                       
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Password" 
                                        TabIndex="-1"
                                        runat="server" 
                                        ReadOnly="true"
                                        ToolTip='<%# GetLocalResourceObject("PasswordRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Password") %>'>                                    
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
                                        <asp:Button 
                                            ID="DeleteButton" 
                                            runat="server" 
                                            CausesValidation="False" 
                                            CommandName="Delete"
                                            AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_EliminarRecursoKCG.AccesKey").ToString() %>'  
                                            Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_DeleteRecursoKCG.Text").ToString() %>'
                                            ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_DeleteRecursoKCG.ToolTip").ToString() %>'>
                                        </asp:Button>
                                        <asp:Button 
                                            ID="NewButton" 
                                            runat="server" 
                                            CausesValidation="False" 
                                            CommandName="New"
                                            AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_NuevoRecursoKCG.AccesKey").ToString() %>'  
                                            Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_NewRecursoKCG.Text").ToString() %>'
                                            ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_NewRecursoKCG.ToolTip").ToString() %>'>
                                        </asp:Button>
                                        <uc1:wucMensajeEliminar ID="WucMensajeEliminar1" runat="server" />
                                    </td>
                                </tr>
                        </table>
                        <%--Id's--%>
                        
                        <asp:TextBox 
                            ID="Pred_Ver_Version_Id" 
                            runat="server"
                            Style="display:none"
                            Visible="true" 
                            Text='<%# Bind("Pred_Ver_Version_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Id" 
                            runat="server" 
                            Style="display:none"
                            Visible="true"
                            Text='<%# Bind("Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Pred_Int_Sucursal_Id" 
                            runat="server" 
                            Style="display:none"
                            Visible="true"
                            Text='<%# Bind("Pred_Int_Sucursal_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="int_empresa_id" 
                            runat="server" 
                            Style="display:none"
                            Visible="true"
                            Text='<%# Bind("int_empresa_id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Per_Personal_Id" 
                            runat="server" 
                            Style="display:none"
                            Visible="true"
                            Text='<%# Bind("Per_Personal_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Pred_Seg_Rol_Id" 
                            runat="server" 
                            Style="display:none"
                            Visible="true"
                            Text='<%# Bind("Pred_Seg_Rol_Id") %>'>
                        </asp:TextBox>
                        <%--CAMPOS NO VISIBLES--%>
                    
                        <asp:TextBox 
                            ID="Pred_Ver_Version_Abreviatura" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Pred_Ver_Version_Abreviatura") %>'>
                        </asp:TextBox>                                        
                        <asp:TextBox 
                            ID="Usuario_Id_Ref" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Usuario_Id_Ref") %>'>
                        </asp:TextBox>                    
                        <asp:TextBox 
                            ID="Pred_ver_version_nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Pred_ver_version_nombre") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Estado" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Estado") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Salt" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Salt") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="int_empresa_codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("int_empresa_codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Pred_ver_version_codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Pred_ver_version_codigo") %>'>
                        </asp:TextBox>                    
                        <asp:TextBox 
                            ID="int_empresa_nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("int_empresa_nombre") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Pred_seg_Rol_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Pred_seg_Rol_Codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Pred_int_Usuario_codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Pred_int_Usuario_codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="estado_nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("estado_nombre") %>'>
                        </asp:TextBox>                    
                        <asp:TextBox 
                            ID="Pred_Int_Usuario_nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Pred_Int_Usuario_nombre") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Pred_seg_Rol_Nombre" 
                            runat="server"
                            Visible="false"
                            Text='<%# Bind("Pred_seg_Rol_Nombre") %>'>
                        </asp:TextBox> 
                    </ItemTemplate>
                </asp:FormView>
            </asp:Panel>
        </ContentTemplate> 
        <Triggers>
            <asp:AsyncPostBackTrigger 
                ControlID="gvint_usuario_personal" 
                EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:ObjectDataSource 
        ID="odsint_usuario_personal" 
        runat="server" 
        ConflictDetection="CompareAllValues" 
        OldValuesParameterFormatString="original{0}"
        SelectMethod="GetById" 
        SortParameterName="sortExpression" 
        TypeName="FEL.INT.BO_Int_Usuario" 
        DeleteMethod="Delete" 
        InsertMethod="Insert" 
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
    <asp:UpdatePanel 
        ID="UpdatePanel2" 
        runat="server">
        <ContentTemplate>
            <asp:Button 
                ID="Atras" 
                runat="server" 
                Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_AtrasRecursoKCG.Text").ToString() %>'
                ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_AtrasRecursoKCG.ToolTip").ToString() %>'  
                Visible="False" />
            <asp:Button 
                ID="Seleccionar" 
                runat="server" 
                Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_SeleccionRecursoKCG.Text").ToString() %>'
                ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_SeleccionRecursoKCG.ToolTip").ToString() %>' 
                Visible="False" />
        </ContentTemplate> 
    </asp:UpdatePanel> 
    <asp:UpdatePanel
        ID="UpdatePanel3" 
        runat="server">        
        <ContentTemplate>
            <koala:KNavegacion 
                ID="nav"
                runat="server"
                GridViewID="gvint_usuario_personal"
                FormViewID="FormView1" 
                OnNavegar="nav_Siguiente" />
            <koala:KFiltro 
                ID="kftFiltro" 
                runat="server" 
                Contenedor="INT_USUARIO_PERSONAL" 
                Objeto="INT_USUARIO" 
                IndiceScope ="Scope"
                Orden="1"
                ObjectDataSourceID="odsgvint_usuario_personal" />
            <asp:Panel 
                runat="server"
                id="pnlDatosGrid"
                meta:resourcekey="Rec_Listado_Int_Usuario_PersonalRecursoKCG">
                <koala:KGrid  
                    ID="gvint_usuario_personal" 
                    runat="server"                   
                    AllowPaging="True" 
                    AllowSorting="True"
                    AutoGenerateColumns="False"
                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>'
                    DataKeyNames="Id" 
                    DataSourceID="odsgvint_usuario_personal">             
                    <AlternatingRowStyle CssClass="alternatingrowstyle" />
                    <HeaderStyle CssClass="headerstyle" />
                    <PagerStyle CssClass="pagerstyle" />
                    <SelectedRowStyle CssClass="selectedrowstyle" />
                    <Columns>
                        <asp:CommandField 
                        ButtonType="Button" 
                        SelectText="..." 
                        ShowSelectButton="True" />
                    <asp:BoundField 
                        DataField="Codigo" 
                        meta:resourcekey="BoundCodigoRecursoKCG"
                        SortExpression="Codigo" >
                        <itemstyle horizontalalign="Right" />
                    </asp:BoundField>
                    <asp:BoundField 
                        DataField="Nombre" 
                        meta:resourcekey="BoundNombreRecursoKCG" 
                        SortExpression="Nombre" >
                        <itemstyle Width="80mm" />
                    </asp:BoundField>
                    <asp:BoundField 
                        DataField="Per_Personal_Nombre" 
                        meta:resourcekey="BoundPer_Personal_NombreRecursoKCG"
                        SortExpression="Per_Personal_Nombre" >
                        <itemstyle Width="80mm" />
                    </asp:BoundField>
                    <asp:BoundField 
                        DataField="Pred_Ver_Version_Abreviatura" 
                        HeaderText="Pred_Ver_Version_Abreviatura"
                        SortExpression="Pred_Ver_Version_Abreviatura" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Pred_Ver_Version_Id" 
                        HeaderText="Pred_Ver_Version_Id"
                        SortExpression="Pred_Ver_Version_Id" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Usuario_Id_Ref" 
                        HeaderText="Usuario_Id_Ref" 
                        SortExpression="Usuario_Id_Ref"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Password" 
                        HeaderText="Password" 
                        SortExpression="Password"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Per_Personal_Codigo" 
                        HeaderText="Per_Personal_Codigo"
                        SortExpression="Per_Personal_Codigo" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Id" 
                        HeaderText="Id" 
                        SortExpression="Id" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Pred_Int_Sucursal_Id" 
                        HeaderText="Pred_Int_Sucursal_Id"
                        SortExpression="Pred_Int_Sucursal_Id" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="int_empresa_id" 
                        HeaderText="int_empresa_id" 
                        SortExpression="int_empresa_id"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Pred_ver_version_nombre" 
                        HeaderText="Pred_ver_version_nombre"
                        SortExpression="Pred_ver_version_nombre" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Estado" 
                        HeaderText="Estado" 
                        SortExpression="Estado" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Salt" 
                        HeaderText="Salt" 
                        SortExpression="Salt" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="int_empresa_codigo" 
                        HeaderText="int_empresa_codigo" 
                        SortExpression="int_empresa_codigo"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Pred_ver_version_codigo" 
                        HeaderText="Pred_ver_version_codigo"
                        SortExpression="Pred_ver_version_codigo" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Per_Personal_Id" 
                        HeaderText="Per_Personal_Id" 
                        SortExpression="Per_Personal_Id"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="int_empresa_nombre" 
                        HeaderText="int_empresa_nombre" 
                        SortExpression="int_empresa_nombre"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Pred_seg_Rol_Codigo" 
                        HeaderText="Pred_seg_Rol_Codigo"
                        SortExpression="Pred_seg_Rol_Codigo" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Pred_int_Usuario_codigo" 
                        HeaderText="Pred_int_Usuario_codigo"
                        SortExpression="Pred_int_Usuario_codigo" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="estado_nombre" 
                        HeaderText="estado_nombre" 
                        SortExpression="estado_nombre"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Pred_Seg_Rol_Id" 
                        HeaderText="Pred_Seg_Rol_Id" 
                        SortExpression="Pred_Seg_Rol_Id"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Pred_Int_Usuario_nombre" 
                        HeaderText="Pred_Int_Usuario_nombre"
                        SortExpression="Pred_Int_Usuario_nombre" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Pred_seg_Rol_Nombre" 
                        HeaderText="Pred_seg_Rol_Nombre"
                        SortExpression="Pred_seg_Rol_Nombre" 
                        Visible="False" />
                    </Columns>
                </koala:KGrid>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>  
    <asp:ObjectDataSource 
        ID="odsgvint_usuario_personal" 
        runat="server" 
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="Get" 
        TypeName="FEL.INT.BO_Int_Usuario">
        <SelectParameters>
            <asp:SessionParameter 
                Name="s" 
                SessionField="Scope" 
                Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

