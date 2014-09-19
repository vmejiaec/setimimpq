<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="DIC_CON_OBJETO.aspx.cs" 
    Inherits="DIC_DIC_CON_OBJETO" 
    StylesheetTheme="EstiloKCG"
    Theme="EstiloKCG"
    meta:resourcekey="Tit_Dic_Con_ObjetoRecursoKCG"%>

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
        <script type="text/javascript">         
            function ItemSelected_Contenedor_Nombre( source, eventArgs ) 
            { 
                var valor = eventArgs.get_value();
                var temp = new Array();
                temp = valor.split('||');                       

                var Dic_Contenedor_Id = $get("ctl00_ContentPlaceHolder1_fvDicConObjeto_Dic_Contenedor_Id");
                Dic_Contenedor_Id.value = temp[0];   
                var Dic_Contenedor_Codigo = $get("ctl00_ContentPlaceHolder1_fvDicConObjeto_Dic_Contenedor_Codigo");
                Dic_Contenedor_Codigo.value = temp[1];           
            }  
        
            function ItemSelected_Objeto_Nombre( source, eventArgs ) 
            { 
                var valor = eventArgs.get_value();
                var temp = new Array();
                temp = valor.split('||');                       

                var Dic_Objeto_Id = $get("ctl00_ContentPlaceHolder1_fvDicConObjeto_Dic_Objeto_Id");
                Dic_Objeto_Id.value = temp[0];   
                var Dic_Objeto_Codigo = $get("ctl00_ContentPlaceHolder1_fvDicConObjeto_Dic_Objeto_Codigo");
                Dic_Objeto_Codigo.value = temp[1];
            }
        </script>
        <asp:Panel 
            runat="server" 
            ID="pnlDatos"
            meta:resourcekey="Rec_Dic_Con_ObjetoRecursoKCG">
            <asp:FormView 
                ID="fvDicConObjeto" 
                runat="server" 
                DataSourceID="odsFVDicConObjeto"
                DefaultMode="Insert">
                <EditItemTemplate>
                    <table>
                        <tr align="right">
                            <td colspan="2">
                                <asp:Label 
                                    ID="Estado_Nombre" 
                                    runat="server" 
                                    Text='<%# Bind("Estado_Nombre") %>'>
                                </asp:Label>
                            </td>
                        </tr>
                        <tr align="left">
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
                                    CssClass="TEXTO_EDICION_KCG"
                                    ReadOnly="true"    
                                    ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'                                
                                    Text='<%# Bind("Codigo") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lblDicContenedor" 
                                    runat="server" 
                                    AssociatedControlID="Dic_Contenedor_Codigo"
                                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                    Text='<%# GetLocalResourceObject("Dic_Contenedor_NombreRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Dic_Contenedor_Codigo"
                                    runat="server"
                                    CssClass="TEXTO_EDICION_KCG" 
                                    ToolTip='<%# GetLocalResourceObject("Dic_Contenedor_CodigoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Dic_Contenedor_Codigo") %>'>
                                </asp:TextBox>
                                <asp:RequiredFieldValidator 
                                    runat="server" 
                                    ID="rvcodigo"
                                    ControlToValidate="Dic_Contenedor_Codigo"
                                    ValidationGroup="I"
                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server"  
                                    ID="ValidatorCalloutExtender1"
                                    TargetControlID="rvcodigo" />
                                <asp:TextBox 
                                    ID="Dic_Contenedor_Nombre" 
                                    CssClass="TEXTO_EDICION_KCG"
                                    runat="server" 
                                    width="400px"
                                    ToolTip='<%# GetLocalResourceObject("Dic_Contenedor_NombreRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Dic_Contenedor_Nombre") %>'>
                                </asp:TextBox>
                                <asp:RequiredFieldValidator 
                                    runat="server" 
                                    ID="rvnombre"
                                    ControlToValidate="Dic_Contenedor_Nombre"
                                    ValidationGroup="I"
                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                <asp:Button 
                                    ID="Button3" 
                                    runat="server" 
                                    CommandArgument="RutaDestino: ~/DIC/DIC_CONTENEDOR.aspx; Filtro: Dic_Contenedor_Codigo|Dic_Contenedor_Nombre;"
                                    CommandName="Zoom" 
                                    Text="..." />
                                <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server"  
                                    ID="ValidatorCalloutExtender5"
                                    TargetControlID="rvnombre" />
                                <AjaxControlToolkit:AutoCompleteExtender
                                    runat="server" 
                                    BehaviorID="ace_Dic_Contenedor_Nombre"
                                    ID="ac_Dic_Contenedor_Nombre" 
                                    TargetControlID="Dic_Contenedor_Nombre"
                                    ServicePath="~/DIC/DIC_CON_OBJETO.aspx" 
                                    ServiceMethod="Get_Contenedor_Nombre"
                                    MinimumPrefixLength="0" 
                                    CompletionInterval="500"
                                    EnableCaching="true"
                                    CompletionSetCount="200"
                                    CompletionListCssClass="autocomplete_completionListElement" 
                                    CompletionListItemCssClass="autocomplete_listItem" 
                                    CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                    OnClientItemSelected="ItemSelected_Contenedor_Nombre" >
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
                                                    var behavior = $find('ace_Dic_Contenedor_Nombre');
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
                                                        EndValueScript="$find('ace_Dic_Contenedor_Nombre')._height" />
                                                </Parallel>
                                            </Sequence>
                                        </OnShow>
                                        <OnHide>
                                            <%-- Collapse down to 0px and fade out --%>
                                            <Parallel Duration=".4">
                                                <FadeOut />
                                                <Length 
                                                    PropertyKey="height" 
                                                    StartValueScript="$find('ace_Dic_Contenedor_Nombre')._height" 
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
                                    ID="lblObjeto" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Dic_Objeto_NombreRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Dic_Objeto_Codigo" 
                                    runat="server"
                                    CssClass="TEXTO_EDICION_KCG" 
                                    ToolTip='<%# GetLocalResourceObject("Dic_Objeto_CodigoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Dic_Objeto_Codigo") %>'>
                                </asp:TextBox>
                                <asp:RequiredFieldValidator 
                                    runat="server" 
                                    ID="rvobjcodigo"
                                    ControlToValidate="Dic_Objeto_Codigo"
                                    ValidationGroup="I"
                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                <asp:TextBox 
                                    ID="Dic_Objeto_Nombre" 
                                    runat="server"
                                    CssClass="TEXTO_EDICION_KCG"
                                    width="400px"
                                    ToolTip='<%# GetLocalResourceObject("Dic_Objeto_NombreRecursoKCG.ToolTip").ToString() %>' 
                                    Text='<%# Bind("Dic_Objeto_Nombre") %>'>
                                </asp:TextBox>
                                <asp:RequiredFieldValidator 
                                    runat="server" 
                                    ID="rvobjnombre"
                                    ControlToValidate="Dic_Objeto_Nombre"
                                    ValidationGroup="I"
                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                <asp:Button 
                                    ID="Button1" 
                                    runat="server" 
                                    CommandArgument="RutaDestino: ~/DIC/DIC_OBJETO.aspx; Filtro: Dic_Objeto_Codigo|Dic_Objeto_Nombre;"
                                    CommandName="Zoom" 
                                    Text="..." />
                                <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server"  
                                    ID="ValidatorCalloutExtender2"
                                    TargetControlID="rvobjcodigo" />
                                <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server"  
                                    ID="ValidatorCalloutExtender6"
                                    TargetControlID="rvobjnombre" />
                                <AjaxControlToolkit:AutoCompleteExtender
                                    runat="server" 
                                    BehaviorID="ace_Dic_Objeto_Nombre"
                                    ID="ac_Dic_Objeto_Nombre" 
                                    TargetControlID="Dic_Objeto_Nombre"
                                    ServicePath="~/DIC/DIC_CON_OBJETO.aspx" 
                                    ServiceMethod="Get_Objeto_Nombre"
                                    MinimumPrefixLength="0" 
                                    CompletionInterval="500"
                                    EnableCaching="true"
                                    CompletionSetCount="200"
                                    CompletionListCssClass="autocomplete_completionListElement" 
                                    CompletionListItemCssClass="autocomplete_listItem" 
                                    CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                    OnClientItemSelected="ItemSelected_Objeto_Nombre" >
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
                                                    var behavior = $find('ace_Dic_Objeto_Nombre');
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
                                                        EndValueScript="$find('ace_Dic_Objeto_Nombre')._height" />
                                                </Parallel>
                                            </Sequence>
                                        </OnShow>
                                        <OnHide>
                                            <%-- Collapse down to 0px and fade out --%>
                                            <Parallel Duration=".4">
                                                <FadeOut />
                                                <Length 
                                                    PropertyKey="height" 
                                                    StartValueScript="$find('ace_Dic_Objeto_Nombre')._height" 
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
                                    ID="lblOrden" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("OrdenRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Orden" 
                                    CssClass="TEXTO_EDICION_KCG"
                                    runat="server" 
                                    ToolTip='<%# GetLocalResourceObject("OrdenRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Orden") %>'>
                                </asp:TextBox>
                                <asp:RequiredFieldValidator 
                                    runat="server" 
                                    ID="rvorden"
                                    ControlToValidate="Orden"
                                    ValidationGroup="I"
                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server"  
                                    ID="ValidatorCalloutExtender3"
                                    TargetControlID="rvorden" />
                                <asp:CompareValidator 
                                    ID="CompareValidator1" 
                                    runat="server" 
                                    Operator="GreaterThan"
                                    Type="Integer" 
                                    ValidationGroup="I"
                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.ErrorMessage").ToString() %>'
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.Text").ToString() %>' 
                                    ValueToCompare="0"
                                    ControlToValidate="Orden">
                                </asp:CompareValidator>
                                <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server"  
                                    ID="ValidatorCalloutExtender4"
                                    TargetControlID="CompareValidator1" />
                          </td>
                    </tr>
                    <tr align="left">
                        <td>
                            <asp:Label 
                                ID="lblMaximo" 
                                runat="server" 
                                Text="Maximo">
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="Maximo" 
                                CssClass="TEXTO_EDICION_KCG"
                                runat="server" 
                                ToolTip="Maximo"
                                Text='<%# Bind("Maximo") %>'>
                            </asp:TextBox>
                            <asp:RequiredFieldValidator 
                                runat="server" 
                                ID="rfvMaximo"
                                ControlToValidate="Maximo"
                                ValidationGroup="I"
                                ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                            <AjaxControlToolkit:ValidatorCalloutExtender 
                                runat="Server"  
                                ID="vceMAximo"
                                TargetControlID="rfvMaximo" />
                            <asp:CompareValidator 
                                ID="CompareValidator2" 
                                runat="server" 
                                Operator="GreaterThan"
                                Type="Integer" 
                                ValidationGroup="I"
                                ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.ErrorMessage").ToString() %>'
                                Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.Text").ToString() %>' 
                                ValueToCompare="0"
                                ControlToValidate="Maximo">
                            </asp:CompareValidator>
                            <AjaxControlToolkit:ValidatorCalloutExtender 
                                runat="Server"  
                                ID="vceMaximo2"
                                TargetControlID="CompareValidator2" />
                        </td>
                    </tr>
                    <tr align="left">
                        <td colspan="2">
                            <asp:Label 
                                ID="lblInsert" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("InsRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                                <asp:DropDownList 
                                    ID="Ins" 
                                    runat="server" 
                                    CssClass="TEXTO_EDICION_KCG"
                                    ToolTip='<%# GetLocalResourceObject("InsRecursoKCG.ToolTip").ToString() %>'
                                    DataSourceID="odsobjeto"
                                    DataTextField="Nombre" 
                                    DataValueField="Dic_Dominio_Dominio" 
                                    SelectedValue='<%# Bind("INS") %>'>
                                </asp:DropDownList>
                                <asp:ObjectDataSource 
                                    ID="odsobjeto" 
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
                                            DefaultValue="DIC_CON_OBJETO" 
                                            Name="Dic_Objeto_Nombre" 
                                            Type="String" />
                                         <asp:Parameter 
                                            DefaultValue="Ins" 
                                            Name="Dic_Campo_Nombre" 
                                            Type="String" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                                <asp:Label 
                                    ID="lblUpdate" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("UpdRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                                <asp:DropDownList 
                                    ID="Upd" 
                                    runat="server"
                                    CssClass="TEXTO_EDICION_KCG"
                                    ToolTip='<%# GetLocalResourceObject("UpdRecursoKCG.ToolTip").ToString() %>'
                                    DataSourceID="odsobjeto"
                                    DataTextField="Nombre" 
                                    DataValueField="Dic_Dominio_Dominio"
                                    SelectedValue='<%# Bind("UPD") %>'>
                                </asp:DropDownList>
                                <asp:ObjectDataSource 
                                    ID="ObjectDataSource1" 
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
                                            DefaultValue="DIC_CON_OBJETO" 
                                            Name="Dic_Objeto_Nombre" 
                                            Type="String" />
                                         <asp:Parameter 
                                            DefaultValue="Upd" 
                                            Name="Dic_Campo_Nombre" 
                                            Type="String" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                                <asp:Label 
                                    ID="lblDelete" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("DelRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                                <asp:DropDownList 
                                    ID="Del" 
                                    runat="server"
                                    CssClass="TEXTO_EDICION_KCG"
                                    ToolTip='<%# GetLocalResourceObject("DelRecursoKCG.ToolTip").ToString() %>' 
                                    DataSourceID="odsobjeto"
                                    DataTextField="Nombre" 
                                    DataValueField="Dic_Dominio_Dominio"
                                    SelectedValue='<%# Bind("DEL") %>'>
                                </asp:DropDownList>
                                <asp:ObjectDataSource 
                                    ID="ObjectDataSource2" 
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
                                            DefaultValue="DIC_CON_OBJETO" 
                                            Name="Dic_Objeto_Nombre" 
                                            Type="String" />
                                        <asp:Parameter 
                                            DefaultValue="Del" 
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
                                    CausesValidation="True" 
                                    CommandName="Update"
                                    ValidationGroup="U"
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
                    
                    <%--Id's--%>
                    
                    <asp:TextBox 
                        ID="Contenedor_Dic_Modulo_Id" 
                        runat="server" 
                        Style="display:none"
                        Visible="true" 
                        Text='<%# Bind("Contenedor_Dic_Modulo_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Dic_Objeto_Id" 
                        Visible="true"
                        Style="display:none"
                        runat="server" 
                        Text='<%# Bind("Dic_Objeto_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Objeto_Dic_Modulo_Id" 
                        Visible="true"
                        Style="display:none"
                        runat="server" 
                        Text='<%# Bind("Objeto_Dic_Modulo_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Dic_Contenedor_Id" 
                        Visible="true"
                        Style="display:none"
                        runat="server" 
                        Text='<%# Bind("Dic_Contenedor_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Id" 
                        runat="server" 
                        Style="display:none"
                        Visible="true"
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    
                    <%--Ocultos--%>
                                       
                    <asp:TextBox 
                        ID="Ins_Nombre" 
                        Visible="false"
                        runat="server" 
                        Text='<%# Bind("Ins_Nombre") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Contenedor_Dic_Modulo_Codigo" 
                        Visible="false"
                        runat="server" 
                        Text='<%# Bind("Contenedor_Dic_Modulo_Codigo") %>'>
                    </asp:TextBox> 
                    
                    <asp:TextBox 
                        ID="Objeto_Dic_Modulo_Nombre" 
                        runat="server"
                        Visible="false"
                        Text='<%# Bind("Objeto_Dic_Modulo_Nombre") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Upd_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Upd_Nombre") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Objeto_Dic_Modulo_Codigo" 
                        Visible="false"
                        runat="server" 
                        Text='<%# Bind("Objeto_Dic_Modulo_Codigo") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Contenedor_Dic_Modulo_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Contenedor_Dic_Modulo_Nombre") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Estado" 
                        Visible="false"
                        runat="server" 
                        Text='<%# Bind("Estado") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Del_Nombre" 
                        Visible="false"
                        runat="server" 
                        Text='<%# Bind("Del_Nombre") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Nombre") %>'>
                    </asp:TextBox>
                </EditItemTemplate>
                
                <InsertItemTemplate>
                    <table>
                        <tr align="right">
                            <td colspan="2">
                                <asp:Label 
                                    ID="Estado_Nombre" 
                                    runat="server" 
                                    Text='<%# Bind("Estado_Nombre") %>'>
                                </asp:Label>   
                            </td>
                        </tr>
                        <tr align="left">
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
                                    CssClass="TEXTO_EDICION_KCG"
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
                                    ID="lblDicContenedor" 
                                    runat="server" 
                                    AssociatedControlID="Dic_Contenedor_Codigo"
                                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                    Text='<%# GetLocalResourceObject("Dic_Contenedor_NombreRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Dic_Contenedor_Codigo"
                                    runat="server"
                                    CssClass="TEXTO_EDICION_KCG" 
                                    ToolTip='<%# GetLocalResourceObject("Dic_Contenedor_CodigoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Dic_Contenedor_Codigo") %>'>
                                </asp:TextBox>
                                <asp:RequiredFieldValidator 
                                    runat="server" 
                                    ID="rvcodigo"
                                    ControlToValidate="Dic_Contenedor_Codigo"
                                    ValidationGroup="I"
                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server"  
                                    ID="ValidatorCalloutExtender1"
                                    TargetControlID="rvcodigo" />
                                <asp:TextBox 
                                    ID="Dic_Contenedor_Nombre" 
                                    CssClass="TEXTO_EDICION_KCG"
                                    runat="server" 
                                    width="400px"
                                    ToolTip='<%# GetLocalResourceObject("Dic_Contenedor_NombreRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Dic_Contenedor_Nombre") %>'>
                                </asp:TextBox>
                                <asp:RequiredFieldValidator 
                                    runat="server" 
                                    ID="rvnombre"
                                    ControlToValidate="Dic_Contenedor_Nombre"
                                    ValidationGroup="I"
                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                <asp:Button 
                                    ID="Button3" 
                                    runat="server" 
                                    CommandArgument="RutaDestino: ~/DIC/DIC_CONTENEDOR.aspx; Filtro: Dic_Contenedor_Codigo|Dic_Contenedor_Nombre;"
                                    CommandName="Zoom" 
                                    Text="..." />                                
                                <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server"  
                                    ID="ValidatorCalloutExtender5"
                                    TargetControlID="rvnombre" />
                                <AjaxControlToolkit:AutoCompleteExtender
                                    runat="server" 
                                    BehaviorID="ace_Dic_Contenedor_Nombre"
                                    ID="ac_Dic_Contenedor_Nombre" 
                                    TargetControlID="Dic_Contenedor_Nombre"
                                    ServicePath="~/DIC/DIC_CON_OBJETO.aspx" 
                                    ServiceMethod="Get_Contenedor_Nombre"
                                    MinimumPrefixLength="0" 
                                    CompletionInterval="500"
                                    EnableCaching="true"
                                    CompletionSetCount="200"
                                    CompletionListCssClass="autocomplete_completionListElement" 
                                    CompletionListItemCssClass="autocomplete_listItem" 
                                    CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                    OnClientItemSelected="ItemSelected_Contenedor_Nombre" >
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
                                                    var behavior = $find('ace_Dic_Contenedor_Nombre');
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
                                                        EndValueScript="$find('ace_Dic_Contenedor_Nombre')._height" />
                                                </Parallel>
                                            </Sequence>
                                        </OnShow>
                                        <OnHide>
                                            <%-- Collapse down to 0px and fade out --%>
                                            <Parallel Duration=".4">
                                                <FadeOut />
                                                <Length 
                                                    PropertyKey="height" 
                                                    StartValueScript="$find('ace_Dic_Contenedor_Nombre')._height" 
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
                                    ID="lblObjeto" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Dic_Objeto_NombreRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Dic_Objeto_Codigo" 
                                    runat="server"
                                    CssClass="TEXTO_EDICION_KCG" 
                                    ToolTip='<%# GetLocalResourceObject("Dic_Objeto_CodigoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Dic_Objeto_Codigo") %>'>
                                </asp:TextBox>
                                <asp:RequiredFieldValidator 
                                    runat="server" 
                                    ID="rvobjcodigo"
                                    ControlToValidate="Dic_Objeto_Codigo"
                                    ValidationGroup="I"
                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                <asp:TextBox 
                                    ID="Dic_Objeto_Nombre" 
                                    runat="server"
                                    width="400px"
                                    CssClass="TEXTO_EDICION_KCG" 
                                    ToolTip='<%# GetLocalResourceObject("Dic_Objeto_NombreRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Dic_Objeto_Nombre") %>'>
                                </asp:TextBox>
                                <asp:RequiredFieldValidator 
                                    runat="server" 
                                    ID="rvobjnombre"
                                    ControlToValidate="Dic_Objeto_Nombre"
                                    ValidationGroup="I"
                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                 <asp:Button 
                                    ID="Button1" 
                                    runat="server" 
                                    CommandArgument="RutaDestino: ~/DIC/DIC_OBJETO.aspx; Filtro: Dic_Objeto_Codigo|Dic_Objeto_Nombre;"
                                    CommandName="Zoom" 
                                    Text="..." />
                                <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server"  
                                    ID="ValidatorCalloutExtender2"
                                    TargetControlID="rvobjcodigo" />
                                <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server"  
                                    ID="ValidatorCalloutExtender6"
                                    TargetControlID="rvobjnombre" />
                                <AjaxControlToolkit:AutoCompleteExtender
                                    runat="server" 
                                    BehaviorID="ace_Dic_Objeto_Nombre"
                                    ID="ac_Dic_Objeto_Nombre" 
                                    TargetControlID="Dic_Objeto_Nombre"
                                    ServicePath="~/DIC/DIC_CON_OBJETO.aspx" 
                                    ServiceMethod="Get_Objeto_Nombre"
                                    MinimumPrefixLength="0" 
                                    CompletionInterval="500"
                                    EnableCaching="true"
                                    CompletionSetCount="200"
                                    CompletionListCssClass="autocomplete_completionListElement" 
                                    CompletionListItemCssClass="autocomplete_listItem" 
                                    CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                    OnClientItemSelected="ItemSelected_Objeto_Nombre" >
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
                                                    var behavior = $find('ace_Dic_Objeto_Nombre');
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
                                                        EndValueScript="$find('ace_Dic_Objeto_Nombre')._height" />
                                                </Parallel>
                                            </Sequence>
                                        </OnShow>
                                        <OnHide>
                                            <%-- Collapse down to 0px and fade out --%>
                                            <Parallel Duration=".4">
                                                <FadeOut />
                                                <Length 
                                                    PropertyKey="height" 
                                                    StartValueScript="$find('ace_Dic_Objeto_Nombre')._height" 
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
                                    ID="lblOrden" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("OrdenRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Orden" 
                                    CssClass="TEXTO_EDICION_KCG"
                                    runat="server" 
                                    ToolTip='<%# GetLocalResourceObject("OrdenRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Orden") %>'>
                                </asp:TextBox>
                                <asp:RequiredFieldValidator 
                                    runat="server" 
                                    ID="rvorden"
                                    ControlToValidate="Orden"
                                    ValidationGroup="I"
                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server"  
                                    ID="ValidatorCalloutExtender3"
                                    TargetControlID="rvorden" />
                                <asp:CompareValidator 
                                    ID="CompareValidator1" 
                                    runat="server" 
                                    Operator="GreaterThan"
                                    Type="Integer" 
                                    ValidationGroup="I"
                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.ErrorMessage").ToString() %>'
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.Text").ToString() %>' 
                                    ValueToCompare="0"
                                    ControlToValidate="Orden">
                                </asp:CompareValidator>
                                <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server"  
                                    ID="ValidatorCalloutExtender4"
                                    TargetControlID="CompareValidator1" />
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lblMaximo" 
                                    runat="server" 
                                    Text="Maximo">
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Maximo" 
                                    CssClass="TEXTO_EDICION_KCG"
                                    runat="server" 
                                    ToolTip="Maximo"
                                    Text='<%# Bind("Maximo") %>'>
                                </asp:TextBox>
                                <asp:RequiredFieldValidator 
                                    runat="server" 
                                    ID="rfvMaximo"
                                    ControlToValidate="Maximo"
                                    ValidationGroup="I"
                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server"  
                                    ID="vceMAximo"
                                    TargetControlID="rfvMaximo" />
                                <asp:CompareValidator 
                                    ID="CompareValidator2" 
                                    runat="server" 
                                    Operator="GreaterThan"
                                    Type="Integer" 
                                    ValidationGroup="I"
                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.ErrorMessage").ToString() %>'
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.Text").ToString() %>' 
                                    ValueToCompare="0"
                                    ControlToValidate="Maximo">
                                </asp:CompareValidator>
                                <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server"  
                                    ID="vceMaximo2"
                                    TargetControlID="CompareValidator2" />
                            </td>
                        </tr>
                        <tr align="left">
                            <td colspan="2">
                                <asp:Label 
                                    ID="lblInsert" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("InsRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                                <asp:DropDownList 
                                    ID="Ins" 
                                    runat="server"
                                    CssClass="TEXTO_EDICION_KCG"
                                    ToolTip='<%# GetLocalResourceObject("InsRecursoKCG.ToolTip").ToString() %>' 
                                    DataSourceID="odsobjeto"
                                    DataTextField="Nombre" 
                                    DataValueField="Dic_Dominio_Dominio" 
                                    SelectedValue='<%# Bind("INS") %>'>
                                </asp:DropDownList>
                                <asp:ObjectDataSource 
                                    ID="odsobjeto" 
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
                                            DefaultValue="DIC_CON_OBJETO" 
                                            Name="Dic_Objeto_Nombre" 
                                            Type="String" />
                                         <asp:Parameter 
                                            DefaultValue="Ins" 
                                            Name="Dic_Campo_Nombre" 
                                            Type="String" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                                <asp:Label 
                                    ID="lblUpdate" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("UpdRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                                <asp:DropDownList 
                                    ID="Upd" 
                                    runat="server" 
                                    CssClass="TEXTO_EDICION_KCG"
                                    ToolTip='<%# GetLocalResourceObject("UpdRecursoKCG.ToolTip").ToString() %>'
                                    DataSourceID="odsobjeto"
                                    DataTextField="Nombre" 
                                    DataValueField="Dic_Dominio_Dominio"
                                    SelectedValue='<%# Bind("UPD") %>'>
                                </asp:DropDownList>
                                <asp:ObjectDataSource 
                                    ID="ObjectDataSource1" 
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
                                            DefaultValue="DIC_CON_OBJETO" 
                                            Name="Dic_Objeto_Nombre" 
                                            Type="String" />
                                        <asp:Parameter 
                                            DefaultValue="Upd" 
                                            Name="Dic_Campo_Nombre" 
                                            Type="String" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                                <asp:Label 
                                    ID="lblDelete" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("DelRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                                <asp:DropDownList 
                                    ID="Del" 
                                    runat="server" 
                                    CssClass="TEXTO_EDICION_KCG"
                                    ToolTip='<%# GetLocalResourceObject("DelRecursoKCG.Text").ToString() %>'
                                    DataSourceID="odsobjeto"
                                    DataTextField="Nombre" 
                                    DataValueField="Dic_Dominio_Dominio"
                                    SelectedValue='<%# Bind("DEL") %>'>
                                </asp:DropDownList>
                                <asp:ObjectDataSource 
                                    ID="ObjectDataSource2" 
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
                                            DefaultValue="DIC_CON_OBJETO" 
                                            Name="Dic_Objeto_Nombre" 
                                            Type="String" />
                                        <asp:Parameter 
                                            DefaultValue="Del" 
                                            Name="Dic_Campo_Nombre" 
                                            Type="String" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>       
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
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
                                        
                    <%--Id's--%>
                    
                    <asp:TextBox 
                        ID="Contenedor_Dic_Modulo_Id" 
                        runat="server" 
                        Style="display:none"
                        Visible="true" 
                        Text='<%# Bind("Contenedor_Dic_Modulo_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Dic_Objeto_Id" 
                        Visible="true"
                        Style="display:none"
                        runat="server" 
                        Text='<%# Bind("Dic_Objeto_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Objeto_Dic_Modulo_Id" 
                        Visible="true"
                        Style="display:none"
                        runat="server" 
                        Text='<%# Bind("Objeto_Dic_Modulo_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Dic_Contenedor_Id" 
                        Visible="true"
                        Style="display:none"
                        runat="server" 
                        Text='<%# Bind("Dic_Contenedor_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Id" 
                        runat="server" 
                        Style="display:none"
                        Visible="true"
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    
                    <%--Ocultos--%>
                                       
                    <asp:TextBox 
                        ID="Ins_Nombre" 
                        Visible="false"
                        runat="server" 
                        Text='<%# Bind("Ins_Nombre") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Contenedor_Dic_Modulo_Codigo" 
                        Visible="false"
                        runat="server" 
                        Text='<%# Bind("Contenedor_Dic_Modulo_Codigo") %>'>
                    </asp:TextBox> 
                    
                    <asp:TextBox 
                        ID="Objeto_Dic_Modulo_Nombte" 
                        runat="server"
                        Visible="false"
                        Text='<%# Bind("Objeto_Dic_Modulo_Nombte") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Upd_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Upd_Nombre") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Objeto_Dic_Modulo_Codigo" 
                        Visible="false"
                        runat="server" 
                        Text='<%# Bind("Objeto_Dic_Modulo_Codigo") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Contenedor_Dic_Modulo_Nombte" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Contenedor_Dic_Modulo_Nombte") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Estado" 
                        Visible="false"
                        runat="server" 
                        Text='<%# Bind("Estado") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Del_Nombre" 
                        Visible="false"
                        runat="server" 
                        Text='<%# Bind("Del_Nombre") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Nombre") %>'>
                    </asp:TextBox>
                </InsertItemTemplate>
                
                <ItemTemplate>
                    <table>
                        <tr align="right">
                            <td colspan="2">
                                <asp:Label 
                                    ID="Estado_Nombre" 
                                    runat="server" 
                                    Text='<%# Bind("Estado_Nombre") %>'>
                                </asp:Label>   
                            </td>
                        </tr>
                        <tr align="left">
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
                                    ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'                                                                   
                                    Text='<%# Bind("Codigo") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lblDicContenedor" 
                                    runat="server" 
                                    AssociatedControlID="Dic_Contenedor_Codigo"
                                    Text='<%# GetLocalResourceObject("Dic_Contenedor_NombreRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Dic_Contenedor_Codigo"
                                    runat="server"
                                    ReadOnly="True" 
                                    ToolTip='<%# GetLocalResourceObject("Dic_Contenedor_CodigoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Dic_Contenedor_Codigo") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Dic_Contenedor_Nombre" 
                                    runat="server"
                                    ReadOnly="True" 
                                    Width="400px" 
                                    ToolTip='<%# GetLocalResourceObject("Dic_Contenedor_NombreRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Dic_Contenedor_Nombre") %>'>
                                </asp:TextBox>
                                <asp:Button 
                                    ID="Button3" 
                                    runat="server" 
                                    CommandArgument="RutaDestino: ~/DIC/DIC_CONTENEDOR.aspx; Filtro: Dic_Contenedor_Codigo|Dic_Contenedor_Nombre;"
                                    Enabled="false"
                                    CommandName="Zoom" 
                                    Text="..." />
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                 <asp:Label 
                                    ID="lblObjeto" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Dic_Objeto_NombreRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Dic_Objeto_Codigo" 
                                    runat="server"
                                    ToolTip='<%# GetLocalResourceObject("Dic_Objeto_CodigoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Dic_Objeto_Codigo") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Dic_Objeto_Nombre" 
                                    runat="server"
                                    Width="400px"
                                    ToolTip='<%# GetLocalResourceObject("Dic_Objeto_NombreRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Dic_Objeto_Nombre") %>'>
                                </asp:TextBox>
                                <asp:Button 
                                    ID="Button1" 
                                    runat="server" 
                                    CommandArgument="RutaDestino: ~/DIC/DIC_OBJETO.aspx; Filtro: Dic_Objeto_Codigo|Dic_Objeto_Nombre;"
                                    Enabled="false"
                                    CommandName="Zoom" 
                                    Text="..." />
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lblOrden" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("OrdenRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Orden" 
                                    runat="server" 
                                    ToolTip='<%# GetLocalResourceObject("OrdenRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Orden") %>'>
                                </asp:TextBox>
                                <asp:RequiredFieldValidator 
                                     runat="server" 
                                     ID="rvorden"
                                     ControlToValidate="Orden"
                                     ValidationGroup="I"
                                     ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                     Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                <AjaxControlToolkit:ValidatorCalloutExtender 
                                     runat="Server"  
                                     ID="arvGeneral"
                                     TargetControlID="rvorden" />  
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lblMaximo" 
                                    runat="server" 
                                    Text="Maximo">
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Maximo" 
                                    ReadOnly="true"
                                    runat="server" 
                                    ToolTip="Maximo"
                                    Text='<%# Bind("Maximo") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr align="left">
                            <td colspan="2">
                                <asp:Label 
                                    ID="lblInsert" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("InsRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                                <asp:TextBox 
                                    ID="Ins_Nombre"
                                    ReadOnly="True"  
                                    runat="server"
                                    Width="25px"
                                    Text='<%# Bind("Ins_Nombre") %>'>
                                </asp:TextBox>
                                <asp:Label 
                                    ID="lblUpdate" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("UpdRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                                <asp:TextBox 
                                    ID="Upd_Nombre" 
                                    ReadOnly="True" 
                                    runat="server" 
                                    Width="25px"
                                    Text='<%# Bind("Upd_Nombre") %>'>
                                </asp:TextBox>    
                                 <asp:Label 
                                    ID="lblDelete" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("DelRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                                <asp:TextBox 
                                    ID="Del_Nombre"
                                    ReadOnly="True" 
                                    runat="server" 
                                    Width="25px"
                                    Text='<%# Bind("Del_Nombre") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr align="left">
                            <td colspan="3">
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
                    
                    <%--Id's--%>
                    
                    <asp:TextBox 
                        ID="Contenedor_Dic_Modulo_Id" 
                        runat="server" 
                        Style="display:none"
                        Visible="true" 
                        Text='<%# Bind("Contenedor_Dic_Modulo_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Dic_Objeto_Id" 
                        Visible="true"
                        Style="display:none"
                        runat="server" 
                        Text='<%# Bind("Dic_Objeto_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Objeto_Dic_Modulo_Id" 
                        Visible="true"
                        Style="display:none"
                        runat="server" 
                        Text='<%# Bind("Objeto_Dic_Modulo_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Dic_Contenedor_Id" 
                        Visible="true"
                        Style="display:none"
                        runat="server" 
                        Text='<%# Bind("Dic_Contenedor_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Id" 
                        runat="server" 
                        Style="display:none"
                        Visible="true"
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    
                    <%--Ocultos--%>
                                       
                    <asp:TextBox 
                        ID="Ins" 
                        Visible="false"
                        runat="server" 
                        Text='<%# Bind("Ins") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Contenedor_Dic_Modulo_Codigo" 
                        Visible="false"
                        runat="server" 
                        Text='<%# Bind("Contenedor_Dic_Modulo_Codigo") %>'>
                    </asp:TextBox>
                     
                    <asp:TextBox 
                        ID="Objeto_Dic_Modulo_Nombre" 
                        runat="server"
                        Visible="false"
                        Text='<%# Bind("Objeto_Dic_Modulo_Nombre") %>'>
                    </asp:TextBox>
                                        
                    <asp:TextBox 
                        ID="Upd" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Upd") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Objeto_Dic_Modulo_Codigo" 
                        Visible="false"
                        runat="server" 
                        Text='<%# Bind("Objeto_Dic_Modulo_Codigo") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Contenedor_Dic_Modulo_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Contenedor_Dic_Modulo_Nombre") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Estado" 
                        Visible="false"
                        runat="server" 
                        Text='<%# Bind("Estado") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Del" 
                        Visible="false"
                        runat="server" 
                        Text='<%# Bind("Del") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Nombre") %>'>
                    </asp:TextBox>
                </ItemTemplate>
              </asp:FormView>
            </asp:Panel>
        </ContentTemplate> 
        <Triggers>
            <asp:AsyncPostBackTrigger 
                ControlID="gvDicConObjeto" 
                EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:ObjectDataSource 
        ID="odsFVDicConObjeto" 
        runat="server" 
        ConflictDetection="CompareAllValues"
        DeleteMethod="Delete" 
        InsertMethod="Insert" 
        OldValuesParameterFormatString="original{0}"
        SelectMethod="GetById" 
        TypeName="FEL.DIC.BO_Dic_Con_Objeto" 
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
            <table>
                <tr>
                    <td>
                        <koala:KNavegacion 
                            ID="nav"
                            runat="server"
                            GridViewID="gvDicConObjeto"
                            FormViewID="FormView1" 
                            OnNavegar="nav_Siguiente" />
                    </td>
                    <td>
                        <koala:KFiltro 
                            ID="kftFiltro" 
                            runat="server" 
                            Contenedor="DIC_CON_OBJETO" 
                            Objeto="DIC_CON_OBJETO" 
                            IndiceScope ="Scope"
                            Orden="1"
                            ObjectDataSourceID="odsGVDicConObjeto" />
                    </td>
                </tr>
            </table>
            <asp:Panel 
                runat="server"
                id="pnlDtaosGrid"
                meta:resourcekey="Rec_Listado_Dic_Con_ObjetoRecursoKCG">
                <koala:KGrid 
                    ID="gvDicConObjeto" 
                    runat="server" 
                    AllowPaging="True" 
                    AllowSorting="True"
                    AutoGenerateColumns="False" 
                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>'
                    DataKeyNames="Id" 
                    DataSourceID="odsGVDicConObjeto">
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
                            SortExpression="Codigo_int" />
                        <asp:BoundField 
                            DataField="Dic_Contenedor_Nombre" 
                            meta:resourcekey="BoundDic_Contenedor_NombreRecursoKCG"
                            SortExpression="Dic_Contenedor_Nombre" />
                        <asp:BoundField 
                            DataField="Dic_Objeto_Nombre" 
                            meta:resourcekey="BoundDic_Objeto_NombreRecursoKCG"
                            SortExpression="Dic_Objeto_Nombre" />
                        <asp:BoundField 
                            DataField="Orden" 
                            meta:resourcekey="BoundOrdenRecursoKCG" 
                            SortExpression="Orden" />
                        <asp:BoundField 
                            DataField="Ins_Nombre" 
                            meta:resourcekey="BoundInsRecursoKCG" 
                            SortExpression="Ins_Nombre" />
                        <asp:BoundField 
                            DataField="Upd_Nombre" 
                            meta:resourcekey="BoundUpdRecursoKCG"  
                            SortExpression="Upd_Nombre" />
                        <asp:BoundField 
                            DataField="Del_Nombre" 
                            meta:resourcekey="BoundDelRecursoKCG"   
                            SortExpression="Del_Nombre" />
                        <asp:BoundField 
                            DataField="Ins" 
                            HeaderText="Ins" 
                            SortExpression="Ins" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Contenedor_Dic_Modulo_Id" 
                            HeaderText="Contenedor_Dic_Modulo_Id"
                            SortExpression="Contenedor_Dic_Modulo_Id" 
                            Visible="False" />
                        <asp:BoundField     
                            DataField="Contenedor_Dic_Modulo_Codigo" 
                            HeaderText="Contenedor_Dic_Modulo_Codigo"
                            SortExpression="Contenedor_Dic_Modulo_Codigo" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Objeto_Dic_Modulo_Nombte" 
                            HeaderText="Objeto_Dic_Modulo_Nombte"
                            SortExpression="Objeto_Dic_Modulo_Nombte" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Dic_Objeto_Id" 
                            HeaderText="Dic_Objeto_Id" 
                            SortExpression="Dic_Objeto_Id" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Upd" 
                            HeaderText="Upd" 
                            SortExpression="Upd" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Objeto_Dic_Modulo_Id" 
                            HeaderText="Objeto_Dic_Modulo_Id"
                            SortExpression="Objeto_Dic_Modulo_Id" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Dic_Contenedor_Codigo" 
                            HeaderText="Dic_Contenedor_Codigo"
                            SortExpression="Dic_Contenedor_Codigo" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Dic_Contenedor_Id" 
                            HeaderText="Dic_Contenedor_Id" 
                            SortExpression="Dic_Contenedor_Id" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Objeto_Dic_Modulo_Codigo" 
                            HeaderText="Objeto_Dic_Modulo_Codigo"
                            SortExpression="Objeto_Dic_Modulo_Codigo" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Estado_Nombre" 
                            HeaderText="Estado_Nombre" 
                            SortExpression="Estado_Nombre" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Contenedor_Dic_Modulo_Nombte" 
                            HeaderText="Contenedor_Dic_Modulo_Nombte"
                            SortExpression="Contenedor_Dic_Modulo_Nombte" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Dic_Objeto_Codigo" 
                            HeaderText="Dic_Objeto_Codigo" 
                            SortExpression="Dic_Objeto_Codigo" 
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
                            DataField="Del" 
                            HeaderText="Del" 
                            SortExpression="Del" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Nombre" 
                            HeaderText="Nombre" 
                            SortExpression="Nombre" 
                            Visible="False" />
                 </Columns>
                </koala:KGrid>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:ObjectDataSource 
        ID="odsGVDicConObjeto" 
        runat="server" 
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="Get" 
        TypeName="FEL.DIC.BO_Dic_Con_Objeto">
        <SelectParameters>
            <asp:SessionParameter 
                Name="s" 
                SessionField="Scope" 
                Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>    
</asp:Content>