<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="DIC_CON_ELEMENTO.aspx.cs" 
    Inherits="DIC_DIC_CON_ELEMENTO" 
    meta:resourcekey="Tit_Dic_Con_ElementoRecursoKCG" 
    Theme="EstiloKCG"
    StylesheetTheme="EstiloKCG"%>
    
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
    
<%@ Register 
    tagprefix="koala" 
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
                function ItemSelected_Modulo_Nombre( source, eventArgs ) 
                { 
                    var valor = eventArgs.get_value();
                    var temp = new Array();
                    temp = valor.split('||');                       

                    var Contenedor_Dic_Modulo_Id = $get("ctl00_ContentPlaceHolder1_fvDicConElemento_Contenedor_Dic_Modulo_Id");
                    Contenedor_Dic_Modulo_Id.value = temp[0];
                    var Contenedor_Dic_Modulo_Codigo = $get("ctl00_ContentPlaceHolder1_fvDicConElemento_Contenedor_Dic_Modulo_Codigo");
                    Contenedor_Dic_Modulo_Codigo.value = temp[1];
                }  
            
                function ItemSelected_Contenedor_Nombre( source, eventArgs ) 
                { 
                    var valor = eventArgs.get_value();
                    var temp = new Array();
                    temp = valor.split('||');                       

                    var Contenedor_Dic_Modulo_Id = $get("ctl00_ContentPlaceHolder1_fvDicConElemento_Contenedor_Dic_Modulo_Id");
                    Contenedor_Dic_Modulo_Id.value = temp[0];
                    var Contenedor_Dic_Modulo_Codigo = $get("ctl00_ContentPlaceHolder1_fvDicConElemento_Contenedor_Dic_Modulo_Codigo");
                    Contenedor_Dic_Modulo_Codigo.value = temp[1];
                    var Contenedor_Dic_Modulo_Nombre = $get("ctl00_ContentPlaceHolder1_fvDicConElemento_Contenedor_Dic_Modulo_Nombre");
                    Contenedor_Dic_Modulo_Nombre.value = temp[2];
                    var Dic_Contenedor_Id = $get("ctl00_ContentPlaceHolder1_fvDicConElemento_Dic_Contenedor_id");
                                         //*[@id="ctl00_ContentPlaceHolder1_fvDicConElemento_Dic_Contenedor_id"]
                    Dic_Contenedor_Id.value = temp[3];   
                    var Dic_Contenedor_Codigo = $get("ctl00_ContentPlaceHolder1_fvDicConElemento_Dic_Contenedor_Codigo");
                    Dic_Contenedor_Codigo.value = temp[4];
                }
                
                function ItemSelected_Rotulo_Nombre( source, eventArgs ) 
                { 
                    var valor = eventArgs.get_value();
                    var temp = new Array();
                    temp = valor.split('||');                       

                    var Dic_Rotulo_id = $get("ctl00_ContentPlaceHolder1_fvDicConElemento_Dic_Rotulo_id");
                    Dic_Rotulo_id.value = temp[0];
                    var Dic_Rotulo_Codigo = $get("ctl00_ContentPlaceHolder1_fvDicConElemento_Dic_Rotulo_Codigo");
                    Dic_Rotulo_Codigo.value = temp[1];
                    var Tool_Dic_Rotulo_Id = $get("ctl00_ContentPlaceHolder1_fvDicConElemento_Tool_Dic_Rotulo_Id");
                    Tool_Dic_Rotulo_Id.value = temp[0];
                    var Tool_Dic_Rotulo_Codigo = $get("ctl00_ContentPlaceHolder1_fvDicConElemento_Tool_Dic_Rotulo_Codigo");
                    Tool_Dic_Rotulo_Codigo.value = temp[1];
                    var Tool_Dic_Rotulo_Nombre = $get("ctl00_ContentPlaceHolder1_fvDicConElemento_Tool_Dic_Rotulo_nombre");
                    Tool_Dic_Rotulo_Nombre.value = temp[2];                    
                }
            </script>
             <asp:Panel 
                   runat="server" 
                   ID="pnlDatos"
                   meta:resourcekey="Rec_Dic_Con_EllementoRecursoKCG"> 
                   <asp:FormView 
                    ID="fvDicConElemento" 
                    runat="server" 
                    DataSourceID="odsFVDicConElemento" 
                    DefaultMode="Insert">
                    <EditItemTemplate>
                     <table>
                        <tr align="right"> 
                            <td colspan="2" > 
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
                                 TabIndex="-1"
                                 ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'                                                                     
                                 Text='<%# Bind("Codigo") %>'>
                            </asp:TextBox>             
                            </td>      
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lblConDicModuloCodigo" 
                                    runat="server" 
                                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                    AssociatedControlID="Contenedor_Dic_Modulo_Codigo"
                                    Text='<%# GetLocalResourceObject("Contenedor_Dic_Modulo_NombreRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Contenedor_Dic_Modulo_Codigo" 
                                    runat="server" 
                                    CssClass="TEXTO_EDICION_KCG"
                                    ToolTip='<%# GetLocalResourceObject("Contenedor_Dic_Modulo_CodigoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Contenedor_Dic_Modulo_Codigo") %>'>
                                </asp:TextBox>     
                                <asp:RequiredFieldValidator 
                                    runat="server" 
                                    ID="rvcodigo"
                                    ControlToValidate="Contenedor_Dic_Modulo_Codigo"
                                    ValidationGroup="I"
                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server" 
                                    ID="caValidator"
                                    TargetControlID="rvcodigo" />
                           </td>
                           <td>
                                <asp:TextBox 
                                    ID="Contenedor_Dic_Modulo_Nombre" 
                                    runat="server" 
                                    Width="400px"
                                    CssClass="TEXTO_EDICION_KCG"
                                    ToolTip='<%# GetLocalResourceObject("Contenedor_Dic_Modulo_NombreRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Contenedor_Dic_Modulo_Nombre") %>'>
                                </asp:TextBox>
                                <asp:RequiredFieldValidator 
                                    runat="server" 
                                    ID="rvconnombre"
                                    ControlToValidate="Contenedor_Dic_Modulo_Nombre"
                                    ValidationGroup="I"
                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server" 
                                    ID="ValidatorCalloutExtender5"
                                    TargetControlID="rvconnombre" />
                                <AjaxControlToolkit:AutoCompleteExtender
                                    runat="server" 
                                    BehaviorID="AutoCEx_ConDicModNom"
                                    ID="ace_ConDicModNom" 
                                    TargetControlID="Contenedor_Dic_Modulo_Nombre"
                                    ServicePath="~/DIC/DIC_CON_ELEMENTO.aspx" 
                                    ServiceMethod="Get_Modulo_Nombre"
                                    MinimumPrefixLength="0" 
                                    CompletionInterval="500"
                                    EnableCaching="true"
                                    CompletionSetCount="500"
                                    CompletionListCssClass="autocomplete_completionListElement" 
                                    CompletionListItemCssClass="autocomplete_listItem" 
                                    CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                    OnClientItemSelected="ItemSelected_Modulo_Nombre" >
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
                                                    var behavior = $find('AutoCEx_ConDicModNom');
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
                                                        EndValueScript="$find('AutoCEx_ConDicModNom')._height" />
                                                </Parallel>
                                            </Sequence>
                                        </OnShow>
                                        <OnHide>
                                            <%-- Collapse down to 0px and fade out --%>
                                            <Parallel Duration=".4">
                                                <FadeOut />
                                                <Length 
                                                    PropertyKey="height" 
                                                    StartValueScript="$find('AutoCEx_ConDicModNom')._height" 
                                                    EndValue="0" />
                                            </Parallel>
                                        </OnHide>
                                    </Animations>
                                </AjaxControlToolkit:AutoCompleteExtender>
                           </td> 
                           <td>
                              <asp:Button 
                                ID="Button3" 
                                runat="server" 
                                CommandArgument="RutaDestino: ~/DIC/DIC_MODULO.aspx; Filtro: Contenedor_Dic_Modulo_Codigo|Contenedor_Dic_Modulo_Nombre"
                                CommandName="Zoom" 
                                Text="..." />
                           </td>    
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lblDicContenedorCodigo" 
                                    runat="server" 
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
                                    ID="RequiredFieldValidator1"
                                    ControlToValidate="Dic_Contenedor_Codigo"
                                    ValidationGroup="I"
                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server" 
                                    ID="ValidatorCalloutExtender1"
                                    TargetControlID="RequiredFieldValidator1" />
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Dic_Contenedor_Nombre" 
                                    runat="server" 
                                    Width="400px"
                                    CssClass="TEXTO_EDICION_KCG"
                                    ToolTip='<%# GetLocalResourceObject("Dic_Contenedor_NombreRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Dic_Contenedor_Nombre") %>'>
                                </asp:TextBox>
                                <asp:RequiredFieldValidator 
                                    runat="server" 
                                    ID="RequiredFieldValidator2"
                                    ControlToValidate="Dic_Contenedor_Nombre"
                                    ValidationGroup="I"
                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server" 
                                    ID="ValidatorCalloutExtender2"
                                    TargetControlID="RequiredFieldValidator2" />
                                <AjaxControlToolkit:AutoCompleteExtender
                                    runat="server" 
                                    BehaviorID="AutoCEx_DicConNom"
                                    ID="ace_DicConNom" 
                                    TargetControlID="Dic_Contenedor_Nombre"
                                    ServicePath="~/DIC/DIC_CON_ELEMENTO.aspx" 
                                    ServiceMethod="Get_Contenedor_Nombre"
                                    MinimumPrefixLength="0" 
                                    CompletionInterval="500"
                                    EnableCaching="true"
                                    CompletionSetCount="500"
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
                                                    var behavior = $find('AutoCEx_DicConNom');
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
                                                        EndValueScript="$find('AutoCEx_DicConNom')._height" />
                                                </Parallel>
                                            </Sequence>
                                        </OnShow>
                                        <OnHide>
                                            <%-- Collapse down to 0px and fade out --%>
                                            <Parallel Duration=".4">
                                                <FadeOut />
                                                <Length 
                                                    PropertyKey="height" 
                                                    StartValueScript="$find('AutoCEx_DicConNom')._height" 
                                                    EndValue="0" />
                                            </Parallel>
                                        </OnHide>
                                    </Animations>
                                </AjaxControlToolkit:AutoCompleteExtender>
                            </td>
                            <td>
                                <asp:Button 
                                    ID="Button1" 
                                    runat="server" 
                                    CommandArgument="RutaDestino: ~/DIC/DIC_CONTENEDOR.aspx; Filtro: Dic_Contenedor_Codigo|Dic_Contenedor_Nombre|Contenedor_Dic_Modulo_Codigo|Contenedor_Dic_Modulo_Nombre; Obtener: Contenedor_Dic_Modulo_Codigo|Dic_Modulo_Codigo, Contenedor_Dic_Modulo_Nombre|Dic_Modulo_Nombre, Dic_Contenedor_id|Id"
                                    CommandName="Zoom" 
                                    Text="..." />
                            </td>   
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lblTipo" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("TipoRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList 
                                    ID="Tipo" 
                                    runat="server" 
                                    DataSourceID="odsTipo" 
                                    DataTextField="Nombre"
                                    CssClass="TEXTO_EDICION_KCG"
                                    ToolTip='<%# GetLocalResourceObject("TipoRecursoKCG.ToolTip").ToString() %>'
                                    DataValueField="Dic_Dominio_Dominio" 
                                    SelectedValue='<%# Bind("Tipo") %>'>
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
                                            DefaultValue="DIC_CON_ELEMENTO" 
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
                               ID="lblNombre" 
                               runat="server" 
                               Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'>
                           </asp:Label>
                         </td>
                         <td colspan="3">
                            <asp:TextBox 
                                ID="Nombre" 
                                runat="server"
                                Width="400px"
                                CssClass="TEXTO_EDICION_KCG" 
                                ToolTip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>'
                                Text='<%# Bind("Nombre") %>'>
                            </asp:TextBox>
                            <asp:RequiredFieldValidator 
                                 runat="server" 
                                 ID="rvNombre"
                                 ControlToValidate="Nombre"
                                 ValidationGroup="I"
                                 ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                 Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                            <AjaxControlToolkit:ValidatorCalloutExtender 
                                 runat="Server"  
                                 ID="arvGeneral"
                                 TargetControlID="rvNombre" />
                         </td>
                       </tr>
                       <tr align="left">
                         <td>
                          <asp:Label 
                              ID="lblDicRotuloCodigo" 
                              runat="server" 
                              Text='<%# GetLocalResourceObject("Dic_Rotulo_NombreRecursoKCG.Text").ToString() %>'>
                          </asp:Label>   
                         </td>
                         <td>
                          <asp:TextBox 
                             ID="Dic_Rotulo_Codigo" 
                             runat="server" 
                             CssClass="TEXTO_EDICION_KCG"
                             ToolTip='<%# GetLocalResourceObject("Dic_Rotulo_CodigoRecursoKCG.ToolTip").ToString() %>'
                             Text='<%# Bind("Dic_Rotulo_Codigo") %>'>
                          </asp:TextBox>
                          <asp:RequiredFieldValidator 
                                 runat="server" 
                                 ID="RequiredFieldValidator3"
                                 ControlToValidate="Dic_Rotulo_Codigo"
                                 ValidationGroup="I"
                                 ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                 Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                           <AjaxControlToolkit:ValidatorCalloutExtender 
                                 runat="Server"  
                                 ID="ValidatorCalloutExtender3"
                                 TargetControlID="RequiredFieldValidator3" />
                         </td>
                         <td>
                           <asp:TextBox 
                              ID="Dic_Rotulo_nombre" 
                              runat="server"
                              Width="400px"
                              CssClass="TEXTO_EDICION_KCG" 
                              ToolTip='<%# GetLocalResourceObject("Dic_Rotulo_NombreRecursoKCG.ToolTip").ToString() %>'
                              Text='<%# Bind("Dic_Rotulo_nombre") %>'>
                           </asp:TextBox> 
                           <asp:RequiredFieldValidator 
                                 runat="server" 
                                 ID="RequiredFieldValidator4"
                                 ControlToValidate="Dic_Rotulo_nombre"
                                 ValidationGroup="I"
                                 ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                 Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                           <AjaxControlToolkit:ValidatorCalloutExtender 
                                 runat="Server"  
                                 ID="ValidatorCalloutExtender4"
                                 TargetControlID="RequiredFieldValidator4" />
                            <AjaxControlToolkit:AutoCompleteExtender
                                    runat="server" 
                                    BehaviorID="AutoCEx_DicRotNom"
                                    ID="ace_DicRotNom" 
                                    TargetControlID="Dic_Rotulo_nombre"
                                    ServicePath="~/DIC/DIC_CON_ELEMENTO.aspx" 
                                    ServiceMethod="Get_Rotulo_Nombre"
                                    MinimumPrefixLength="0" 
                                    CompletionInterval="500"
                                    EnableCaching="true"
                                    CompletionSetCount="500"
                                    CompletionListCssClass="autocomplete_completionListElement" 
                                    CompletionListItemCssClass="autocomplete_listItem" 
                                    CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                    OnClientItemSelected="ItemSelected_Rotulo_Nombre" >
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
                                                    var behavior = $find('ace_DicRotNom');
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
                                                        EndValueScript="$find('ace_DicRotNom')._height" />
                                                </Parallel>
                                            </Sequence>
                                        </OnShow>
                                        <OnHide>
                                            <%-- Collapse down to 0px and fade out --%>
                                            <Parallel Duration=".4">
                                                <FadeOut />
                                                <Length 
                                                    PropertyKey="height" 
                                                    StartValueScript="$find('ace_DicRotNom')._height" 
                                                    EndValue="0" />
                                            </Parallel>
                                        </OnHide>
                                    </Animations>
                                </AjaxControlToolkit:AutoCompleteExtender> 
                         </td>
                         <td>
                           <asp:Button 
                              ID="Button2" 
                              runat="server" 
                              CommandArgument="RutaDestino: ~/DIC/DIC_ROTULO.aspx; Filtro: Dic_Rotulo_Codigo|Dic_Rotulo_nombre"
                              CommandName="Zoom" 
                              Text="..." />
                         </td>   
                       </tr>
                       <tr align="left">
                        <td>
                          <asp:Label 
                             ID="lblToolDicRotuloCodigo" 
                             runat="server" 
                             Text='<%# GetLocalResourceObject("Tool_dic_Rotulo_NombreRecursoKCG.Text").ToString() %>'>
                          </asp:Label> 
                        </td>
                        <td>
                            <asp:TextBox 
                              ID="Tool_Dic_Rotulo_Codigo" 
                              runat="server" 
                              CssClass="TEXTO_EDICION_KCG"
                              ToolTip='<%# GetLocalResourceObject("Tool_Dic_Rotulo_CodigoRecursoKCG.ToolTip").ToString() %>'
                              Text='<%# Bind("Tool_Dic_Rotulo_Codigo") %>'>
                            </asp:TextBox>   
                            <asp:RequiredFieldValidator 
                                    runat="server" ID="rvtoolcod"
                                    ControlToValidate="Tool_Dic_Rotulo_Codigo"
                                    ValidationGroup="I"
                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                            <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server" 
                                    ID="ValidatorCalloutExtender14"
                                    TargetControlID="rvtoolcod" />    
                        </td>
                        <td>
                            <asp:TextBox 
                               ID="Tool_Dic_Rotulo_nombre" 
                               runat="server" 
                               Width="400px"
                               CssClass="TEXTO_EDICION_KCG"
                               ToolTip='<%# GetLocalResourceObject("Tool_dic_Rotulo_NombreRecursoKCG.ToolTip").ToString() %>'
                               Text='<%# Bind("Tool_Dic_Rotulo_nombre") %>'>
                            </asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="rvtoolnom"
                                 ControlToValidate="Tool_Dic_Rotulo_nombre"
                                 ValidationGroup="I"
                                 ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                 Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                            <AjaxControlToolkit:ValidatorCalloutExtender 
                                 runat="Server" 
                                 ID="ValidatorCalloutExtender15"
                                 TargetControlID="rvtoolnom" />
                        </td>
                          <td>
                              <asp:Button 
                                ID="Button4" 
                                runat="server" 
                                CommandArgument="RutaDestino: ~/DIC/DIC_ROTULO.aspx; Filtro: Tool_Dic_Rotulo_nombre|Tool_Dic_Rotulo_Codigo; Alias:Tool; Obtener: Tool_Dic_Rotulo_nombre|Nombre, Tool_Dic_Rotulo_Codigo|Codigo, Tool_Dic_Rotulo_Id|Id"
                                CommandName="Zoom" 
                                Text="..." />
                           </td>   
                       </tr>
                    </table>   
                           <table>
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
                              <uc2:wucMensajeActualizar ID="WucMensajeActualizar1" runat="server" />
                             </td>   
                           </tr>     
                           </table>
                           <%--Id's--%>
                                
                            <asp:TextBox 
                                ID="Contenedor_Dic_Modulo_Id" 
                                runat="server" 
                                style="display:none"
                                Visible="true"
                                Text='<%# Bind("Contenedor_Dic_Modulo_Id") %>'>
                            </asp:TextBox>                       
                            <asp:TextBox 
                                ID="Dic_Contenedor_id" 
                                runat="server" 
                                style="display:none"
                                Visible="true"
                                Text='<%# Bind("Dic_Contenedor_id") %>'>
                            </asp:TextBox>                       
                            <asp:TextBox 
                                ID="Id" 
                                runat="server" 
                                style="display:none"
                                Visible="true"
                                Text='<%# Bind("Id") %>'>
                            </asp:TextBox>
                            <asp:TextBox 
                                ID="Dic_Rotulo_id" 
                                runat="server" 
                                style="display:none"
                                Visible="true"
                                Text='<%# Bind("Dic_Rotulo_id") %>'>
                            </asp:TextBox>
                            <asp:TextBox 
                                ID="Tool_Dic_Rotulo_Id" 
                                runat="server" 
                                style="display:none"
                                Visible="true"
                                Text='<%# Bind("Tool_Dic_Rotulo_Id") %>'>
                            </asp:TextBox>
                           
                           <!--CAMPOS  NO VISIBLES  -->  
                                                       
                            <asp:TextBox 
                                ID="Tipo_Nombre" 
                                runat="server" 
                                Visible="false"
                                Text='<%# Bind("Tipo_Nombre") %>'>
                            </asp:TextBox>        
                            <asp:TextBox 
                                ID="Estado" 
                                runat="server" 
                                Visible="false"
                                Text='<%# Bind("Estado") %>'>
                            </asp:TextBox>                 
                            <asp:TextBox 
                                ID="Tool_Ver_etiqueta_nombre" 
                                runat="server" 
                                Visible="false"
                                Text='<%# Bind("Tool_Ver_etiqueta_nombre") %>'>
                            </asp:TextBox>                        
                            <asp:TextBox 
                                ID="Ver_etiqueta_nombre" 
                                runat="server" 
                                Visible="false"
                                Text='<%# Bind("Ver_etiqueta_nombre") %>'>
                            </asp:TextBox> 
                    </EditItemTemplate>
                    <InsertItemTemplate>
                    <table>
                        <tr align="right"> 
                            <td colspan="2" > 
                                <asp:Label 
                                    ID="Estado_Nombre" 
                                    runat="server" 
                                    Text='<%# Bind("Estado_Nombre") %>'>
                                    </asp:Label> 
                            </td>       
                        </tr>
                        <tr align="left"> 
                            <td align="left"> 
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
                                ID="lblConDicModuloCodigo" 
                                runat="server" 
                                AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                AssociatedControlID="Contenedor_Dic_Modulo_Codigo"
                                Text='<%# GetLocalResourceObject("Contenedor_Dic_Modulo_NombreRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                           <td>
                            <asp:TextBox 
                                ID="Contenedor_Dic_Modulo_Codigo" 
                                runat="server" 
                                CssClass="TEXTO_EDICION_KCG"
                                ToolTip='<%# GetLocalResourceObject("Contenedor_Dic_Modulo_CodigoRecursoKCG.ToolTip").ToString() %>'
                                Text='<%# Bind("Contenedor_Dic_Modulo_Codigo") %>'>
                            </asp:TextBox>     
                            <asp:RequiredFieldValidator 
                                runat="server" 
                                ID="rvcodigo"
                                ControlToValidate="Contenedor_Dic_Modulo_Codigo"
                                ValidationGroup="I"
                                ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                            <AjaxControlToolkit:ValidatorCalloutExtender 
                                runat="Server" 
                                ID="caValidator"
                                TargetControlID="rvcodigo" />
                           </td>
                           <td>
                            <asp:TextBox 
                                ID="Contenedor_Dic_Modulo_Nombre" 
                                runat="server" 
                                Width="400px"
                                CssClass="TEXTO_EDICION_KCG"
                                ToolTip='<%# GetLocalResourceObject("Contenedor_Dic_Modulo_NombreRecursoKCG.ToolTip").ToString() %>'
                                Text='<%# Bind("Contenedor_Dic_Modulo_Nombre") %>'>
                            </asp:TextBox>
                            <asp:RequiredFieldValidator 
                                runat="server" 
                                ID="rvconnombre"
                                ControlToValidate="Contenedor_Dic_Modulo_Nombre"
                                ValidationGroup="I"
                                ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                            <AjaxControlToolkit:ValidatorCalloutExtender 
                                runat="Server" 
                                ID="ValidatorCalloutExtender5"
                                TargetControlID="rvconnombre" />
                                <AjaxControlToolkit:AutoCompleteExtender
                                    runat="server" 
                                    BehaviorID="AutoCEx_ConDicModNom"
                                    ID="ace_ConDicModNom" 
                                    TargetControlID="Contenedor_Dic_Modulo_Nombre"
                                    ServicePath="~/DIC/DIC_CON_ELEMENTO.aspx" 
                                    ServiceMethod="Get_Modulo_Nombre"
                                    MinimumPrefixLength="0" 
                                    CompletionInterval="500"
                                    EnableCaching="true"
                                    CompletionSetCount="500"
                                    CompletionListCssClass="autocomplete_completionListElement" 
                                    CompletionListItemCssClass="autocomplete_listItem" 
                                    CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                    OnClientItemSelected="ItemSelected_Modulo_Nombre" >
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
                                                    var behavior = $find('AutoCEx_ConDicModNom');
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
                                                        EndValueScript="$find('AutoCEx_ConDicModNom')._height" />
                                                </Parallel>
                                            </Sequence>
                                        </OnShow>
                                        <OnHide>
                                            <%-- Collapse down to 0px and fade out --%>
                                            <Parallel Duration=".4">
                                                <FadeOut />
                                                <Length 
                                                    PropertyKey="height" 
                                                    StartValueScript="$find('AutoCEx_ConDicModNom')._height" 
                                                    EndValue="0" />
                                            </Parallel>
                                        </OnHide>
                                    </Animations>
                                </AjaxControlToolkit:AutoCompleteExtender>
                           </td> 
                           <td>
                              <asp:Button 
                                ID="Button3" 
                                runat="server" 
                                CommandArgument="RutaDestino: ~/DIC/DIC_MODULO.aspx; Filtro: Contenedor_Dic_Modulo_Codigo|Contenedor_Dic_Modulo_Nombre"                                                 
                                CommandName="Zoom" 
                                Text="..." />
                           </td>    
                        </tr>
                        <tr align="left">
                         <td>
                            <asp:Label 
                                ID="lblDicContenedorCodigo" 
                                runat="server" 
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
                                ID="RequiredFieldValidator1"
                                ControlToValidate="Dic_Contenedor_Codigo"
                                ValidationGroup="I"
                                ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                            <AjaxControlToolkit:ValidatorCalloutExtender 
                                runat="Server" 
                                ID="ValidatorCalloutExtender1"
                                TargetControlID="RequiredFieldValidator1" />
                         </td>
                         <td>
                           <asp:TextBox 
                               ID="Dic_Contenedor_Nombre" 
                               runat="server" 
                               Width="400px"
                               CssClass="TEXTO_EDICION_KCG"
                               ToolTip='<%# GetLocalResourceObject("Dic_Contenedor_NombreRecursoKCG.ToolTip").ToString() %>'
                               Text='<%# Bind("Dic_Contenedor_Nombre") %>'>
                           </asp:TextBox>
                           <asp:RequiredFieldValidator 
                                runat="server" 
                                ID="RequiredFieldValidator2"
                                ControlToValidate="Dic_Contenedor_Nombre"
                                ValidationGroup="I"
                                ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                           <AjaxControlToolkit:ValidatorCalloutExtender 
                                runat="Server" 
                                ID="ValidatorCalloutExtender2"
                                TargetControlID="RequiredFieldValidator2" />
                                <AjaxControlToolkit:AutoCompleteExtender
                                    runat="server" 
                                    BehaviorID="AutoCEx_DicConNom"
                                    ID="ace_DicConNom" 
                                    TargetControlID="Dic_Contenedor_Nombre"
                                    ServicePath="~/DIC/DIC_CON_ELEMENTO.aspx" 
                                    ServiceMethod="Get_Contenedor_Nombre"
                                    MinimumPrefixLength="0" 
                                    CompletionInterval="500"
                                    EnableCaching="true"
                                    CompletionSetCount="500"
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
                                                    var behavior = $find('AutoCEx_DicConNom');
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
                                                        EndValueScript="$find('AutoCEx_DicConNom')._height" />
                                                </Parallel>
                                            </Sequence>
                                        </OnShow>
                                        <OnHide>
                                            <%-- Collapse down to 0px and fade out --%>
                                            <Parallel Duration=".4">
                                                <FadeOut />
                                                <Length 
                                                    PropertyKey="height" 
                                                    StartValueScript="$find('AutoCEx_DicConNom')._height" 
                                                    EndValue="0" />
                                            </Parallel>
                                        </OnHide>
                                    </Animations>
                                </AjaxControlToolkit:AutoCompleteExtender>
                         </td>
                           <td>
                              <asp:Button 
                                ID="Button1" 
                                runat="server" 
                                CommandArgument="RutaDestino: ~/DIC/DIC_CONTENEDOR.aspx; Filtro: Dic_Contenedor_Codigo|Dic_Contenedor_Nombre|Contenedor_Dic_Modulo_Codigo|Contenedor_Dic_Modulo_Nombre; Obtener: Contenedor_Dic_Modulo_Codigo|Dic_Modulo_Codigo, Contenedor_Dic_Modulo_Nombre|Dic_Modulo_Nombre, Dic_Contenedor_id|Id"
                                CommandName="Zoom" 
                                Text="..." />
                           </td>   
                       </tr>
                       <tr align="left">
                        <td>
                            <asp:Label 
                                ID="lblTipo" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("TipoRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        
                        <td>
                            <asp:DropDownList 
                                ID="Tipo" 
                                runat="server" 
                                DataSourceID="odsTipo" 
                                DataTextField="Nombre"
                                CssClass="TEXTO_EDICION_KCG"
                                ToolTip='<%# GetLocalResourceObject("TipoRecursoKCG.Text").ToString() %>'
                                DataValueField="Dic_Dominio_Dominio" 
                                SelectedValue='<%# Bind("Tipo") %>'>
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
                                        DefaultValue="DIC_CON_ELEMENTO" 
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
                               ID="lblNombre" 
                               runat="server" 
                               Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'>
                           </asp:Label>
                         </td>
                         <td colspan="3">
                            <asp:TextBox 
                                ID="Nombre" 
                                runat="server"
                                Width="400px"
                                CssClass="TEXTO_EDICION_KCG"
                                ToolTip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>' 
                                Text='<%# Bind("Nombre") %>'>
                            </asp:TextBox>
                            <asp:RequiredFieldValidator 
                                 runat="server" 
                                 ID="rvNombre"
                                 ControlToValidate="Nombre"
                                 ValidationGroup="I"
                                 ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                 Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                            <AjaxControlToolkit:ValidatorCalloutExtender 
                                 runat="Server"  
                                 ID="arvGeneral"
                                 TargetControlID="rvNombre" />                         
                         </td>
                       </tr>
                       <tr align="left">
                         <td>
                          <asp:Label 
                              ID="lblDicRotuloCodigo" 
                              runat="server" 
                              Text='<%# GetLocalResourceObject("Dic_Rotulo_NombreRecursoKCG.Text").ToString() %>'>
                          </asp:Label>   
                         </td>
                         <td>
                          <asp:TextBox 
                             ID="Dic_Rotulo_Codigo" 
                             runat="server" 
                             CssClass="TEXTO_EDICION_KCG"
                             ToolTip='<%# GetLocalResourceObject("Dic_Rotulo_CodigoRecursoKCG.ToolTip").ToString() %>'
                             Text='<%# Bind("Dic_Rotulo_Codigo") %>'>
                          </asp:TextBox>
                          <asp:RequiredFieldValidator 
                                 runat="server" 
                                 ID="RequiredFieldValidator3"
                                 ControlToValidate="Dic_Rotulo_Codigo"
                                 ValidationGroup="I"
                                 ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                 Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                           <AjaxControlToolkit:ValidatorCalloutExtender 
                                 runat="Server"  
                                 ID="ValidatorCalloutExtender3"
                                 TargetControlID="RequiredFieldValidator3" />
                         </td>
                         <td>
                           <asp:TextBox 
                              ID="Dic_Rotulo_nombre" 
                              runat="server"
                              Width="400px"
                              CssClass="TEXTO_EDICION_KCG" 
                              ToolTip='<%# GetLocalResourceObject("Dic_Rotulo_NombreRecursoKCG.ToolTip").ToString() %>'
                              Text='<%# Bind("Dic_Rotulo_nombre") %>'>
                           </asp:TextBox> 
                           <asp:RequiredFieldValidator 
                                 runat="server" 
                                 ID="RequiredFieldValidator4"
                                 ControlToValidate="Dic_Rotulo_nombre"
                                 ValidationGroup="I"
                                 ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                 Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                           <AjaxControlToolkit:ValidatorCalloutExtender 
                                 runat="Server"  
                                 ID="ValidatorCalloutExtender4"
                                 TargetControlID="RequiredFieldValidator4" />
                                 <AjaxControlToolkit:AutoCompleteExtender
                                    runat="server" 
                                    BehaviorID="AutoCEx_DicRotNom"
                                    ID="ace_DicRotNom" 
                                    TargetControlID="Dic_Rotulo_nombre"
                                    ServicePath="~/DIC/DIC_CON_ELEMENTO.aspx" 
                                    ServiceMethod="Get_Rotulo_Nombre"
                                    MinimumPrefixLength="0" 
                                    CompletionInterval="500"
                                    EnableCaching="true"
                                    CompletionSetCount="200"
                                    CompletionListCssClass="autocomplete_completionListElement" 
                                    CompletionListItemCssClass="autocomplete_listItem" 
                                    CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                    OnClientItemSelected="ItemSelected_Rotulo_Nombre" >
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
                                                    var behavior = $find('AutoCEx_DicConNom');
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
                                                        EndValueScript="$find('AutoCEx_DicConNom')._height" />
                                                </Parallel>
                                            </Sequence>
                                        </OnShow>
                                        <OnHide>
                                            <%-- Collapse down to 0px and fade out --%>
                                            <Parallel Duration=".4">
                                                <FadeOut />
                                                <Length 
                                                    PropertyKey="height" 
                                                    StartValueScript="$find('AutoCEx_DicConNom')._height" 
                                                    EndValue="0" />
                                            </Parallel>
                                        </OnHide>
                                    </Animations>
                                </AjaxControlToolkit:AutoCompleteExtender> 
                         </td>
                         <td>
                           <asp:Button 
                              ID="Button2" 
                              runat="server" 
                              CommandArgument="RutaDestino: ~/DIC/DIC_ROTULO.aspx; Filtro: Dic_Rotulo_Codigo|Dic_Rotulo_nombre"
                              CommandName="Zoom" 
                              Text="..." />
                         </td>   
                       </tr>
                       <tr align="left">
                        <td>
                          <asp:Label 
                             ID="lblToolDicRotuloCodigo" 
                             runat="server" 
                             Text='<%# GetLocalResourceObject("Tool_dic_Rotulo_NombreRecursoKCG.Text").ToString() %>'>
                          </asp:Label> 
                        </td>
                        <td>
                            <asp:TextBox 
                              ID="Tool_Dic_Rotulo_Codigo" 
                              runat="server" 
                              CssClass="TEXTO_EDICION_KCG"
                              ToolTip='<%# GetLocalResourceObject("Tool_Dic_Rotulo_CodigoRecursoKCG.ToolTip").ToString() %>'
                              Text='<%# Bind("Tool_Dic_Rotulo_Codigo") %>'>
                            </asp:TextBox>   
                            <asp:RequiredFieldValidator 
                                    runat="server" ID="rvtoolcod"
                                    ControlToValidate="Tool_Dic_Rotulo_Codigo"
                                    ValidationGroup="I"
                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                            <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server" 
                                    ID="ValidatorCalloutExtender14"
                                    TargetControlID="rvtoolcod" />    
                        </td>
                        <td>
                            <asp:TextBox 
                               ID="Tool_Dic_Rotulo_nombre" 
                               runat="server" 
                               Width="400px"
                               CssClass="TEXTO_EDICION_KCG"
                               ToolTip='<%# GetLocalResourceObject("Tool_dic_Rotulo_NombreRecursoKCG.ToolTip").ToString() %>'
                               Text='<%# Bind("Tool_Dic_Rotulo_nombre") %>'>
                            </asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="rvtoolnom"
                                 ControlToValidate="Tool_Dic_Rotulo_nombre"
                                 ValidationGroup="I"
                                 ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                 Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                            <AjaxControlToolkit:ValidatorCalloutExtender 
                                 runat="Server" 
                                 ID="ValidatorCalloutExtender15"
                                 TargetControlID="rvtoolnom" />
                        </td>
                          <td>
                              <asp:Button 
                                ID="Button4" 
                                runat="server" 
                                CommandArgument="RutaDestino: ~/DIC/DIC_ROTULO.aspx; Filtro: Tool_Dic_Rotulo_nombre|Tool_Dic_Rotulo_Codigo; Alias:Tool; Obtener: Tool_Dic_Rotulo_nombre|Nombre, Tool_Dic_Rotulo_Codigo|Codigo, Tool_Dic_Rotulo_Id|Id"
                                CommandName="Zoom" 
                                Text="..." />
                           </td>   
                       </tr>
                    </table>   
                    <table>   
                        <tr align="left">
                        <td>
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
                          </td>   
                          <td>
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
                                ID="Contenedor_Dic_Modulo_Id" 
                                runat="server" 
                                style="display:none"
                                Visible="true"
                                Text='<%# Bind("Contenedor_Dic_Modulo_Id") %>'>
                            </asp:TextBox>                       
                            <asp:TextBox 
                                ID="Dic_Contenedor_id" 
                                runat="server" 
                                style="display:none"
                                Visible="true"
                                Text='<%# Bind("Dic_Contenedor_id") %>'>
                            </asp:TextBox>                       
                            <asp:TextBox 
                                ID="Id" 
                                runat="server" 
                                style="display:none"
                                Visible="true"
                                Text='<%# Bind("Id") %>'>
                            </asp:TextBox>
                            <asp:TextBox 
                                ID="Dic_Rotulo_id" 
                                runat="server" 
                                style="display:none"
                                Visible="true"
                                Text='<%# Bind("Dic_Rotulo_id") %>'>
                            </asp:TextBox>
                            <asp:TextBox 
                                ID="Tool_Dic_Rotulo_Id" 
                                runat="server" 
                                style="display:none"
                                Visible="true"
                                Text='<%# Bind("Tool_Dic_Rotulo_Id") %>'>
                            </asp:TextBox>
                           
                           <!--CAMPOS  NO VISIBLES  -->  
                                                       
                            <asp:TextBox 
                                ID="Tipo_Nombre" 
                                runat="server" 
                                Visible="false"
                                Text='<%# Bind("Tipo_Nombre") %>'>
                            </asp:TextBox>        
                            <asp:TextBox 
                                ID="Estado" 
                                runat="server" 
                                Visible="false"
                                Text='<%# Bind("Estado") %>'>
                            </asp:TextBox>                 
                            <asp:TextBox 
                                ID="Tool_Ver_etiqueta_nombre" 
                                runat="server" 
                                Visible="false"
                                Text='<%# Bind("Tool_Ver_etiqueta_nombre") %>'>
                            </asp:TextBox>                        
                            <asp:TextBox 
                                ID="Ver_etiqueta_nombre" 
                                runat="server" 
                                Visible="false"
                                Text='<%# Bind("Ver_etiqueta_nombre") %>'>
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
                             TabIndex="-1"
                             ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'
                             Text='<%# Bind("Codigo") %>'>
                        </asp:TextBox>             
                        </td>      
                    </tr>
                    <tr align="left">
                    <td>
                        <asp:Label 
                            ID="lblConDicModuloCodigo" 
                            runat="server" 
                            Text='<%# GetLocalResourceObject("Contenedor_Dic_Modulo_NombreRecursoKCG.Text").ToString() %>'>
                        </asp:Label>
                    </td>
                       <td>
                        <asp:TextBox 
                            ID="Contenedor_Dic_Modulo_Codigo" 
                            runat="server"
                            ReadOnly="true" 
                            TabIndex="-1"
                            ToolTip='<%# GetLocalResourceObject("Contenedor_Dic_Modulo_CodigoRecursoKCG.ToolTip").ToString() %>'
                            Text='<%# Bind("Contenedor_Dic_Modulo_Codigo") %>'>
                        </asp:TextBox>     
                       </td>
                       <td>
                        <asp:TextBox 
                            ID="Contenedor_Dic_Modulo_Nombre" 
                            runat="server"
                            ReadOnly="true" 
                            Width="400px"
                            TabIndex="-1"
                            ToolTip='<%# GetLocalResourceObject("Contenedor_Dic_Modulo_NombreRecursoKCG.ToolTip").ToString() %>'
                            Text='<%# Bind("Contenedor_Dic_Modulo_Nombre") %>'>
                        </asp:TextBox>
                       </td> 
                       <td>
                          <asp:Button 
                            ID="Button3" 
                            runat="server" 
                            Enabled="false"
                            CommandArgument="RutaDestino: ~/DIC/DIC_MODULO.aspx; Filtro: Contenedor_Dic_Modulo_Codigo|Contenedor_Dic_Modulo_Nombre"
                            CommandName="Zoom" 
                            Text="..." />
                       </td>    
                    </tr>
                    <tr align="left">
                     <td>
                        <asp:Label 
                            ID="lblDicContenedorCodigo" 
                            runat="server" 
                            Text='<%# GetLocalResourceObject("Dic_Contenedor_NombreRecursoKCG.Text").ToString() %>'>
                        </asp:Label>
                     </td>
                     <td>
                        <asp:TextBox 
                            ID="Dic_Contenedor_Codigo" 
                            runat="server"
                            ReadOnly="true" 
                            TabIndex="-1"
                            ToolTip='<%# GetLocalResourceObject("Dic_Contenedor_CodigoRecursoKCG.ToolTip").ToString() %>'
                            Text='<%# Bind("Dic_Contenedor_Codigo") %>'>
                        </asp:TextBox>
                     </td>
                     <td>
                       <asp:TextBox 
                           ID="Dic_Contenedor_Nombre" 
                           runat="server"
                           ReadOnly="true" 
                           Width="400px"
                           TabIndex="-1"
                           ToolTip='<%# GetLocalResourceObject("Dic_Contenedor_NombreRecursoKCG.ToolTip").ToString() %>'
                           Text='<%# Bind("Dic_Contenedor_Nombre") %>'>
                       </asp:TextBox>
                     </td>
                       <td>
                          <asp:Button 
                            ID="Button1" 
                            runat="server" 
                            Enabled="false"
                            CommandArgument="RutaDestino: ~/DIC/DIC_CONTENEDOR.aspx; Filtro: Dic_Contenedor_Codigo|Dic_Contenedor_Nombre|Contenedor_Dic_Modulo_Codigo|Contenedor_Dic_Modulo_Nombre; Obtener: Contenedor_Dic_Modulo_Codigo|Dic_Modulo_Codigo, Contenedor_Dic_Modulo_Nombre|Dic_Modulo_Nombre, Dic_Contenedor_id|Id"
                            CommandName="Zoom" 
                            Text="..." />
                       </td>   
                   </tr>
                   <tr align="left">
                    <td>
                        <asp:Label 
                            ID="lblTipo" 
                            runat="server" 
                            Text='<%# GetLocalResourceObject("TipoRecursoKCG.Text").ToString() %>'>
                        </asp:Label>
                    </td>
                    <td>
                         <asp:TextBox 
                             ID="Tipo_Nombre" 
                             runat="server"
                             ReadOnly="true" 
                             TabIndex="-1"
                             ToolTip='<%# GetLocalResourceObject("TipoRecursoKCG.Text").ToString() %>'
                             Text='<%# Bind("Tipo_Nombre") %>'>
                        </asp:TextBox>
                    </td>
                   </tr>

                   <tr align="left">
                     <td>
                           <asp:Label 
                               ID="lblNombre" 
                               runat="server" 
                               Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'>
                           </asp:Label>
                     </td>
                     <td colspan="3">
                        <asp:TextBox 
                            ID="Nombre" 
                            runat="server"
                            ReadOnly="true" 
                            Width="400px"
                            TabIndex="-1"
                            ToolTip='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'
                            Text='<%# Bind("Nombre") %>'>
                        </asp:TextBox>
                       </td>
                   </tr>
                    <tr align="left">
                    <td>
                      <asp:Label 
                          ID="lblDicRotuloCodigo" 
                          runat="server" 
                          Text='<%# GetLocalResourceObject("Dic_Rotulo_NombreRecursoKCG.Text").ToString() %>'>
                      </asp:Label>   
                    </td>
                    <td>
                        <asp:TextBox 
                            ID="Dic_Rotulo_Codigo" 
                            runat="server" 
                            ReadOnly="true"
                            TabIndex="-1"
                            ToolTip='<%# GetLocalResourceObject("Dic_Rotulo_CodigoRecursoKCG.ToolTip").ToString() %>'
                            Text='<%# Bind("Dic_Rotulo_Codigo") %>'>
                        </asp:TextBox>
                     </td>
                     <td>
                        <asp:TextBox 
                            ID="Dic_Rotulo_nombre" 
                            runat="server" 
                            ReadOnly="true"
                            Width="400px"
                            TabIndex="-1"
                            ToolTip='<%# GetLocalResourceObject("Dic_Rotulo_NombreRecursoKCG.ToolTip").ToString() %>'
                            Text='<%# Bind("Dic_Rotulo_nombre") %>'>
                        </asp:TextBox>      
                     </td>
                        <td>
                          <asp:Button 
                              ID="Button2" 
                              runat="server" 
                              Enabled="false"
                              CommandArgument="RutaDestino: ~/DIC/DIC_ROTULO.aspx; Filtro: Dic_Rotulo_Codigo|Dic_Rotulo_nombre"
                              CommandName="Zoom" 
                              Text="..." />
                       </td>   
                   </tr>
                   <tr align="left">
                    <td>
                        <asp:Label 
                            ID="lblToolDicRotuloCodigo" 
                            runat="server" 
                            Text='<%# GetLocalResourceObject("Tool_dic_Rotulo_NombreRecursoKCG.Text").ToString() %>'>
                        </asp:Label> 
                    </td>
                    <td>
                        <asp:TextBox 
                            ID="Tool_Dic_Rotulo_Codigo" 
                            runat="server"
                            ReadOnly="true" 
                            TabIndex="-1"
                            ToolTip='<%# GetLocalResourceObject("Tool_Dic_Rotulo_CodigoRecursoKCG.ToolTip").ToString() %>'
                            Text='<%# Bind("Tool_Dic_Rotulo_Codigo") %>'>
                        </asp:TextBox>       
                    </td>
                    <td>
                        <asp:TextBox 
                            ID="Tool_Dic_Rotulo_nombre" 
                            runat="server"
                            ReadOnly="true" 
                            Width="400px"
                            TabIndex="-1"
                            ToolTip='<%# GetLocalResourceObject("Tool_dic_Rotulo_NombreRecursoKCG.ToolTip").ToString() %>'
                            Text='<%# Bind("Tool_Dic_Rotulo_nombre") %>'>
                        </asp:TextBox>
                    </td>
                      <td>
                          <asp:Button 
                            ID="Button4" 
                            runat="server" 
                            Enabled="false"
                            CommandArgument="RutaDestino: ~/DIC/DIC_ROTULO.aspx; Filtro: Tool_Dic_Rotulo_nombre|Tool_Dic_Rotulo_Codigo; Alias:Tool; Obtener: Tool_Dic_Rotulo_nombre|Nombre, Tool_Dic_Rotulo_Codigo|Codigo, Tool_Dic_Rotulo_Id|Id"
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
                            style="display:none"
                            Visible="true"
                            Text='<%# Bind("Contenedor_Dic_Modulo_Id") %>'>
                        </asp:TextBox>                       
                        <asp:TextBox 
                            ID="Dic_Contenedor_id" 
                            runat="server" 
                            style="display:none"
                            Visible="true"
                            Text='<%# Bind("Dic_Contenedor_id") %>'>
                        </asp:TextBox>                       
                        <asp:TextBox 
                            ID="Id" 
                            runat="server" 
                            style="display:none"
                            Visible="true"
                            Text='<%# Bind("Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Dic_Rotulo_id" 
                            runat="server" 
                            style="display:none"
                            Visible="true"
                            Text='<%# Bind("Dic_Rotulo_id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Tool_Dic_Rotulo_Id" 
                            runat="server" 
                            style="display:none"
                            Visible="true"
                            Text='<%# Bind("Tool_Dic_Rotulo_Id") %>'>
                        </asp:TextBox>
                       
                       <!--CAMPOS  NO VISIBLES  -->  
                                                   
                        <asp:TextBox 
                            ID="Tipo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Tipo") %>'>
                        </asp:TextBox>        
                        <asp:TextBox 
                            ID="Estado" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Estado") %>'>
                        </asp:TextBox>                 
                        <asp:TextBox 
                            ID="Tool_Ver_etiqueta_nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Tool_Ver_etiqueta_nombre") %>'>
                        </asp:TextBox>                        
                        <asp:TextBox 
                            ID="Ver_etiqueta_nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Ver_etiqueta_nombre") %>'>
                        </asp:TextBox> 
                    </ItemTemplate>        
                 </asp:FormView>
             </asp:Panel>
        </ContentTemplate> 
        <Triggers>
            <asp:AsyncPostBackTrigger 
                ControlID="gvDicConElemento" 
                EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel> 
 <asp:ObjectDataSource 
     ID="odsFVDicConElemento" 
     runat="server" 
     ConflictDetection="CompareAllValues"
     DeleteMethod="Delete" 
     InsertMethod="Insert" 
     OldValuesParameterFormatString="original{0}"
     SelectMethod="GetById" 
     SortParameterName="sortExpression" 
     TypeName="FEL.DIC.BO_Dic_Con_Elemento"
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
        runat="server" 
        UpdateMode="Always">
        <ContentTemplate>
        <koala:KNavegacion 
            ID="nav"
            runat="server"
            GridViewID="gvDicConElemento"
            FormViewID="FormView1" 
            OnNavegar="nav_Siguiente" />
        <koala:KFiltro 
            ID="kftFiltro" 
            runat="server" 
            Contenedor="DIC_CON_ELEMENTO" 
            Objeto="DIC_CON_ELEMENTO" 
            IndiceScope ="Scope"
            Orden="1"
            ObjectDataSourceID="odsGVDicConElemento"/>
        <asp:Panel 
            runat="server" 
            ID="pnlDatos1"
            meta:resourcekey="Rec_Listado_Dic_Con_ElementoRecursoKCG">
            <koala:KGrid 
                ID="gvDicConElemento" 
                runat="server" 
                AllowPaging="True" 
                AutoGenerateColumns="False"
                AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>'
                DataKeyNames="Id"
                DataSourceID="odsGVDicConElemento" 
                AllowSorting="True">
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
                        DataField="Tipo_Nombre" 
                        HeaderText="Tipo" 
                        SortExpression="Tipo_Nombre" />
                    <asp:BoundField 
                        DataField="Nombre" 
                        meta:resourcekey="BoundNombreRecursoKCG"
                        SortExpression="Nombre" />
                    <asp:BoundField 
                        DataField="Dic_Rotulo_nombre" 
                        meta:resourcekey="BoundDic_Rotulo_NombreRecursoKCG"
                        SortExpression="Dic_Rotulo_nombre" />
                    <asp:BoundField 
                        DataField="Tool_Dic_Rotulo_nombre" 
                        meta:resourcekey="BoundTool_dic_Rotulo_NombreRecursoKCG"
                        SortExpression="Tool_Dic_Rotulo_nombre" />
                    <asp:BoundField 
                        DataField="Contenedor_Dic_Modulo_Nombre" 
                        meta:resourcekey="BoundContenedor_Dic_Modulo_NombreRecursoKCG"
                        SortExpression="Contenedor_Dic_Modulo_Nombre" />
                    <asp:BoundField 
                        DataField="Estado_Nombre" 
                        HeaderText="Estado_Nombre" 
                        SortExpression="Estado_Nombre"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Tool_Dic_Rotulo_Codigo" 
                        HeaderText="Tool_Dic_Rotulo_Codigo"
                        SortExpression="Tool_Dic_Rotulo_Codigo" 
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
                        DataField="Dic_Contenedor_id" 
                        HeaderText="Dic_Contenedor_id" 
                        SortExpression="Dic_Contenedor_id"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Dic_Contenedor_Codigo" 
                        HeaderText="Dic_Contenedor_Codigo"
                        SortExpression="Dic_Contenedor_Codigo" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Id" 
                        HeaderText="Id" 
                        SortExpression="Id" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Dic_Rotulo_id" 
                        HeaderText="Dic_Rotulo_id" 
                        SortExpression="Dic_Rotulo_id"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Estado" 
                        HeaderText="Estado" 
                        SortExpression="Estado" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Tipo" 
                        HeaderText="Tipo" 
                        SortExpression="Tipo" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Dic_Rotulo_Codigo" 
                        HeaderText="Dic_Rotulo_Codigo" 
                        SortExpression="Dic_Rotulo_Codigo"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Tool_Ver_etiqueta_nombre" 
                        HeaderText="Tool_Ver_etiqueta_nombre"
                        SortExpression="Tool_Ver_etiqueta_nombre" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Ver_etiqueta_nombre" 
                        HeaderText="Ver_etiqueta_nombre"
                        SortExpression="Ver_etiqueta_nombre" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Tool_Dic_Rotulo_Id" 
                        HeaderText="Tool_Dic_Rotulo_Id" 
                        SortExpression="Tool_Dic_Rotulo_Id"
                        Visible="False" />
                </Columns>
            </koala:KGrid>
        </asp:Panel>
    </ContentTemplate>
 </asp:UpdatePanel>
 <asp:ObjectDataSource 
        ID="odsGVDicConElemento" 
        runat="server" 
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="Get" 
        TypeName="FEL.DIC.BO_Dic_Con_Elemento">
        <SelectParameters>
            <asp:SessionParameter 
                Name="s" 
                SessionField="Scope" 
                Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>  
</asp:Content>

