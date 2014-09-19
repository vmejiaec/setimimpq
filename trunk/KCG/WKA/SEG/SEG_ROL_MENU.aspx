<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="SEG_ROL_MENU.aspx.cs" 
    Inherits="SEG_SEG_ROL_MENU" 
    Theme="EstiloKCG"    
    StylesheetTheme="EstiloKCG"
    meta:resourcekey="Tit_Seg_Rol_MenuRecursoKCG" %>

<%@ Register 
    Src="../WebUserControls/wucMensajeEliminar.ascx" 
    TagName="wucMensajeEliminar"
    TagPrefix="koala" %>
    
<%@ Register 
    Src="../WebUserControls/wucMensajeActualizar.ascx" 
    TagName="wucMensajeActualizar"
    TagPrefix="koala" %>
    
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
    <table>
        <tr valign="top">
            <td>
                <asp:Panel
                    runat="server"
                    ID="Panel_Seg_Rol_Menu"
                    meta:resourcekey="Rec_Seg_Rol_Menu_RolesRecursoKCG">                    
                    <asp:UpdatePanel 
                        ID="UdpMst" 
                        runat="server" >
                        <ContentTemplate>                            
                            <koala:KGrid 
                                ID="mstgv_seg_rol_menu" 
                                runat="server" 
                                AllowPaging="True" 
                                AllowSorting="True"
                                SelectedIndex="0"
                                AutoGenerateColumns="False" 
                                DataKeyNames="Id" 
                                DataSourceID="ods_mstgv_seg_rol_menu">
                                <AlternatingRowStyle CssClass="alternatingrowstyle" />
                                <HeaderStyle CssClass="headerstyle" />
                                <PagerStyle CssClass="pagerstyle" />
                                <SelectedRowStyle CssClass="selectedrowstyle" />
                                <Columns>
                                    <asp:CommandField ButtonType="Button" 
                                        SelectText="..." 
                                        ShowSelectButton="True" />
                                    <asp:BoundField 
                                        DataField="Codigo" 
                                        meta:resourcekey="BoundCodigoRecursoKCG" 
                                        SortExpression="Codigo">
                                        <ItemStyle HorizontalAlign="Right" />
                                    </asp:BoundField>
                                    <asp:BoundField 
                                        DataField="Nombre" 
                                        meta:resourcekey="BoundNombreRecursoKCG" 
                                        SortExpression="Nombre">
                                        <ItemStyle Width="80mm" Wrap="True" />
                                    </asp:BoundField>
                                    <asp:BoundField 
                                        DataField="Descripcion" 
                                        HeaderText="Descripcion" 
                                        SortExpression="Descripcion"
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
                                        DataField="Estado" 
                                        HeaderText="Estado" 
                                        SortExpression="Estado" 
                                        Visible="False" />
                                </Columns>
                            </koala:KGrid>                          
                           
                        </ContentTemplate>
                    </asp:UpdatePanel>                        
                </asp:Panel>
            </td>
            <td>                
                 <asp:Panel
                    runat="server"
                    ID="Panel_Accesos"
                    meta:resourcekey="Rec_AccesosRecursoKCG">
                    <asp:UpdatePanel 
                        ID="UpdatePanel4" 
                        runat="server"
                        UpdateMode="Always">
                        <ContentTemplate>    
                            <table>
                                <tr>
                                    <td>
                                        <asp:Button 
                                                ID="Btn_Seg_Rol_Menu_Rol" 
                                                runat="server"
                                                meta:resourcekey="Btn_Seg_Rol_Menu_RolRecursoKCG"/>
                                    </td>
                                    <td>    
                                        <asp:Button 
                                            ID="Btn_Seg_Rol_Menu_Pantalla" 
                                            runat="server"
                                            meta:resourcekey="Btn_Seg_Rol_Menu_PantallaRecursoKCG" 
                                            PostBackUrl="~/DIC/DIC_PANTALLA.aspx"  />
                                    </td>
                                    <td>
                                        <asp:Button 
                                            ID="Btn_Seg_Rol_Menu_Elemento" 
                                            runat="server"
                                            meta:resourcekey="Btn_Seg_Rol_Menu_ElementoRecursoKCG" 
                                            PostBackUrl="~/DIC/DIC_CON_ELEMENTO.aspx"  />
                                    </td>
                                    <td>
                                        <asp:Button 
                                            ID="Btn_Seg_Rol_Menu_Etiqueta" 
                                            runat="server"
                                            meta:resourcekey="Btn_Seg_Rol_Menu_EtiquetaRecursoKCG" 
                                            PostBackUrl="~/VER/VER_ETIQUETA.aspx" />
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </asp:Panel>
                 <koala:KNavegacion 
                                ID="navMst"
                                runat="server"
                                GridViewID="mstgv_seg_rol_menu"  />
            </td>
        </tr>
    </table>    
    <asp:ObjectDataSource 
        ID="ods_mstgv_seg_rol_menu" 
        runat="server" 
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="Get" 
        TypeName="FEL.SEG.BO_Seg_Rol">
        <SelectParameters>
            <asp:SessionParameter 
                Name="s" 
                SessionField="Scope" 
                Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>    
    <script type="text/javascript">    
        Sys.Application.add_load(page_load);
        Sys.Application.add_unload(page_unload);
        var Pantalla_Ver_Etiqueta_nombre = null;          
        
        function page_load(sender, e)
        {                  
            Pantalla_Ver_Etiqueta_nombre = $get("ctl00_ContentPlaceHolder1_fv_det_SegRolMenu_Pantalla_Ver_Etiqueta_nombre");
            if(Pantalla_Ver_Etiqueta_nombre)
                $addHandler(Pantalla_Ver_Etiqueta_nombre, "change", Pantalla_Nombre_onchange);                     
        }        
            
        function page_unload(sender, e)
        {
            $removeHandler(Pantalla_Ver_Etiqueta_nombre, "change", Pantalla_Nombre_onchange);                                                                                                
        }   
            
        function Pantalla_Nombre_onchange(sender, e)
        {               
            var Pantalla_Ver_Etiqueta_nombre = $get("ctl00_ContentPlaceHolder1_fv_det_SegRolMenu_Pantalla_Ver_Etiqueta_nombre");
            var Dic_Pantalla_Nombre = $get("ctl00_ContentPlaceHolder1_fv_det_SegRolMenu_Dic_Pantalla_Nombre");
            if(Pantalla_Ver_Etiqueta_nombre.value == "")                   
              Dic_Pantalla_Nombre.value = "";              
        } 
                   
        function ItemSelected_Etiqueta_nombre( source, eventArgs ) 
        {   
            var valor = eventArgs.get_value();
            var temp = new Array();
            temp = valor.split('||');                                                                   

            var Dic_Pantalla_Id = $get("ctl00_ContentPlaceHolder1_fv_det_SegRolMenu_Dic_Pantalla_Id" );
            Dic_Pantalla_Id.value = temp[0];
            
            var Dic_Pantalla_Codigo = $get("ctl00_ContentPlaceHolder1_fv_det_SegRolMenu_Dic_Pantalla_Codigo" );
            Dic_Pantalla_Codigo.value = temp[1];
            
            var Pantalla_Dic_Rotulo_Nombre = $get("ctl00_ContentPlaceHolder1_fv_det_SegRolMenu_Pantalla_Dic_Rotulo_Nombre");
            Pantalla_Dic_Rotulo_Nombre.value = temp[2];
            
            var Dic_Pantalla_Nombre = $get("ctl00_ContentPlaceHolder1_fv_det_SegRolMenu_Dic_Pantalla_Nombre");
            Dic_Pantalla_Nombre.value = temp[3];                                                                        
         }
         
         function ItemSelected_DicComElemento( source, eventArgs ) 
         {
            var valor = eventArgs.get_value();
            var temp = new Array();
            temp = valor.split('||');                                                            

            var Dic_Con_Elemento_Id = $get("ctl00_ContentPlaceHolder1_fv_det_SegRolMenu_Dic_Con_Elemento_Id" );
            Dic_Con_Elemento_Id.value = temp[0];            
                 
            var Elemento_Dic_Rotulo_Nombre = $get("ctl00_ContentPlaceHolder1_fv_det_SegRolMenu_Elemento_Dic_Rotulo_Nombre");
            Elemento_Dic_Rotulo_Nombre.value = temp[1];
            
            var dic_contenedor_nombre = $get("ctl00_ContentPlaceHolder1_fv_det_SegRolMenu_dic_contenedor_nombre");
            dic_contenedor_nombre.value = temp[2]; 
            
            var Dic_con_elemento_nombre = $get("ctl00_ContentPlaceHolder1_fv_det_SegRolMenu_Dic_con_elemento_nombre");
            Dic_con_elemento_nombre.value = temp[3];                         
         }
         
         function ItemSelected_Contenedor_Nombre( source, eventArgs ) 
         {
            var valor = eventArgs.get_value();
            var temp = new Array();
            temp = valor.split('||');                                                            

            var Dic_Con_Elemento_Id = $get("ctl00_ContentPlaceHolder1_fv_det_SegRolMenu_Dic_Con_Elemento_Id" );
            Dic_Con_Elemento_Id.value = temp[0];            
                 
            var Elemento_Dic_Rotulo_Nombre = $get("ctl00_ContentPlaceHolder1_fv_det_SegRolMenu_Elemento_Dic_Rotulo_Nombre");
            Elemento_Dic_Rotulo_Nombre.value = temp[1];
            
            var Elemento_Ver_Etiqueta_nombre = $get("ctl00_ContentPlaceHolder1_fv_det_SegRolMenu_Elemento_Ver_Etiqueta_nombre");
            Elemento_Ver_Etiqueta_nombre.value = temp[2]; 
            
            var Dic_con_elemento_nombre = $get("ctl00_ContentPlaceHolder1_fv_det_SegRolMenu_Dic_con_elemento_nombre");
            Dic_con_elemento_nombre.value = temp[3];                         
         }
         
         function checkSelectedValueGrupo()
         { 
            var ddl_Grupo = $get("ctl00_ContentPlaceHolder1_fv_det_SegRolMenu_ddl_Grupo");
            var Grupo   = $get("ctl00_ContentPlaceHolder1_fv_det_SegRolMenu_Grupo");
            
            Grupo.value = ddl_Grupo.options[ddl_Grupo.selectedIndex].value;
         }
    </script>    
    <asp:Panel 
        ID="pnl_Rec_Seg_Rol_Menu" 
        runat="server" 
        meta:resourcekey="Rec_Seg_Rol_MenuRecursoKCG">
        <asp:UpdatePanel 
            ID="UpdatePanel1" 
            runat="server">            
            <ContentTemplate>
                <asp:FormView 
                    ID="fv_det_SegRolMenu" 
                    runat="server" 
                    DataSourceID="odsfv_det_SegRolMenu"
                    DefaultMode="Insert">
                    <EditItemTemplate>
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
                                        TabIndex="-1"
                                        ReadOnly="true"
                                        ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Codigo") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>                            
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lblDic_Pantalla_Nombre" 
                                        runat="server"                                         
                                        Text='<%# GetLocalResourceObject("Pantalla_Ver_Etiqueta_nombreRecursoKCG.Text").ToString() %>'>
                                     </asp:Label>
                                </td>
                                <td style= "white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Pantalla_Ver_Etiqueta_nombre" 
                                        runat="server"
                                        Width="400px"
                                        CssClass="TEXTO_COMBOPER_KCG"
                                        ToolTip='<%# GetLocalResourceObject("Pantalla_Ver_Etiqueta_nombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Pantalla_Ver_Etiqueta_nombre") %>'>
                                    </asp:TextBox>
                                    <AjaxControlToolkit:AutoCompleteExtender
                                        runat="server" 
                                        BehaviorID="AutoCompleteEx"
                                        ID="acePantalla_Ver_Etiqueta_nombre" 
                                        TargetControlID="Pantalla_Ver_Etiqueta_nombre"
                                        ServicePath="~/SEG/SEG_ROL_MENU.aspx" 
                                        ServiceMethod="GetEtiqueta_nombre"
                                        MinimumPrefixLength="0" 
                                        CompletionInterval="500"
                                        EnableCaching="true"
                                        CompletionSetCount="500"
                                        CompletionListCssClass="autocomplete_completionListElement" 
                                        CompletionListItemCssClass="autocomplete_listItem" 
                                        CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                        OnClientItemSelected="ItemSelected_Etiqueta_nombre" >
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
                                        ID="btnZoomDic_Pan_Nom" 
                                        runat="server" 
                                        CommandArgument="RutaDestino: ~/DIC/DIC_PANTALLA.aspx; Filtro: Dic_Pantalla_Nombre; Obtener: Dic_Pantalla_Id|Id,Pantalla_Ver_Etiqueta_nombre|Nombre"
                                        CommandName="Zoom" 
                                        Text="..." />  
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Pantalla_Dic_Rotulo_Nombre" 
                                        runat="server" 
                                        Width="400px"
                                        TabIndex="-1"
                                        ReadOnly="true"
                                        style="display:none"
                                        ToolTip='<%# GetLocalResourceObject("Pantalla_Dic_Rotulo_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Pantalla_Dic_Rotulo_Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Dic_Pantalla_Codigo" 
                                        runat="server" 
                                        TabIndex="-1"
                                        ReadOnly="true"
                                        style="display:none"
                                        ToolTip='<%# GetLocalResourceObject("Dic_Pantalla_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Dic_Pantalla_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Dic_Pantalla_Nombre" 
                                        runat="server"
                                        TabIndex="-1"
                                        onfocus="this.blur()" 
                                        style="display:none"
                                        ToolTip='<%# GetLocalResourceObject("Dic_Pantalla_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Dic_Pantalla_Nombre") %>'>
                                    </asp:TextBox>
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
                                    <asp:TextBox 
                                        ID="Grupo" 
                                        runat="server" 
                                        style="display:none"
                                        Text='<%# Bind("Grupo") %>'>
                                    </asp:TextBox>
                                    <asp:DropDownList 
                                        ID="ddl_Grupo" 
                                        runat="server"
                                        Width="200px"
                                        AppendDataBoundItems="true" 
                                        CssClass="TEXTO_EDICION_KCG"
                                        DataSourceID="odsddlGrupo"
                                        DataTextField="Nombre" 
                                        DataValueField="Dic_Dominio_Dominio"
                                        OnDataBound="Grupo_DataBound">
                                        <asp:ListItem 
                                            Selected="True" 
                                            Value="">Seleccione...
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
                                            DefaultValue="SEG_ROL_MENU" 
                                            Name="Dic_Objeto_Nombre" 
                                            Type="String" />
                                        <asp:Parameter 
                                            DefaultValue="Grupo" 
                                            Name="Dic_Campo_Nombre" 
                                            Type="String" />
                                        </SelectParameters>
                                        </asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lbldic_contenedor_nombre"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Dic_Contenedor_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="dic_contenedor_nombre" 
                                        runat="server"
                                        Width="400px"
                                        CssClass="TEXTO_COMBOPER_KCG"
                                        ToolTip='<%# GetLocalResourceObject("Dic_Contenedor_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("dic_contenedor_nombre") %>'>
                                    </asp:TextBox>
                                    <AjaxControlToolkit:AutoCompleteExtender
                                        runat="server" 
                                        BehaviorID="AutoCompleteEx1"
                                        ID="acedic_contenedor_nombre" 
                                        TargetControlID="dic_contenedor_nombre"
                                        ServicePath="~/SEG/SEG_ROL_MENU.aspx" 
                                        ServiceMethod="Getcontenedor_nombre"
                                        MinimumPrefixLength="0" 
                                        CompletionInterval="500"
                                        EnableCaching="true"
                                        CompletionSetCount="500"
                                        CompletionListCssClass="autocomplete_completionListElement" 
                                        CompletionListItemCssClass="autocomplete_listItem" 
                                        CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                        OnClientItemSelected="ItemSelected_Contenedor_Nombre"
                                        UseContextKey="true"
                                        ContextKey="0">
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
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lblDic_con_elemento_nombre" 
                                        runat="server"                                         
                                        Text='<%# GetLocalResourceObject("Dic_con_elemento_nombreRecursoKCG.Text").ToString() %>'>
                                     </asp:Label>
                                </td>
                                <td style="white-space:nowrap"> 
                                    <asp:TextBox 
                                        ID="Elemento_Dic_Rotulo_Nombre" 
                                        runat="server"
                                        Width="300px"
                                        TabIndex="-1"
                                        ReadOnly="true"
                                        style="display:none"
                                        ToolTip='<%# GetLocalResourceObject("Elemento_Dic_Rotulo_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Elemento_Dic_Rotulo_Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Elemento_Ver_Etiqueta_nombre"
                                        Width="400px"
                                        runat="server" 
                                        CssClass="TEXTO_COMBOPER_KCG"
                                        ToolTip='<%# GetLocalResourceObject("Elemento_Ver_Etiqueta_nombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Elemento_Ver_Etiqueta_nombre") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        ID="RequiredFieldValidator1"
                                        runat="server" 
                                        ControlToValidate="Elemento_Ver_Etiqueta_nombre"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="ValidatorCalloutExtender1"
                                        TargetControlID="RequiredFieldValidator1"/> 
                                    <AjaxControlToolkit:AutoCompleteExtender
                                        runat="server" 
                                        BehaviorID="AutoCompleteEx4"
                                        ID="AutoCompleteExtender4" 
                                        TargetControlID="Elemento_Ver_Etiqueta_nombre"
                                        ServicePath="~/SEG/SEG_ROL_MENU.aspx" 
                                        ServiceMethod="Get_DicComElemento"
                                        MinimumPrefixLength="0" 
                                        CompletionInterval="500"
                                        EnableCaching="true"
                                        CompletionSetCount="20"
                                        CompletionListCssClass="autocomplete_completionListElement" 
                                        CompletionListItemCssClass="autocomplete_listItem" 
                                        CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                        OnClientItemSelected="ItemSelected_DicComElemento">                                                                                 
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
                                                        var behavior = $find('AutoCompleteEx4');
                                                        if (!behavior._height) {
                                                            var target = behavior.get_completionList();
                                                            behavior._height = target.offsetHeight - 2;
                                                            target.style.height = '0px';
                                                        }" />                                                    
                                                    <%-- Expand from 0px to the appropriate size while fading in --%>
                                                    <Parallel Duration=".4">
                                                        <FadeIn />
                                                        <Length PropertyKey="height" StartValue="0" EndValueScript="$find('AutoCompleteEx4')._height" />
                                                    </Parallel>
                                                </Sequence>
                                            </OnShow>
                                            <OnHide>
                                                <%-- Collapse down to 0px and fade out --%>
                                                <Parallel Duration=".4">
                                                    <FadeOut />
                                                    <Length PropertyKey="height" StartValueScript="$find('AutoCompleteEx4')._height" EndValue="0" />
                                                </Parallel>
                                            </OnHide>
                                        </Animations>
                                    </AjaxControlToolkit:AutoCompleteExtender>  
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox 
                                        ID="Dic_con_elemento_nombre" 
                                        runat="server" 
                                        Width="350px"                     
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        style="display:none"
                                        ToolTip='<%# GetLocalResourceObject("Dic_con_elemento_nombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Dic_con_elemento_nombre") %>'>
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
                                    <KOALA:wucMensajeActualizar 
                                        ID="WucMensajeActualizar1" 
                                        runat="server" />
                                </td>
                            </tr>
                        </table>
                    
                    
                        <%--id's--%>                                                
                        
                            <asp:TextBox 
                                ID="Dic_Pantalla_Id" 
                                runat="server" 
                                style="display:none"
                                Text='<%# Bind("Dic_Pantalla_Id") %>'>
                            </asp:TextBox>
                            
                            <asp:TextBox 
                                ID="Seg_Rol_Id" 
                                runat="server" 
                                style="display:none"
                                Text='<%# Bind("Seg_Rol_Id") %>'>
                            </asp:TextBox>
                            
                            <asp:TextBox 
                                ID="Dic_Contenedor_id" 
                                runat="server" 
                                style="display:none"
                                Text='<%# Bind("Dic_Contenedor_id") %>'>
                            </asp:TextBox>
                            
                            <asp:TextBox 
                                ID="Pantalla_Dic_Rotulo_Id" 
                                runat="server" 
                                style="display:none"
                                Text='<%# Bind("Pantalla_Dic_Rotulo_Id") %>'>
                            </asp:TextBox>
                            
                            <asp:TextBox 
                                ID="Elemento_Dic_Rotulo_Id" 
                                runat="server" 
                                style="display:none"
                                Text='<%# Bind("Elemento_Dic_Rotulo_Id") %>'>
                            </asp:TextBox>
                            
                            <asp:TextBox 
                                ID="Id" 
                                runat="server" 
                                style="display:none"
                                Text='<%# Bind("Id") %>'>
                            </asp:TextBox>
                            
                            <asp:TextBox 
                                ID="Dic_Con_Elemento_Id" 
                                runat="server" 
                                style="display:none"
                                Text='<%# Bind("Dic_Con_Elemento_Id") %>'>
                            </asp:TextBox>                       
                        
                        <%--campos no visibles--%>
                        
                        <asp:TextBox 
                            ID="estado_nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("estado_nombre") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Grupo_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Grupo_Nombre") %>'>
                        </asp:TextBox>
                       
                        <asp:TextBox 
                            ID="Seg_Rol_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Seg_Rol_Codigo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Seg_Rol_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Seg_Rol_Nombre") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="dic_contenedor_codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("dic_contenedor_codigo") %>'>
                        </asp:TextBox>
                      
                                                                       
                        <asp:TextBox 
                            ID="Pantalla_Dic_Rotulo_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Pantalla_Dic_Rotulo_Codigo") %>'>
                        </asp:TextBox>
                                                                        
                        <asp:TextBox 
                            ID="Elemento_Dic_Rotulo_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Elemento_Dic_Rotulo_Codigo") %>'>
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
                                        ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Codigo") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>                            
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lblDic_Pantalla_Nombre"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Pantalla_Ver_Etiqueta_nombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style= "white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Pantalla_Ver_Etiqueta_nombre" 
                                        runat="server"
                                        Width="400px"
                                        CssClass="TEXTO_COMBOPER_KCG"
                                        ToolTip='<%# GetLocalResourceObject("Pantalla_Ver_Etiqueta_nombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Pantalla_Ver_Etiqueta_nombre") %>'>
                                    </asp:TextBox>
                                    <AjaxControlToolkit:AutoCompleteExtender
                                        runat="server" 
                                        BehaviorID="AutoCompleteEx"
                                        ID="acePantalla_Ver_Etiqueta_nombre" 
                                        TargetControlID="Pantalla_Ver_Etiqueta_nombre"
                                        ServicePath="~/SEG/SEG_ROL_MENU.aspx" 
                                        ServiceMethod="GetEtiqueta_nombre"
                                        MinimumPrefixLength="0" 
                                        CompletionInterval="500"
                                        EnableCaching="true"
                                        CompletionSetCount="500"
                                        CompletionListCssClass="autocomplete_completionListElement" 
                                        CompletionListItemCssClass="autocomplete_listItem" 
                                        CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                        OnClientItemSelected="ItemSelected_Etiqueta_nombre" >
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
                                        ID="btnZoomDic_Pan_Nom" 
                                        runat="server" 
                                        CommandArgument="RutaDestino: ~/DIC/DIC_PANTALLA.aspx; Filtro: Pantalla_Ver_Etiqueta_nombre; Obtener: Dic_Pantalla_Id|Id,Pantalla_Ver_Etiqueta_nombre|Nombre"
                                        CommandName="Zoom" 
                                        Text="..." />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Pantalla_Dic_Rotulo_Nombre" 
                                        runat="server" 
                                        Width="400px"
                                        TabIndex="-1"
                                        ReadOnly="true"
                                        style="display:none"
                                        ToolTip='<%# GetLocalResourceObject("Pantalla_Dic_Rotulo_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Pantalla_Dic_Rotulo_Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Dic_Pantalla_Codigo" 
                                        runat="server" 
                                        TabIndex="-1"
                                        ReadOnly="true"
                                        style="display:none"
                                        ToolTip='<%# GetLocalResourceObject("Dic_Pantalla_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Dic_Pantalla_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Dic_Pantalla_Nombre" 
                                        runat="server"
                                        TabIndex="-1"
                                        onfocus="this.blur()" 
                                        style="display:none"
                                        ToolTip='<%# GetLocalResourceObject("Dic_Pantalla_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Dic_Pantalla_Nombre") %>'>
                                    </asp:TextBox>
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
                                    <asp:TextBox 
                                        ID="Grupo" 
                                        runat="server" 
                                        style="display:none"
                                        Text='<%# Bind("Grupo") %>'>
                                    </asp:TextBox>
                                    <asp:DropDownList 
                                        ID="ddl_Grupo" 
                                        runat="server"
                                        Width="200px"
                                        AppendDataBoundItems="true" 
                                        CssClass="TEXTO_EDICION_KCG"
                                        DataSourceID="odsddlGrupo"
                                        DataTextField="Nombre" 
                                        DataValueField="Dic_Dominio_Dominio"
                                        OnDataBound="Grupo_DataBound">
                                        <asp:ListItem 
                                            Selected="True" 
                                            Value="">Seleccione...
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
                                            DefaultValue="SEG_ROL_MENU" 
                                            Name="Dic_Objeto_Nombre" 
                                            Type="String" />
                                        <asp:Parameter 
                                            DefaultValue="Grupo" 
                                            Name="Dic_Campo_Nombre" 
                                            Type="String" />
                                        </SelectParameters>
                                        </asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lbldic_contenedor_nombre"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Dic_Contenedor_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="dic_contenedor_nombre" 
                                        runat="server"
                                        Width="400px"
                                        CssClass="TEXTO_COMBOPER_KCG"
                                        ToolTip='<%# GetLocalResourceObject("Dic_Contenedor_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("dic_contenedor_nombre") %>'>
                                    </asp:TextBox>
                                    <AjaxControlToolkit:AutoCompleteExtender
                                        runat="server" 
                                        BehaviorID="AutoCompleteEx1"
                                        ID="acedic_contenedor_nombre" 
                                        TargetControlID="dic_contenedor_nombre"
                                        ServicePath="~/SEG/SEG_ROL_MENU.aspx" 
                                        ServiceMethod="Getcontenedor_nombre"
                                        MinimumPrefixLength="0" 
                                        CompletionInterval="500"
                                        EnableCaching="true"
                                        CompletionSetCount="500"
                                        CompletionListCssClass="autocomplete_completionListElement" 
                                        CompletionListItemCssClass="autocomplete_listItem" 
                                        CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                        OnClientItemSelected="ItemSelected_Contenedor_Nombre"
                                        UseContextKey="true"
                                        ContextKey="0">
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
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lblDic_con_elemento_nombre" 
                                        runat="server"                                         
                                        Text='<%# GetLocalResourceObject("Dic_con_elemento_nombreRecursoKCG.Text").ToString() %>'>
                                     </asp:Label>
                                </td>
                                <td style="white-space:nowrap"> 
                                    <asp:TextBox 
                                        ID="Elemento_Dic_Rotulo_Nombre" 
                                        runat="server"
                                        Width="300px"
                                        TabIndex="-1"
                                        ReadOnly="true"
                                        style="display:none"
                                        ToolTip='<%# GetLocalResourceObject("Elemento_Dic_Rotulo_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Elemento_Dic_Rotulo_Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Elemento_Ver_Etiqueta_nombre"
                                        Width="400px"
                                        runat="server" 
                                        CssClass="TEXTO_COMBOPER_KCG"
                                        ToolTip='<%# GetLocalResourceObject("Elemento_Ver_Etiqueta_nombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Elemento_Ver_Etiqueta_nombre") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        ID="RequiredFieldValidator1"
                                        runat="server" 
                                        ControlToValidate="Elemento_Ver_Etiqueta_nombre"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="ValidatorCalloutExtender1"
                                        TargetControlID="RequiredFieldValidator1"/> 
                                    <AjaxControlToolkit:AutoCompleteExtender
                                        runat="server" 
                                        BehaviorID="AutoCompleteEx4"
                                        ID="AutoCompleteExtender4" 
                                        TargetControlID="Elemento_Ver_Etiqueta_nombre"
                                        ServicePath="~/SEG/SEG_ROL_MENU.aspx" 
                                        ServiceMethod="Get_DicComElemento"
                                        MinimumPrefixLength="0" 
                                        CompletionInterval="500"
                                        EnableCaching="true"
                                        CompletionSetCount="20"
                                        CompletionListCssClass="autocomplete_completionListElement" 
                                        CompletionListItemCssClass="autocomplete_listItem" 
                                        CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                        OnClientItemSelected="ItemSelected_DicComElemento">                                                                                 
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
                                                        var behavior = $find('AutoCompleteEx4');
                                                        if (!behavior._height) {
                                                            var target = behavior.get_completionList();
                                                            behavior._height = target.offsetHeight - 2;
                                                            target.style.height = '0px';
                                                        }" />                                                    
                                                    <%-- Expand from 0px to the appropriate size while fading in --%>
                                                    <Parallel Duration=".4">
                                                        <FadeIn />
                                                        <Length PropertyKey="height" StartValue="0" EndValueScript="$find('AutoCompleteEx4')._height" />
                                                    </Parallel>
                                                </Sequence>
                                            </OnShow>
                                            <OnHide>
                                                <%-- Collapse down to 0px and fade out --%>
                                                <Parallel Duration=".4">
                                                    <FadeOut />
                                                    <Length PropertyKey="height" StartValueScript="$find('AutoCompleteEx4')._height" EndValue="0" />
                                                </Parallel>
                                            </OnHide>
                                        </Animations>
                                    </AjaxControlToolkit:AutoCompleteExtender>  
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox 
                                        ID="Dic_con_elemento_nombre" 
                                        runat="server" 
                                        Width="350px"                     
                                        ReadOnly="true"
                                        TabIndex="-1"  
                                        style="display:none"
                                        ToolTip='<%# GetLocalResourceObject("Dic_con_elemento_nombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Dic_con_elemento_nombre") %>'>
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
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InsertarRecursoKCG.AccesKey").ToString() %>' 
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_InsertRecursoKCG.Text").ToString() %>'
                                        ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_InsertRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:Button>
                                    <asp:Button 
                                        ID="InsertCancelButton" 
                                        runat="server" 
                                        CausesValidation="False" 
                                        CommandName="Cancel"
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_CancelarRecursoKCG.AccesKey").ToString() %>' 
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_CancelRecursoKCG.Text").ToString() %>'
                                        ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_CancelRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:Button>
                                </td>
                            </tr>
                        </table>
                    
                    
                        <%--id's--%>
                        
                        <asp:TextBox 
                            ID="Dic_Pantalla_Id" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Dic_Pantalla_Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Seg_Rol_Id" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Seg_Rol_Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Dic_Contenedor_id" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Dic_Contenedor_id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Pantalla_Dic_Rotulo_Id" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Pantalla_Dic_Rotulo_Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Elemento_Dic_Rotulo_Id" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Elemento_Dic_Rotulo_Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Id" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Dic_Con_Elemento_Id" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Dic_Con_Elemento_Id") %>'>
                        </asp:TextBox>
                        
                        <%--campos no visibles--%>
                        
                        <asp:TextBox 
                            ID="Dic_con_elemento_Codigo" 
                            runat="server"  
                            Visible="false"                                       
                            Text='<%# Bind("Dic_con_elemento_Codigo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="estado_nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("estado_nombre") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Grupo_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Grupo_Nombre") %>'>
                        </asp:TextBox>
                       
                        <asp:TextBox 
                            ID="Seg_Rol_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Seg_Rol_Codigo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Seg_Rol_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Seg_Rol_Nombre") %>'>
                        </asp:TextBox>
                                                                       
                        <asp:TextBox 
                            ID="dic_contenedor_codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("dic_contenedor_codigo") %>'>
                        </asp:TextBox>
                                                                       
                        <asp:TextBox 
                            ID="Pantalla_Dic_Rotulo_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Pantalla_Dic_Rotulo_Codigo") %>'>
                        </asp:TextBox>
                                                                        
                        <asp:TextBox 
                            ID="Elemento_Dic_Rotulo_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Elemento_Dic_Rotulo_Codigo") %>'>
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
                                        TabIndex="-1"
                                        ReadOnly="true"
                                        ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Codigo") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>                            
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lblDic_Pantalla_Nombre"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Pantalla_Ver_Etiqueta_nombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style= "white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Pantalla_Ver_Etiqueta_nombre" 
                                        runat="server"
                                        Width="400px"
                                        TabIndex="-1"
                                        ReadOnly="true"
                                        ToolTip='<%# GetLocalResourceObject("Pantalla_Ver_Etiqueta_nombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Pantalla_Ver_Etiqueta_nombre") %>'>
                                    </asp:TextBox>
                                    <asp:Button 
                                        ID="btnZoomDic_Pan_Nom" 
                                        runat="server" 
                                        CommandArgument="RutaDestino: ~/DIC/DIC_PANTALLA.aspx; Filtro: Dic_Pantalla_Nombre; Obtener: Dic_Pantalla_Codigo|Codigo,Pantalla_Dic_Rotulo_Nombre|Dic_Rotulo_Nombre,Pantalla_Ver_Etiqueta_nombre|Nombre"
                                        CommandName="Zoom"
                                        Enabled="false"
                                        Text="..." />  
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Pantalla_Dic_Rotulo_Nombre" 
                                        runat="server" 
                                        Width="400px"
                                        TabIndex="-1"
                                        ReadOnly="true"
                                        Visible="false"
                                        ToolTip='<%# GetLocalResourceObject("Pantalla_Dic_Rotulo_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Pantalla_Dic_Rotulo_Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Dic_Pantalla_Codigo" 
                                        runat="server" 
                                        TabIndex="-1"
                                        ReadOnly="true"
                                        style="display:none"
                                        ToolTip='<%# GetLocalResourceObject("Dic_Pantalla_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Dic_Pantalla_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Dic_Pantalla_Nombre" 
                                        runat="server"
                                        TabIndex="-1"
                                        ReadOnly="true"
                                        style="display:none"
                                        ToolTip='<%# GetLocalResourceObject("Dic_Pantalla_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Dic_Pantalla_Nombre") %>'>
                                    </asp:TextBox>
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
                                    <asp:TextBox 
                                        ID="Grupo_Nombre" 
                                        runat="server"
                                        Width="250px"
                                        TabIndex="-1"
                                        ReadOnly="true"
                                        Text='<%# Bind("Grupo_Nombre") %>'>
                                    </asp:TextBox>                                    
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lbldic_contenedor_nombre"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Dic_Contenedor_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="dic_contenedor_nombre" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Width="400px"
                                        ToolTip='<%# GetLocalResourceObject("Dic_Contenedor_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("dic_contenedor_nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lblDic_con_elemento_nombre" 
                                        runat="server"                                         
                                        Text='<%# GetLocalResourceObject("Dic_con_elemento_nombreRecursoKCG.Text").ToString() %>'>
                                     </asp:Label>
                                </td>
                                <td style="white-space:nowrap"> 
                                    <asp:TextBox 
                                        ID="Elemento_Dic_Rotulo_Nombre" 
                                        runat="server"
                                        Width="300px"
                                        TabIndex="-1"
                                        ReadOnly="true"
                                        Visible="false"
                                        ToolTip='<%# GetLocalResourceObject("Elemento_Dic_Rotulo_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Elemento_Dic_Rotulo_Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Elemento_Ver_Etiqueta_nombre"
                                        Width="400px"
                                        runat="server" 
                                        TabIndex="-1"
                                        ReadOnly="true"
                                        ToolTip='<%# GetLocalResourceObject("Elemento_Ver_Etiqueta_nombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Elemento_Ver_Etiqueta_nombre") %>'>
                                    </asp:TextBox>                                     
                                </td>
                            </tr>
                            <tr>
                                <td>                                    
                                    <asp:TextBox 
                                        ID="Dic_con_elemento_nombre" 
                                        runat="server" 
                                        Width="350px"                     
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Visible="false"           
                                        ToolTip='<%# GetLocalResourceObject("Dic_con_elemento_nombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Dic_con_elemento_nombre") %>'>
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
                                    <KOALA:wucMensajeEliminar 
                                        ID="WucMensajeEliminar1" 
                                        runat="server" />
                                </td>
                            </tr>
                        </table>
                    
                    
                        <%--id's--%>
                                                
                            <asp:TextBox 
                                ID="Dic_Pantalla_Id" 
                                runat="server" 
                                style="display:none"
                                Text='<%# Bind("Dic_Pantalla_Id") %>'>
                            </asp:TextBox>
                            
                            <asp:TextBox 
                                ID="Seg_Rol_Id" 
                                runat="server" 
                                style="display:none"
                                Text='<%# Bind("Seg_Rol_Id") %>'>
                            </asp:TextBox>
                            
                            <asp:TextBox 
                                ID="Dic_Contenedor_id" 
                                runat="server" 
                                style="display:none"
                                Text='<%# Bind("Dic_Contenedor_id") %>'>
                            </asp:TextBox>
                            
                            <asp:TextBox 
                                ID="Pantalla_Dic_Rotulo_Id" 
                                runat="server" 
                                style="display:none"
                                Text='<%# Bind("Pantalla_Dic_Rotulo_Id") %>'>
                            </asp:TextBox>
                            
                            <asp:TextBox 
                                ID="Elemento_Dic_Rotulo_Id" 
                                runat="server" 
                                style="display:none"
                                Text='<%# Bind("Elemento_Dic_Rotulo_Id") %>'>
                            </asp:TextBox>
                            
                            <asp:TextBox 
                                ID="Id" 
                                runat="server" 
                                style="display:none"
                                Text='<%# Bind("Id") %>'>
                            </asp:TextBox>
                            
                            <asp:TextBox 
                                ID="Dic_Con_Elemento_Id" 
                                runat="server" 
                                style="display:none"
                                Text='<%# Bind("Dic_Con_Elemento_Id") %>'>
                            </asp:TextBox>
                        
                        <%--campos no visibles--%>
                        
                        <asp:TextBox 
                            ID="estado_nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("estado_nombre") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Grupo" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Grupo") %>'>
                        </asp:TextBox>
                       
                        <asp:TextBox 
                            ID="Seg_Rol_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Seg_Rol_Codigo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Seg_Rol_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Seg_Rol_Nombre") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="dic_contenedor_codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("dic_contenedor_codigo") %>'>
                        </asp:TextBox>                      
                       
                                                                       
                        <asp:TextBox 
                            ID="Pantalla_Dic_Rotulo_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Pantalla_Dic_Rotulo_Codigo") %>'>
                        </asp:TextBox>
                                                                        
                        <asp:TextBox 
                            ID="Elemento_Dic_Rotulo_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Elemento_Dic_Rotulo_Codigo") %>'>
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
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger 
                    ControlID="mstgv_seg_rol_menu"
                    EventName="SelectedIndexChanged"/>
                <asp:AsyncPostBackTrigger 
                    ControlID="navMst"
                    EventName="Navegar"/>
                <asp:AsyncPostBackTrigger 
                    ControlID="gv_det_SegRolMenu"
                    EventName="SelectedIndexChanged"/>
            </Triggers>
        </asp:UpdatePanel>
        <asp:ObjectDataSource 
            ID="odsfv_det_SegRolMenu" 
            runat="server" 
            ConflictDetection="CompareAllValues"
            DeleteMethod="Delete" 
            InsertMethod="Insert" 
            OldValuesParameterFormatString="original{0}"
            SelectMethod="GetById" 
            SortParameterName="sortExpression" 
            TypeName="FEL.SEG.BO_Seg_Rol_Menu"
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
                <koala:KNavegacion 
                    ID="nav"
                    runat="server"
                    GridViewID="gv_det_SegRolMenu" />
                <koala:KFiltro 
                    ID="kftFiltro" 
                    runat="server" 
                    Contenedor="SEG_ROL_MENU" 
                    Objeto="Seg_Rol_Menu" 
                    IndiceScope ="Scope"
                    Orden="1" 
                    ObjectDataSourceID="odsgv_det_SegRolMenu"/>
                <koala:KGrid 
                    ID="gv_det_SegRolMenu" 
                    runat="server" 
                    AutoGenerateColumns="False" 
                    DataSourceID="odsgv_det_SegRolMenu" 
                    AllowPaging="True" 
                    AllowSorting="True" 
                    DataKeyNames="Id,Seg_Rol_Id">
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
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="grupo_nombre" 
                            meta:resourcekey="BoundGrupoRecursoKCG"
                            SortExpression="grupo_nombre" >
                            <ItemStyle Width="40mm" Wrap="True" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Pantalla_Ver_Etiqueta_nombre" 
                            meta:resourcekey="BoundPantalla_Ver_Etiqueta_nombreRecursoKCG"
                            SortExpression="Pantalla_Ver_Etiqueta_nombre" >
                            <ItemStyle Width="80mm" Wrap="True" horizontalalign="Left" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="dic_contenedor_nombre" 
                            meta:resourcekey="BoundDic_Contenedor_NombreRecursoKCG"
                            SortExpression="dic_contenedor_nombre" >
                            <itemstyle horizontalalign="Left" width="80mm" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Elemento_Ver_Etiqueta_nombre" 
                            meta:resourcekey="BoundDic_con_elemento_nombreRecursoKCG"
                            SortExpression="Elemento_Ver_Etiqueta_nombre" >
                            <ItemStyle Width="80mm" Wrap="True" />
                        </asp:BoundField>
                        <asp:BoundField 
                        DataField="Dic_Pantalla_Id" 
                        HeaderText="Dic_Pantalla_Id" 
                        SortExpression="Dic_Pantalla_Id" 
                        Visible="False" />
                        <asp:BoundField 
                        DataField="Seg_Rol_Id" 
                        HeaderText="Seg_Rol_Id" 
                        SortExpression="Seg_Rol_Id" 
                        Visible="False" />
                        <asp:BoundField 
                            DataField="Dic_Pantalla_Nombre" 
                            meta:resourcekey="BoundDic_Pantalla_NombreRecursoKCG"
                            SortExpression="Dic_Pantalla_Nombre" Visible="False" >
                            <ItemStyle Width="80mm" Wrap="True" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Elemento_Dic_Rotulo_Nombre" 
                           meta:resourcekey="BoundElemento_Dic_Rotulo_NombreRecursoKCG"
                            SortExpression="Elemento_Dic_Rotulo_Nombre" Visible="False" > 
                        <ItemStyle Width="80mm" Wrap="True" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Dic_con_elemento_nombre" 
                            meta:resourcekey="BoundDic_con_elemento_nombreRecursoKCG"
                            SortExpression="Dic_con_elemento_nombre" 
                            Visible="False" />                            
                        <asp:BoundField 
                        DataField="Dic_Con_Elemento_Id" 
                        HeaderText="Dic_Con_Elemento_Id"
                            SortExpression="Dic_Con_Elemento_Id" 
                            Visible="False" />
                        <asp:BoundField 
                        DataField="estado_nombre" 
                        HeaderText="estado_nombre" 
                        SortExpression="estado_nombre" 
                        Visible="False" />
                        <asp:BoundField 
                        DataField="grupo" 
                        HeaderText="grupo" 
                        SortExpression="grupo" 
                        Visible="False" />
                        <asp:BoundField 
                        DataField="Dic_Pantalla_Codigo" 
                        HeaderText="Dic_Pantalla_Codigo"
                            SortExpression="Dic_Pantalla_Codigo" 
                            Visible="False" />
                        <asp:BoundField 
                        DataField="Seg_Rol_Codigo" 
                        HeaderText="Seg_Rol_Codigo" 
                        SortExpression="Seg_Rol_Codigo" 
                        Visible="False" />
                        <asp:BoundField 
                        DataField="Seg_Rol_Nombre" 
                        HeaderText="Seg_Rol_Nombre" 
                        SortExpression="Seg_Rol_Nombre" 
                        Visible="False" />
                        <asp:BoundField 
                        DataField="Dic_con_elemento_Codigo" 
                        HeaderText="Dic_con_elemento_Codigo"
                            SortExpression="Dic_con_elemento_Codigo" 
                            Visible="False" />
                        <asp:BoundField 
                        DataField="Dic_Contenedor_id" 
                        HeaderText="Dic_Contenedor_id" 
                        SortExpression="Dic_Contenedor_id"
                        Visible="False" />
                        <asp:BoundField
                        DataField="dic_contenedor_codigo" 
                        HeaderText="dic_contenedor_codigo"
                            SortExpression="dic_contenedor_codigo" 
                            Visible="False" />
                        <asp:BoundField 
                        DataField="Pantalla_Dic_Rotulo_Id" 
                        HeaderText="Pantalla_Dic_Rotulo_Id"
                            SortExpression="Pantalla_Dic_Rotulo_Id" 
                            Visible="False" />
                        <asp:BoundField 
                        DataField="Pantalla_Dic_Rotulo_Codigo" 
                        HeaderText="Pantalla_Dic_Rotulo_Codigo"
                            SortExpression="Pantalla_Dic_Rotulo_Codigo" 
                            Visible="False" />
                        <asp:BoundField 
                        DataField="Pantalla_Dic_Rotulo_Nombre" 
                        HeaderText="Pantalla_Dic_Rotulo_Nombre"
                            SortExpression="Pantalla_Dic_Rotulo_Nombre" 
                            Visible="False" />
                        <asp:BoundField 
                        DataField="Elemento_Dic_Rotulo_Id" 
                        HeaderText="Elemento_Dic_Rotulo_Id"
                            SortExpression="Elemento_Dic_Rotulo_Id" 
                            Visible="False" />
                        <asp:BoundField 
                        DataField="Elemento_Dic_Rotulo_Codigo" 
                        HeaderText="Elemento_Dic_Rotulo_Codigo"
                            SortExpression="Elemento_Dic_Rotulo_Codigo" 
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
            </ContentTemplate>            
        </asp:UpdatePanel>
    </asp:Panel>
    <asp:ObjectDataSource 
        ID="odsgv_det_SegRolMenu" 
        runat="server" 
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetByRol" 
        TypeName="FEL.SEG.BO_Seg_Rol_Menu">
        <SelectParameters>
            <asp:SessionParameter 
                Name="s" 
                SessionField="Scope" 
                Type="Object" />
            <asp:ControlParameter 
                ControlID="mstgv_seg_rol_menu" 
                Name="Seg_Rol_Id" 
                PropertyName="SelectedDataKey.Values[Id]"
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>            
        
</asp:Content>

