<%@ Page Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="SEG_MENU.aspx.cs" 
    Inherits="SEG_SEG_MENU" 
    Theme="EstiloKCG"
    StylesheetTheme="EstiloKCG"
    meta:resourcekey="Tit_Seg_MenuRecursoKCG" %>
    
<%@ Register tagprefix="koala" 
    assembly="KoalaWebControls" 
    namespace="Koala.KoalaWebControls" %>

<%@ Register Src="../WebUserControls/wucMensajeEliminar.ascx" 
    TagName="wucMensajeEliminar"
    TagPrefix="koala" %>

<%@ Register Src="../WebUserControls/wucMensajeActualizar.ascx" 
    TagName="wucMensajeActualizar"
    TagPrefix="koala" %>
    
<%@ Register Assembly="AjaxControlToolkit" 
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
        <asp:TextBox
            ID="Aux_Dic_Nombre"
            runat="server"
            style="display:none">
        </asp:TextBox>
        <asp:TextBox
            ID="Aux_Dic_Id"
            runat="server"
            style="display:none">
        </asp:TextBox>
    <script type="text/javascript">
        function ItemSelected_Roles( source, eventArgs ) 
        {
            var valor = eventArgs.get_value();
            var temp = new Array();
            temp = valor.split('||');                                                                   

            var Seg_Rol_Id = $get("ctl00_ContentPlaceHolder1_Seg_Rol_Id" );
            Seg_Rol_Id.value = temp[0];
            var pnlSeg_Menu = $get("ctl00_ContentPlaceHolder1_pnlSeg_Menu");
            pnlSeg_Menu.disabled = false;
        }
        
        function checkSelectedValueGrupo()
        { 
            var ddlGrupo = $get("ctl00_ContentPlaceHolder1_fvSegMenu_ddlGrupo");
            var Grupo = $get("ctl00_ContentPlaceHolder1_fvSegMenu_Grupo");            
            Grupo.value = ddlGrupo.options[ddlGrupo.selectedIndex].value;
        }
        
        function ItemSelected_Pantalla( source, eventArgs ) 
        {
            var valor = eventArgs.get_value();
            var temp = new Array();
            temp = valor.split('||');
            
            var Dic_Pantalla_Id = $get("ctl00_ContentPlaceHolder1_fvSegMenu_Dic_Pantalla_Id" );
            Dic_Pantalla_Id.value = temp[0];          
        }
        
        function ItemSelected_Elemento( source, eventArgs ) 
        {
            var valor = eventArgs.get_value();
            var temp = new Array();
            temp = valor.split('||');
            
            var Dic_Con_Elemento_Id = $get("ctl00_ContentPlaceHolder1_fvSegMenu_Dic_Con_Elemento_Id" );
            Dic_Con_Elemento_Id.value = temp[0];         
            
            var Dic_con_elemento_nombre = $get("ctl00_ContentPlaceHolder1_fvSegMenu_Dic_con_elemento_nombre");
            Dic_con_elemento_nombre.value = temp[1];
            
            var dic_contenedor_codigo = $get("ctl00_ContentPlaceHolder1_fvSegMenu_dic_contenedor_codigo");
            dic_contenedor_codigo.value = temp[2];
            
            var dic_contenedor_nombre = $get("ctl00_ContentPlaceHolder1_fvSegMenu_dic_contenedor_nombre");
            dic_contenedor_nombre.value = temp[3];
            
            var Dic_Rotulo_Codigo = $get("ctl00_ContentPlaceHolder1_fvSegMenu_Dic_Rotulo_Codigo" );
            Dic_Rotulo_Codigo.value = temp[4];
            
            var Dic_Rotulo_Nombre = $get("ctl00_ContentPlaceHolder1_fvSegMenu_Dic_Rotulo_Nombre" );
            Dic_Rotulo_Nombre.value = temp[5];
        }
        
        function ItemSelected_Contenedor( source, eventArgs )
        {
            var valor = eventArgs.get_value();
            var temp = new Array();
            temp = valor.split('||');
            
            var Dic_Con_Elemento_Id = $get("ctl00_ContentPlaceHolder1_fvSegMenu_Dic_Con_Elemento_Id" );
            Dic_Con_Elemento_Id.value = temp[0];         
            
            var Dic_con_elemento_nombre = $get("ctl00_ContentPlaceHolder1_fvSegMenu_Dic_con_elemento_nombre");
            Dic_con_elemento_nombre.value = temp[1];
            
            var dic_contenedor_codigo = $get("ctl00_ContentPlaceHolder1_fvSegMenu_dic_contenedor_codigo");
            dic_contenedor_codigo.value = temp[2];
            
            var ver_etiqueta_nombre = $get("ctl00_ContentPlaceHolder1_fvSegMenu_ver_etiqueta_nombre" );
            ver_etiqueta_nombre.value = temp[3];
            
            var Dic_Rotulo_Codigo = $get("ctl00_ContentPlaceHolder1_fvSegMenu_Dic_Rotulo_Codigo" );
            Dic_Rotulo_Codigo.value = temp[4];
            
            var Dic_Rotulo_Nombre = $get("ctl00_ContentPlaceHolder1_fvSegMenu_Dic_Rotulo_Nombre" );
            Dic_Rotulo_Nombre.value = temp[5];
        } 
         
        function Contenedor_Populating( source, eventArgs )
        {
            var Seg_Rol_Id = $get("ctl00_ContentPlaceHolder1_Seg_Rol_Id" );
            var Seg_Rol_Nombre = $get("ctl00_ContentPlaceHolder1_Seg_Rol_Nombre" );

            if(Seg_Rol_Id.value == "")
            {
                eventArgs.set_cancel(true);
                Seg_Rol_Nombre.focus();
                return;
            }
            
            var behavior = $find('AutoCompleteEx2');
            behavior.set_contextKey(Seg_Rol_Id.value);
        }
         
        function Elemento_Populating( source, eventArgs )
        {  
            var Seg_Rol_Id = $get("ctl00_ContentPlaceHolder1_Seg_Rol_Id" );
            var Seg_Rol_Nombre = $get("ctl00_ContentPlaceHolder1_Seg_Rol_Nombre" );

            if(Seg_Rol_Id.value == "")
            {
                eventArgs.set_cancel(true);
                Seg_Rol_Nombre.focus();
                return;
            }
            
            var behavior = $find('aceDic_con_elemento_nombreBI');
            behavior.set_contextKey(Seg_Rol_Id.value);
        }
     </script>
    <%--<asp:UpdatePanel 
        ID="UpdatePanel4" 
        runat="server">
        <ContentTemplate>--%>
            <asp:Panel 
                ID="pnlFiltro" 
                runat="server"
                meta:resourcekey="Rec_Seg_Menu_FiltrosRecursoKCG">
                <asp:Label 
                    ID="lblSeg_Rol_Nombre" 
                    runat="server"
                    Text='<%# GetLocalResourceObject("Lbl_Seg_Rol_NombreRecursoKCG.Text").ToString() %>'> 
                </asp:Label>        
                <asp:TextBox 
                    ID="Seg_Rol_Nombre" 
                    runat="server" 
                    CssClass="TEXTO_COMBOPER_KCG" 
                    Width="400px" 
                    ValidationGroup="F"
                    ToolTip='<%# GetLocalResourceObject("Lbl_Seg_Rol_NombreRecursoKCG.ToolTip").ToString() %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Seg_Rol_Id" 
                    runat="server" 
                    style="display:none">
                </asp:TextBox>
                <asp:RequiredFieldValidator 
                    ID="rfvSeg_Rol_Nombre"
                    runat="server" 
                    ControlToValidate="Seg_Rol_Nombre"
                    ValidationGroup="F"
                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                    Text='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ2RecursoKCG.Text").ToString() %>'/>
                <asp:Button 
                    ID="btnConsultar" 
                    runat="server" 
                    ValidationGroup="F" 
                    CausesValidation="true"
                    meta:resourcekey="Btn_Seg_Menu_ConsultarRecursoKCG" />
                <AjaxControlToolkit:ValidatorCalloutExtender 
                    runat="Server" 
                    ID="vceSeg_Rol_Nombre" 
                    TargetControlID="rfvSeg_Rol_Nombre"/>
                <AjaxControlToolkit:AutoCompleteExtender
                    runat="server" 
                    BehaviorID="AutoCompleteEx1"
                    ID="AutoCompleteExtender" 
                    TargetControlID="Seg_Rol_Nombre"
                    ServicePath="~/SEG/SEG_MENU.aspx"
                    ServiceMethod="GetRoles"
                    MinimumPrefixLength="0" 
                    CompletionInterval="500"
                    EnableCaching="true"
                    CompletionSetCount="20"
                    CompletionListCssClass="autocomplete_completionListElement" 
                    CompletionListItemCssClass="autocomplete_listItem" 
                    CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                    OnClientItemSelected="ItemSelected_Roles">                                        
                    <Animations>
                        <OnShow>
                            <Sequence>
                                <%-- Make the completion list transparent and then show it --%>
                                <OpacityAction 
                                    Opacity="0" />
                                <HideAction 
                                    Visible="true" />                                                    
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
            </asp:Panel>
        <%--</ContentTemplate>
    </asp:UpdatePanel>--%>
    <%--<asp:UpdatePanel 
        ID="UpdatePanel1" 
        runat="server"
        UpdateMode="Conditional">
        <ContentTemplate>--%>
    <asp:Panel 
        ID="pnlSeg_Menu" 
        runat="server"
        meta:resourcekey="Rec_Seg_MenuRecursoKCG">
    <asp:FormView 
        ID="fvSegMenu" 
        runat="server" 
        DataSourceID="odsFvSegMenu"
        DefaultMode="Insert">
        <EditItemTemplate>
            <table>
                <tr>
                    <td >
                        <asp:Label ID="lblCodigo" 
                            runat="server" 
                            Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'>
                        </asp:Label>
                    </td>
                    <td style="white-space:nowrap">
                        <asp:TextBox ID="Codigo"
                            ReadOnly="true"
                            TabIndex="-1" 
                            runat="server" 
                            Text='<%# Bind("Codigo") %>'
                            ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'>
                         </asp:TextBox>                   
                        <asp:Label 
                            ID="lblOrden" 
                            runat="server" 
                            Text='<%# GetLocalResourceObject("OrdenRecursoKCG.Text").ToString() %>'>
                        </asp:Label>
                        <asp:TextBox 
                            ID="Orden" 
                            runat="server"
                            CssClass="TEXTO_EDICION_KCG" 
                            style="text-align:right"
                            Text='<%# Bind("Orden") %>'
                            ToolTip='<%# GetLocalResourceObject("OrdenRecursoKCG.ToolTip").ToString() %>'>
                        </asp:TextBox>
                        <AjaxControlToolkit:MaskedEditExtender 
                            ID="meeOrden" 
                            runat="server"
                            TargetControlID="Orden"
                            Mask="9999999999999"
                            MessageValidatorTip="false"
                            OnFocusCssClass="MaskedEditFocus"
                            OnInvalidCssClass="MaskedEditError"
                            MaskType="Number"
                            InputDirection="RightToLeft"
                            AcceptNegative="None"
                            DisplayMoney="None"
                            ErrorTooltipEnabled="False"
                            ClearMaskOnLostFocus="True" />
                        <AjaxControlToolkit:MaskedEditValidator 
                            ID="mevOrden" 
                            runat="server"
                            ControlExtender="meeOrden"
                            ControlToValidate="Orden"
                            IsValidEmpty="False"
                            EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                            InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                            MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                            MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                            MinimumValue="0"
                            MaximumValue="9999999999999" 
                            Display="None"
                            EmptyValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ29RecursoKCG.Text").ToString() %>'
                            InvalidValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ29RecursoKCG.Text").ToString() %>'
                            MaximumValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ29RecursoKCG.Text").ToString() %>' 
                            MinimumValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ29RecursoKCG.Text").ToString() %>'
                            ValidationGroup="I" />                                    
                        <AjaxControlToolkit:ValidatorCalloutExtender 
                            runat="Server" 
                            ID="vceOrden"
                            TargetControlID="mevOrden"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblDic_Pantalla_Codigo" 
                            runat="server" 
                            Text='<%# GetLocalResourceObject("pantalla_ver_etiqueta_nombreRecursoKCG.Text").ToString() %>'>
                        </asp:Label>
                    </td>                    
                    <td 
                        colspan="2"
                        style="white-space:nowrap">
                        <asp:TextBox ID="pantalla_ver_etiqueta_nombre" 
                            Width="400px"
                            CssClass="TEXTO_COMBOPER_KCG" 
                            runat="server"
                            ToolTip= '<%# GetLocalResourceObject("pantalla_ver_etiqueta_nombreRecursoKCG.ToolTip").ToString() %>' 
                            Text='<%# Bind("pantalla_ver_etiqueta_nombre") %>'>
                        </asp:TextBox>                                               
                        <asp:Button 
                            ID="btnZoomDic_Pan_Nom" 
                            runat="server" 
                            CommandArgument="RutaDestino: ~/DIC/DIC_PANTALLA.aspx; 
                                            Filtro: Dic_Pantalla_Nombre; 
                                            Obtener: Dic_Pantalla_Id|Id, pantalla_ver_etiqueta_nombre|Nombre"
                            CommandName="Zoom"
                            Text="..." />
                        <AjaxControlToolkit:AutoCompleteExtender
                            runat="server" 
                            BehaviorID="AutoCompleteEx"
                            ID="aceDic_Pantalla_Nombre" 
                            TargetControlID="pantalla_ver_etiqueta_nombre"
                            ServicePath="~/SEG/SEG_MENU.aspx" 
                            ServiceMethod="GetPantalla"
                            MinimumPrefixLength="0" 
                            CompletionInterval="500"
                            EnableCaching="true"
                            CompletionSetCount="1000"
                            CompletionListCssClass="autocomplete_completionListElement" 
                            CompletionListItemCssClass="autocomplete_listItem" 
                            CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                            OnClientItemSelected="ItemSelected_Pantalla" >
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
                    </td>
                </tr>                
                <tr>
                    <td>
                        <asp:Label 
                            ID="lblGrupo" 
                            runat="server" 
                            Text='<%# GetLocalResourceObject("GrupoRecursoKCG.Text").ToString() %>'>
                        </asp:Label>
                    </td>
                    <td>                  
                        <asp:TextBox ID="grupo_nombre" 
                            runat="server"
                            TabIndex="-1" 
                            Text='<%# Bind("grupo_nombre") %>'
                            style="display:none" >
                        </asp:TextBox>
                        <asp:TextBox ID="Grupo" 
                            runat="server"
                            TabIndex="-1" 
                            Text='<%# Bind("Grupo") %>'
                            style="display:none">
                        </asp:TextBox>
                        <asp:DropDownList
                            ID="ddlGrupo" 
                            runat="server" 
                            Width="150px"
                            CssClass="TEXTO_EDICION_KCG"
                            DataSourceID="odsddlGrupo"
                            DataTextField="Nombre"
                            AppendDataBoundItems="true" 
                            DataValueField="Dic_Dominio_Dominio" 
                            OnDataBound="ddlGrupo_DataBound" >
                            <asp:ListItem Selected="True" >
                            </asp:ListItem>
                        </asp:DropDownList>
                        <asp:ObjectDataSource 
                            ID="odsddlGrupo" 
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
                                    DefaultValue="SEG_MENU" 
                                    Name="Dic_Objeto_Nombre" 
                                    Type="String" />
                                <asp:Parameter 
                                    DefaultValue="GRUPO" 
                                    Name="Dic_Campo_Nombre" 
                                    Type="String" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblDic_Contenedor_Nombre" 
                            runat="server" 
                            Text='<%# GetLocalResourceObject("Dic_Contenedor_NombreRecursoKCG.Text").ToString() %>'>
                        </asp:Label>                         
                    </td>
                    <td style="white-space:nowrap">
                         <asp:TextBox ID="dic_contenedor_codigo" 
                            ReadOnly="true"
                            TabIndex="-1"
                            runat="server"
                            style="display:none"
                            ToolTip='<%# GetLocalResourceObject("Dic_Contenedor_CodigoRecursoKCG.ToolTip").ToString() %>' 
                            Text='<%# Bind("dic_contenedor_codigo") %>'>
                        </asp:TextBox>                    
                        <asp:TextBox ID="dic_contenedor_nombre"
                            Width="400px" 
                            runat="server"
                            CssClass="TEXTO_COMBOPER_KCG"
                            Text='<%# Bind("dic_contenedor_nombre") %>'
                            ToolTip='<%# GetLocalResourceObject("Dic_Contenedor_NombreRecursoKCG.ToolTip").ToString() %>'>
                        </asp:TextBox>
                         <asp:RequiredFieldValidator ID="rfvdic_contenedor_nombre"
                            runat="server" 
                            ControlToValidate="dic_contenedor_nombre"
                            ValidationGroup="I"
                            ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                            Text='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                        <AjaxControlToolkit:ValidatorCalloutExtender 
                            runat="Server" 
                            ID="vcedic_contenedor_nombre"
                            TargetControlID="rfvdic_contenedor_nombre"/>
                        <AjaxControlToolkit:AutoCompleteExtender
                            runat="server" 
                            BehaviorID="AutoCompleteEx2"
                            ID="AutoCompleteExtender2" 
                            TargetControlID="dic_contenedor_nombre"
                            ServicePath="~/SEG/SEG_MENU.aspx" 
                            ServiceMethod="GetContenedor"
                            MinimumPrefixLength="0" 
                            CompletionInterval="500"
                            EnableCaching="true"
                            CompletionSetCount="500"
                            CompletionListCssClass="autocomplete_completionListElement" 
                            CompletionListItemCssClass="autocomplete_listItem" 
                            CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                            OnClientItemSelected="ItemSelected_Contenedor" 
                            UseContextKey="true"
                            ContextKey="0"
                            OnClientPopulating="Contenedor_Populating"><%----%>
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
                                            var behavior = $find('AutoCompleteEx2');
                                            if (!behavior._height) {
                                                var target = behavior.get_completionList();
                                                behavior._height = target.offsetHeight - 2;
                                                target.style.height = '0px';
                                            }" />                                                    
                                        <%-- Expand from 0px to the appropriate size while fading in --%>
                                        <Parallel Duration=".4">
                                            <FadeIn />
                                            <Length PropertyKey="height" StartValue="0" EndValueScript="$find('AutoCompleteEx2')._height" />
                                        </Parallel>
                                    </Sequence>
                                </OnShow>
                                <OnHide>
                                    <%-- Collapse down to 0px and fade out --%>
                                    <Parallel Duration=".4">
                                        <FadeOut />
                                        <Length PropertyKey="height" StartValueScript="$find('AutoCompleteEx2')._height" EndValue="0" />
                                    </Parallel>
                                </OnHide>
                            </Animations>
                        </AjaxControlToolkit:AutoCompleteExtender>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblVer_Etiqueta_Nombre" 
                            runat="server" 
                            Text='<%# GetLocalResourceObject("Ver_Etiqueta_NombreRecursoKCG.Text").ToString() %>'>
                        </asp:Label>
                    </td>
                    <td style="white-space:nowrap">                        
                                          
                        <asp:TextBox ID="ver_etiqueta_nombre"                            
                            runat="server"                            
                            CssClass="TEXTO_COMBOPER_KCG"
                            Width="400px"
                            ToolTip= '<%# GetLocalResourceObject("ver_etiqueta_nombreRecursoKCG.ToolTip").ToString() %>' 
                            Text='<%# Bind("ver_etiqueta_nombre") %>'>
                        </asp:TextBox>                                       
                        <asp:RequiredFieldValidator 
                            ID="rfvver_etiqueta_nombre"
                            runat="server" 
                            ControlToValidate="ver_etiqueta_nombre"
                            ValidationGroup="I"
                            ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                            Text='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                        <AjaxControlToolkit:ValidatorCalloutExtender 
                            runat="Server" 
                            ID="vcever_etiqueta_nombre" 
                            TargetControlID="rfvver_etiqueta_nombre"/>
                        <AjaxControlToolkit:AutoCompleteExtender
                            runat="server" 
                            BehaviorID="aceDic_con_elemento_nombreBI"
                            ID="aceDic_con_elemento_nombre" 
                            TargetControlID="ver_etiqueta_nombre"
                            ServicePath="~/SEG/SEG_MENU.aspx" 
                            ServiceMethod="GetElemento"
                            MinimumPrefixLength="0" 
                            CompletionInterval="500"
                            EnableCaching="true"
                            CompletionSetCount="500"
                            CompletionListCssClass="autocomplete_completionListElement" 
                            CompletionListItemCssClass="autocomplete_listItem" 
                            CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                            OnClientItemSelected="ItemSelected_Elemento"
                            UseContextKey="true"
                            ContextKey="0"
                            OnClientPopulating="Elemento_Populating" >
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
                                            var behavior = $find('aceDic_con_elemento_nombreBI');
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
                                            EndValueScript="$find('aceDic_con_elemento_nombreBI')._height" />
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
                                        StartValueScript="$find('aceDic_con_elemento_nombreBI')._height" 
                                        EndValue="0" />
                                    </Parallel>
                                </OnHide>
                            </Animations>
                        </AjaxControlToolkit:AutoCompleteExtender>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblDic_Rotulo_Nombre" 
                            runat="server" 
                            Text='<%# GetLocalResourceObject("Dic_Rotulo_NombreRecursoKCG.Text").ToString() %>'>
                        </asp:Label>                         
                    </td>
                    
                    <td style="white-space:nowrap">
                        <asp:TextBox ID="Dic_Rotulo_Codigo" 
                            runat="server" 
                            ReadOnly="true"
                            TabIndex="-1"
                            ToolTip='<%# GetLocalResourceObject("Dic_Rotulo_CodigoRecursoKCG.ToolTip").ToString() %>'
                            Text='<%# Bind("Dic_Rotulo_Codigo") %>'>
                        </asp:TextBox>                   
                        <asp:TextBox ID="Dic_Rotulo_Nombre"
                            Width="495px" 
                            runat="server"
                            ReadOnly="true"
                            TabIndex="-1"
                            Text='<%# Bind("Dic_Rotulo_Nombre") %>'
                            ToolTip='<%# GetLocalResourceObject("Dic_Rotulo_NombreRecursoKCG.ToolTip").ToString() %>'>
                        </asp:TextBox>
                    </td>
                    
                </tr>                    
                <tr align="left">
                    <td colspan="2">                                        
                        <asp:Button ID="UpdateButton" 
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
                        <koala:wucMensajeActualizar 
                            ID="WucMensajeActualizar1" 
                            runat="server" />
                    </td>
                </tr>
            </table>

            <%--Campos Ocultos--%>
            <div style="display:none">
                <asp:TextBox ID="Dic_Pantalla_Id" runat="server" Text='<%# Bind("Dic_Pantalla_Id") %>'>
                </asp:TextBox>
                <asp:TextBox ID="Int_Usuario_Id" runat="server" Text='<%# Bind("Int_Usuario_Id") %>'>
                </asp:TextBox>
                <asp:TextBox ID="Dic_Con_Elemento_Id" runat="server" Text='<%# Bind("Dic_Con_Elemento_Id") %>'>
                </asp:TextBox>
                <asp:TextBox ID="Seg_Rol_Id" runat="server" Text='<%# Bind("Seg_Rol_Id") %>'>
                </asp:TextBox>
                <asp:TextBox ID="Dic_Contenedor_id" runat="server" Text='<%# Bind("Dic_Contenedor_id") %>'>
                </asp:TextBox>
                <asp:TextBox ID="Dic_Rotulo_id" runat="server" Text='<%# Bind("Dic_Rotulo_id") %>'>
                </asp:TextBox>
                <asp:TextBox ID="Id" runat="server" Text='<%# Bind("Id") %>'>
                </asp:TextBox>
            </div>      
            
            <asp:TextBox ID="Dic_con_elemento_nombre"
                runat="server"
                style="display:none"
                Text='<%# Bind("Dic_con_elemento_nombre") %>'>
            </asp:TextBox>  
            
            <asp:TextBox ID="Dic_Pantalla_Codigo" runat="server" Visible="False" Text='<%# Bind("Dic_Pantalla_Codigo") %>'>
            </asp:TextBox>                      
            <asp:TextBox ID="Dic_Pantalla_Nombre" runat="server" Visible="false" Text='<%# Bind("Dic_Pantalla_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Dic_con_elemento_Codigo" runat="server" Visible="false" Text='<%# Bind("Dic_con_elemento_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" ID="int_usuario_codigo" runat="server" Text='<%# Bind("int_usuario_codigo") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" ID="int_usuario_nombre" runat="server" Text='<%# Bind("int_usuario_nombre") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" ID="pantalla_ver_etiqueta_imagen_activa" runat="server" Text='<%# Bind("pantalla_ver_etiqueta_imagen_activa") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" ID="pantalla_ver_etiqueta_imagen_desactiva" runat="server" Text='<%# Bind("pantalla_ver_etiqueta_imagen_desactiva") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" ID="tool_pantalla_ver_etiqueta_nombre" runat="server" Text='<%# Bind("tool_pantalla_ver_etiqueta_nombre") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" ID="Seg_Rol_Codigo" runat="server" Text='<%# Bind("Seg_Rol_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" ID="Seg_Rol_Nombre" runat="server" Text='<%# Bind("Seg_Rol_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" ID="ver_etiqueta_imagen_activa" runat="server" Text='<%# Bind("ver_etiqueta_imagen_activa") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" ID="ver_etiqueta_imagen_desactiva" runat="server" Text='<%# Bind("ver_etiqueta_imagen_desactiva") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" ID="tool_ver_etiqueta_nombre" runat="server" Text='<%# Bind("tool_ver_etiqueta_nombre") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" ID="Par_servidor_det_referencia" runat="server" Text='<%# Bind("Par_servidor_det_referencia") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" ID="estado_nombre" runat="server" Text='<%# Bind("estado_nombre") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" ID="Dic_Contenedor_Tipo" runat="server" Text='<%# Bind("Dic_Contenedor_Tipo") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" ID="Codigo_int" runat="server" Text='<%# Bind("Codigo_int") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" ID="Nombre" runat="server" Text='<%# Bind("Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" ID="Estado" runat="server" Text='<%# Bind("Estado") %>'>
            </asp:TextBox>
        </EditItemTemplate>
        
        <InsertItemTemplate>
            <table>
                <tr>
                    <td >
                        <asp:Label ID="lblCodigo" 
                            runat="server" 
                            Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'>
                        </asp:Label>
                    </td>
                    <td style="white-space:nowrap">
                        <asp:TextBox ID="Codigo"
                            ReadOnly="true"
                            TabIndex="-1" 
                            runat="server" 
                            Text='<%# Bind("Codigo") %>'
                            ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'>
                         </asp:TextBox>                   
                        <asp:Label 
                            ID="lblOrden" 
                            runat="server" 
                            Text='<%# GetLocalResourceObject("OrdenRecursoKCG.Text").ToString() %>'>
                        </asp:Label>
                        <asp:TextBox 
                            ID="Orden" 
                            runat="server"
                            CssClass="TEXTO_EDICION_KCG" 
                            style="text-align:right"
                            Text='<%# Bind("Orden") %>'
                            ToolTip='<%# GetLocalResourceObject("OrdenRecursoKCG.ToolTip").ToString() %>'>
                        </asp:TextBox>
                        <AjaxControlToolkit:MaskedEditExtender 
                            ID="meeOrden" 
                            runat="server"
                            TargetControlID="Orden"
                            Mask="9999999999999"
                            MessageValidatorTip="false"
                            OnFocusCssClass="MaskedEditFocus"
                            OnInvalidCssClass="MaskedEditError"
                            MaskType="Number"
                            InputDirection="RightToLeft"
                            AcceptNegative="None"
                            DisplayMoney="None"
                            ErrorTooltipEnabled="False"
                            ClearMaskOnLostFocus="True" />
                        <AjaxControlToolkit:MaskedEditValidator 
                            ID="mevOrden" 
                            runat="server"
                            ControlExtender="meeOrden"
                            ControlToValidate="Orden"
                            IsValidEmpty="False"
                            EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                            InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                            MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                            MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                            MinimumValue="0"
                            MaximumValue="9999999999999" 
                            Display="None"
                            EmptyValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ29RecursoKCG.Text").ToString() %>'
                            InvalidValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ29RecursoKCG.Text").ToString() %>'
                            MaximumValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ29RecursoKCG.Text").ToString() %>' 
                            MinimumValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ29RecursoKCG.Text").ToString() %>'
                            ValidationGroup="I" />                                    
                        <AjaxControlToolkit:ValidatorCalloutExtender 
                            runat="Server" 
                            ID="vceOrden"
                            TargetControlID="mevOrden"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblDic_Pantalla_Codigo" 
                            runat="server" 
                            Text='<%# GetLocalResourceObject("pantalla_ver_etiqueta_nombreRecursoKCG.Text").ToString() %>'>
                        </asp:Label>
                    </td>                   
                    <td 
                        colspan="2"
                        style="white-space:nowrap">
                        <asp:TextBox ID="pantalla_ver_etiqueta_nombre"
                            Width="400px"
                            CssClass="TEXTO_COMBOPER_KCG" 
                            runat="server"
                            ToolTip= '<%# GetLocalResourceObject("pantalla_ver_etiqueta_nombreRecursoKCG.ToolTip").ToString() %>' 
                            Text='<%# Bind("pantalla_ver_etiqueta_nombre") %>'>
                        </asp:TextBox>
                        <asp:Button 
                            ID="btnZoomDic_Pan_Nom" 
                            runat="server" 
                            CommandArgument="RutaDestino: ~/DIC/DIC_PANTALLA.aspx; 
                                            Filtro: Dic_Pantalla_Nombre; 
                                            Obtener: Dic_Pantalla_Id|Id, pantalla_ver_etiqueta_nombre|Nombre"
                            CommandName="Zoom"
                            Text="..." />                                   
                        <AjaxControlToolkit:AutoCompleteExtender
                            runat="server" 
                            BehaviorID="AutoCompleteEx"
                            ID="aceDic_Pantalla_Nombre" 
                            TargetControlID="pantalla_ver_etiqueta_nombre"
                            ServicePath="~/SEG/SEG_MENU.aspx" 
                            ServiceMethod="GetPantalla"
                            MinimumPrefixLength="0" 
                            CompletionInterval="500"
                            EnableCaching="true"
                            CompletionSetCount="1000"
                            CompletionListCssClass="autocomplete_completionListElement" 
                            CompletionListItemCssClass="autocomplete_listItem" 
                            CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                            OnClientItemSelected="ItemSelected_Pantalla" >
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
                    </td>
                </tr>      
                <tr>
                    <td>
                        <asp:Label 
                            ID="lblGrupo" 
                            runat="server" 
                            Text='<%# GetLocalResourceObject("GrupoRecursoKCG.Text").ToString() %>'>
                        </asp:Label>
                    </td>
                    <td>                  
                        <asp:TextBox ID="grupo_nombre" 
                            runat="server"
                            TabIndex="-1" 
                            Text='<%# Bind("grupo_nombre") %>'
                            style="display:none" >
                        </asp:TextBox>
                        <asp:TextBox ID="Grupo" 
                            runat="server"
                            TabIndex="-1" 
                            Text='<%# Bind("Grupo") %>'
                            style="display:none">
                        </asp:TextBox>
                        <asp:DropDownList
                            ID="ddlGrupo" 
                            runat="server" 
                            Width="150px"
                            CssClass="TEXTO_EDICION_KCG"
                            DataSourceID="odsddlGrupo"
                            DataTextField="Nombre"
                            AppendDataBoundItems="true" 
                            DataValueField="Dic_Dominio_Dominio" 
                            OnDataBound="ddlGrupo_DataBound" >
                            <asp:ListItem Selected="True" >
                            </asp:ListItem>
                        </asp:DropDownList>
                        <asp:ObjectDataSource 
                            ID="odsddlGrupo" 
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
                                    DefaultValue="SEG_MENU" 
                                    Name="Dic_Objeto_Nombre" 
                                    Type="String" />
                                <asp:Parameter 
                                    DefaultValue="GRUPO" 
                                    Name="Dic_Campo_Nombre" 
                                    Type="String" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblDic_Contenedor_Nombre" 
                            runat="server" 
                            Text='<%# GetLocalResourceObject("Dic_Contenedor_NombreRecursoKCG.Text").ToString() %>'>
                        </asp:Label>                         
                    </td>
                    <td style="white-space:nowrap">
                         <asp:TextBox ID="dic_contenedor_codigo" 
                            ReadOnly="true"
                            TabIndex="-1"
                            runat="server"
                            style="display:none"
                            ToolTip='<%# GetLocalResourceObject("Dic_Contenedor_CodigoRecursoKCG.ToolTip").ToString() %>' 
                            Text='<%# Bind("dic_contenedor_codigo") %>'>
                        </asp:TextBox>                    
                        <asp:TextBox ID="dic_contenedor_nombre"
                            Width="400px" 
                            runat="server"
                            CssClass="TEXTO_COMBOPER_KCG"
                            Text='<%# Bind("dic_contenedor_nombre") %>'
                            ToolTip='<%# GetLocalResourceObject("Dic_Contenedor_NombreRecursoKCG.ToolTip").ToString() %>'>
                        </asp:TextBox>
                         <asp:RequiredFieldValidator ID="rfvdic_contenedor_nombre"
                            runat="server" 
                            ControlToValidate="dic_contenedor_nombre"
                            ValidationGroup="I"
                            ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                            Text='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                        <AjaxControlToolkit:ValidatorCalloutExtender 
                            runat="Server" 
                            ID="vcedic_contenedor_nombre"
                            TargetControlID="rfvdic_contenedor_nombre"/>
                        <AjaxControlToolkit:AutoCompleteExtender
                            runat="server" 
                            BehaviorID="AutoCompleteEx2"
                            ID="AutoCompleteExtender2" 
                            TargetControlID="dic_contenedor_nombre"
                            ServicePath="~/SEG/SEG_MENU.aspx" 
                            ServiceMethod="GetContenedor"
                            MinimumPrefixLength="0" 
                            CompletionInterval="500"
                            EnableCaching="true"
                            CompletionSetCount="500"
                            CompletionListCssClass="autocomplete_completionListElement" 
                            CompletionListItemCssClass="autocomplete_listItem" 
                            CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                            OnClientItemSelected="ItemSelected_Contenedor" 
                            UseContextKey="true"
                            ContextKey="0"
                            OnClientPopulating="Contenedor_Populating"><%----%>
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
                                            var behavior = $find('AutoCompleteEx2');
                                            if (!behavior._height) {
                                                var target = behavior.get_completionList();
                                                behavior._height = target.offsetHeight - 2;
                                                target.style.height = '0px';
                                            }" />                                                    
                                        <%-- Expand from 0px to the appropriate size while fading in --%>
                                        <Parallel Duration=".4">
                                            <FadeIn />
                                            <Length PropertyKey="height" StartValue="0" EndValueScript="$find('AutoCompleteEx2')._height" />
                                        </Parallel>
                                    </Sequence>
                                </OnShow>
                                <OnHide>
                                    <%-- Collapse down to 0px and fade out --%>
                                    <Parallel Duration=".4">
                                        <FadeOut />
                                        <Length PropertyKey="height" StartValueScript="$find('AutoCompleteEx2')._height" EndValue="0" />
                                    </Parallel>
                                </OnHide>
                            </Animations>
                        </AjaxControlToolkit:AutoCompleteExtender>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblVer_Etiqueta_Nombre" 
                            runat="server" 
                            Text='<%# GetLocalResourceObject("Ver_Etiqueta_NombreRecursoKCG.Text").ToString() %>'>
                        </asp:Label>
                    </td>
                    <td style="white-space:nowrap">                        
                                   
                        <asp:TextBox ID="ver_etiqueta_nombre"                            
                            runat="server"                            
                            CssClass="TEXTO_COMBOPER_KCG"
                            Width="400px"
                            ToolTip= '<%# GetLocalResourceObject("ver_etiqueta_nombreRecursoKCG.ToolTip").ToString() %>' 
                            Text='<%# Bind("ver_etiqueta_nombre") %>'>
                        </asp:TextBox>                                       
                        <asp:RequiredFieldValidator 
                            ID="rfvver_etiqueta_nombre"
                            runat="server" 
                            ControlToValidate="ver_etiqueta_nombre"
                            ValidationGroup="I"
                            ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                            Text='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                        <AjaxControlToolkit:ValidatorCalloutExtender 
                            runat="Server" 
                            ID="vcever_etiqueta_nombre" 
                            TargetControlID="rfvver_etiqueta_nombre"/>
                        <AjaxControlToolkit:AutoCompleteExtender
                            runat="server" 
                            BehaviorID="aceDic_con_elemento_nombreBI"
                            ID="aceDic_con_elemento_nombre" 
                            TargetControlID="ver_etiqueta_nombre"
                            ServicePath="~/SEG/SEG_MENU.aspx" 
                            ServiceMethod="GetElemento"
                            MinimumPrefixLength="0" 
                            CompletionInterval="500"
                            EnableCaching="true"
                            CompletionSetCount="500"
                            CompletionListCssClass="autocomplete_completionListElement" 
                            CompletionListItemCssClass="autocomplete_listItem" 
                            CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                            OnClientItemSelected="ItemSelected_Elemento"
                            UseContextKey="true"
                            ContextKey="0"
                            OnClientPopulating="Elemento_Populating" >
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
                                            var behavior = $find('aceDic_con_elemento_nombreBI');
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
                                            EndValueScript="$find('aceDic_con_elemento_nombreBI')._height" />
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
                                        StartValueScript="$find('aceDic_con_elemento_nombreBI')._height" 
                                        EndValue="0" />
                                    </Parallel>
                                </OnHide>
                            </Animations>
                        </AjaxControlToolkit:AutoCompleteExtender>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblDic_Rotulo_Nombre" 
                            runat="server" 
                            Text='<%# GetLocalResourceObject("Dic_Rotulo_NombreRecursoKCG.Text").ToString() %>'>
                        </asp:Label>                         
                    </td>
                    
                    <td style="white-space:nowrap">
                        <asp:TextBox ID="Dic_Rotulo_Codigo" 
                            runat="server" 
                            ReadOnly="true"
                            TabIndex="-1"
                            ToolTip='<%# GetLocalResourceObject("Dic_Rotulo_CodigoRecursoKCG.ToolTip").ToString() %>'
                            Text='<%# Bind("Dic_Rotulo_Codigo") %>'>
                        </asp:TextBox>                   
                        <asp:TextBox ID="Dic_Rotulo_Nombre"
                            Width="495px" 
                            runat="server"
                            ReadOnly="true"
                            TabIndex="-1"
                            Text='<%# Bind("Dic_Rotulo_Nombre") %>'
                            ToolTip='<%# GetLocalResourceObject("Dic_Rotulo_NombreRecursoKCG.ToolTip").ToString() %>'>
                        </asp:TextBox>
                    </td>
                    
                </tr>
                    
                <tr align="left">
                    <td colspan="2" >
                        <asp:Button 
                            ID="InsertButton" 
                            runat="server" 
                            CausesValidation="True" 
                            CommandName="Insert"
                            ValidationGroup="I"
                            AccessKey='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "Tec_InsertarRecursoKCG.AccesKey").ToString() %>' 
                            Text='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "Btn_InsertRecursoKCG.Text").ToString() %>'
                            ToolTip='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "Btn_InsertRecursoKCG.ToolTip").ToString() %>'>
                        </asp:Button>
                        <asp:Button 
                            ID="InsertCancelButton" 
                            runat="server" 
                            CausesValidation="False" 
                            CommandName="Cancel"
                            AccessKey='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "Tec_CancelarRecursoKCG.AccesKey").ToString() %>' 
                            Text='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "Btn_CancelRecursoKCG.Text").ToString() %>'
                            ToolTip='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "Btn_CancelRecursoKCG.ToolTip").ToString() %>'>
                        </asp:Button>
                    </td>
                </tr>
            </table>
            
            
            <%--Campos Ocultos--%>
            <div style="display:none">
                <asp:TextBox ID="Dic_Pantalla_Id" runat="server" Text='<%# Bind("Dic_Pantalla_Id") %>'>
                </asp:TextBox>
                <asp:TextBox ID="Int_Usuario_Id" runat="server" Text='<%# Bind("Int_Usuario_Id") %>'>
                </asp:TextBox>
                <asp:TextBox ID="Dic_Con_Elemento_Id" runat="server" Text='<%# Bind("Dic_Con_Elemento_Id") %>'>
                </asp:TextBox>
                <asp:TextBox ID="Seg_Rol_Id" runat="server" Text='<%# Bind("Seg_Rol_Id") %>'>
                </asp:TextBox>
                <asp:TextBox ID="Dic_Contenedor_id" runat="server" Text='<%# Bind("Dic_Contenedor_id") %>'>
                </asp:TextBox>
                <asp:TextBox ID="Dic_Rotulo_id" runat="server" Text='<%# Bind("Dic_Rotulo_id") %>'>
                </asp:TextBox>
                <asp:TextBox ID="Id" runat="server" Text='<%# Bind("Id") %>'>
                </asp:TextBox>
            </div> 
            <asp:TextBox ID="Dic_Pantalla_Nombre" runat="server" Visible="false" Text='<%# Bind("Dic_Pantalla_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Dic_con_elemento_nombre" runat="server" style="display:none" Text='<%# Bind("Dic_con_elemento_nombre") %>'>
            </asp:TextBox>          
            <asp:TextBox ID="Dic_Pantalla_Codigo" runat="server" Visible="false" Text='<%# Bind("Dic_Pantalla_Codigo") %>'>
            </asp:TextBox>     
            <asp:TextBox ID="Dic_con_elemento_Codigo" runat="server" Visible="false" Text='<%# Bind("Dic_con_elemento_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" ID="int_usuario_codigo" runat="server" Text='<%# Bind("int_usuario_codigo") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" ID="int_usuario_nombre" runat="server" Text='<%# Bind("int_usuario_nombre") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" ID="pantalla_ver_etiqueta_imagen_activa" runat="server" Text='<%# Bind("pantalla_ver_etiqueta_imagen_activa") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" ID="pantalla_ver_etiqueta_imagen_desactiva" runat="server" Text='<%# Bind("pantalla_ver_etiqueta_imagen_desactiva") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" ID="tool_pantalla_ver_etiqueta_nombre" runat="server" Text='<%# Bind("tool_pantalla_ver_etiqueta_nombre") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" ID="Seg_Rol_Codigo" runat="server" Text='<%# Bind("Seg_Rol_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" ID="Seg_Rol_Nombre" runat="server" Text='<%# Bind("Seg_Rol_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" ID="ver_etiqueta_imagen_activa" runat="server" Text='<%# Bind("ver_etiqueta_imagen_activa") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" ID="ver_etiqueta_imagen_desactiva" runat="server" Text='<%# Bind("ver_etiqueta_imagen_desactiva") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" ID="tool_ver_etiqueta_nombre" runat="server" Text='<%# Bind("tool_ver_etiqueta_nombre") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" ID="Par_servidor_det_referencia" runat="server" Text='<%# Bind("Par_servidor_det_referencia") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" ID="estado_nombre" runat="server" Text='<%# Bind("estado_nombre") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" ID="Dic_Contenedor_Tipo" runat="server" Text='<%# Bind("Dic_Contenedor_Tipo") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" ID="Codigo_int" runat="server" Text='<%# Bind("Codigo_int") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" ID="Nombre" runat="server" Text='<%# Bind("Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" ID="Estado" runat="server" Text='<%# Bind("Estado") %>'>
            </asp:TextBox>
        </InsertItemTemplate>
        
        <ItemTemplate>
            <table>
                <tr>
                    <td >
                        <asp:Label ID="lblCodigo" 
                            runat="server" 
                            Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'>
                        </asp:Label>
                    </td>
                    <td style="white-space:nowrap">
                        <asp:TextBox ID="Codigo"
                            ReadOnly="true"
                            TabIndex="-1" 
                            runat="server" 
                            Text='<%# Bind("Codigo") %>'
                            ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'>
                         </asp:TextBox>                   
                        <asp:Label 
                            ID="lblOrden" 
                            runat="server" 
                            Text='<%# GetLocalResourceObject("OrdenRecursoKCG.Text").ToString() %>'>
                        </asp:Label>
                        <asp:TextBox 
                            ID="Orden" 
                            runat="server"
                            ReadOnly="true"
                            TabIndex="-1" 
                            style="text-align:right"
                            Text='<%# Bind("Orden") %>'
                            ToolTip='<%# GetLocalResourceObject("OrdenRecursoKCG.ToolTip").ToString() %>'>
                        </asp:TextBox>                        
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblDic_Pantalla_Codigo" 
                            runat="server" 
                            Text='<%# GetLocalResourceObject("pantalla_ver_etiqueta_nombreRecursoKCG.Text").ToString() %>'>
                        </asp:Label>
                    </td>                   
                    <td 
                        colspan="2"
                        style="white-space:nowrap">
                        <asp:TextBox ID="pantalla_ver_etiqueta_nombre"
                            Width="400px"
                            ReadOnly="true"
                            TabIndex="-1"  
                            runat="server"
                            ToolTip= '<%# GetLocalResourceObject("Dic_Pantalla_NombreRecursoKCG.ToolTip").ToString() %>' 
                            Text='<%# Bind("pantalla_ver_etiqueta_nombre") %>'>  
                        </asp:TextBox>
                        <asp:Button 
                            ID="btnZoomDic_Pan_Nom" 
                            runat="server" 
                            CommandArgument="RutaDestino: ~/DIC/DIC_PANTALLA.aspx; Filtro: pantalla_ver_etiqueta_nombre; Obtener: Dic_Pantalla_Id|Id,pantalla_ver_etiqueta_nombre|Nombre"
                            CommandName="Zoom" 
                            Enabled="false"                                                       
                            Text="..." />                        
                    </td>
                </tr>
                <%--<tr>
                    <td>
                        
                    </td>             
                    
                </tr>--%>
                <tr>
                    <td>
                        <asp:Label 
                            ID="lblGrupo" 
                            runat="server" 
                            Text='<%# GetLocalResourceObject("GrupoRecursoKCG.Text").ToString() %>'>
                        </asp:Label>
                    </td>
                    <td>                                          
                        <asp:TextBox ID="grupo_nombre" 
                            runat="server"
                            TabIndex="-1" 
                            Text='<%# Bind("grupo_nombre") %>'
                            ReadOnly="true">
                        </asp:TextBox>                        
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblDic_Contenedor_Nombre" 
                            runat="server" 
                            Text='<%# GetLocalResourceObject("Dic_Contenedor_NombreRecursoKCG.Text").ToString() %>'>
                        </asp:Label>                         
                    </td>
                    <td style="white-space:nowrap">
                         <asp:TextBox ID="dic_contenedor_codigo" 
                            ReadOnly="true"
                            TabIndex="-1"
                            runat="server"
                            style="display:none"
                            ToolTip='<%# GetLocalResourceObject("Dic_Contenedor_CodigoRecursoKCG.ToolTip").ToString() %>' 
                            Text='<%# Bind("dic_contenedor_codigo") %>'>
                        </asp:TextBox>                    
                        <asp:TextBox ID="dic_contenedor_nombre"
                            Width="400px" 
                            runat="server"
                            ReadOnly="true"
                            TabIndex="-1"
                            Text='<%# Bind("dic_contenedor_nombre") %>'
                            ToolTip='<%# GetLocalResourceObject("Dic_Contenedor_NombreRecursoKCG.ToolTip").ToString() %>'>
                        </asp:TextBox>                         
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblVer_Etiqueta_Nombre" 
                            runat="server" 
                            Text='<%# GetLocalResourceObject("Ver_Etiqueta_NombreRecursoKCG.Text").ToString() %>'>
                        </asp:Label>
                    </td>
                    <td style="white-space:nowrap">                        
                                         
                        <asp:TextBox ID="ver_etiqueta_nombre"                            
                            runat="server"                            
                            ReadOnly="true"
                            TabIndex="-1"
                            Width="400px"
                            ToolTip= '<%# GetLocalResourceObject("ver_etiqueta_nombreRecursoKCG.ToolTip").ToString() %>' 
                            Text='<%# Bind("ver_etiqueta_nombre") %>'>
                        </asp:TextBox>                                                               
                    </td>
                </tr>                
                <tr>
                    <td>
                        <asp:Label ID="lblDic_Rotulo_Nombre" 
                            runat="server" 
                            Text='<%# GetLocalResourceObject("Dic_Rotulo_NombreRecursoKCG.Text").ToString() %>'>
                        </asp:Label>                         
                    </td>
                    
                    <td style="white-space:nowrap">
                        <asp:TextBox ID="Dic_Rotulo_Codigo" 
                            runat="server" 
                            ReadOnly="true"
                            TabIndex="-1"
                            ToolTip='<%# GetLocalResourceObject("Dic_Rotulo_CodigoRecursoKCG.ToolTip").ToString() %>'
                            Text='<%# Bind("Dic_Rotulo_Codigo") %>'>
                        </asp:TextBox>                   
                        <asp:TextBox ID="Dic_Rotulo_Nombre"
                            Width="495px" 
                            runat="server"
                            ReadOnly="true"
                            TabIndex="-1"
                            Text='<%# Bind("Dic_Rotulo_Nombre") %>'
                            ToolTip='<%# GetLocalResourceObject("Dic_Rotulo_NombreRecursoKCG.ToolTip").ToString() %>'>
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
                        <koala:wucMensajeEliminar 
                            ID="WucMensajeEliminar1" 
                            runat="server" />
                    </td>
                </tr>
            </table>                        

            <%--Campos Ocultos--%>
            <div style="display:none">
                <asp:TextBox ID="Dic_Pantalla_Id" runat="server" Text='<%# Bind("Dic_Pantalla_Id") %>'>
                </asp:TextBox>
                <asp:TextBox ID="Int_Usuario_Id" runat="server" Text='<%# Bind("Int_Usuario_Id") %>'>
                </asp:TextBox>
                <asp:TextBox ID="Dic_Con_Elemento_Id" runat="server" Text='<%# Bind("Dic_Con_Elemento_Id") %>'>
                </asp:TextBox>
                <asp:TextBox ID="Seg_Rol_Id" runat="server" Text='<%# Bind("Seg_Rol_Id") %>'>
                </asp:TextBox>
                <asp:TextBox ID="Dic_Contenedor_id" runat="server" Text='<%# Bind("Dic_Contenedor_id") %>'>
                </asp:TextBox>
                <asp:TextBox ID="Dic_Rotulo_id" runat="server" Text='<%# Bind("Dic_Rotulo_id") %>'>
                </asp:TextBox>
                <asp:TextBox ID="Id" runat="server" Text='<%# Bind("Id") %>'>
                </asp:TextBox>
            </div> 
           
             <asp:TextBox ID="Dic_con_elemento_nombre"                            
                runat="server"                                                        
                style="display:none"                            
                Text='<%# Bind("Dic_con_elemento_nombre") %>'>
            </asp:TextBox>   
            <asp:TextBox ID="Dic_Pantalla_Codigo" runat="server" Visible="False" Text='<%# Bind("Dic_Pantalla_Codigo") %>'>
            </asp:TextBox>                      
            <asp:TextBox ID="Grupo" runat="server" Visible="false" Text='<%# Bind("Grupo") %>'> 
            </asp:TextBox>
            <asp:TextBox ID="Dic_Pantalla_Nombre" runat="server" Visible="false" Text='<%# Bind("Dic_Pantalla_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Dic_con_elemento_Codigo" runat="server" Visible="false" Text='<%# Bind("Dic_con_elemento_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" ID="int_usuario_codigo" runat="server" Text='<%# Bind("int_usuario_codigo") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" ID="int_usuario_nombre" runat="server" Text='<%# Bind("int_usuario_nombre") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" ID="pantalla_ver_etiqueta_imagen_activa" runat="server" Text='<%# Bind("pantalla_ver_etiqueta_imagen_activa") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" ID="pantalla_ver_etiqueta_imagen_desactiva" runat="server" Text='<%# Bind("pantalla_ver_etiqueta_imagen_desactiva") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" ID="tool_pantalla_ver_etiqueta_nombre" runat="server" Text='<%# Bind("tool_pantalla_ver_etiqueta_nombre") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" ID="Seg_Rol_Codigo" runat="server" Text='<%# Bind("Seg_Rol_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" ID="Seg_Rol_Nombre" runat="server" Text='<%# Bind("Seg_Rol_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" ID="ver_etiqueta_imagen_activa" runat="server" Text='<%# Bind("ver_etiqueta_imagen_activa") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" ID="ver_etiqueta_imagen_desactiva" runat="server" Text='<%# Bind("ver_etiqueta_imagen_desactiva") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" ID="tool_ver_etiqueta_nombre" runat="server" Text='<%# Bind("tool_ver_etiqueta_nombre") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" ID="Par_servidor_det_referencia" runat="server" Text='<%# Bind("Par_servidor_det_referencia") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" ID="estado_nombre" runat="server" Text='<%# Bind("estado_nombre") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" ID="Dic_Contenedor_Tipo" runat="server" Text='<%# Bind("Dic_Contenedor_Tipo") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" ID="Codigo_int" runat="server" Text='<%# Bind("Codigo_int") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" ID="Nombre" runat="server" Text='<%# Bind("Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" ID="Estado" runat="server" Text='<%# Bind("Estado") %>'>
            </asp:TextBox>
        </ItemTemplate>
    </asp:FormView>
    </asp:Panel>
        <%--</ContentTemplate>--%>
       <%-- <Triggers>
            <asp:AsyncPostBackTrigger 
                ControlID="GvSegMenu" 
                EventName="SelectedIndexChanged" />
        </Triggers> --%>  
    <%--</asp:UpdatePanel>--%>
    <asp:ObjectDataSource 
        ID="odsFvSegMenu" 
        runat="server" 
        DeleteMethod="Delete" 
        InsertMethod="Insert"
        OldValuesParameterFormatString="original{0}" 
        SelectMethod="GetById" 
        TypeName="FEL.SEG.BO_Seg_Menu"
        UpdateMethod="Update" 
        ConflictDetection="CompareAllValues"
        SortParameterName="sortExpression">
        <SelectParameters>
            <asp:SessionParameter 
                Name="s" 
                SessionField="Scope" 
                Type="Object" />
            <asp:Parameter 
                Name="Id" 
                Type="String" />
            <asp:Parameter 
                Name="par_servidor_id" 
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <%--<asp:UpdatePanel 
        ID="UpdatePanel2" 
        runat="server">
        <ContentTemplate>--%>
            <asp:Button 
                ID="Atras" 
                runat="server" 
                Visible="False" />
            <br />
            <asp:Button 
                ID="Seleccionar"
                runat="server" 
                Visible="False" />
        <%--</ContentTemplate>
    </asp:UpdatePanel>--%>
    <%--<asp:UpdatePanel 
        ID="UpdatePanel3" 
        runat="server">
        <ContentTemplate>--%>
    <koala:KNavegacion 
        ID="nav"
        runat="server"
        GridViewID="GvSegMenu" 
        OnNavegar="nav_Siguiente" />
    <koala:KFiltro
        ID="kftFiltro" 
        runat="server" 
        Contenedor="SEG_MENU" 
        Objeto="SEG_MENU" 
        IndiceScope="Scope"
        Orden="1"
        ObjectDataSourceID="odsGvSegMenu" />
    <asp:Panel 
        ID="pnlListado" 
        runat="server"
        meta:resourcekey="Rec_Seg_Menu_ListadoRecursoKCG">
    
<%--    odsMenusPorRol   DataSourceID="odsGvSegMenu" --%>
    
    <koala:KGrid 
        ID="GvSegMenu" 
        runat="server" 
        AutoGenerateColumns="False" 
        DataSourceID="odsMenusPorRol"
        AllowSorting="True"
        AllowPaging="True"
        DataKeyNames="Id"
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
            <asp:BoundField DataField="Codigo" 
                meta:resourcekey="BoundCodigoRecursoKCG" 
                SortExpression="Codigo_int">
                <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="pantalla_ver_etiqueta_nombre" 
                meta:resourcekey="Boundpantalla_ver_etiqueta_nombreRecursoKCG"
                SortExpression="pantalla_ver_etiqueta_nombre" >
                 <ItemStyle Width="200px"/>
            </asp:BoundField>            
            <asp:BoundField 
                DataField="dic_contenedor_nombre" 
                meta:resourcekey="BoundDic_Contenedor_NombreRecursoKCG"
                SortExpression="dic_contenedor_nombre" >
                <itemstyle width="80mm" wrap="True" />
            </asp:BoundField>            
            <asp:BoundField 
                DataField="grupo_nombre" 
                meta:resourcekey="BoundGrupo_NombreRecursoKCG"
                SortExpression="grupo_nombre" >
                <itemstyle width="40mm" wrap="True" />
            </asp:BoundField>
            <asp:BoundField DataField="ver_etiqueta_nombre" 
                meta:resourcekey="Boundver_etiqueta_nombreRecursoKCG" 
                SortExpression="ver_etiqueta_nombre" >
                <ItemStyle Width="200px" backcolor="LightCyan" />
            </asp:BoundField>   
            <asp:BoundField DataField="Orden" 
                meta:resourcekey="BoundOrdenRecursoKCG" 
                SortExpression="Orden" >
                <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField 
                DataField="Dic_Pantalla_Nombre" 
                HeaderText="Dic_Pantalla_Nombre" 
                SortExpression="Dic_Pantalla_Nombre"
                Visible="False" />                     
            <asp:BoundField 
                DataField="Dic_Pantalla_Codigo" 
                meta:resourcekey="BoundDic_Pantalla_CodigoRecursoKCG" 
                SortExpression="Dic_Pantalla_Codigo"
                Visible="False"/>
            <asp:BoundField 
                DataField="Dic_Pantalla_Id" 
                Visible="false" 
                HeaderText="Dic_Pantalla_Id" 
                SortExpression="Dic_Pantalla_Id" />
            <asp:BoundField 
                DataField="pantalla_ver_etiqueta_imagen_activa" 
                Visible="False" 
                HeaderText="pantalla_ver_etiqueta_imagen_activa" 
                SortExpression="pantalla_ver_etiqueta_imagen_activa" />
            <asp:BoundField 
                DataField="pantalla_ver_etiqueta_imagen_desactiva" 
                Visible="False" 
                HeaderText="pantalla_ver_etiqueta_imagen_desactiva" 
                SortExpression="pantalla_ver_etiqueta_imagen_desactiva" />
            <asp:BoundField 
                DataField="tool_pantalla_ver_etiqueta_nombre" 
                Visible="False" 
                HeaderText="tool_pantalla_ver_etiqueta_nombre" 
                SortExpression="tool_pantalla_ver_etiqueta_nombre" />
            <asp:BoundField 
                DataField="Seg_Rol_Codigo" 
                Visible="False" 
                HeaderText="Seg_Rol_Codigo" 
                SortExpression="Seg_Rol_Codigo" />
            <asp:BoundField 
                DataField="Seg_Rol_Nombre" 
                Visible="False" 
                HeaderText="Seg_Rol_Nombre" 
                SortExpression="Seg_Rol_Nombre" />
            <asp:BoundField 
                DataField="Dic_Contenedor_id" 
                Visible="False" 
                HeaderText="Dic_Contenedor_id" 
                SortExpression="Dic_Contenedor_id" />
            <asp:BoundField 
                DataField="dic_contenedor_codigo" 
                Visible="False" 
                HeaderText="dic_contenedor_codigo" 
                SortExpression="dic_contenedor_codigo" />
            <asp:BoundField 
                DataField="Dic_Rotulo_id" 
                Visible="False" 
                HeaderText="Dic_Rotulo_id" 
                SortExpression="Dic_Rotulo_id" />
            <asp:BoundField 
                DataField="Dic_Rotulo_Codigo" 
                Visible="False" 
                HeaderText="Dic_Rotulo_Codigo" 
                SortExpression="Dic_Rotulo_Codigo" />
            <asp:BoundField 
                DataField="Dic_Rotulo_Nombre" 
                Visible="False" 
                HeaderText="Dic_Rotulo_Nombre" 
                SortExpression="Dic_Rotulo_Nombre" />
            <asp:BoundField 
                DataField="ver_etiqueta_imagen_activa" 
                Visible="False" 
                HeaderText="ver_etiqueta_imagen_activa" 
                SortExpression="ver_etiqueta_imagen_activa" />
            <asp:BoundField 
                DataField="ver_etiqueta_imagen_desactiva" 
                Visible="False" 
                HeaderText="ver_etiqueta_imagen_desactiva" 
                SortExpression="ver_etiqueta_imagen_desactiva" />
            <asp:BoundField 
                DataField="tool_ver_etiqueta_nombre" 
                Visible="False" 
                HeaderText="tool_ver_etiqueta_nombre" 
                SortExpression="tool_ver_etiqueta_nombre" />
            <asp:BoundField 
                DataField="Par_servidor_det_referencia" 
                Visible="False" 
                HeaderText="Par_servidor_det_referencia" 
                SortExpression="Par_servidor_det_referencia" />
            <asp:BoundField 
                DataField="estado_nombre" 
                Visible="False" 
                HeaderText="estado_nombre" 
                SortExpression="estado_nombre" />
            <asp:BoundField 
                DataField="Dic_Contenedor_Tipo" 
                Visible="False" 
                HeaderText="Dic_Contenedor_Tipo" 
                SortExpression="Dic_Contenedor_Tipo" />
        </Columns>
    </koala:KGrid>
    </asp:Panel>
    <%--</ContentTemplate>
    </asp:UpdatePanel>--%>
    <asp:ObjectDataSource 
        ID="odsGvSegMenu" 
        runat="server" 
        SelectMethod="GetByRolUsuario" 
        TypeName="FEL.SEG.BO_Seg_Menu"  >
        <SelectParameters>
            <asp:SessionParameter 
                Name="s" 
                SessionField="Scope" 
                Type="Object" />
            <asp:ControlParameter 
                ControlID="Seg_Rol_Id" 
                Name="Seg_Rol_Id" 
                PropertyName="Text" 
                Type="String" />
            <asp:Parameter 
                Name="par_servidor_id" 
                Type="String" DefaultValue="1" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <%--Otro grid--%>
            <asp:ObjectDataSource ID="odsMenusPorRol" runat="server" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetByRolId" 
                TypeName="FEL.SEG.BO_Seg_Menu">
                <SelectParameters>                    
                    <asp:SessionParameter DefaultValue="" Name="s" SessionField="Scope" 
                        Type="Object" />
                    <asp:ControlParameter ControlID="Seg_Rol_Id" Name="Seg_Rol_Id" 
                        PropertyName="Text" Type="String" />
                    <asp:Parameter DefaultValue="1" Name="par_servidor_id" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
    </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

