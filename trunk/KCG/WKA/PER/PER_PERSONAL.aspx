<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="PER_PERSONAL.aspx.cs" 
    Inherits="PER_PER_PERSONAL" 
    meta:resourcekey="Tit_Per_PersonalRecursoKCG"
    Theme="EstiloKCG"
    StylesheetTheme="EstiloKCG" %>
    
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
        runat="server">
        <ContentTemplate>
            <script type="text/javascript">
                function ItemSelected_Par_Tipo_Identificacion_Nombre( source, eventArgs ) 
                    {   
                        var valor = eventArgs.get_value();
                        var temp = new Array();
                        temp = valor.split('||');
                                                            
                        var Par_Tipo_Identificacion_Id = $get("ctl00_ContentPlaceHolder1_Fv_Per_Personal_Par_Tipo_Identificacion_Id");
                        Par_Tipo_Identificacion_Id.value = temp[0];  
                        
                        var Par_Razon_Social_Nombre = $get("ctl00_ContentPlaceHolder1_Fv_Per_Personal_Par_Razon_Social_Nombre");   
                        var Par_Razon_Social_Numero = $get("ctl00_ContentPlaceHolder1_Fv_Per_Personal_Par_Razon_Social_Numero"); 
                        Par_Razon_Social_Nombre.value = "";
                        Par_Razon_Social_Numero.value = "";                                                                                                                                                                                  
                    }  
                    
                function ItemSelected_Par_Razon_Social_Numero( source, eventArgs ) 
                    {   
                        var valor = eventArgs.get_value();
                        var temp = new Array();
                        temp = valor.split('||');
                                                            
                        var Par_Razon_Social_Id = $get("ctl00_ContentPlaceHolder1_Fv_Per_Personal_Par_Razon_Social_Id");
                        Par_Razon_Social_Id.value = temp[0];     
                        var Par_Razon_Social_Nombre = $get("ctl00_ContentPlaceHolder1_Fv_Per_Personal_Par_Razon_Social_Nombre"); 
                        Par_Razon_Social_Nombre.value = temp[1];                                                                                                                                                               
                    }  
                function ItemSelected_Par_Razon_Social_Nombre( source, eventArgs ) 
                    {   
                        var valor = eventArgs.get_value();
                        var temp = new Array();
                        temp = valor.split('||');
                                                            
                        var Par_Razon_Social_Id = $get("ctl00_ContentPlaceHolder1_Fv_Per_Personal_Par_Razon_Social_Id");
                        Par_Razon_Social_Id.value = temp[0];     
                        var Par_Razon_Social_Numero = $get("ctl00_ContentPlaceHolder1_Fv_Per_Personal_Par_Razon_Social_Numero"); 
                        Par_Razon_Social_Numero.value = temp[1];                                                                                                                                                             
                    }  
                  
                function Populating_Par_Razon_Social_Nombre( source, eventArgs )
                    {  
                        var Par_Tipo_Identificacion_Id = $get("ctl00_ContentPlaceHolder1_Fv_Per_Personal_Par_Tipo_Identificacion_Id");
                        var Par_Tipo_Identificacion_Nombre = $get("ctl00_ContentPlaceHolder1_Fv_Per_Personal_Par_Tipo_Identificacion_Nombre");

                        if(Par_Tipo_Identificacion_Id.value == "")
                        {
                            eventArgs.set_cancel(true);
                            Par_Tipo_Identificacion_Nombre.focus();
                            return;
                        }
                        
                        var variable = $find('AutoCompleteEx_Social_Nombre');
                        variable.set_contextKey(Par_Tipo_Identificacion_Id.value);     
                    }    
                    
                function Populating_Par_Razon_Social_Numero( source, eventArgs )
                    {   
                        var Par_Tipo_Identificacion_Id = $get("ctl00_ContentPlaceHolder1_Fv_Per_Personal_Par_Tipo_Identificacion_Id");
                        var Par_Tipo_Identificacion_Nombre = $get("ctl00_ContentPlaceHolder1_Fv_Per_Personal_Par_Tipo_Identificacion_Nombre");

                        if(Par_Tipo_Identificacion_Id.value == "")
                        {
                            eventArgs.set_cancel(true);
                            Par_Tipo_Identificacion_Nombre.focus();
                            return;
                        }
                        
                        var variable = $find('AutoCompleteEx_Social_Numero');
                        variable.set_contextKey(Par_Tipo_Identificacion_Id.value);     
                    }    
                
                function checkSelectedValue_JFiscalizacion()
                    { 
                        var ddlJefe_Fiscalizacion = $get("ctl00_ContentPlaceHolder1_Fv_Per_Personal_ddlJefe_Fiscalizacion");
                        var Jefe_Fiscalizacion = $get("ctl00_ContentPlaceHolder1_Fv_Per_Personal_Jefe_Fiscalizacion");
                                        
                        Jefe_Fiscalizacion.value = ddlJefe_Fiscalizacion.options[ddlJefe_Fiscalizacion.selectedIndex].value;
                    }
                    
                function checkSelectedValue_Fiscalizacion()
                    { 
                        var ddlFiscalizacion = $get("ctl00_ContentPlaceHolder1_Fv_Per_Personal_ddlFiscalizacion");
                        var Fiscalizacion = $get("ctl00_ContentPlaceHolder1_Fv_Per_Personal_Fiscalizacion");
                                        
                        Fiscalizacion.value = ddlFiscalizacion.options[ddlFiscalizacion.selectedIndex].value;
                    }
                    
                function checkSelectedValue_Contratista()
                    { 
                        var ddlContratista = $get("ctl00_ContentPlaceHolder1_Fv_Per_Personal_ddlContratista");
                        var Contratista = $get("ctl00_ContentPlaceHolder1_Fv_Per_Personal_Contratista");
                                        
                        Contratista.value = ddlContratista.options[ddlContratista.selectedIndex].value;
                    }
                    
                function checkSelectedValue_TFiscalizacion()
                    { 
                        var ddlTipo_Fiscalizacion = $get("ctl00_ContentPlaceHolder1_Fv_Per_Personal_ddlTipo_Fiscalizacion");
                        var Tipo_Fiscalizacion = $get("ctl00_ContentPlaceHolder1_Fv_Per_Personal_Tipo_Fiscalizacion");
                                        
                        Tipo_Fiscalizacion.value = ddlTipo_Fiscalizacion.options[ddlTipo_Fiscalizacion.selectedIndex].value;
                    }
                    
                function checkSelectedValue_Coordinador()
                    { 
                        var ddlCoordinador = $get("ctl00_ContentPlaceHolder1_Fv_Per_Personal_ddlCoordinador");
                        var Coordinador = $get("ctl00_ContentPlaceHolder1_Fv_Per_Personal_Coordinador");
                                        
                        Coordinador.value = ddlCoordinador.options[ddlCoordinador.selectedIndex].value;
                    }
                    
                function checkSelectedValue_TCostos()
                    { 
                        var ddlTecnico_Costos = $get("ctl00_ContentPlaceHolder1_Fv_Per_Personal_ddlTecnico_Costos");
                        var Tecnico_Costos = $get("ctl00_ContentPlaceHolder1_Fv_Per_Personal_Tecnico_Costos");
                                        
                        Tecnico_Costos.value = ddlTecnico_Costos.options[ddlTecnico_Costos.selectedIndex].value;
                    }
                    
            </script>
            <asp:FormView 
                ID="Fv_Per_Personal" 
                runat="server" 
                DataSourceID="odsFv_Per_Personal"
                DefaultMode="Insert">
                <EditItemTemplate>
                    <asp:Panel 
                        ID="pnl_Razon_Social" 
                        runat="server" 
                        meta:resourcekey="Rec_Per_Personal_Razon_SocialRecursoKCG">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lbl_Identificacion"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Par_Tipo_Identificacion_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Par_Tipo_Identificacion_Nombre" 
                                        runat="server" 
                                        CssClass="TEXTO_COMBOPER_KCG"     
                                        ToolTip='<%# GetLocalResourceObject("Par_Tipo_Identificacion_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Par_Tipo_Identificacion_Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        ID="rfv_Par_Tipo_Identificacion_Nombre"
                                        runat="server" 
                                        ControlToValidate="Par_Tipo_Identificacion_Nombre"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="vce_Par_Tipo_Identificacion_Nombre"
                                        TargetControlID="rfv_Par_Tipo_Identificacion_Nombre"/>
                                     <AjaxControlToolkit:AutoCompleteExtender
                                        runat="server" 
                                        BehaviorID="AutoCompleteEx_Tipo_Identificacion"
                                        ID="AutoCo_Tipo_Identificacion" 
                                        TargetControlID="Par_Tipo_Identificacion_Nombre"
                                        ServicePath="~/PER/PER_PERSONAL.aspx" 
                                        ServiceMethod="Get_Par_Tipo_Identificacion_Nombre"
                                        MinimumPrefixLength="0" 
                                        CompletionInterval="500"
                                        EnableCaching="true"
                                        CompletionSetCount="500"
                                        CompletionListCssClass="autocomplete_completionListElement" 
                                        CompletionListItemCssClass="autocomplete_listItem" 
                                        CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                        OnClientItemSelected="ItemSelected_Par_Tipo_Identificacion_Nombre" >    
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
                                                        var behavior = $find('AutoCompleteEx_Tipo_Identificacion');
                                                        if (!behavior._height) {
                                                            var target = behavior.get_completionList();
                                                            behavior._height = target.offsetHeight - 2;
                                                            target.style.height = '0px';
                                                        }" />                                                    
                                                    <%-- Expand from 0px to the appropriate size while fading in --%>
                                                    <Parallel Duration=".4">
                                                        <FadeIn />
                                                        <Length PropertyKey="height" StartValue="0" EndValueScript="$find('AutoCompleteEx_Tipo_Identificacion')._height" />
                                                    </Parallel>
                                                </Sequence>
                                            </OnShow>
                                            <OnHide>
                                                <%-- Collapse down to 0px and fade out --%>
                                                <Parallel Duration=".4">
                                                    <FadeOut />
                                                    <Length PropertyKey="height" StartValueScript="$find('AutoCompleteEx_Tipo_Identificacion')._height" EndValue="0" />
                                                </Parallel>
                                            </OnHide>
                                        </Animations>
                                    </AjaxControlToolkit:AutoCompleteExtender>  
                                    <asp:Label
                                        ID="lbl_Numero"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Par_Razon_Social_NumeroRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                    <asp:TextBox 
                                        ID="Par_Razon_Social_Numero" 
                                        runat="server" 
                                        CssClass="TEXTO_COMBOPER_KCG"     
                                        ToolTip='<%# GetLocalResourceObject("Par_Razon_Social_NumeroRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Par_Razon_Social_Numero") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        ID="rfv_Par_Razon_Social_Numero"
                                        runat="server" 
                                        ControlToValidate="Par_Razon_Social_Numero"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="vce_Par_Razon_Social_Numero"
                                        TargetControlID="rfv_Par_Razon_Social_Numero"/>
                                     <AjaxControlToolkit:AutoCompleteExtender
                                        runat="server" 
                                        BehaviorID="AutoCompleteEx_Social_Numero"
                                        ID="AutoCo_Social_Numero" 
                                        TargetControlID="Par_Razon_Social_Numero"
                                        ServicePath="~/PER/PER_PERSONAL.aspx" 
                                        ServiceMethod="Get_Par_Razon_Social_Numero"
                                        MinimumPrefixLength="0" 
                                        CompletionInterval="500"
                                        EnableCaching="true"
                                        CompletionSetCount="500"
                                        CompletionListCssClass="autocomplete_completionListElement" 
                                        CompletionListItemCssClass="autocomplete_listItem" 
                                        CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                        OnClientItemSelected="ItemSelected_Par_Razon_Social_Numero" 
                                        UseContextKey="true"
                                        ContextKey="variable" 
                                        OnClientPopulating="Populating_Par_Razon_Social_Numero" >    
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
                                                        var behavior = $find('AutoCompleteEx_Social_Numero');
                                                        if (!behavior._height) {
                                                            var target = behavior.get_completionList();
                                                            behavior._height = target.offsetHeight - 2;
                                                            target.style.height = '0px';
                                                        }" />                                                    
                                                    <%-- Expand from 0px to the appropriate size while fading in --%>
                                                    <Parallel Duration=".4">
                                                        <FadeIn />
                                                        <Length PropertyKey="height" StartValue="0" EndValueScript="$find('AutoCompleteEx_Social_Numero')._height" />
                                                    </Parallel>
                                                </Sequence>
                                            </OnShow>
                                            <OnHide>
                                                <%-- Collapse down to 0px and fade out --%>
                                                <Parallel Duration=".4">
                                                    <FadeOut />
                                                    <Length PropertyKey="height" StartValueScript="$find('AutoCompleteEx_Social_Numero')._height" EndValue="0" />
                                                </Parallel>
                                            </OnHide>
                                        </Animations>
                                    </AjaxControlToolkit:AutoCompleteExtender>  
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lbl_Nombre"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Par_Razon_Social_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Par_Razon_Social_Nombre" 
                                        runat="server" 
                                        Width="400px"
                                        CssClass="TEXTO_COMBOPER_KCG"     
                                        ToolTip='<%# GetLocalResourceObject("Par_Razon_Social_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Par_Razon_Social_Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        ID="rfv_Par_Razon_Social_Nombre"
                                        runat="server" 
                                        ControlToValidate="Par_Razon_Social_Nombre"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="vce_Par_Razon_Social_Nombre"
                                        TargetControlID="rfv_Par_Razon_Social_Nombre"/>
                                     <AjaxControlToolkit:AutoCompleteExtender
                                        runat="server" 
                                        BehaviorID="AutoCompleteEx_Social_Nombre"
                                        ID="AutoCo_Social_Nombre" 
                                        TargetControlID="Par_Razon_Social_Nombre"
                                        ServicePath="~/PER/PER_PERSONAL.aspx" 
                                        ServiceMethod="Get_Par_Razon_Social_Nombre"
                                        MinimumPrefixLength="0" 
                                        CompletionInterval="500"
                                        EnableCaching="true"
                                        CompletionSetCount="500"
                                        CompletionListCssClass="autocomplete_completionListElement" 
                                        CompletionListItemCssClass="autocomplete_listItem" 
                                        CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                        OnClientItemSelected="ItemSelected_Par_Razon_Social_Nombre" 
                                        UseContextKey="true"
                                        ContextKey="variable" 
                                        OnClientPopulating="Populating_Par_Razon_Social_Nombre" >    
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
                                                        var behavior = $find('AutoCompleteEx_Social_Nombre');
                                                        if (!behavior._height) {
                                                            var target = behavior.get_completionList();
                                                            behavior._height = target.offsetHeight - 2;
                                                            target.style.height = '0px';
                                                        }" />                                                    
                                                    <%-- Expand from 0px to the appropriate size while fading in --%>
                                                    <Parallel Duration=".4">
                                                        <FadeIn />
                                                        <Length PropertyKey="height" StartValue="0" EndValueScript="$find('AutoCompleteEx_Social_Nombre')._height" />
                                                    </Parallel>
                                                </Sequence>
                                            </OnShow>
                                            <OnHide>
                                                <%-- Collapse down to 0px and fade out --%>
                                                <Parallel Duration=".4">
                                                    <FadeOut />
                                                    <Length PropertyKey="height" StartValueScript="$find('AutoCompleteEx_Social_Nombre')._height" EndValue="0" />
                                                </Parallel>
                                            </OnHide>
                                        </Animations>
                                    </AjaxControlToolkit:AutoCompleteExtender>  
                                    <asp:Button 
                                        ID="btnZoom" 
                                        runat="server"                                                                                                                                                     
                                        CommandArgument="RutaDestino: ~/PAR/PAR_RAZON_SOCIAL.aspx; Filtro: Par_Razon_Social_Nombre; Obtener: Int_Empresa_Nombre|Numero;"
                                        CommandName="Zoom" 
                                        Text="..." /> 
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <asp:Panel
                        ID="pnl_Personal"
                        runat="server"
                        meta:resourcekey="Rec_Per_PersonalRecursoKCG" >
                        <table>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lbl_Codigo_Identificacion"
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
                                <td 
                                    colspan="2"
                                    align="right">
                                    <asp:label
                                        id="lblestado"
                                        runat="server"
                                        ForeColor="Red"                                        
                                        Text='<%# Bind("Estado_Nombre") %>'>
                                    </asp:label>                                  
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lbl_Cuenta_Usuario"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Per_Personal_UsuarioRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td colspan="3">
                                    <asp:TextBox 
                                        ID="Per_Personal_Usuario" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Width="400px"
                                        ToolTip='<%# GetLocalResourceObject("Per_Personal_UsuarioRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Per_Personal_Usuario") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lbl_Jefe_Fiscalizacion"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Jefe_FiscalizacionRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Jefe_Fiscalizacion" 
                                        runat="server" 
                                        style="display:none"
                                        Text='<%# Bind("Jefe_Fiscalizacion") %>'>
                                    </asp:TextBox>
                                    <asp:DropDownList 
                                        ID="ddlJefe_Fiscalizacion" 
                                        runat="server" 
                                        Width="155px"
                                        CssClass="TEXTO_EDICION_KCG"
                                        DataSourceID="odsJefe_Fiscalizacion"
                                        DataTextField="Nombre" 
                                        DataValueField="Dic_Dominio_Dominio"
                                        OnDataBound="Jefe_Fiscalizacion_DataBound">
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource 
                                        ID="odsJefe_Fiscalizacion" 
                                        runat="server" 
                                        OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetByObjetoCampo" 
                                        TypeName="FEL.VER.BO_Ver_Dominio">
                                        <SelectParameters>
                                        <asp:Parameter 
                                            DefaultValue="Nombre" 
                                            Name="sortExpression" 
                                            Type="String" />
                                        <asp:SessionParameter 
                                            DefaultValue="" 
                                            Name="s" 
                                            SessionField="Scope" 
                                            Type="Object" />
                                        <asp:Parameter 
                                        DefaultValue="PER_PERSONAL" 
                                            Name="Dic_Objeto_Nombre" 
                                            Type="String" />
                                        <asp:Parameter 
                                            DefaultValue="Jefe_Fiscalizacion" 
                                            Name="Dic_Campo_Nombre" 
                                            Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </td>
                                <td>
                                    <asp:Label
                                        ID="lbl_Fiscalizador"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("FiscalizadorRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Fiscalizacion" 
                                        runat="server" 
                                        style="display:none"
                                        Text='<%# Bind("Fiscalizacion") %>'>
                                    </asp:TextBox>
                                    <asp:DropDownList 
                                        ID="ddlFiscalizacion" 
                                        runat="server" 
                                        Width="155px"
                                        CssClass="TEXTO_EDICION_KCG"
                                        DataSourceID="odsFiscalizacion"
                                        DataTextField="Nombre" 
                                        DataValueField="Dic_Dominio_Dominio"
                                        OnDataBound="Fiscalizacion_DataBound">
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource 
                                        ID="odsFiscalizacion" 
                                        runat="server" 
                                        OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetByObjetoCampo" 
                                        TypeName="FEL.VER.BO_Ver_Dominio">
                                        <SelectParameters>
                                        <asp:Parameter 
                                            DefaultValue="Nombre" 
                                            Name="sortExpression" 
                                            Type="String" />
                                        <asp:SessionParameter 
                                            DefaultValue="" 
                                            Name="s" 
                                            SessionField="Scope" 
                                            Type="Object" />
                                        <asp:Parameter 
                                        DefaultValue="PER_PERSONAL" 
                                            Name="Dic_Objeto_Nombre" 
                                            Type="String" />
                                        <asp:Parameter 
                                            DefaultValue="Fiscalizacion" 
                                            Name="Dic_Campo_Nombre" 
                                            Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>   
                                </td>
                                <td>
                                    <asp:Label
                                        ID="lbl_Tecnico_Costos"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Tecnico_CostosRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>  
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Tecnico_Costos" 
                                        runat="server" 
                                        style="display:none"
                                        Text='<%# Bind("Tecnico_Costos") %>'>
                                    </asp:TextBox>
                                    <asp:DropDownList 
                                        ID="ddlTecnico_Costos" 
                                        runat="server" 
                                        Width="155px"
                                        CssClass="TEXTO_EDICION_KCG"
                                        DataSourceID="odsTecnico_Costos"
                                        DataTextField="Nombre" 
                                        DataValueField="Dic_Dominio_Dominio"
                                        OnDataBound="Tecnico_Costos_DataBound">
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource 
                                        ID="odsTecnico_Costos" 
                                        runat="server" 
                                        OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetByObjetoCampo" 
                                        TypeName="FEL.VER.BO_Ver_Dominio">
                                        <SelectParameters>
                                        <asp:Parameter 
                                            DefaultValue="Nombre" 
                                            Name="sortExpression" 
                                            Type="String" />
                                        <asp:SessionParameter 
                                            DefaultValue="" 
                                            Name="s" 
                                            SessionField="Scope" 
                                            Type="Object" />
                                        <asp:Parameter 
                                        DefaultValue="PER_PERSONAL" 
                                            Name="Dic_Objeto_Nombre" 
                                            Type="String" />
                                        <asp:Parameter 
                                            DefaultValue="Tecnico_Costos" 
                                            Name="Dic_Campo_Nombre" 
                                            Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lbl_Contratista"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("ContratistaRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Contratista" 
                                        runat="server" 
                                        STYLE="display:none"
                                        Text='<%# Bind("Contratista") %>'>
                                    </asp:TextBox>
                                    <asp:DropDownList 
                                        ID="ddlContratista" 
                                        runat="server" 
                                        Width="155px"
                                        CssClass="TEXTO_EDICION_KCG"
                                        DataSourceID="odsContratista"
                                        DataTextField="Nombre" 
                                        DataValueField="Dic_Dominio_Dominio"
                                        OnDataBound="Contratista_DataBound">
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource 
                                        ID="odsContratista" 
                                        runat="server" 
                                        OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetByObjetoCampo" 
                                        TypeName="FEL.VER.BO_Ver_Dominio">
                                        <SelectParameters>
                                        <asp:Parameter 
                                            DefaultValue="Nombre" 
                                            Name="sortExpression" 
                                            Type="String" />
                                        <asp:SessionParameter 
                                            DefaultValue="" 
                                            Name="s" 
                                            SessionField="Scope" 
                                            Type="Object" />
                                        <asp:Parameter 
                                        DefaultValue="PER_PERSONAL" 
                                            Name="Dic_Objeto_Nombre" 
                                            Type="String" />
                                        <asp:Parameter 
                                            DefaultValue="Contratista" 
                                            Name="Dic_Campo_Nombre" 
                                            Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>  
                                </td>
                                <td> 
                                    <asp:Label
                                        ID="lbl_Tipo_Fiscalizacion"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Tipo_FiscalizadorRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Tipo_Fiscalizacion" 
                                        runat="server" 
                                        Style="display:none"
                                        Text='<%# Bind("Tipo_Fiscalizacion") %>'>
                                    </asp:TextBox>
                                    <asp:DropDownList 
                                        ID="ddlTipo_Fiscalizacion" 
                                        runat="server" 
                                        Width="155px"
                                        CssClass="TEXTO_EDICION_KCG"
                                        DataSourceID="odsTipo_Fiscalizacion"
                                        DataTextField="Nombre" 
                                        DataValueField="Dic_Dominio_Dominio"
                                        OnDataBound="Tipo_Fiscalizacion_DataBound">
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource 
                                        ID="odsTipo_Fiscalizacion" 
                                        runat="server" 
                                        OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetByObjetoCampo" 
                                        TypeName="FEL.VER.BO_Ver_Dominio">
                                        <SelectParameters>
                                        <asp:Parameter 
                                            DefaultValue="Nombre" 
                                            Name="sortExpression" 
                                            Type="String" />
                                        <asp:SessionParameter 
                                            DefaultValue="" 
                                            Name="s" 
                                            SessionField="Scope" 
                                            Type="Object" />
                                        <asp:Parameter 
                                        DefaultValue="PER_PERSONAL" 
                                            Name="Dic_Objeto_Nombre" 
                                            Type="String" />
                                        <asp:Parameter 
                                            DefaultValue="Tipo_Fiscalizacion" 
                                            Name="Dic_Campo_Nombre" 
                                            Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </td>
                                <td>   
                                    <asp:Label
                                        ID="lbl_Coordinador"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("CoordinadorRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Coordinador" 
                                        runat="server" 
                                        Style="display:none"
                                        Text='<%# Bind("Coordinador") %>'>
                                    </asp:TextBox>
                                    <asp:DropDownList 
                                        ID="ddlCoordinador" 
                                        runat="server" 
                                        Width="155px"
                                        CssClass="TEXTO_EDICION_KCG"
                                        DataSourceID="odsCoordinador"
                                        DataTextField="Nombre" 
                                        DataValueField="Dic_Dominio_Dominio"
                                        OnDataBound="Coordinador_DataBound">
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource 
                                        ID="odsCoordinador" 
                                        runat="server" 
                                        OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetByObjetoCampo" 
                                        TypeName="FEL.VER.BO_Ver_Dominio">
                                        <SelectParameters>
                                        <asp:Parameter 
                                            DefaultValue="Nombre" 
                                            Name="sortExpression" 
                                            Type="String" />
                                        <asp:SessionParameter 
                                            DefaultValue="" 
                                            Name="s" 
                                            SessionField="Scope" 
                                            Type="Object" />
                                        <asp:Parameter 
                                        DefaultValue="PER_PERSONAL" 
                                            Name="Dic_Objeto_Nombre" 
                                            Type="String" />
                                        <asp:Parameter 
                                            DefaultValue="Coordinador" 
                                            Name="Dic_Campo_Nombre" 
                                            Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>  
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
                    
                        <%-- ID's--%>
                           
                    <asp:TextBox 
                        ID="Int_Empresa_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Int_Empresa_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Par_Razon_Social_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Par_Razon_Social_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Par_Tipo_Identificacion_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Par_Tipo_Identificacion_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    
                        <%--CAMPOS OCULTOS--%>

                    <asp:TextBox 
                        ID="Jefe_Costos" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Jefe_Costos") %>'>
                    </asp:TextBox>
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
                        ID="Par_Razon_Social_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Par_Razon_Social_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Par_Razon_Social_Nom_Comercial" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Par_Razon_Social_Nom_Comercial") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Coordinador_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Coordinador_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Tecnico_Costos_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Tecnico_Costos_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Jefe_Costos_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Jefe_Costos_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Tipo_Fiscalizacion_Nombre"
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Tipo_Fiscalizacion_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Jefe_Fiscalizacion_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Jefe_Fiscalizacion_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Fiscalizacion_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Fiscalizacion_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Contratista_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Contratista_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Estado_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Estado_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Codigo_int" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Codigo_int") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Nombre") %>'>
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
                        ID="pnl_Razon_Social" 
                        runat="server" 
                        meta:resourcekey="Rec_Per_Personal_Razon_SocialRecursoKCG">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lbl_Identificacion"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Par_Tipo_Identificacion_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Par_Tipo_Identificacion_Nombre" 
                                        runat="server" 
                                        CssClass="TEXTO_COMBOPER_KCG"     
                                        ToolTip='<%# GetLocalResourceObject("Par_Tipo_Identificacion_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Par_Tipo_Identificacion_Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        ID="rfv_Par_Tipo_Identificacion_Nombre"
                                        runat="server" 
                                        ControlToValidate="Par_Tipo_Identificacion_Nombre"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="vce_Par_Tipo_Identificacion_Nombre"
                                        TargetControlID="rfv_Par_Tipo_Identificacion_Nombre"/>
                                     <AjaxControlToolkit:AutoCompleteExtender
                                        runat="server" 
                                        BehaviorID="AutoCompleteEx_Tipo_Identificacion"
                                        ID="AutoCo_Tipo_Identificacion" 
                                        TargetControlID="Par_Tipo_Identificacion_Nombre"
                                        ServicePath="~/PER/PER_PERSONAL.aspx" 
                                        ServiceMethod="Get_Par_Tipo_Identificacion_Nombre"
                                        MinimumPrefixLength="0" 
                                        CompletionInterval="500"
                                        EnableCaching="true"
                                        CompletionSetCount="500"
                                        CompletionListCssClass="autocomplete_completionListElement" 
                                        CompletionListItemCssClass="autocomplete_listItem" 
                                        CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                        OnClientItemSelected="ItemSelected_Par_Tipo_Identificacion_Nombre" >    
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
                                                        var behavior = $find('AutoCompleteEx_Tipo_Identificacion');
                                                        if (!behavior._height) {
                                                            var target = behavior.get_completionList();
                                                            behavior._height = target.offsetHeight - 2;
                                                            target.style.height = '0px';
                                                        }" />                                                    
                                                    <%-- Expand from 0px to the appropriate size while fading in --%>
                                                    <Parallel Duration=".4">
                                                        <FadeIn />
                                                        <Length PropertyKey="height" StartValue="0" EndValueScript="$find('AutoCompleteEx_Tipo_Identificacion')._height" />
                                                    </Parallel>
                                                </Sequence>
                                            </OnShow>
                                            <OnHide>
                                                <%-- Collapse down to 0px and fade out --%>
                                                <Parallel Duration=".4">
                                                    <FadeOut />
                                                    <Length PropertyKey="height" StartValueScript="$find('AutoCompleteEx_Tipo_Identificacion')._height" EndValue="0" />
                                                </Parallel>
                                            </OnHide>
                                        </Animations>
                                    </AjaxControlToolkit:AutoCompleteExtender>  
                                    <asp:Label
                                        ID="lbl_Numero"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Par_Razon_Social_NumeroRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                    <asp:TextBox 
                                        ID="Par_Razon_Social_Numero" 
                                        runat="server" 
                                        CssClass="TEXTO_COMBOPER_KCG"     
                                        ToolTip='<%# GetLocalResourceObject("Par_Razon_Social_NumeroRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Par_Razon_Social_Numero") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        ID="rfv_Par_Razon_Social_Numero"
                                        runat="server" 
                                        ControlToValidate="Par_Razon_Social_Numero"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="vce_Par_Razon_Social_Numero"
                                        TargetControlID="rfv_Par_Razon_Social_Numero"/>
                                     <AjaxControlToolkit:AutoCompleteExtender
                                        runat="server" 
                                        BehaviorID="AutoCompleteEx_Social_Numero"
                                        ID="AutoCo_Social_Numero" 
                                        TargetControlID="Par_Razon_Social_Numero"
                                        ServicePath="~/PER/PER_PERSONAL.aspx" 
                                        ServiceMethod="Get_Par_Razon_Social_Numero"
                                        MinimumPrefixLength="0" 
                                        CompletionInterval="500"
                                        EnableCaching="true"
                                        CompletionSetCount="500"
                                        CompletionListCssClass="autocomplete_completionListElement" 
                                        CompletionListItemCssClass="autocomplete_listItem" 
                                        CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                        OnClientItemSelected="ItemSelected_Par_Razon_Social_Numero"
                                        UseContextKey="true"
                                        ContextKey="variable" 
                                        OnClientPopulating="Populating_Par_Razon_Social_Numero" >       
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
                                                        var behavior = $find('AutoCompleteEx_Social_Numero');
                                                        if (!behavior._height) {
                                                            var target = behavior.get_completionList();
                                                            behavior._height = target.offsetHeight - 2;
                                                            target.style.height = '0px';
                                                        }" />                                                    
                                                    <%-- Expand from 0px to the appropriate size while fading in --%>
                                                    <Parallel Duration=".4">
                                                        <FadeIn />
                                                        <Length PropertyKey="height" StartValue="0" EndValueScript="$find('AutoCompleteEx_Social_Numero')._height" />
                                                    </Parallel>
                                                </Sequence>
                                            </OnShow>
                                            <OnHide>
                                                <%-- Collapse down to 0px and fade out --%>
                                                <Parallel Duration=".4">
                                                    <FadeOut />
                                                    <Length PropertyKey="height" StartValueScript="$find('AutoCompleteEx_Social_Numero')._height" EndValue="0" />
                                                </Parallel>
                                            </OnHide>
                                        </Animations>
                                    </AjaxControlToolkit:AutoCompleteExtender>  
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lbl_Nombre"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Par_Razon_Social_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Par_Razon_Social_Nombre" 
                                        runat="server" 
                                        Width="400px"
                                        CssClass="TEXTO_COMBOPER_KCG"     
                                        ToolTip='<%# GetLocalResourceObject("Par_Razon_Social_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Par_Razon_Social_Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        ID="rfv_Par_Razon_Social_Nombre"
                                        runat="server" 
                                        ControlToValidate="Par_Razon_Social_Nombre"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="vce_Par_Razon_Social_Nombre"
                                        TargetControlID="rfv_Par_Razon_Social_Nombre"/>
                                     <AjaxControlToolkit:AutoCompleteExtender
                                        runat="server" 
                                        BehaviorID="AutoCompleteEx_Social_Nombre"
                                        ID="AutoCo_Social_Nombre" 
                                        TargetControlID="Par_Razon_Social_Nombre"
                                        ServicePath="~/PER/PER_PERSONAL.aspx" 
                                        ServiceMethod="Get_Par_Razon_Social_Nombre"
                                        MinimumPrefixLength="0" 
                                        CompletionInterval="500"
                                        EnableCaching="true"
                                        CompletionSetCount="500"
                                        CompletionListCssClass="autocomplete_completionListElement" 
                                        CompletionListItemCssClass="autocomplete_listItem" 
                                        CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                        OnClientItemSelected="ItemSelected_Par_Razon_Social_Nombre"
                                        UseContextKey="true"
                                        ContextKey="variable" 
                                        OnClientPopulating="Populating_Par_Razon_Social_Nombre" >     
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
                                                        var behavior = $find('AutoCompleteEx_Social_Nombre');
                                                        if (!behavior._height) {
                                                            var target = behavior.get_completionList();
                                                            behavior._height = target.offsetHeight - 2;
                                                            target.style.height = '0px';
                                                        }" />                                                    
                                                    <%-- Expand from 0px to the appropriate size while fading in --%>
                                                    <Parallel Duration=".4">
                                                        <FadeIn />
                                                        <Length PropertyKey="height" StartValue="0" EndValueScript="$find('AutoCompleteEx_Social_Nombre')._height" />
                                                    </Parallel>
                                                </Sequence>
                                            </OnShow>
                                            <OnHide>
                                                <%-- Collapse down to 0px and fade out --%>
                                                <Parallel Duration=".4">
                                                    <FadeOut />
                                                    <Length PropertyKey="height" StartValueScript="$find('AutoCompleteEx_Social_Nombre')._height" EndValue="0" />
                                                </Parallel>
                                            </OnHide>
                                        </Animations>
                                    </AjaxControlToolkit:AutoCompleteExtender> 
                                    <asp:Button 
                                        ID="btnZoom" 
                                        runat="server"                                                                                                                                                     
                                        CommandArgument="RutaDestino: ~/PAR/PAR_RAZON_SOCIAL.aspx; Filtro: Par_Razon_Social_Nombre; Obtener: Int_Empresa_Nombre|Numero;"
                                        CommandName="Zoom" 
                                        Text="..." /> 
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <asp:Panel
                        ID="pnl_Personal"
                        runat="server"
                        meta:resourcekey="Rec_Per_PersonalRecursoKCG" >
                        <table>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lbl_Codigo_Identificacion"
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
                                <td 
                                    colspan="2"
                                    align="right">
                                    <asp:label
                                        id="lblestado"
                                        runat="server"
                                        ForeColor="Red"                                        
                                        Text='<%# Bind("Estado_Nombre") %>'>
                                    </asp:label>                                  
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lbl_Cuenta_Usuario"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Per_Personal_UsuarioRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td colspan="3">
                                    <asp:TextBox 
                                        ID="Per_Personal_Usuario" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Width="400px"
                                        ToolTip='<%# GetLocalResourceObject("Per_Personal_UsuarioRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Per_Personal_Usuario") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lbl_Jefe_Fiscalizacion"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Jefe_FiscalizacionRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Jefe_Fiscalizacion" 
                                        runat="server" 
                                        style="display:none"
                                        Text='<%# Bind("Jefe_Fiscalizacion") %>'>
                                    </asp:TextBox>
                                    <asp:DropDownList 
                                        ID="ddlJefe_Fiscalizacion" 
                                        runat="server" 
                                        Width="155px"
                                        CssClass="TEXTO_EDICION_KCG"
                                        DataSourceID="odsJefe_Fiscalizacion"
                                        DataTextField="Nombre" 
                                        DataValueField="Dic_Dominio_Dominio"
                                        OnDataBound="Jefe_Fiscalizacion_DataBound">
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource 
                                        ID="odsJefe_Fiscalizacion" 
                                        runat="server" 
                                        OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetByObjetoCampo" 
                                        TypeName="FEL.VER.BO_Ver_Dominio">
                                        <SelectParameters>
                                        <asp:Parameter 
                                            DefaultValue="Nombre" 
                                            Name="sortExpression" 
                                            Type="String" />
                                        <asp:SessionParameter 
                                            DefaultValue="" 
                                            Name="s" 
                                            SessionField="Scope" 
                                            Type="Object" />
                                        <asp:Parameter 
                                        DefaultValue="PER_PERSONAL" 
                                            Name="Dic_Objeto_Nombre" 
                                            Type="String" />
                                        <asp:Parameter 
                                            DefaultValue="Jefe_Fiscalizacion" 
                                            Name="Dic_Campo_Nombre" 
                                            Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </td>
                                <td>
                                    <asp:Label
                                        ID="lbl_Fiscalizador"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("FiscalizadorRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Fiscalizacion" 
                                        runat="server" 
                                        style="display:none"
                                        Text='<%# Bind("Fiscalizacion") %>'>
                                    </asp:TextBox>
                                    <asp:DropDownList 
                                        ID="ddlFiscalizacion" 
                                        runat="server" 
                                        Width="155px"
                                        CssClass="TEXTO_EDICION_KCG"
                                        DataSourceID="odsFiscalizacion"
                                        DataTextField="Nombre" 
                                        DataValueField="Dic_Dominio_Dominio"
                                        OnDataBound="Fiscalizacion_DataBound">
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource 
                                        ID="odsFiscalizacion" 
                                        runat="server" 
                                        OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetByObjetoCampo" 
                                        TypeName="FEL.VER.BO_Ver_Dominio">
                                        <SelectParameters>
                                        <asp:Parameter 
                                            DefaultValue="Nombre" 
                                            Name="sortExpression" 
                                            Type="String" />
                                        <asp:SessionParameter 
                                            DefaultValue="" 
                                            Name="s" 
                                            SessionField="Scope" 
                                            Type="Object" />
                                        <asp:Parameter 
                                        DefaultValue="PER_PERSONAL" 
                                            Name="Dic_Objeto_Nombre" 
                                            Type="String" />
                                        <asp:Parameter 
                                            DefaultValue="Fiscalizacion" 
                                            Name="Dic_Campo_Nombre" 
                                            Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource> 
                                </td>
                                <td>
                                    <asp:Label
                                        ID="lbl_Tecnico_Costos"
                                        runat="server"
                                         Text='<%# GetLocalResourceObject("Tecnico_CostosRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>  
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Tecnico_Costos" 
                                        runat="server" 
                                        style="display:none"
                                        Text='<%# Bind("Tecnico_Costos") %>'>
                                    </asp:TextBox>
                                    <asp:DropDownList 
                                        ID="ddlTecnico_Costos" 
                                        runat="server" 
                                        Width="155px"
                                        CssClass="TEXTO_EDICION_KCG"
                                        DataSourceID="odsTecnico_Costos"
                                        DataTextField="Nombre" 
                                        DataValueField="Dic_Dominio_Dominio"
                                        OnDataBound="Tecnico_Costos_DataBound">
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource 
                                        ID="odsTecnico_Costos" 
                                        runat="server" 
                                        OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetByObjetoCampo" 
                                        TypeName="FEL.VER.BO_Ver_Dominio">
                                        <SelectParameters>
                                        <asp:Parameter 
                                            DefaultValue="Nombre" 
                                            Name="sortExpression" 
                                            Type="String" />
                                        <asp:SessionParameter 
                                            DefaultValue="" 
                                            Name="s" 
                                            SessionField="Scope" 
                                            Type="Object" />
                                        <asp:Parameter 
                                        DefaultValue="PER_PERSONAL" 
                                            Name="Dic_Objeto_Nombre" 
                                            Type="String" />
                                        <asp:Parameter 
                                            DefaultValue="Tecnico_Costos" 
                                            Name="Dic_Campo_Nombre" 
                                            Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lbl_Contratista"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("ContratistaRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Contratista" 
                                        runat="server" 
                                        STYLE="display:none"
                                        Text='<%# Bind("Contratista") %>'>
                                    </asp:TextBox>
                                    <asp:DropDownList 
                                        ID="ddlContratista" 
                                        runat="server" 
                                        Width="155px"
                                        CssClass="TEXTO_EDICION_KCG"
                                        DataSourceID="odsContratista"
                                        DataTextField="Nombre" 
                                        DataValueField="Dic_Dominio_Dominio"
                                        OnDataBound="Contratista_DataBound">
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource 
                                        ID="odsContratista" 
                                        runat="server" 
                                        OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetByObjetoCampo" 
                                        TypeName="FEL.VER.BO_Ver_Dominio">
                                        <SelectParameters>
                                        <asp:Parameter 
                                            DefaultValue="Nombre" 
                                            Name="sortExpression" 
                                            Type="String" />
                                        <asp:SessionParameter 
                                            DefaultValue="" 
                                            Name="s" 
                                            SessionField="Scope" 
                                            Type="Object" />
                                        <asp:Parameter 
                                        DefaultValue="PER_PERSONAL" 
                                            Name="Dic_Objeto_Nombre" 
                                            Type="String" />
                                        <asp:Parameter 
                                            DefaultValue="Contratista" 
                                            Name="Dic_Campo_Nombre" 
                                            Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>  
                                </td>
                                <td> 
                                    <asp:Label
                                        ID="lbl_Tipo_Fiscalizacion"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Tipo_FiscalizadorRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Tipo_Fiscalizacion" 
                                        runat="server" 
                                        Style="display:none"
                                        Text='<%# Bind("Tipo_Fiscalizacion") %>'>
                                    </asp:TextBox>
                                    <asp:DropDownList 
                                        ID="ddlTipo_Fiscalizacion" 
                                        runat="server" 
                                        Width="155px"
                                        CssClass="TEXTO_EDICION_KCG"
                                        DataSourceID="odsTipo_Fiscalizacion"
                                        DataTextField="Nombre" 
                                        DataValueField="Dic_Dominio_Dominio"
                                        OnDataBound="Tipo_Fiscalizacion_DataBound">
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource 
                                        ID="odsTipo_Fiscalizacion" 
                                        runat="server" 
                                        OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetByObjetoCampo" 
                                        TypeName="FEL.VER.BO_Ver_Dominio">
                                        <SelectParameters>
                                        <asp:Parameter 
                                            DefaultValue="Nombre" 
                                            Name="sortExpression" 
                                            Type="String" />
                                        <asp:SessionParameter 
                                            DefaultValue="" 
                                            Name="s" 
                                            SessionField="Scope" 
                                            Type="Object" />
                                        <asp:Parameter 
                                        DefaultValue="PER_PERSONAL" 
                                            Name="Dic_Objeto_Nombre" 
                                            Type="String" />
                                        <asp:Parameter 
                                            DefaultValue="Tipo_Fiscalizacion" 
                                            Name="Dic_Campo_Nombre" 
                                            Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource> 
                                </td>
                                <td>  
                                    <asp:Label
                                        ID="lbl_Coordinador"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("CoordinadorRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Coordinador" 
                                        runat="server" 
                                        Style="display:none"
                                        Text='<%# Bind("Coordinador") %>'>
                                    </asp:TextBox>
                                    <asp:DropDownList 
                                        ID="ddlCoordinador" 
                                        runat="server" 
                                        Width="155px"
                                        CssClass="TEXTO_EDICION_KCG"
                                        DataSourceID="odsCoordinador"
                                        DataTextField="Nombre" 
                                        DataValueField="Dic_Dominio_Dominio"
                                        OnDataBound="Coordinador_DataBound">
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource 
                                        ID="odsCoordinador" 
                                        runat="server" 
                                        OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetByObjetoCampo" 
                                        TypeName="FEL.VER.BO_Ver_Dominio">
                                        <SelectParameters>
                                        <asp:Parameter 
                                            DefaultValue="Nombre" 
                                            Name="sortExpression" 
                                            Type="String" />
                                        <asp:SessionParameter 
                                            DefaultValue="" 
                                            Name="s" 
                                            SessionField="Scope" 
                                            Type="Object" />
                                        <asp:Parameter 
                                        DefaultValue="PER_PERSONAL" 
                                            Name="Dic_Objeto_Nombre" 
                                            Type="String" />
                                        <asp:Parameter 
                                            DefaultValue="Coordinador" 
                                            Name="Dic_Campo_Nombre" 
                                            Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>   
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
                    
                        <%-- ID's--%>
                           
                    <asp:TextBox 
                        ID="Int_Empresa_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Int_Empresa_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Par_Razon_Social_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Par_Razon_Social_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Par_Tipo_Identificacion_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Par_Tipo_Identificacion_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    
                        <%--CAMPOS OCULTOS--%>
                    
                    <asp:TextBox 
                        ID="Jefe_Costos" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Jefe_Costos") %>'>
                    </asp:TextBox>
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
                        ID="Par_Razon_Social_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Par_Razon_Social_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Par_Razon_Social_Nom_Comercial" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Par_Razon_Social_Nom_Comercial") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Coordinador_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Coordinador_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Tecnico_Costos_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Tecnico_Costos_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Jefe_Costos_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Jefe_Costos_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Tipo_Fiscalizacion_Nombre"
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Tipo_Fiscalizacion_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Jefe_Fiscalizacion_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Jefe_Fiscalizacion_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Fiscalizacion_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Fiscalizacion_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Contratista_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Contratista_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Estado_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Estado_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Codigo_int" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Codigo_int") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Nombre") %>'>
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
                        ID="pnl_Razon_Social" 
                        runat="server" 
                        meta:resourcekey="Rec_Per_Personal_Razon_SocialRecursoKCG">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lbl_Identificacion"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Par_Tipo_Identificacion_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Par_Tipo_Identificacion_Nombre" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Par_Tipo_Identificacion_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Par_Tipo_Identificacion_Nombre") %>'>
                                    </asp:TextBox>
                                    
                                    <asp:Label
                                        ID="lbl_Numero"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Par_Razon_Social_NumeroRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                    <asp:TextBox 
                                        ID="Par_Razon_Social_Numero" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Par_Razon_Social_NumeroRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Par_Razon_Social_Numero") %>'>
                                    </asp:TextBox>
                                    
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lbl_Nombre"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Par_Razon_Social_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Par_Razon_Social_Nombre" 
                                        runat="server" 
                                        Width="400px"
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Par_Razon_Social_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Par_Razon_Social_Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:Button 
                                        ID="btnZoom" 
                                        runat="server"                                                                                                                                                     
                                        CommandArgument="RutaDestino: ~/PAR/PAR_RAZON_SOCIAL.aspx; Filtro: Par_Razon_Social_Nombre; Obtener: Int_Empresa_Nombre|Numero;"
                                        CommandName="Zoom" 
                                        Text="..."
                                        Enabled="false" /> 
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <asp:Panel
                        ID="pnl_Personal"
                        runat="server"
                        meta:resourcekey="Rec_Per_PersonalRecursoKCG" >
                        <table>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lbl_Codigo_Identificacion"
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
                                <td 
                                    colspan="2"
                                    align="right">
                                    <asp:label
                                        id="lblestado"
                                        runat="server"
                                        ForeColor="Red"                                        
                                        Text='<%# Bind("Estado_Nombre") %>'>
                                    </asp:label>                                  
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lbl_Cuenta_Usuario"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Per_Personal_UsuarioRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td colspan="3">
                                    <asp:TextBox 
                                        ID="Per_Personal_Usuario" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Width="400px"
                                        ToolTip='<%# GetLocalResourceObject("Per_Personal_UsuarioRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Per_Personal_Usuario") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lbl_Jefe_Fiscalizacion"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Jefe_FiscalizacionRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Jefe_Fiscalizacion_Nombre" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Jefe_FiscalizacionRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Jefe_Fiscalizacion_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label
                                        ID="lbl_Fiscalizador"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("FiscalizadorRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Fiscalizacion_Nombre" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("FiscalizadorRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Fiscalizacion_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label
                                        ID="lbl_Tecnico_Costos"
                                        runat="server"
                                         Text='<%# GetLocalResourceObject("Tecnico_CostosRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Tecnico_Costos_Nombre" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"    
                                        ToolTip='<%# GetLocalResourceObject("Tecnico_CostosRecursoKCG.ToolTip").ToString() %>'                                    
                                        Text='<%# Bind("Tecnico_Costos_Nombre") %>'>
                                    </asp:TextBox>                                 
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lbl_Contratista"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("ContratistaRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Contratista_Nombre" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("ContratistaRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Contratista_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label
                                        ID="lbl_Tipo_Fiscalizacion"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Tipo_FiscalizadorRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Tipo_Fiscalizacion_Nombre" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Tipo_FiscalizadorRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Tipo_Fiscalizacion_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label
                                        ID="lbl_Coordinador"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("CoordinadorRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Coordinador_Nombre" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("CoordinadorRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Coordinador_Nombre") %>'>
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
                    </asp:Panel>
                    
                        <%-- ID's--%>
                           
                    <asp:TextBox 
                        ID="Int_Empresa_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Int_Empresa_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Par_Razon_Social_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Par_Razon_Social_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Par_Tipo_Identificacion_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Par_Tipo_Identificacion_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    
                        <%--CAMPOS OCULTOS--%>
                    
                    <asp:TextBox 
                        ID="Coordinador" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Coordinador") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Tecnico_Costos" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Tecnico_Costos") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Jefe_Costos" 
                        runat="server" 
                        Visible="false" 
                        Text='<%# Bind("Jefe_Costos") %>'>
                    </asp:TextBox>
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
                        ID="Par_Razon_Social_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Par_Razon_Social_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Par_Razon_Social_Nom_Comercial" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Par_Razon_Social_Nom_Comercial") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Jefe_Costos_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Jefe_Costos_Nombre") %>'>
                    </asp:TextBox>                       
                    <asp:TextBox 
                        ID="Tipo_Fiscalizacion"
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Tipo_Fiscalizacion") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Jefe_Fiscalizacion" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Jefe_Fiscalizacion") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Fiscalizacion" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Fiscalizacion") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Contratista" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Contratista") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Estado_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Estado_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Codigo_int" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Codigo_int") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Estado" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Estado") %>'>
                    </asp:TextBox>
                </ItemTemplate>
            </asp:FormView>
            <asp:ObjectDataSource 
                ID="odsFv_Per_Personal" 
                runat="server" 
                ConflictDetection="CompareAllValues" 
                OldValuesParameterFormatString="original{0}"
                SelectMethod="GetById" 
                SortParameterName="sortExpression" 
                TypeName="FEL.PER.BO_Per_Personal" DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
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
            <asp:Button 
                ID="Atras" 
                runat="server"                 
                Visible="False" />
            <asp:Button 
                ID="Seleccionar" 
                runat="server"                 
                Visible="False" />
            <table>
                <tr>
                    <td>
                        <koala:KNavegacion 
                            ID="KNavegacion"
                            runat="server"
                            GridViewID="Gv_Per_Personal"
                            OnNavegar="nav_Siguiente" />
                    </td>
                    <td>
                        <koala:KFiltro 
                            ID="KFiltro" 
                            runat="server" 
                            Contenedor="PER_PERSONAL" 
                            Objeto="Per_Personal" 
                            IndiceScope ="Scope"
                            Orden="1"
                            ObjectDataSourceID="odsGv_Per_Personal" />
                    </td>  
                    <td>
                        <asp:Button 
                            ID="Btn_Reporte"
                            runat="server"
                            meta:resourcekey="Btn_Per_Personal_ReporteRecursoKCG"
                            OnClick="Btn_Reporte_Click"/>
                    </td>
                </tr>
            </table>
            <asp:Panel 
                ID="pnl_Listado" 
                runat="server" 
                meta:resourcekey="Rec_Listado_Per_PersonalRecursoKCG">
                <koala:KGrid  
                    ID="Gv_Per_Personal" 
                    runat="server" 
                    AllowPaging="True" 
                    AllowSorting="True"
                    AutoGenerateColumns="False"
                    DataKeyNames="Id" 
                    DataSourceID="odsGv_Per_Personal"
                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>' MostrarPaginacionSiempre="True" >                    
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
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Nombre" 
                            meta:resourcekey="BoundNombreRecursoKCG"
                            SortExpression="Nombre">
                            <ItemStyle HorizontalAlign="Left" Width="80mm" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Jefe_Fiscalizacion_Nombre" 
                            meta:resourcekey="BoundJefe_FiscalizacionRecursoKCG"
                            SortExpression="Jefe_Fiscalizacion_Nombre">
                            <ItemStyle HorizontalAlign="Left" Width="30mm" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Fiscalizacion_Nombre" 
                            meta:resourcekey="BoundFiscalizador_NombreRecursoKCG"
                            SortExpression="Fiscalizacion_Nombre">
                            <ItemStyle HorizontalAlign="Left" Width="30mm" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Tipo_Fiscalizacion_Nombre" 
                            meta:resourcekey="BoundTipo_Fiscalizador_NombreRecursoKCG"
                            SortExpression="Tipo_Fiscalizacion_Nombre">
                            <ItemStyle HorizontalAlign="Left" Width="40mm" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Contratista_Nombre" 
                            meta:resourcekey="BoundContratista_NombreRecursoKCG"
                            SortExpression="Contratista_Nombre">
                            <ItemStyle HorizontalAlign="Left" Width="30mm" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Per_Personal_Usuario" 
                            meta:resourcekey="BoundPer_Personal_UsuarioRecursoKCG"
                            SortExpression="Per_Personal_Usuario" >
                            <ItemStyle HorizontalAlign="Left" Width="80mm" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Coordinador_Nombre" 
                            meta:resourcekey="BoundCoordinadorRecursoKCG"
                            SortExpression="Coordinador_Nombre" >
                            <ItemStyle HorizontalAlign="Left" Width="30mm" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Jefe_Fiscalizacion" 
                            HeaderText="Jefe_Fiscalizacion" 
                            SortExpression="Jefe_Fiscalizacion" 
                            Visible="False">
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Coordinador" 
                            HeaderText="Coordinador" 
                            SortExpression="Coordinador"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Tecnico_Costos" 
                            HeaderText="Tecnico_Costos" 
                            SortExpression="Tecnico_Costos"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Int_Empresa_Id" 
                            HeaderText="Int_Empresa_Id" 
                            SortExpression="Int_Empresa_Id"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Jefe_Costos" 
                            HeaderText="Jefe_Costos" 
                            SortExpression="Jefe_Costos"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Par_Razon_Social_Id" 
                            HeaderText="Par_Razon_Social_Id"
                            SortExpression="Par_Razon_Social_Id" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Tipo_Fiscalizacion" 
                            HeaderText="Tipo_Fiscalizacion" 
                            SortExpression="Tipo_Fiscalizacion"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Fiscalizacion" 
                            HeaderText="Fiscalizacion" 
                            SortExpression="Fiscalizacion"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Contratista" 
                            HeaderText="Contratista" 
                            SortExpression="Contratista"
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
                            DataField="Par_Tipo_Identificacion_Id" 
                            HeaderText="Par_Tipo_Identificacion_Id"
                            SortExpression="Par_Tipo_Identificacion_Id" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Par_Tipo_Identificacion_Nombre" 
                            HeaderText="Par_Tipo_Identificacion_Nombre"
                            SortExpression="Par_Tipo_Identificacion_Nombre" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Par_Razon_Social_Codigo" 
                            HeaderText="Par_Razon_Social_Codigo"
                            SortExpression="Par_Razon_Social_Codigo" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Par_Razon_Social_Numero" 
                            HeaderText="Par_Razon_Social_Numero"
                            SortExpression="Par_Razon_Social_Numero" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Par_Razon_Social_Nom_Comercial" 
                            HeaderText="Par_Razon_Social_Nom_Comercial"
                            SortExpression="Par_Razon_Social_Nom_Comercial" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Tecnico_Costos_Nombre" 
                            HeaderText="Tecnico_Costos_Nombre"
                            SortExpression="Tecnico_Costos_Nombre" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Jefe_Costos_Nombre" 
                            HeaderText="Jefe_Costos_Nombre" 
                            SortExpression="Jefe_Costos_Nombre"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Estado_Nombre" 
                            HeaderText="Estado_Nombre" 
                            SortExpression="Estado_Nombre"
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
                            DataField="Nombre" 
                            HeaderText="Nombre" 
                            SortExpression="Nombre" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Estado" 
                            HeaderText="Estado" 
                            SortExpression="Estado" 
                            Visible="False" />
                    </Columns>
                </koala:KGrid>
                <asp:ObjectDataSource 
                    ID="odsGv_Per_Personal" 
                    runat="server" 
                    ConflictDetection="CompareAllValues"
                    OldValuesParameterFormatString="original_{0}" 
                    SelectMethod="Get" 
                    TypeName="FEL.PER.BO_Per_Personal">
                    <SelectParameters>
                        <asp:SessionParameter 
                            Name="s" 
                            SessionField="Scope" 
                            Type="Object" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

