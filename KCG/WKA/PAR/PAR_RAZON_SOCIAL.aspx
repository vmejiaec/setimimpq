<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="PAR_RAZON_SOCIAL.aspx.cs" 
    Inherits="PAR_PAR_RAZON_SOCIAL" 
    Theme="EstiloKCG"
    StylesheetTheme="EstiloKCG"
    meta:resourcekey="Tit_Par_Razon_SocialRecursoKCG" %>
    
<%@ Register tagprefix="koala" 
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
        runat="server"
        UpdateMode="Conditional">
        <ContentTemplate>
            <script type="text/javascript">  
                Sys.Application.add_load(page_load);
                Sys.Application.add_unload(page_unload);
                var Nombre = null; 
                var Nombre_Comercial = null;
                
                function page_load(sender, e)
                    {
                        Nombre = $get("ctl00_ContentPlaceHolder1_fvpar_razon_social_Nombre");                          
                        if(Nombre)          
                            $addHandler(Nombre, "change", Nombre_onchange);                      
                    }        
                    
                function page_unload(sender, e)
                    {
                        $removeHandler(Nombre, "change", Nombre_onchange);                                                                                                
                    }  
                    
                function Nombre_onchange(sender, e)
                    {   
                        var maxlimit = 200;
                        var longitud = null;
                        
                        Nombre_Comercial = $get("ctl00_ContentPlaceHolder1_fvpar_razon_social_Nombre_Comercial");
                        longitud = Nombre.value.length 
                        Nombre_Comercial.value = Nombre.value.substring(0, maxlimit); ;
                         
                    }    
                                                                                                                      
                function ItemSelected( source, eventArgs ) 
                {   
                   var valor = eventArgs.get_value();
                    var temp = new Array();
                    temp = valor.split('||');
                                                        
                    var Par_Tipo_Identificacion_Id = $get("ctl00_ContentPlaceHolder1_fvpar_razon_social_Par_Tipo_Identificacion_Id");
                    Par_Tipo_Identificacion_Id.value = temp[0];
                    
                    var Par_Tipo_Identificacion_Codigo = $get("ctl00_ContentPlaceHolder1_fvpar_razon_social_Par_Tipo_Identificacion_Codigo");
                    Par_Tipo_Identificacion_Codigo.value = temp[1];                         
                    
                    var Par_Tipo_Identificacion_Nombre = $get("ctl00_ContentPlaceHolder1_fvpar_razon_social_Par_Tipo_Identificacion_Nombre");
                    Par_Tipo_Identificacion_Nombre.value = temp[2];
                    
                    var Par_Tipo_Identificacion_Cedula = $get("ctl00_ContentPlaceHolder1_fvpar_razon_social_Par_Tipo_Identificacion_Cedula");
                    Par_Tipo_Identificacion_Cedula.value = temp[3];
                }                       
            </script>
            <asp:FormView 
                ID="fvpar_razon_social" 
                runat="server" 
                DataSourceID="odsfvpar_razon_social"
                DefaultMode="Insert">
                <EditItemTemplate> 
                    <asp:Panel
                        id="Panel1"
                        runat="server"
                        meta:resourcekey="Rec_Par_Razon_SocialRecursoKCG">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label
                                        id="lblcodigo"
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
                                <td>
                                    <asp:Label
                                        id="lblestado"
                                        runat="server"
                                        Text='<%# Bind("estado_nombre") %>'>
                                    </asp:Label> 
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        id="lblpartipo"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Par_Tipo_Identificacion_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>     
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Par_Tipo_Identificacion_Codigo" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1" 
                                        ToolTip='<%# GetLocalResourceObject("Par_Tipo_Identificacion_CodigoRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("Par_Tipo_Identificacion_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Par_Tipo_Identificacion_Nombre" 
                                        runat="server"
                                        CssClass="TEXTO_COMBOPER_KCG"
                                        Width="400px" 
                                        ToolTip='<%# GetLocalResourceObject("Par_Tipo_Identificacion_NombreRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("Par_Tipo_Identificacion_Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        runat="server" 
                                        ID="rfvPar_Tipo_Identificacion_Nombre"
                                        ControlToValidate="Par_Tipo_Identificacion_Nombre"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="ValidatorCalloutExtender1"
                                        TargetControlID="rfvPar_Tipo_Identificacion_Nombre" />  
                                    <AjaxControlToolkit:AutoCompleteExtender
                                        runat="server" 
                                        BehaviorID="AutoCompleteEx"
                                        ID="autoComplete1" 
                                        TargetControlID="Par_Tipo_Identificacion_Nombre"
                                        ServicePath="~/PAR/PAR_RAZON_SOCIAL.aspx" 
                                        ServiceMethod="GetIdentificacion"
                                        MinimumPrefixLength="0" 
                                        CompletionInterval="500"
                                        EnableCaching="true"
                                        CompletionSetCount="20"
                                        CompletionListCssClass="autocomplete_completionListElement" 
                                        CompletionListItemCssClass="autocomplete_listItem" 
                                        CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                        OnClientItemSelected="ItemSelected" >
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
                                                    <Parallel Duration=".4">
                                                        <FadeIn />
                                                        <Length PropertyKey="height" StartValue="0" EndValueScript="$find('AutoCompleteEx')._height" />
                                                    </Parallel>
                                                </Sequence>
                                            </OnShow>
                                            <OnHide>
                                                <%-- Collapse down to 0px and fade out --%>
                                                <Parallel Duration=".4">
                                                    <FadeOut />
                                                    <Length PropertyKey="height" StartValueScript="$find('AutoCompleteEx')._height" EndValue="0" />
                                                </Parallel>
                                            </OnHide>
                                        </Animations>
                                    </AjaxControlToolkit:AutoCompleteExtender>     
                                    <asp:Button 
                                        ID="btnZoomArticulo" 
                                        runat="server" 
                                        CommandArgument="RutaDestino: ~/PAR/PAR_TIPO_IDENTIFICACION.aspx; 
                                                        Filtro: Par_Tipo_Identificacion_Nombre;"
                                        CommandName="Zoom" 
                                        Text="..." />  
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        id="lblnumero"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("NumeroRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>   
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Numero" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG"
                                        ToolTip='<%# GetLocalResourceObject("NumeroRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("Numero") %>'>
                                    </asp:TextBox>
                                   <asp:RequiredFieldValidator 
                                        runat="server" 
                                        ID="rfv_Numero"
                                        ControlToValidate="Numero"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="vce_Numero"
                                        TargetControlID="rfv_Numero" />     
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        id="lblrazonsocial"
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
                                        Text='<%# Bind("Nombre") %>'
                                        ToolTip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        runat="server" 
                                        ID="RequiredFieldValidator1"
                                        ControlToValidate="Nombre"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="ValidatorCalloutExtender2"
                                        TargetControlID="RequiredFieldValidator1" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        id="lblnomcomercial"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Nombre_ComercialRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>   
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Nombre_Comercial" 
                                        runat="server"
                                        Width="400px" 
                                        CssClass="TEXTO_EDICION_KCG"
                                        Text='<%# Bind("Nombre_Comercial") %>'
                                        ToolTip='<%# GetLocalResourceObject("Nombre_ComercialRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        runat="server" 
                                        ID="rfvNombre_Comercial"
                                        ControlToValidate="Nombre_Comercial"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="ValidatorCalloutExtender4"
                                        TargetControlID="rfvNombre_Comercial" />
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
                    </asp:Panel> 
                    
                    <%--ID's--%>
                    
                    <asp:TextBox 
                        ID="Par_Tipo_Identificacion_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Par_Tipo_Identificacion_Id") %>'>
                    </asp:TextBox>                    
                    <asp:TextBox 
                        ID="Int_Empresa_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Int_Empresa_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Par_Tipo_Identificacion_Cedula" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Par_Tipo_Identificacion_Cedula") %>'>
                    </asp:TextBox>
                    
                    <%--CAMPOS NO VISIBLES--%>
                    
                    <asp:TextBox 
                        ID="Int_Empresa_Codigo" 
                        runat="server" 
                        Visible="false" 
                        Text='<%# Bind("Int_Empresa_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_Empresa_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Int_Empresa_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="estado_nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("estado_nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Codigo_int" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Codigo_int") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Estado" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Estado") %>'>
                    </asp:TextBox>                    
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:Panel
                        id="Panel1"
                        runat="server"
                        meta:resourcekey="Rec_Par_Razon_SocialRecursoKCG">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label
                                        id="lblcodigo"
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
                                <td>
                                    <asp:Label
                                        id="lblestado"
                                        runat="server"
                                        Text='<%# Bind("estado_nombre") %>'>
                                    </asp:Label> 
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        id="lblpartipo"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Par_Tipo_Identificacion_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>     
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Par_Tipo_Identificacion_Codigo" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1" 
                                        ToolTip='<%# GetLocalResourceObject("Par_Tipo_Identificacion_CodigoRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("Par_Tipo_Identificacion_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Par_Tipo_Identificacion_Nombre" 
                                        runat="server"
                                        CssClass="TEXTO_COMBOPER_KCG"
                                        Width="400px" 
                                        ToolTip='<%# GetLocalResourceObject("Par_Tipo_Identificacion_NombreRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("Par_Tipo_Identificacion_Nombre") %>'>
                                    </asp:TextBox> 
                                    <asp:RequiredFieldValidator 
                                        runat="server" 
                                        ID="rfvPar_Tipo_Identificacion_Nombre"
                                        ControlToValidate="Par_Tipo_Identificacion_Nombre"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="ValidatorCalloutExtender1"
                                        TargetControlID="rfvPar_Tipo_Identificacion_Nombre" />
                                    <AjaxControlToolkit:AutoCompleteExtender
                                        runat="server" 
                                        BehaviorID="AutoCompleteEx"
                                        ID="autoComplete1" 
                                        TargetControlID="Par_Tipo_Identificacion_Nombre"
                                        ServicePath="~/PAR/PAR_RAZON_SOCIAL.aspx" 
                                        ServiceMethod="GetIdentificacion"
                                        MinimumPrefixLength="0" 
                                        CompletionInterval="500"
                                        EnableCaching="true"
                                        CompletionSetCount="20"
                                        CompletionListCssClass="autocomplete_completionListElement" 
                                        CompletionListItemCssClass="autocomplete_listItem" 
                                        CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                        OnClientItemSelected="ItemSelected" >
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
                                                    <Parallel Duration=".4">
                                                        <FadeIn />
                                                        <Length PropertyKey="height" StartValue="0" EndValueScript="$find('AutoCompleteEx')._height" />
                                                    </Parallel>
                                                </Sequence>
                                            </OnShow>
                                            <OnHide>
                                                <%-- Collapse down to 0px and fade out --%>
                                                <Parallel Duration=".4">
                                                    <FadeOut />
                                                    <Length PropertyKey="height" StartValueScript="$find('AutoCompleteEx')._height" EndValue="0" />
                                                </Parallel>
                                            </OnHide>
                                        </Animations>
                                    </AjaxControlToolkit:AutoCompleteExtender>     
                                    <asp:Button 
                                        ID="btnZoomArticulo" 
                                        runat="server" 
                                        CommandArgument="RutaDestino: ~/PAR/PAR_TIPO_IDENTIFICACION.aspx; 
                                                        Filtro: Par_Tipo_Identificacion_Nombre;"
                                        CommandName="Zoom" 
                                        Text="..." />  
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        id="lblnumero"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("NumeroRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>   
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Numero" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG"
                                        ToolTip='<%# GetLocalResourceObject("NumeroRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("Numero") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        runat="server" 
                                        ID="rfv_Numero"
                                        ControlToValidate="Numero"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="vce_Numero"
                                        TargetControlID="rfv_Numero" />                                     
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        id="lblrazonsocial"
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
                                        Text='<%# Bind("Nombre") %>'
                                        ToolTip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        runat="server" 
                                        ID="RequiredFieldValidator1"
                                        ControlToValidate="Nombre"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="ValidatorCalloutExtender2"
                                        TargetControlID="RequiredFieldValidator1" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        id="lblnomcomercial"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Nombre_ComercialRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>   
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Nombre_Comercial" 
                                        runat="server"
                                        Width="400px" 
                                        CssClass="TEXTO_EDICION_KCG"
                                        Text='<%# Bind("Nombre_Comercial") %>'
                                        ToolTip='<%# GetLocalResourceObject("Nombre_ComercialRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        runat="server" 
                                        ID="rfvNombre_Comercial"
                                        ControlToValidate="Nombre_Comercial"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="ValidatorCalloutExtender4"
                                        TargetControlID="rfvNombre_Comercial" />
                                </td>
                            </tr>
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
                    </asp:Panel> 
                    
                    <%--ID's--%>
                    
                    <asp:TextBox 
                        ID="Par_Tipo_Identificacion_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Par_Tipo_Identificacion_Id") %>'>
                    </asp:TextBox>                    
                    <asp:TextBox 
                        ID="Int_Empresa_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Int_Empresa_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Par_Tipo_Identificacion_Cedula" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Par_Tipo_Identificacion_Cedula") %>'>
                    </asp:TextBox>
                    
                    <%--CAMPOS NO VISIBLES--%>
                    
                    <asp:TextBox 
                        ID="Int_Empresa_Codigo" 
                        runat="server" 
                        Visible="false" 
                        Text='<%# Bind("Int_Empresa_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_Empresa_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Int_Empresa_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="estado_nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("estado_nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Codigo_int" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Codigo_int") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Estado" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Estado") %>'>
                    </asp:TextBox>                    
                </InsertItemTemplate>
                <ItemTemplate>  
                    <asp:Panel
                        id="Panel1"
                        runat="server"
                        meta:resourcekey="Rec_Par_Razon_SocialRecursoKCG">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label
                                        id="lblcodigo"
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
                                <td>
                                    <asp:Label
                                        id="lblestado"
                                        runat="server"
                                        Text='<%# Bind("estado_nombre") %>'>
                                    </asp:Label> 
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        id="lblpartipo"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Par_Tipo_Identificacion_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>     
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Par_Tipo_Identificacion_Codigo" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1" 
                                        ToolTip='<%# GetLocalResourceObject("Par_Tipo_Identificacion_CodigoRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("Par_Tipo_Identificacion_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Par_Tipo_Identificacion_Nombre" 
                                        runat="server"
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Width="400px" 
                                        ToolTip='<%# GetLocalResourceObject("Par_Tipo_Identificacion_NombreRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("Par_Tipo_Identificacion_Nombre") %>'>
                                    </asp:TextBox> 
                                    <asp:Button 
                                        ID="btnZoomArticulo" 
                                        runat="server"
                                        Enabled="false"  
                                        CommandArgument="RutaDestino: ~/PAR/PAR_TIPO_IDENTIFICACION.aspx; 
                                                        Filtro: Par_Tipo_Identificacion_Nombre;"
                                        CommandName="Zoom" 
                                        Text="..." />   
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        id="lblnumero"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("NumeroRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>   
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Numero" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("NumeroRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("Numero") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        id="lblrazonsocial"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>   
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Nombre" 
                                        runat="server"
                                        Width="400px" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Text='<%# Bind("Nombre") %>'
                                        ToolTip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        id="lblnomcomercial"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Nombre_ComercialRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>   
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Nombre_Comercial" 
                                        runat="server"
                                        Width="400px" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Text='<%# Bind("Nombre_Comercial") %>'
                                        ToolTip='<%# GetLocalResourceObject("Nombre_ComercialRecursoKCG.ToolTip").ToString() %>'>
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
                                   <asp:Button 
                                        ID="CopyButton" 
                                        runat="server"
                                        CausesValidation="False" 
                                        CommandName="New"                                        
                                        Text="Copia"
                                        OnClick="CopyButton_Click">
                                   </asp:Button>                           
                                   <uc1:wucMensajeEliminar ID="WucMensajeEliminar1" runat="server" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel> 
                    
                    <%--ID's--%>
                    
                    <asp:TextBox 
                        ID="Par_Tipo_Identificacion_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Par_Tipo_Identificacion_Id") %>'>
                    </asp:TextBox>                    
                    <asp:TextBox 
                        ID="Int_Empresa_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Int_Empresa_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Par_Tipo_Identificacion_Cedula" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Par_Tipo_Identificacion_Cedula") %>'>
                    </asp:TextBox>
                    
                    <%--CAMPOS NO VISIBLES--%>
                    
                    <asp:TextBox 
                        ID="Int_Empresa_Codigo" 
                        runat="server" 
                        Visible="false" 
                        Text='<%# Bind("Int_Empresa_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_Empresa_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Int_Empresa_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="estado_nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("estado_nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Codigo_int" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Codigo_int") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Estado" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Estado") %>'>
                    </asp:TextBox>                   
                </ItemTemplate>
            </asp:FormView>
            <koala:KNavegacion ID="nav"
                runat="server"
                GridViewID="gvpar_razon_social"
                FormViewID="FormView1" OnNavegar="nav_Siguiente" />
                <koala:KFiltro 
            ID="kftFiltro" 
            runat="server" 
            Contenedor="PAR_RAZON_SOCIAL" 
            Objeto="PAR_RAZON_SOCIAL" 
            IndiceScope ="Scope"
            Orden="1"
            ObjectDataSourceID="odsgvpar_razon_social" /> 
                     
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger 
                    ControlID="gvpar_razon_social" 
                    EventName="SelectedIndexChanged" />
            </Triggers>                    
    </asp:UpdatePanel>
    <asp:ObjectDataSource 
        ID="odsfvpar_razon_social" 
        runat="server" 
        ConflictDetection="CompareAllValues"
        DeleteMethod="Delete" 
        InsertMethod="Insert" 
        OldValuesParameterFormatString="original{0}"
        SelectMethod="GetById" 
        SortParameterName="sortExpression" 
        TypeName="FEL.PAR.BO_Par_Razon_Social"
        UpdateMethod="Update">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
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
                Visible="False" />
            <asp:Button 
                ID="Seleccionar" 
                runat="server"                 
                Visible="False" />
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel 
        ID="UpdatePanel3" 
        runat="server">
        <ContentTemplate>    
                  
                                           
            <asp:Panel 
                runat="server"
                id="pnlDatosGrid"
                meta:resourcekey="Rec_Par_Razon_Social_ListadoRecursoKCG">                 
                <koala:KGrid
                ID="gvpar_razon_social" 
                runat="server" 
                AllowPaging="True"
                AllowSorting ="True"    
                AutoGenerateColumns="False"
                DataKeyNames="Id"                
                DataSourceID="odsgvpar_razon_social"
                AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>'>
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
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField 
                        DataField="Par_Tipo_Identificacion_Nombre" 
                        meta:resourcekey="BoundPar_Tipo_Identificacion_NombreRecursoKCG"
                        SortExpression="Par_Tipo_Identificacion_Nombre">
                        <ItemStyle wrap="true" />
                    </asp:BoundField>
                    <asp:BoundField 
                        DataField="Numero" 
                        meta:resourcekey="BoundNumeroRecursoKCG" 
                        SortExpression="Numero">
                        <ItemStyle HorizontalAlign="Right" Wrap="True" />
                    </asp:BoundField>
                    <asp:BoundField 
                        DataField="Nombre" 
                        meta:resourcekey="BoundNombreRecursoKCG" 
                        SortExpression="Nombre">
                        <ItemStyle Width="80mm" Wrap="True" />
                    </asp:BoundField>
                    <asp:BoundField 
                        DataField="Nombre_Comercial" 
                        meta:resourcekey="BoundNombre_ComercialRecursoKCG" 
                        SortExpression="Nombre_Comercial" >
                        <itemstyle width="80mm" Wrap="True" />
                    </asp:BoundField>
                    <asp:BoundField 
                        DataField="Par_Tipo_Identificacion_Id" 
                        HeaderText="Par_Tipo_Identificacion_Id"
                        SortExpression="Par_Tipo_Identificacion_Id" 
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
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Int_Empresa_Nombre" 
                        HeaderText="Int_Empresa_Nombre" 
                        SortExpression="Int_Empresa_Nombre"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Par_Tipo_Identificacion_Codigo" 
                        HeaderText="Par_Tipo_Identificacion_Codigo"
                        SortExpression="Par_Tipo_Identificacion_Codigo" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="estado_nombre" 
                        HeaderText="estado_nombre" 
                        SortExpression="estado_nombre"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Id" 
                        HeaderText="Id" 
                        SortExpression="Id" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Codigo_int" 
                        HeaderText="Codigo_int" 
                        SortExpression="Codigo_int"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Estado" 
                        HeaderText="Estado" 
                        SortExpression="Estado" 
                        Visible="False" />
                </Columns>
            </koala:KGrid>
            </asp:Panel> 
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:ObjectDataSource 
        ID="odsgvpar_razon_social" 
        runat="server" 
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetByEmpresa" 
        TypeName="FEL.PAR.BO_Par_Razon_Social">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
            <asp:Parameter Name="Int_Empresa_Id" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

