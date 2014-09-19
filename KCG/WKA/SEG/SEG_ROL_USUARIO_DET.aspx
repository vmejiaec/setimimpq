<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="SEG_ROL_USUARIO_DET.aspx.cs" 
    Inherits="SEG_SEG_ROL_USUARIO_DET" 
    StylesheetTheme="EstiloKCG"
    Theme="EstiloKCG"
    meta:resourcekey="Tit_Seg_Rol_Usuario_DetRecursoKCG" %>

<%@ Register 
    tagprefix="koala" 
    assembly="KoalaWebControls" 
    namespace="Koala.KoalaWebControls" %>
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
<asp:Content 
    ID="Content1" 
    ContentPlaceHolderID="ContentPlaceHolder1" 
    Runat="Server">
    <asp:UpdatePanel 
        ID="UpdatePanel1" 
        runat="server">
        <ContentTemplate>
            <script type="text/javascript">
                    
                function Populating_Int_Sucursal( source, eventArgs )
                {
                    var Int_Empresa_Id = $get('ctl00_ContentPlaceHolder1_fvSegRolUsuarioDet_Int_Empresa_Id');
                    var Int_Empresa_Nombre = $get('ctl00_ContentPlaceHolder1_fvSegRolUsuarioDet_Int_Empresa_Nombre');

                    if(Int_Empresa_Id.value == "")
                    {
                        eventArgs.set_cancel(true);
                        Int_Empresa_Nombre.focus();	
                        return;
                    }
                    
                    var behavior = $find('AutoCompleteEx1');
                    behavior.set_contextKey(Int_Empresa_Id.value);
                }     
                        
                function ItemSelected_Int_Empresa_Nombre( source, eventArgs ) 
                {         
                    var valor = eventArgs.get_value();
                    var temp = new Array();
                    temp = valor.split('||');
                                                        
                    var Int_Empresa_Id = $get("ctl00_ContentPlaceHolder1_fvSegRolUsuarioDet_Int_Empresa_Id");
                    Int_Empresa_Id.value = temp[0];
                    var Int_Empresa_Codigo = $get("ctl00_ContentPlaceHolder1_fvSegRolUsuarioDet_Int_Empresa_Codigo");
                    Int_Empresa_Codigo.value = temp[1];                      
                }   
                function ItemSelected_Int_Sucursal_Nombre(source, eventArgs)
                {
                    var valor = eventArgs.get_value();
                    var temp = new Array();
                    temp = valor.split('||');
                    
                    var Int_Sucursal_Id = $get("ctl00_ContentPlaceHolder1_fvSegRolUsuarioDet_Int_Sucursal_Id");
                    Int_Sucursal_Id.value = temp[0];
                    var Int_Sucursal_Codigo = $get("ctl00_ContentPlaceHolder1_fvSegRolUsuarioDet_Int_Sucursal_Codigo");
                    Int_Sucursal_Codigo.value = temp[1];  
                }   
            </script>
            <asp:FormView 
                ID="fvSegRolUsuarioDet"
                runat="server" 
                DataSourceID="odsFVSegRolUsuarioDet" 
                DefaultMode="Insert">
                <EditItemTemplate>
                    <asp:Panel
                        runat="server"
                        ID="Rec_Seg_Rol_Usuario_Det_Rol_Usuario"
                        meta:resourcekey="Rec_Seg_Rol_Usuario_Det_Rol_UsuarioRecursoKCG">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lblRolUsuario" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Seg_Rol_Usuario_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Seg_Rol_Usuario_Codigo" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Seg_Rol_Usuario_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Seg_Rol_Usuario_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Seg_Rol_Usuario_Nombre" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Width="400px"
                                        ToolTip='<%# GetLocalResourceObject("Seg_Rol_Usuario_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Seg_Rol_Usuario_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <asp:Panel
                            runat="server"
                            ID="Rec_Seg_Rol_Usuario_Det"
                            meta:resourcekey="Rec_Seg_Rol_Usuario_DetRecursoKCG">
                            <table>
                                <tr>
                                <td>
                                    <asp:Label 
                                        ID="lblCodigo" 
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Codigo" 
                                        runat="server"
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("Codigo") %>'>
                                    </asp:TextBox>
                                </td>
                                <td align="right"
                                    colspan="2">
                                    <asp:Label 
                                        ID="Estado_Nombre" 
                                        runat="server" 
                                        ForeColor="Red"
                                        Text='<%# Bind("Estado_Nombre") %>'>
                                    </asp:Label>
                                </td>
                                
                            </tr>
                                <td>
                                     <asp:Label 
                                        ID="lblEmpresa" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Int_empresa_nombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td  style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Int_Empresa_Codigo" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Int_Empresa_CodigoRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("Int_Empresa_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Int_Empresa_Nombre" 
                                        runat="server" 
                                        Width="400px"
                                        CssClass="TEXTO_COMBOPER_KCG"
                                        ToolTip='<%# GetLocalResourceObject("Int_empresa_nombreRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("Int_Empresa_Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        ID="rfvInt_Empresa_Nombre"
                                        runat="server" 
                                        ControlToValidate="Int_Empresa_Nombre"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="vceInt_Empresa_Nombre"
                                        TargetControlID="rfvInt_Empresa_Nombre"/>
                                    <AjaxControlToolkit:AutoCompleteExtender
                                        runat="server" 
                                        BehaviorID="AutoCompleteEx"
                                        ID="AutoCompleteExtender1" 
                                        TargetControlID="Int_Empresa_Nombre"
                                        ServicePath="~/SEG/SEG_ROL_USUARIO_DET.aspx" 
                                        ServiceMethod="GetInt_Empresa_Nombre"
                                        MinimumPrefixLength="0" 
                                        CompletionInterval="500"
                                        EnableCaching="true"
                                        CompletionSetCount="20"
                                        CompletionListCssClass="autocomplete_completionListElement" 
                                        CompletionListItemCssClass="autocomplete_listItem" 
                                        CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                        OnClientItemSelected="ItemSelected_Int_Empresa_Nombre" >
                                        <Animations>
                                            <OnShow>
                                                <Sequence>
                                                    <%-- Make the completion list transparent and then show it --%>
                                                    <OpacityAction Opacity="0" />
                                                    <HideAction Visible="true" />                                                    
                                                    <%--Cache the original size of the completion list the first time
                                                        the animation is played and then set it to zero --%>
                                                    <ScriptAction Script="
                                                        // Cache the size and setup the initial size
                                                        var behavior = $find('AutoCompleteEx');
                                                        if (!behavior._height) {
                                                            var target = behavior.get_completionList();
                                                            behavior._height = target.offsetHeight - 2;
                                                            target.style.height = '0px';
                                                        }" />                                                    
                                                    <%-- Expand from 0px to the appropriate size while fading in --%>
                                                    <Parallel 
                                                        Duration=".4">
                                                        <FadeIn />
                                                        <Length 
                                                            PropertyKey="height" 
                                                            StartValue="0" 
                                                            EndValueScript="$find('AutoCompleteEx')._height" />
                                                    </Parallel>
                                                </Sequence>
                                            </OnShow>
                                            <OnHide>
                                                <%-- Collapse down to 0px and fade out --%>
                                                <Parallel 
                                                    Duration=".4">
                                                    <FadeOut />
                                                    <Length 
                                                        PropertyKey="height" 
                                                        StartValueScript="$find('AutoCompleteEx')._height" 
                                                        EndValue="0" />
                                                </Parallel>
                                            </OnHide>
                                        </Animations>
                                    </AjaxControlToolkit:AutoCompleteExtender>
                                    <asp:Button 
                                        ID="zoomEmpresa" 
                                        runat="server" 
                                        CommandArgument="RutaDestino: ~/INT/INT_EMPRESA.aspx; Filtro: Int_Empresa_Nombre;"
                                        CommandName="Zoom" 
                                        Visible="false"
                                        Text="..." />  
                                </td>
                                <tr>
                                <td>
                                    <asp:Label 
                                        ID="lblSucursal" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Int_sucursal_nombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td  style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Int_Sucursal_Codigo" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Int_Sucursal_codigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Int_Sucursal_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Int_Sucursal_Nombre" 
                                        runat="server" 
                                        Width="400px"
                                        CssClass="TEXTO_COMBOPER_KCG"
                                        ToolTip='<%# GetLocalResourceObject("Int_sucursal_nombreRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("Int_Sucursal_Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        ID="rfvInt_Sucursal_Nombre"
                                        runat="server" 
                                        ControlToValidate="Int_Sucursal_Nombre"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="vceInt_Sucursal_Nombre"
                                        TargetControlID="rfvInt_Sucursal_Nombre"/>
                                    <AjaxControlToolkit:AutoCompleteExtender
                                        runat="server" 
                                        BehaviorID="AutoCompleteEx1"
                                        ID="AutoCompleteExtender2" 
                                        TargetControlID="Int_Sucursal_Nombre"
                                        ServicePath="~/SEG/SEG_ROL_USUARIO_DET.aspx" 
                                        ServiceMethod="GetInt_Sucursal_Nombre"
                                        MinimumPrefixLength="0" 
                                        CompletionInterval="500"
                                        EnableCaching="true"
                                        CompletionSetCount="20"
                                        CompletionListCssClass="autocomplete_completionListElement" 
                                        CompletionListItemCssClass="autocomplete_listItem" 
                                        CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                        OnClientItemSelected="ItemSelected_Int_Sucursal_Nombre" 
                                        UseContextKey="true"                                        
                                        ContextKey="0"
                                        OnClientPopulating="Populating_Int_Sucursal">
                                        <Animations>
                                            <OnShow>
                                                <Sequence>
                                                    <%-- Make the completion list transparent and then show it --%>
                                                    <OpacityAction Opacity="0" />
                                                    <HideAction Visible="true" />                                                    
                                                    <%--Cache the original size of the completion list the first time
                                                        the animation is played and then set it to zero --%>
                                                    <ScriptAction Script="
                                                        // Cache the size and setup the initial size
                                                        var behavior = $find('AutoCompleteEx1');
                                                        if (!behavior._height) {
                                                            var target = behavior.get_completionList();
                                                            behavior._height = target.offsetHeight - 2;
                                                            target.style.height = '0px';
                                                        }" />                                                    
                                                    <%-- Expand from 0px to the appropriate size while fading in --%>
                                                    <Parallel 
                                                        Duration=".4">
                                                        <FadeIn />
                                                        <Length 
                                                            PropertyKey="height" 
                                                            StartValue="0" 
                                                            EndValueScript="$find('AutoCompleteEx1')._height" />
                                                    </Parallel>
                                                </Sequence>
                                            </OnShow>
                                            <OnHide>
                                                <%-- Collapse down to 0px and fade out --%>
                                                <Parallel 
                                                    Duration=".4">
                                                    <FadeOut />
                                                    <Length 
                                                        PropertyKey="height" 
                                                        StartValueScript="$find('AutoCompleteEx1')._height" 
                                                        EndValue="0" />
                                                </Parallel>
                                            </OnHide>
                                        </Animations>
                                    </AjaxControlToolkit:AutoCompleteExtender>
                                    <asp:Button 
                                        ID="zoomSucursal" 
                                        runat="server" 
                                        CommandArgument="RutaDestino: ~/INT/INT_SUCURSAL.aspx; Filtro: Int_Sucursal_Nombre;"
                                        CommandName="Zoom"  
                                        Visible="false"                                       
                                        Text="..." />
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
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "Tec_ActualizarRecursoKCG.AccesKey").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "Btn_UpdateRecursoKCG.Text").ToString() %>'
                                        ToolTip='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "Btn_UpdateRecursoKCG.ToolTip").ToString() %>'>
                                     </asp:Button>
                                     <asp:Button 
                                        ID="UpdateCancelButton" 
                                        runat="server"
                                        CausesValidation="False" 
                                        CommandName="Cancel"
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "Tec_CancelarRecursoKCG.AccesKey").ToString() %>' 
                                        Text='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "Btn_CancelRecursoKCG.Text").ToString() %>'
                                        ToolTip='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "Btn_CancelRecursoKCG.ToolTip").ToString() %>'>
                                     </asp:Button>
                                  <uc2:wucMensajeActualizar ID="WucMensajeActualizar1" runat="server" />
                                </td>
                            </tr>
                            </table>
                    </asp:Panel>
                        
                    <%--  Ids--%>
                    <asp:TextBox 
                        ID="Seg_Rol_Usuario_Id" 
                        runat="server"
                        style="display:none"  
                        Text='<%# Bind("Seg_Rol_Usuario_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_Empresa_Id" 
                        style="display:none" 
                        runat="server" 
                        Text='<%# Bind("Int_Empresa_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="int_usuario_id" 
                        style="display:none" 
                        runat="server" 
                        Text='<%# Bind("int_usuario_id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_Sucursal_Id"
                        style="display:none"  
                        runat="server" 
                        Text='<%# Bind("Int_Sucursal_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Seg_Rol_Id" 
                        style="display:none" 
                        runat="server" 
                        Text='<%# Bind("Seg_Rol_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Id"
                        style="display:none"  
                        runat="server" 
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_Moneda_Id"
                        style="display:none"  
                        runat="server" 
                        Text='<%# Bind("Int_Moneda_Id") %>'>
                    </asp:TextBox>
                    
                    <%--Ocultos--%>
                    <asp:TextBox 
                        ID="Codigo_int" 
                        runat="server"
                        Visible="false" 
                        Text='<%# Bind("Codigo_int") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Seg_Rol_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Seg_Rol_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_Usuario_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Int_Usuario_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Nombre"
                        Visible="false" 
                        runat="server" 
                        Text='<%# Bind("Nombre") %>'>
                    </asp:TextBox>       
                    <asp:TextBox 
                        Visible="false"
                        ID="Estado" 
                        runat="server" 
                        Text='<%# Bind("Estado") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_Moneda_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Int_Moneda_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Seg_Rol_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Seg_Rol_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_Moneda_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Int_Moneda_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_Usuario_Nombre" 
                        runat="server"
                        Visible="false" 
                        Text='<%# Bind("Int_Usuario_Nombre") %>'>
                    </asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:Panel
                        runat="server"
                        ID="Rec_Seg_Rol_Usuario_Det_Rol_Usuario"
                        meta:resourcekey="Rec_Seg_Rol_Usuario_Det_Rol_UsuarioRecursoKCG">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lblRolUsuario" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Seg_Rol_Usuario_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Seg_Rol_Usuario_Codigo" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Seg_Rol_Usuario_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Seg_Rol_Usuario_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Seg_Rol_Usuario_Nombre" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Width="400px"
                                        ToolTip='<%# GetLocalResourceObject("Seg_Rol_Usuario_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Seg_Rol_Usuario_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <asp:Panel
                            runat="server"
                            ID="Rec_Seg_Rol_Usuario_Det"
                            meta:resourcekey="Rec_Seg_Rol_Usuario_DetRecursoKCG">
                            <table>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lblCodigo" 
                                        runat="server"
                                        Visible="false" 
                                        Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Codigo" 
                                        runat="server"
                                        Visible="false"
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("Codigo") %>'>
                                    </asp:TextBox>
                                </td>
                                <td align="right"
                                    colspan="2">
                                    <asp:Label 
                                        ID="Estado_Nombre" 
                                        runat="server" 
                                        ForeColor="Red"
                                        Text='<%# Bind("Estado_Nombre") %>'>
                                    </asp:Label>
                                </td>
                                
                            </tr>
                                <td>
                                     <asp:Label 
                                        ID="lblEmpresa" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Int_empresa_nombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td  style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Int_Empresa_Codigo" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Int_Empresa_CodigoRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("Int_Empresa_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Int_Empresa_Nombre" 
                                        runat="server" 
                                        Width="400px"
                                        CssClass="TEXTO_COMBOPER_KCG"
                                        ToolTip='<%# GetLocalResourceObject("Int_empresa_nombreRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("Int_Empresa_Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        ID="rfvInt_Empresa_Nombre"
                                        runat="server" 
                                        ControlToValidate="Int_Empresa_Nombre"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="vceInt_Empresa_Nombre"
                                        TargetControlID="rfvInt_Empresa_Nombre"/>
                                    <AjaxControlToolkit:AutoCompleteExtender
                                        runat="server" 
                                        BehaviorID="AutoCompleteEx"
                                        ID="AutoCompleteExtender1" 
                                        TargetControlID="Int_Empresa_Nombre"
                                        ServicePath="~/SEG/SEG_ROL_USUARIO_DET.aspx" 
                                        ServiceMethod="GetInt_Empresa_Nombre"
                                        MinimumPrefixLength="0" 
                                        CompletionInterval="500"
                                        EnableCaching="true"
                                        CompletionSetCount="20"
                                        CompletionListCssClass="autocomplete_completionListElement" 
                                        CompletionListItemCssClass="autocomplete_listItem" 
                                        CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                        OnClientItemSelected="ItemSelected_Int_Empresa_Nombre" >
                                        <Animations>
                                            <OnShow>
                                                <Sequence>
                                                    <%-- Make the completion list transparent and then show it --%>
                                                    <OpacityAction Opacity="0" />
                                                    <HideAction Visible="true" />                                                    
                                                    <%--Cache the original size of the completion list the first time
                                                        the animation is played and then set it to zero --%>
                                                    <ScriptAction Script="
                                                        // Cache the size and setup the initial size
                                                        var behavior = $find('AutoCompleteEx');
                                                        if (!behavior._height) {
                                                            var target = behavior.get_completionList();
                                                            behavior._height = target.offsetHeight - 2;
                                                            target.style.height = '0px';
                                                        }" />                                                    
                                                    <%-- Expand from 0px to the appropriate size while fading in --%>
                                                    <Parallel 
                                                        Duration=".4">
                                                        <FadeIn />
                                                        <Length 
                                                            PropertyKey="height" 
                                                            StartValue="0" 
                                                            EndValueScript="$find('AutoCompleteEx')._height" />
                                                    </Parallel>
                                                </Sequence>
                                            </OnShow>
                                            <OnHide>
                                                <%-- Collapse down to 0px and fade out --%>
                                                <Parallel 
                                                    Duration=".4">
                                                    <FadeOut />
                                                    <Length 
                                                        PropertyKey="height" 
                                                        StartValueScript="$find('AutoCompleteEx')._height" 
                                                        EndValue="0" />
                                                </Parallel>
                                            </OnHide>
                                        </Animations>
                                    </AjaxControlToolkit:AutoCompleteExtender>
                                    <asp:Button 
                                        ID="zoomEmpresa" 
                                        runat="server" 
                                        CommandArgument="RutaDestino: ~/INT/INT_EMPRESA.aspx; Filtro: Int_Empresa_Nombre;"
                                        CommandName="Zoom" 
                                        Visible="false"
                                        Text="..." />  
                                </td>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lblSucursal" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Int_sucursal_nombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td  style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Int_Sucursal_Codigo" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Int_Sucursal_codigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Int_Sucursal_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Int_Sucursal_Nombre" 
                                        runat="server" 
                                        Width="400px"
                                        CssClass="TEXTO_COMBOPER_KCG"
                                        ToolTip='<%# GetLocalResourceObject("Int_sucursal_nombreRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("Int_Sucursal_Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        ID="rfvInt_Sucursal_Nombre"
                                        runat="server" 
                                        ControlToValidate="Int_Sucursal_Nombre"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="vceInt_Sucursal_Nombre"
                                        TargetControlID="rfvInt_Sucursal_Nombre"/>
                                    <AjaxControlToolkit:AutoCompleteExtender
                                        runat="server" 
                                        BehaviorID="AutoCompleteEx1"
                                        ID="AutoCompleteExtender2" 
                                        TargetControlID="Int_Sucursal_Nombre"
                                        ServicePath="~/SEG/SEG_ROL_USUARIO_DET.aspx" 
                                        ServiceMethod="GetInt_Sucursal_Nombre"
                                        MinimumPrefixLength="0" 
                                        CompletionInterval="500"
                                        EnableCaching="true"
                                        CompletionSetCount="20"
                                        CompletionListCssClass="autocomplete_completionListElement" 
                                        CompletionListItemCssClass="autocomplete_listItem" 
                                        CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                        OnClientItemSelected="ItemSelected_Int_Sucursal_Nombre" 
                                        UseContextKey="true"                                        
                                        ContextKey="0"
                                        OnClientPopulating="Populating_Int_Sucursal">
                                        <Animations>
                                            <OnShow>
                                                <Sequence>
                                                    <%-- Make the completion list transparent and then show it --%>
                                                    <OpacityAction Opacity="0" />
                                                    <HideAction Visible="true" />                                                    
                                                    <%--Cache the original size of the completion list the first time
                                                        the animation is played and then set it to zero --%>
                                                    <ScriptAction Script="
                                                        // Cache the size and setup the initial size
                                                        var behavior = $find('AutoCompleteEx1');
                                                        if (!behavior._height) {
                                                            var target = behavior.get_completionList();
                                                            behavior._height = target.offsetHeight - 2;
                                                            target.style.height = '0px';
                                                        }" />                                                    
                                                    <%-- Expand from 0px to the appropriate size while fading in --%>
                                                    <Parallel 
                                                        Duration=".4">
                                                        <FadeIn />
                                                        <Length 
                                                            PropertyKey="height" 
                                                            StartValue="0" 
                                                            EndValueScript="$find('AutoCompleteEx1')._height" />
                                                    </Parallel>
                                                </Sequence>
                                            </OnShow>
                                            <OnHide>
                                                <%-- Collapse down to 0px and fade out --%>
                                                <Parallel 
                                                    Duration=".4">
                                                    <FadeOut />
                                                    <Length 
                                                        PropertyKey="height" 
                                                        StartValueScript="$find('AutoCompleteEx1')._height" 
                                                        EndValue="0" />
                                                </Parallel>
                                            </OnHide>
                                        </Animations>
                                    </AjaxControlToolkit:AutoCompleteExtender>
                                    <asp:Button 
                                        ID="zoomSucursal" 
                                        runat="server" 
                                        CommandArgument="RutaDestino: ~/INT/INT_SUCURSAL.aspx; Filtro: Int_Sucursal_Nombre;"
                                        CommandName="Zoom"  
                                        Visible="false"                                                                             
                                        Text="..." />
                                </td>
                            </tr>
                            <tr align="left">
                                <td colspan="2">
                                    <asp:Button 
                                        ID="InsertButton" 
                                        runat="server" 
                                        CausesValidation="True" 
                                        CommandName="Insert"
                                        ValidationGroup="I"
                                        AccessKey="I"
                                        Text='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "Btn_InsertRecursoKCG.Text").ToString() %>'
                                        ToolTip='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "Btn_InsertRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:Button>
                                    <asp:Button 
                                        ID="InsertCancelButton" 
                                        runat="server" 
                                        CausesValidation="False" 
                                        CommandName="Cancel"
                                        AccessKey="C"
                                        Text='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "Btn_CancelRecursoKCG.Text").ToString() %>'
                                        ToolTip='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "Btn_CancelRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:Button>
                                </td>
                            </tr>
                            </table>
                        
                    </asp:Panel>
                        
                    <%--  Ids--%>
                    <asp:TextBox 
                        ID="Seg_Rol_Usuario_Id" 
                        runat="server"
                        style="display:none"  
                        Text='<%# Bind("Seg_Rol_Usuario_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_Empresa_Id" 
                        style="display:none" 
                        runat="server" 
                        Text='<%# Bind("Int_Empresa_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="int_usuario_id" 
                        style="display:none" 
                        runat="server" 
                        Text='<%# Bind("int_usuario_id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_Sucursal_Id"
                        style="display:none"  
                        runat="server" 
                        Text='<%# Bind("Int_Sucursal_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Seg_Rol_Id" 
                        style="display:none" 
                        runat="server" 
                        Text='<%# Bind("Seg_Rol_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Id"
                        style="display:none"  
                        runat="server" 
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_Moneda_Id"
                        style="display:none"  
                        runat="server" 
                        Text='<%# Bind("Int_Moneda_Id") %>'>
                    </asp:TextBox>
                    
                    <%--Ocultos--%>
                    <asp:TextBox 
                        ID="Codigo_int" 
                        runat="server"
                        Visible="false" 
                        Text='<%# Bind("Codigo_int") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Seg_Rol_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Seg_Rol_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_Usuario_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Int_Usuario_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Nombre"
                        Visible="false" 
                        runat="server" 
                        Text='<%# Bind("Nombre") %>'>
                    </asp:TextBox>       
                    <asp:TextBox 
                        Visible="false"
                        ID="Estado" 
                        runat="server" 
                        Text='<%# Bind("Estado") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_Moneda_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Int_Moneda_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Seg_Rol_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Seg_Rol_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_Moneda_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Int_Moneda_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_Usuario_Nombre" 
                        runat="server"
                        Visible="false" 
                        Text='<%# Bind("Int_Usuario_Nombre") %>'>
                    </asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Panel
                        runat="server"
                        ID="Rec_Seg_Rol_Usuario_Det_Rol_Usuario"
                        meta:resourcekey="Rec_Seg_Rol_Usuario_Det_Rol_UsuarioRecursoKCG">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lblRolUsuario" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Seg_Rol_Usuario_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Seg_Rol_Usuario_Codigo" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Seg_Rol_Usuario_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Seg_Rol_Usuario_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Seg_Rol_Usuario_Nombre" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Width="400px"
                                        ToolTip='<%# GetLocalResourceObject("Seg_Rol_Usuario_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Seg_Rol_Usuario_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <asp:Panel
                            runat="server"
                            ID="Rec_Seg_Rol_Usuario_Det"
                            meta:resourcekey="Rec_Seg_Rol_Usuario_DetRecursoKCG">
                            <table>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lblCodigo" 
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Codigo" 
                                        runat="server"
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("Codigo") %>'>
                                    </asp:TextBox>
                                </td>
                                <td align="right"
                                    colspan="2">
                                    <asp:Label 
                                        ID="Estado_Nombre" 
                                        runat="server" 
                                        ForeColor="Red"
                                        Text='<%# Bind("Estado_Nombre") %>'>
                                    </asp:Label>
                                </td>
                                
                            </tr>
                                <td>
                                     <asp:Label 
                                        ID="lblEmpresa" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Int_empresa_nombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td  style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Int_Empresa_Codigo" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Int_Empresa_CodigoRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("Int_Empresa_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Int_Empresa_Nombre" 
                                        runat="server" 
                                        Width="400px"
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Int_empresa_nombreRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("Int_Empresa_Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:Button 
                                        ID="zoomEmpresa" 
                                        runat="server" 
                                        Visible="false"
                                        CommandArgument="RutaDestino: ~/INT/INT_EMPRESA.aspx; Filtro: Int_Empresa_Nombre;"
                                        CommandName="Zoom" 
                                        Text="..." />  
                                </td>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lblSucursal" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Int_sucursal_nombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td  style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Int_Sucursal_Codigo" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Int_Sucursal_codigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Int_Sucursal_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Int_Sucursal_Nombre" 
                                        runat="server" 
                                        Width="400px"
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Int_sucursal_nombreRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("Int_Sucursal_Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:Button 
                                        ID="zoomSucursal" 
                                        runat="server"
                                        Visible="false" 
                                        CommandArgument="RutaDestino: ~/INT/INT_SUCURSAL.aspx; Filtro: Int_Sucursal_Nombre;"
                                        CommandName="Zoom" 
                                        Text="..." />
                                </td>
                            </tr>
                            <tr align="left">
                                <td colspan="2">
                                   <asp:Button 
                                        ID="EditButton" 
                                        runat="server"
                                        CausesValidation="False" 
                                        CommandName="Edit"
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "Tec_EditarRecursoKCG.AccesKey").ToString() %>'  
                                        Text='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "Btn_EditRecursoKCG.Text").ToString() %>'
                                        ToolTip='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "Btn_EditRecursoKCG.ToolTip").ToString() %>'>
                                   </asp:Button>
                                   <asp:Button 
                                        ID="DeleteButton" 
                                        runat="server" 
                                        CausesValidation="False" 
                                        CommandName="Delete"
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "Tec_EliminarRecursoKCG.AccesKey").ToString() %>'  
                                        Text='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "Btn_DeleteRecursoKCG.Text").ToString() %>'
                                        ToolTip='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "Btn_DeleteRecursoKCG.ToolTip").ToString() %>'>
                                   </asp:Button>
                                   <asp:Button 
                                        ID="NewButton" 
                                        runat="server" 
                                        CausesValidation="False" 
                                        CommandName="New"
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "Tec_NuevoRecursoKCG.AccesKey").ToString() %>'  
                                        Text='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "Btn_NewRecursoKCG.Text").ToString() %>'
                                        ToolTip='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "Btn_NewRecursoKCG.ToolTip").ToString() %>'>
                                   </asp:Button>
                                   <uc1:wucMensajeEliminar ID="WucMensajeEliminar1" runat="server" />
                                </td>
                            </tr>
                            </table>
                    </asp:Panel>
                        
                    <%--  Ids--%>
                    <asp:TextBox 
                        ID="Seg_Rol_Usuario_Id" 
                        runat="server"
                        style="display:none"  
                        Text='<%# Bind("Seg_Rol_Usuario_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_Empresa_Id" 
                        style="display:none" 
                        runat="server" 
                        Text='<%# Bind("Int_Empresa_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="int_usuario_id" 
                        style="display:none" 
                        runat="server" 
                        Text='<%# Bind("int_usuario_id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_Sucursal_Id"
                        style="display:none"  
                        runat="server" 
                        Text='<%# Bind("Int_Sucursal_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Seg_Rol_Id" 
                        style="display:none" 
                        runat="server" 
                        Text='<%# Bind("Seg_Rol_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Id"
                        style="display:none"  
                        runat="server" 
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_Moneda_Id"
                        style="display:none"  
                        runat="server" 
                        Text='<%# Bind("Int_Moneda_Id") %>'>
                    </asp:TextBox>
                    
                    <%--Ocultos--%>
                    <asp:TextBox 
                        ID="Codigo_int" 
                        runat="server"
                        Visible="false" 
                        Text='<%# Bind("Codigo_int") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Seg_Rol_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Seg_Rol_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_Usuario_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Int_Usuario_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Nombre"
                        Visible="false" 
                        runat="server" 
                        Text='<%# Bind("Nombre") %>'>
                    </asp:TextBox>       
                    <asp:TextBox 
                        Visible="false"
                        ID="Estado" 
                        runat="server" 
                        Text='<%# Bind("Estado") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_Moneda_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Int_Moneda_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Seg_Rol_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Seg_Rol_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_Moneda_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Int_Moneda_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_Usuario_Nombre" 
                        runat="server"
                        Visible="false" 
                        Text='<%# Bind("Int_Usuario_Nombre") %>'>
                    </asp:TextBox>
                </ItemTemplate>
            </asp:FormView>
            <asp:ObjectDataSource 
                ID="odsFVSegRolUsuarioDet" 
                runat="server"
                SelectMethod="GetById" 
                OldValuesParameterFormatString="original{0}" 
                TypeName="FEL.SEG.BO_Seg_Rol_Usuario_Det" 
                ConflictDetection="CompareAllValues" 
                SortParameterName="sortExpression" DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
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
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel 
        ID="UpdatePanel2" 
        runat="server">
        <ContentTemplate>
            <asp:Button 
                ID="Atras" 
                runat="server"                 
                Visible="False" />
            <asp:Button 
                ID="Seleccionar" 
                runat="server"                 
                Visible="False" />
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel 
        id="pnlDatosGrid"
        runat="server">
        <ContentTemplate>
            <table>
                <tr>
                    <td>
                        <koala:KNavegacion ID="nav"
                        runat="server"
                        GridViewID="gvSeg_Rol_Usuario_Det"
                        FormViewID="fvSegRolUsuarioDet" OnNavegar="nav_Siguiente" />
                    </td>
                    <td>
                        <koala:KFiltro 
                        ID="kftFiltro" 
                        runat="server" 
                        Contenedor="SEG_ROL_USUARIO_DET" 
                        Objeto="Seg_Rol_Usuario_Det" 
                        IndiceScope ="Scope"
                        Orden="1"
                        ObjectDataSourceID="odsGvSeg_Rol_Usuario_Det" />
                    </td>
                    <td>
                        <asp:Button 
                            ID="btnSeg_Rol_Usu" 
                            runat="server" 
                            OnClick="btnSeg_Rol_Usu_Click"
                            text="Usuario del Rol"/>
                    </td>
                    
                </tr>
            </table>
            <asp:Panel
                        runat="server"
                        ID="Rec_Seg_Rol_Usuario_Det_Listado"
                        meta:resourcekey="Rec_Seg_Rol_Usuario_Det_ListadoRecursoKCG">
                        <koala:KGrid
                            ID="gvSeg_Rol_Usuario_Det" 
                            runat="server" 
                            AllowPaging="True" 
                            AllowSorting ="True" 
                            AutoGenerateColumns="False" 
                            DataKeyNames="Id" 
                            DataSourceID="odsGvSeg_Rol_Usuario_Det" 
                            AccessKey='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>'>
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
                                    SortExpression="Codigo">
                                    <itemstyle horizontalalign="Right" />
                                </asp:BoundField> 
                                    
                                <asp:BoundField 
                                    DataField="Seg_Rol_Usuario_Nombre"
                                    meta:resourcekey="BoundSeg_Rol_Usuario_NombreRecursoKCG"
                                    HeaderText="Seg_Rol_Usuario_Nombre"
                                    SortExpression="Seg_Rol_Usuario_Nombre">
                                    <itemstyle width="80mm" wrap="True" />
                                </asp:BoundField>
                                    
                                <asp:BoundField 
                                    DataField="Int_Empresa_Nombre" 
                                    meta:resourcekey="BoundInt_empresa_nombreRecursoKCG" 
                                    SortExpression="Int_Empresa_Nombre" >
                                    <itemstyle width="80mm" wrap="True" />
                                </asp:BoundField>
                                
                                <asp:BoundField 
                                    DataField="Int_Sucursal_Nombre" 
                                    meta:resourcekey="BoundInt_sucursal_nombreRecursoKCG"
                                    SortExpression="Int_Sucursal_Nombre" >
                                    <itemstyle width="80mm" wrap="True" />
                                </asp:BoundField>
                                <asp:BoundField 
                                    DataField="Seg_Rol_Nombre" 
                                    HeaderText="Seg_Rol_Nombre" 
                                    SortExpression="Seg_Rol_Nombre" 
                                    Visible="False" />
                                <asp:BoundField 
                                    DataField="Seg_Rol_Usuario_Id" 
                                    HeaderText="Seg_Rol_Usuario_Id" 
                                    SortExpression="Seg_Rol_Usuario_Id" 
                                    Visible="False" />
                                <asp:BoundField 
                                    DataField="Codigo_int" 
                                    HeaderText="Codigo_int" 
                                    SortExpression="Codigo_int" 
                                    Visible="False" />
                                <asp:BoundField 
                                    DataField="Int_Sucursal_Codigo" 
                                    HeaderText="Int_Sucursal_Codigo"
                                    SortExpression="Int_Sucursal_Codigo" 
                                    Visible="False" />
                                <asp:BoundField 
                                    DataField="Int_Usuario_Codigo" 
                                    HeaderText="Int_Usuario_Codigo" 
                                    SortExpression="Int_Usuario_Codigo" 
                                    Visible="False" />
                                <asp:BoundField 
                                    DataField="Int_Empresa_Id" 
                                    HeaderText="Int_Empresa_Id" 
                                    SortExpression="Int_Empresa_Id" 
                                    Visible="False" />
                                <asp:BoundField 
                                    DataField="Int_Empresa_Codigo" 
                                    HeaderText="Int_Empresa_Codigo" 
                                    SortExpression="Int_Empresa_Codigo" 
                                    Visible="False"/>
                                <asp:BoundField 
                                    DataField="Estado_Nombre" 
                                    HeaderText="Estado_Nombre" 
                                    SortExpression="Estado_Nombre"
                                    Visible="False"  />
                                <asp:BoundField 
                                    DataField="Nombre" 
                                    HeaderText="Nombre" 
                                    SortExpression="Nombre"
                                    Visible="False"  />
                                <asp:BoundField 
                                    DataField="int_usuario_id" 
                                    HeaderText="int_usuario_id" 
                                    SortExpression="int_usuario_id" 
                                    Visible="False" />
                                <asp:BoundField 
                                    DataField="Int_Sucursal_Id" 
                                    HeaderText="Int_Sucursal_Id" 
                                    SortExpression="Int_Sucursal_Id"
                                    Visible="False"  />
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
                                    DataField="Id" 
                                    HeaderText="Id" 
                                    SortExpression="Id" 
                                    Visible="False" />
                                <asp:BoundField 
                                    DataField="Int_Moneda_Nombre" 
                                    HeaderText="Int_Moneda_Nombre" 
                                    SortExpression="Int_Moneda_Nombre" 
                                    Visible="False" />
                                <asp:BoundField 
                                    DataField="Seg_Rol_Codigo" 
                                    HeaderText="Seg_Rol_Codigo" 
                                    SortExpression="Seg_Rol_Codigo" 
                                    Visible="False" />
                                <asp:BoundField 
                                    DataField="Int_Moneda_Codigo" 
                                    HeaderText="Int_Moneda_Codigo" 
                                    SortExpression="Int_Moneda_Codigo" 
                                    Visible="False" />
                                <asp:BoundField 
                                    DataField="Int_Usuario_Nombre" 
                                    HeaderText="Int_Usuario_Nombre" 
                                    SortExpression="Int_Usuario_Nombre" 
                                    Visible="False" />
                                <asp:BoundField 
                                    DataField="Seg_Rol_Usuario_Codigo" 
                                    HeaderText="Seg_Rol_Usuario_Codigo"
                                    SortExpression="Seg_Rol_Usuario_Codigo" 
                                    Visible="False" />
                                <asp:BoundField 
                                    DataField="Int_Moneda_Id" 
                                    HeaderText="Int_Moneda_Id" 
                                    SortExpression="Int_Moneda_Id" 
                                    Visible="False" />
                            </Columns>
                        </koala:KGrid>
                        <asp:ObjectDataSource 
                            ID="odsGvSeg_Rol_Usuario_Det" 
                            runat="server" 
                            OldValuesParameterFormatString="original_{0}"
                            SelectMethod="GetByRolUsuario" 
                            TypeName="FEL.SEG.BO_Seg_Rol_Usuario_Det">
                            <SelectParameters>
                                <asp:SessionParameter 
                                    Name="s" 
                                    SessionField="Scope" 
                                    Type="Object" />
                                <asp:QueryStringParameter 
                                    Name="Seg_Rol_Usuario_Id" 
                                    QueryStringField="Seg_Rol_Usuario_Id"
                                    Type="String" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
            </asp:Panel>
        </ContentTemplate>
     </asp:UpdatePanel>
      
</asp:Content>

