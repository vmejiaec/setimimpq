<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="DIC_CONTENEDOR.aspx.cs" 
    Inherits="DIC_DIC_CONTENEDOR" 
    meta:resourcekey="Tit_Dic_ContenedorRecursoKCG"
    Theme="EstiloKCG"
    StylesheetTheme="EstiloKCG" %>
    
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
    
<asp:Content ID="Content1" 
    ContentPlaceHolderID="ContentPlaceHolder1" 
    Runat="Server">
    <asp:UpdatePanel 
        ID="UpdatePanel1" 
        runat="server" 
        UpdateMode="Conditional">
        <ContentTemplate>
        <script type="text/javascript">
            function checkSelectedValueFiltro()
            { 
                var ddlFiltro = $get("ctl00_ContentPlaceHolder1_fvDicContenedor_ddlFiltro");
                var Filtro   = $get("ctl00_ContentPlaceHolder1_fvDicContenedor_Filtro");
                                
                Filtro.value = ddlFiltro.options[ddlFiltro.selectedIndex].value;
            }
             
            function ItemSelected_Modulo( source, eventArgs ) 
            { 
                var valor = eventArgs.get_value();
                var temp = new Array();
                temp = valor.split('||');                       

                var Dic_Modulo_Id = $get("ctl00_ContentPlaceHolder1_fvDicContenedor_Dic_Modulo_Id");
                Dic_Modulo_Id.value = temp[0];   
                var Dic_Modulo_Codigo = $get("ctl00_ContentPlaceHolder1_fvDicContenedor_Dic_Modulo_Codigo");
                Dic_Modulo_Codigo.value = temp[1];
            }
        </script>
        <asp:Panel 
            runat="server" 
            ID="pnlDatosFV"
            meta:resourcekey="Rec_Dic_ContenedorRecursoKCG">
            <asp:FormView 
                ID="fvDicContenedor" 
                runat="server" 
                DataSourceID="odsFvDicContenedor"
                DefaultMode="Insert">
                <EditItemTemplate>
                     <table>
                        <tr align="left">
                            <td colspan="2">
                                <asp:Label 
                                    ID="Estado_nombre" 
                                    runat="server" 
                                    Text='<%# Bind("Estado_nombre") %>'>
                                </asp:Label>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lblCodigo" 
                                    runat="server"
                                    meta:resourcekey="CodigoRecursoKCG">
                                </asp:Label>
                            </td>
                            <td>
                                 <asp:TextBox 
                                    ID="Codigo" 
                                    runat="server" 
                                    CssClass="TEXTO_EDICION_KCG"
                                    ReadOnly="true"
                                    Text='<%# Bind("Codigo") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lblNombre" 
                                    runat="server"
                                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                    AssociatedControlID="Nombre" 
                                    meta:resourcekey="NombreRecursoKCG">
                                 </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Nombre" 
                                    runat="server"
                                    Width="400px"
                                    CssClass="TEXTO_EDICION_KCG" 
                                    Text='<%# Bind("Nombre") %>'>
                                </asp:TextBox>
                                 <asp:RequiredFieldValidator 
                                    runat="server" 
                                    ID="rqvNombre"
                                    ControlToValidate="Nombre"
                                    ValidationGroup="I"
                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                 <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server" ID="caValidator"
                                    TargetControlID="rqvNombre" />
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lblTipo" 
                                    runat="server"
                                    meta:resourcekey="Tipo_NombreRecursoKCG">
                                 </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Tipo" 
                                    runat="server"
                                    Style="display:none"
                                    Text='<%# Bind("Tipo") %>'>
                                </asp:TextBox>
                                <asp:DropDownList 
                                    ID="ddlTipo" 
                                    runat="server" 
                                    DataSourceID="odsTipo" 
                                    DataTextField="Nombre"
                                    CssClass="TEXTO_EDICION_KCG"
                                    DataValueField="Dic_Dominio_Dominio">
                                </asp:DropDownList>
                                <asp:ObjectDataSource 
                                    ID="odsTipo" 
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
                                            DefaultValue="DIC_CONTENEDOR" 
                                            Name="Dic_Objeto_Nombre" 
                                            Type="String" />
                                        <asp:Parameter 
                                            DefaultValue="TIPO" 
                                            Name="Dic_Campo_Nombre" 
                                            Type="String" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lblModulo" 
                                    runat="server"
                                    meta:resourcekey="Dic_Modulo_NombreRecursoKCG">
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Dic_Modulo_Codigo" 
                                    runat="server"
                                    ReadOnly="true"
                                    TabIndex="-1"
                                    Text='<%# Bind("Dic_Modulo_Codigo") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Dic_Modulo_Nombre" 
                                    runat="server"
                                    Width="400px"
                                    CssClass="TEXTO_EDICION_KCG" 
                                    Text='<%# Bind("Dic_Modulo_Nombre") %>'>
                                </asp:TextBox>
                                <asp:Button 
                                    ID="Button3" 
                                    runat="server" 
                                    CommandArgument="RutaDestino: ~/DIC/DIC_MODULO.aspx; Filtro: Dic_Modulo_Nombre;"
                                    CommandName="Zoom" 
                                    Text="..." />
                                <asp:RequiredFieldValidator 
                                    runat="server" 
                                    ID="RequiredFieldValidator2"
                                    ControlToValidate="Dic_Modulo_Nombre"
                                    ValidationGroup="I"
                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server" 
                                    ID="ValidatorCalloutExtender2"
                                    TargetControlID="RequiredFieldValidator2" />
                                <AjaxControlToolkit:AutoCompleteExtender
                                    runat="server" 
                                    BehaviorID="AutoCompleteEx"
                                    ID="autoComplete1" 
                                    TargetControlID="Dic_Modulo_Nombre"
                                    ServicePath="~/DIC/DIC_CONTENEDOR.aspx" 
                                    ServiceMethod="Get_Modulo_Nombre"
                                    MinimumPrefixLength="0" 
                                    CompletionInterval="500"
                                    EnableCaching="true"
                                    CompletionSetCount="20"
                                    CompletionListCssClass="autocomplete_completionListElement" 
                                    CompletionListItemCssClass="autocomplete_listItem" 
                                    CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                    OnClientItemSelected="ItemSelected_Modulo" >
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
                                                    <Length 
                                                        PropertyKey="height" 
                                                        StartValue="0" 
                                                        EndValueScript="$find('AutoCompleteEx')._height" />
                                                </Parallel>
                                            </Sequence>
                                        </OnShow>
                                        <OnHide>
                                            <%-- Collapse down to 0px and fade out --%>
                                            <Parallel Duration=".4">
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
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lblArchivoRecursos" 
                                    runat="server"                                            
                                    meta:resourcekey="archivo_recursosRecursoKCG">
                                 </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="archivo_recursos" 
                                    runat="server" 
                                    ReadOnly="true"
                                    TabIndex="-1"
                                    Width="400px"
                                    Text='<%# Bind("archivo_recursos") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lblFiltro" 
                                    runat="server"
                                    meta:resourcekey="FiltroRecursoKCG">
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Filtro" 
                                    runat="server"
                                    Style="display:none"
                                    Text='<%# Bind("Filtro") %>'>
                                </asp:TextBox>                                
                                <asp:DropDownList 
                                    ID="ddlFiltro" 
                                    runat="server"                                             
                                    DataSourceID="odsFiltro" 
                                    DataTextField="Nombre"
                                    CssClass="TEXTO_EDICION_KCG"
                                    DataValueField="Dic_Dominio_Dominio"
                                    OnDataBound="Filttro_DataBound">
                                </asp:DropDownList>
                                <asp:ObjectDataSource 
                                    ID="odsFiltro" 
                                    runat="server" 
                                    EnableCaching="true"
                                    CacheDuration="300" 
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
                                            DefaultValue="DIC_CONTENEDOR" 
                                            Name="Dic_Objeto_Nombre" 
                                            Type="String" />
                                        <asp:Parameter 
                                            DefaultValue="FILTRO" 
                                            Name="Dic_Campo_Nombre" 
                                            Type="String" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>   
                            </td>
                        </tr>
                        <tr align="left">
                            <td colspan="2">
                                <asp:Button 
                                    ID="UpdateButton" 
                                    runat="server"
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
                                <uc2:wucMensajeActualizar 
                                    ID="WucMensajeActualizar1" 
                                    runat="server" />
                            </td>
                        </tr>
                    </table>
                    
                    <%--Ids--%>
                    
                    <asp:TextBox 
                        ID="Id" 
                        runat="server" 
                        Visible="true"
                        style="display:none"
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Dic_Modulo_id" 
                        runat="server" 
                        style="display:none"
                        Visible="true"
                        Text='<%# Bind("Dic_Modulo_id") %>'>
                    </asp:TextBox>
                    
                    <%--Ocultos--%>

                    <asp:TextBox 
                        ID="TextBox1" 
                        Visible="false"
                        runat="server" 
                        Text='<%# Bind("Tipo") %>'>
                    </asp:TextBox>
                    

                    <asp:TextBox 
                        ID="Estado" 
                        runat="server"
                        Visible="false" 
                        Text='<%# Bind("Estado") %>'>
                    </asp:TextBox>

                    <asp:TextBox 
                        ID="TextBox2" 
                        Visible="false"
                        runat="server" 
                        Text='<%# Bind("Filtro") %>'>
                    </asp:TextBox>
                </EditItemTemplate>
                
                <InsertItemTemplate>
                    <table>
                        <tr align="left">
                            <td colspan="2">
                                <asp:Label 
                                    ID="Estado_nombre" 
                                    runat="server" 
                                    Text='<%# Bind("Estado_nombre") %>'>
                                </asp:Label>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lblCodigo" 
                                    runat="server"
                                    Visible="false" 
                                    meta:resourcekey="CodigoRecursoKCG">
                                </asp:Label>
                            </td>
                            <td>
                                 <asp:TextBox 
                                    ID="Codigo" 
                                    runat="server" 
                                    Visible="false"
                                    Text='<%# Bind("Codigo") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lblNombre" 
                                    runat="server"
                                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                    AssociatedControlID="Nombre" 
                                    meta:resourcekey="NombreRecursoKCG">
                                 </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Nombre" 
                                    runat="server"
                                    Width="400px"
                                    CssClass="TEXTO_EDICION_KCG" 
                                    Text='<%# Bind("Nombre") %>'>
                                </asp:TextBox>
                                 <asp:RequiredFieldValidator 
                                    ID="rfvNombre"
                                    runat="server" 
                                    ControlToValidate="Nombre"
                                    ValidationGroup="I"
                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server" 
                                    ID="ValidatorCalloutExtender3"
                                    TargetControlID="rfvNombre"/> 
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lblTipo" 
                                    runat="server"
                                    meta:resourcekey="Tipo_NombreRecursoKCG">
                                 </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Tipo" 
                                    runat="server"
                                    Style="display:none"
                                    Text='<%# Bind("Tipo") %>'>
                                </asp:TextBox>
                                <asp:DropDownList 
                                    ID="ddlTipo"
                                    runat="server" 
                                    DataSourceID="odsTipo" 
                                    DataTextField="Nombre"
                                    CssClass="TEXTO_EDICION_KCG"
                                    DataValueField="Dic_Dominio_Dominio">
                                </asp:DropDownList>
                                <asp:ObjectDataSource 
                                    ID="odsTipo" 
                                    runat="server"
                                    EnableCaching="true"
                                    CacheDuration="300" 
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
                                            DefaultValue="DIC_CONTENEDOR" 
                                            Name="Dic_Objeto_Nombre" 
                                            Type="String" />
                                        <asp:Parameter 
                                            DefaultValue="TIPO" 
                                            Name="Dic_Campo_Nombre" 
                                            Type="String" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                 <asp:Label 
                                    ID="lblModulo" 
                                    runat="server"
                                    meta:resourcekey="Dic_Modulo_NombreRecursoKCG">
                                 </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Dic_Modulo_Codigo" 
                                    runat="server"
                                    TabIndex="-1"
                                    ReadOnly="true"
                                    Text='<%# Bind("Dic_Modulo_Codigo") %>'>
                                </asp:TextBox>                                          
                                <asp:TextBox 
                                    ID="Dic_Modulo_Nombre" 
                                    runat="server"
                                    Width="400px"
                                    CssClass="TEXTO_EDICION_KCG" 
                                    Text='<%# Bind("Dic_Modulo_Nombre") %>'>
                                </asp:TextBox>
                                <asp:Button 
                                    ID="Button3" 
                                    runat="server" 
                                    CommandArgument="RutaDestino: ~/DIC/DIC_MODULO.aspx; Filtro: Dic_Modulo_Nombre;"
                                    CommandName="Zoom" 
                                    Text="..." />
                                <asp:RequiredFieldValidator 
                                    ID="rfvDic_Modulo_Nombre"
                                    runat="server" 
                                    ControlToValidate="Dic_Modulo_Nombre"
                                    ValidationGroup="I"
                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server" 
                                    ID="ValidatorCalloutExtender6"
                                    TargetControlID="rfvDic_Modulo_Nombre"/>
                                <AjaxControlToolkit:AutoCompleteExtender
                                    runat="server" 
                                    BehaviorID="AutoCompleteEx"
                                    ID="autoComplete1" 
                                    TargetControlID="Dic_Modulo_Nombre"
                                    ServicePath="~/DIC/DIC_CONTENEDOR.aspx" 
                                    ServiceMethod="Get_Modulo_Nombre"
                                    MinimumPrefixLength="0" 
                                    CompletionInterval="500"
                                    EnableCaching="true"
                                    CompletionSetCount="20"
                                    CompletionListCssClass="autocomplete_completionListElement" 
                                    CompletionListItemCssClass="autocomplete_listItem" 
                                    CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                    OnClientItemSelected="ItemSelected_Modulo" >
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
                                                    <Length 
                                                        PropertyKey="height" 
                                                        StartValue="0" 
                                                        EndValueScript="$find('AutoCompleteEx')._height" />
                                                </Parallel>
                                            </Sequence>
                                        </OnShow>
                                        <OnHide>
                                            <%-- Collapse down to 0px and fade out --%>
                                            <Parallel Duration=".4">
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
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lblArchivoRecursos" 
                                    runat="server"
                                    meta:resourcekey="archivo_recursosRecursoKCG">
                                 </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="archivo_recursos" 
                                    runat="server"
                                    ReadOnly="true"
                                    TabIndex="-1"
                                    Width="400px"
                                    Text='<%# Bind("archivo_recursos") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lblFiltro" 
                                    runat="server"
                                    meta:resourcekey="FiltroRecursoKCG">
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Filtro" 
                                    runat="server"
                                    Style="display:none"
                                    Text='<%# Bind("Filtro") %>'>
                                </asp:TextBox>                                                                               
                                <asp:DropDownList 
                                    ID="ddlFiltro" 
                                    runat="server"                                             
                                    DataSourceID="odsFiltro" 
                                    DataTextField="Nombre"
                                    CssClass="TEXTO_EDICION_KCG"
                                    DataValueField="Dic_Dominio_Dominio"
                                    OnDataBound="Filttro_DataBound">
                                </asp:DropDownList>
                                <asp:ObjectDataSource 
                                    ID="odsFiltro" 
                                    runat="server" 
                                    EnableCaching="true"
                                    CacheDuration="300" 
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
                                            DefaultValue="DIC_CONTENEDOR" 
                                            Name="Dic_Objeto_Nombre" 
                                            Type="String" />
                                        <asp:Parameter 
                                            DefaultValue="FILTRO" 
                                            Name="Dic_Campo_Nombre" 
                                            Type="String" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>                                                                                
                            </td>
                        </tr>
                        <tr align="left">
                            <td colspan="2">
                                <asp:Button 
                                    ID="InsertButton" 
                                    runat="server" 
                                    CausesValidation="True" 
                                    CommandName="Insert"
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
                    
                    <%--Ids--%>
                    
                    <asp:TextBox 
                        ID="Id" 
                        runat="server" 
                        Visible="true"
                        style="display:none"
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Dic_Modulo_id" 
                        runat="server" 
                        style="display:none"
                        Visible="true"
                        Text='<%# Bind("Dic_Modulo_id") %>'>
                    </asp:TextBox>
                    
                    <%--Ocultos--%>

                    <asp:TextBox 
                        ID="TextBox1" 
                        Visible="false"
                        runat="server" 
                        Text='<%# Bind("Tipo") %>'>
                    </asp:TextBox>
                    

                    <asp:TextBox 
                        ID="Estado" 
                        runat="server"
                        Visible="false" 
                        Text='<%# Bind("Estado") %>'>
                    </asp:TextBox>

                    <asp:TextBox 
                        ID="TextBox2" 
                        Visible="false"
                        runat="server" 
                        Text='<%# Bind("Filtro") %>'>
                    </asp:TextBox>                    
                </InsertItemTemplate>
                
                <ItemTemplate>
                     <table>
                        <tr align="left">
                            <td colspan="2">
                                <asp:Label 
                                    ID="Estado_nombre" 
                                    runat="server" 
                                    Text='<%# Bind("Estado_nombre") %>'>
                                </asp:Label>
                            </td>
                        </tr>
                        <tr align="left">
                            <td style="width: 131px">
                                <asp:Label 
                                    ID="lblCodigo" 
                                    runat="server"
                                    meta:resourcekey="CodigoRecursoKCG">
                                </asp:Label>
                            </td>
                            <td>
                                 <asp:TextBox 
                                    ID="Codigo" 
                                    runat="server" 
                                    ReadOnly="true"
                                    TabIndex="-1"
                                    Text='<%# Bind("Codigo") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr align="left">
                            <td style="width: 131px">
                                <asp:Label 
                                    ID="lblNombre" 
                                    runat="server"
                                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                    AssociatedControlID="Nombre" 
                                    meta:resourcekey="NombreRecursoKCG">
                                 </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Nombre" 
                                    runat="server"
                                    ReadOnly="true"
                                    Width="400px"
                                    TabIndex="-1"
                                    Text='<%# Bind("Nombre") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr align="left">
                            <td style="width: 131px">
                                <asp:Label 
                                    ID="lblTipo" 
                                    runat="server"
                                    meta:resourcekey="Tipo_NombreRecursoKCG">
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Tipo_Nombre" 
                                    ReadOnly="true"
                                    runat="server" 
                                    TabIndex="-1"
                                    Text='<%# Bind("Tipo_Nombre") %>'>
                                </asp:TextBox>                                    
                            </td>
                        </tr>
                        <tr align="left">
                            <td style="width: 131px">
                                <asp:Label 
                                    ID="lblModulo" 
                                    runat="server"
                                    meta:resourcekey="Dic_Modulo_NombreRecursoKCG">
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Dic_Modulo_Codigo" 
                                    runat="server"
                                    ReadOnly="true" 
                                    TabIndex="-1"
                                    Text='<%# Bind("Dic_Modulo_Codigo") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Dic_Modulo_Nombre" 
                                    runat="server"
                                    ReadOnly="true"
                                    TabIndex="-1"
                                    Width="400px"
                                    Text='<%# Bind("Dic_Modulo_Nombre") %>'>
                                </asp:TextBox>
                                <asp:Button 
                                    ID="Button3" 
                                    runat="server"
                                    Enabled="false"  
                                    CommandArgument="RutaDestino: ~/DIC/DIC_MODULO.aspx; Filtro: Dic_Modulo_Nombre;"
                                    CommandName="Zoom" 
                                    Text="..." />                                
                            </td>
                        </tr>
                        <tr align="left">
                            <td style="width: 131px">
                                <asp:Label 
                                    ID="lblArchivoRecursos" 
                                    runat="server"
                                    meta:resourcekey="archivo_recursosRecursoKCG">
                                 </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="archivo_recursos" 
                                    ReadOnly="true"
                                    TabIndex="-1"
                                    runat="server" 
                                    Width="400px"
                                    Text='<%# Bind("archivo_recursos") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr align="left">
                            <td style="width: 131px">
                                <asp:Label 
                                    ID="lblFiltro" 
                                    runat="server"
                                    meta:resourcekey="FiltroRecursoKCG">
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Filtro_Nombre" 
                                    runat="server"
                                    ReadOnly="true" 
                                    TabIndex="-1"
                                    Text='<%# Bind("Filtro_Nombre") %>'>
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
                                <uc1:wucMensajeEliminar 
                                    ID="WucMensajeEliminar1" 
                                    runat="server" />
                            </td>
                        </tr>
                    </table>
                    
                    <%--Ids--%>
                    
                    <asp:TextBox 
                        ID="Id" 
                        runat="server" 
                        Visible="true"
                        style="display:none"
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Dic_Modulo_id" 
                        runat="server" 
                        style="display:none"
                        Visible="true"
                        Text='<%# Bind("Dic_Modulo_id") %>'>
                    </asp:TextBox>
                    
                    <%--Ocultos--%>

                    <asp:TextBox 
                        ID="Tipo" 
                        Visible="false"
                        runat="server" 
                        Text='<%# Bind("Tipo") %>'>
                    </asp:TextBox>
                    

                    <asp:TextBox 
                        ID="Estado" 
                        runat="server"
                        Visible="false" 
                        Text='<%# Bind("Estado") %>'>
                    </asp:TextBox>

                    <asp:TextBox 
                        ID="Filtro" 
                        Visible="false"
                        runat="server" 
                        Text='<%# Bind("Filtro") %>'>
                    </asp:TextBox>
                </ItemTemplate>
            </asp:FormView>
        </asp:Panel>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger 
                ControlID="gvDicContenedor" 
                EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:ObjectDataSource 
        ID="odsFvDicContenedor" 
        runat="server" 
        ConflictDetection="CompareAllValues"
        DeleteMethod="Delete" 
        InsertMethod="Insert" 
        OldValuesParameterFormatString="original{0}"
        SelectMethod="GetById" 
        SortParameterName="sortExpression" 
        TypeName="FEL.DIC.BO_Dic_Contenedor"
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
        <table>
            <tr>
                <td>
                    <koala:KNavegacion 
                        ID="nav"
                        runat="server"
                        GridViewID="gvDicContenedor"
                        FormViewID="FormView1" 
                        OnNavegar="nav_Siguiente" />  
                </td>
                <td>
                    <koala:KFiltro 
                        ID="kftFiltro" 
                        runat="server" 
                        Contenedor="DIC_CONTENEDOR" 
                        Objeto="DIC_CONTENEDOR" 
                        IndiceScope ="Scope"
                        Orden="1" 
                        ObjectDataSourceID="odsGvDicContenedor"/>
                </td>
            </tr>
        </table>
        <asp:Panel 
            runat="server"
            id="pnlDatosGrid"
            meta:resourcekey="Rec_Listado_Dic_ContenedorRecursoKCG">
            <koala:KGrid 
                ID="gvDicContenedor" 
                runat="server" 
                AllowPaging="True" 
                AllowSorting="True"
                AutoGenerateColumns="False"         
                AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>' 
                DataKeyNames="Id" 
                DataSourceID="odsGvDicContenedor">
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
                    SortExpression="Codigo_int" >
                    <itemstyle horizontalalign="Right" />
                </asp:BoundField>
                <asp:BoundField 
                    DataField="Nombre" 
                    meta:resourcekey="BoundNombreRecursoKCG" 
                    SortExpression="Nombre" >
                    <itemstyle width="80mm" wrap="true" />
                </asp:BoundField>
                <asp:BoundField 
                    DataField="Tipo_Nombre" 
                    meta:resourcekey="BoundTipo_NombreRecursoKCG" 
                    SortExpression="Tipo_Nombre" >
                    <itemstyle width="40mm" wrap="true" />
                </asp:BoundField>
                <asp:BoundField 
                    DataField="Dic_Modulo_Nombre" 
                    meta:resourcekey="BoundDic_Modulo_NombreRecursoKCG"  
                    SortExpression="Dic_Modulo_Nombre" >
                    <itemstyle width="40mm" wrap="true" />
                </asp:BoundField>
                <asp:BoundField 
                    DataField="archivo_recursos" 
                    meta:resourcekey="Boundarchivo_recursosRecursoKCG"  
                    SortExpression="archivo_recursos" >
                    <itemstyle width="80mm" wrap="true" />
                </asp:BoundField>
                <asp:BoundField 
                    DataField="Filtro" 
                    meta:resourcekey="BoundFiltroRecursoKCG"   
                    SortExpression="Filtro" >
                    <itemstyle horizontalalign="Center" />
                </asp:BoundField>
                <asp:BoundField 
                    DataField="Dic_Modulo_Codigo" 
                    HeaderText="Dic_Modulo_Codigo" 
                    SortExpression="Dic_Modulo_Codigo" 
                    Visible="False" />
                <asp:BoundField 
                    DataField="Estado_nombre" 
                    HeaderText="Estado_nombre" 
                    SortExpression="Estado_nombre" 
                    Visible="False" />
                <asp:BoundField 
                    DataField="Id" 
                    HeaderText="Id" 
                    SortExpression="Id" 
                    Visible="False" />
                <asp:BoundField 
                    DataField="Estado" 
                    HeaderText="Estado" 
                    SortExpression="Estado" 
                    Visible="False" />
                <asp:BoundField 
                    DataField="Filtro_Nombre" 
                    HeaderText="Filtro_Nombre" 
                    SortExpression="Filtro_Nombre" 
                    Visible="False" />
                <asp:BoundField 
                    DataField="Tipo" 
                    HeaderText="Tipo" 
                    SortExpression="Tipo" 
                    Visible="False" />
                <asp:BoundField 
                    DataField="Dic_Modulo_id" 
                    HeaderText="Dic_Modulo_id" 
                    SortExpression="Dic_Modulo_id" 
                    Visible="False" />
            </Columns>
        </koala:KGrid>
        </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:ObjectDataSource 
        ID="odsGvDicContenedor" 
        runat="server" 
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="Get" 
        TypeName="FEL.DIC.BO_Dic_Contenedor">
        <SelectParameters>
            <asp:SessionParameter 
                Name="s" 
                SessionField="Scope" 
                Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>