<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="DIC_CON_CAMPO.aspx.cs" 
    Inherits="DIC_DIC_CON_CAMPO" 
    StylesheetTheme="EstiloKCG"
    Theme="EstiloKCG"
    meta:resourcekey="Tit_Dic_Con_CampoRecursoKCG" %>

<%@ Register Src="../WebUserControls/wucMensajeEliminar.ascx" 
    TagName="wucMensajeEliminar"
    TagPrefix="uc1" %>
    
<%@ Register Src="../WebUserControls/wucMensajeActualizar.ascx" 
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
                var contenedor_id = "";
                var objeto_id = "";
                                                                  
                function ItemSelectedContenedor( source, eventArgs ) 
                {
                    var valor = eventArgs.get_value();
                    var temp = new Array();
                    temp = valor.split('||');                       

                    var Dic_Contenedor_Id = $get("ctl00_ContentPlaceHolder1_FormView1_Dic_Contenedor_Id");
                    Dic_Contenedor_Id.value = temp[0];                                       
                    
                    var Dic_Contenedor_Codigo = $get("ctl00_ContentPlaceHolder1_FormView1_Dic_Contenedor_Codigo");
                    Dic_Contenedor_Codigo.value = temp[1]; 
                    
                    contenedor_id = temp[0];
                } 
                
                function ItemSelectedObjeto( source, eventArgs ) 
                {
                    var valor = eventArgs.get_value();
                    var temp = new Array();
                    temp = valor.split('||');                                           
                                        
                    var Dic_Objeto_Id = $get("ctl00_ContentPlaceHolder1_FormView1_Dic_Objeto_Id");
                    Dic_Objeto_Id.value = temp[0];                                                            
                    
                    var Dic_Objeto_Codigo = $get("ctl00_ContentPlaceHolder1_FormView1_Dic_Objeto_Codigo");
                    Dic_Objeto_Codigo.value = temp[1];                                          
                                                            
                    var variabl_e = $find('AutoCompleteEx3'); 
                    objeto_id =(temp[0]);
                    
                    variabl_e.set_contextKey(contenedor_id + '||' + objeto_id);                     
                }               
                
                function ItemSelectedDicObjeto( source, eventArgs ) 
                {
                    var valor = eventArgs.get_value();
                    var temp = new Array();
                    temp = valor.split('||');                       

                    var Dic_Con_Objeto_Id = $get("ctl00_ContentPlaceHolder1_FormView1_Dic_Con_Objeto_Id");
                    Dic_Con_Objeto_Id.value = temp[0];
                    
                    var Dic_con_Objeto_Codigo = $get("ctl00_ContentPlaceHolder1_FormView1_Dic_con_Objeto_Codigo");
                    Dic_con_Objeto_Codigo.value = temp[1];
                }    
                
                function SelectedPopulatingCampo( source, eventArgs ) 
                {   
                    if(objeto_id != "")
                    {
                        var objetoId = $find('AutoCompleteEx4');                         
                        objetoId.set_contextKey(objeto_id);                        
                    }
                    else
                    {
                        alert("Debe Ingresar Primero el Objeto");
                        eventArgs._cancel=true; 
                        var campoNombre = document.getElementById("ctl00_ContentPlaceHolder1_FormView1_Dic_Campo_Nombre");
                        campoNombre.blur();
                    }
                }
                
                function ItemSelectedCampo( source, eventArgs ) 
                {
                    var valor = eventArgs.get_value();
                    var temp = new Array();
                    temp = valor.split('||');                       

                    var Dic_Campo_Id = $get("ctl00_ContentPlaceHolder1_FormView1_Dic_Campo_Id");
                    Dic_Campo_Id.value = temp[0];
                    
                    var Dic_Campo_Codigo = $get("ctl00_ContentPlaceHolder1_FormView1_Dic_Campo_Codigo");
                    Dic_Campo_Codigo.value = temp[1];  
                    
                    var Dic_Rotulo_Id = $get("ctl00_ContentPlaceHolder1_FormView1_Dic_Rotulo_Id");
                    Dic_Rotulo_Id.value = temp[2];  
                    
                    var Dic_Rotulo_Codigo = $get("ctl00_ContentPlaceHolder1_FormView1_Dic_Rotulo_Codigo");
                    Dic_Rotulo_Codigo.value = temp[3];  
                    
                    var Dic_Rotulo_Nombre = $get("ctl00_ContentPlaceHolder1_FormView1_Dic_Rotulo_Nombre");
                    Dic_Rotulo_Nombre.value = temp[4];  
                    
                    var Tool_Dic_Rotulo_Id = $get("ctl00_ContentPlaceHolder1_FormView1_Tool_Dic_Rotulo_Id");
                    Tool_Dic_Rotulo_Id.value = temp[5];  
                    
                    var Tool_Dic_Rotulo_Codigo = $get("ctl00_ContentPlaceHolder1_FormView1_Tool_Dic_Rotulo_Codigo");
                    Tool_Dic_Rotulo_Codigo.value = temp[6];  
                    
                    var Tool_Dic_Rotulo_Nombre = $get("ctl00_ContentPlaceHolder1_FormView1_Tool_Dic_Rotulo_Nombre");
                    Tool_Dic_Rotulo_Nombre.value = temp[7];
                }                                
            </script>
            <asp:Panel
                runat="server"
                ID="pnlDatos"
                meta:resourcekey="Rec_Dic_Con_CampoRecursoKCG">
                <asp:FormView 
                    ID="FormView1"
                    runat="server" 
                    DataSourceID="odsdiccampo" 
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
                                    ID="lblcodigo" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                 <asp:TextBox 
                                    ID="Codigo" 
                                    runat="server"
                                    CssClass="TEXTO_EDICION_KCG"
                                    ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'                                    
                                    Text='<%# Bind("Codigo") %>'>
                                 </asp:TextBox>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lblcontenedor" 
                                    runat="server" 
                                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                    AssociatedControlID="Dic_Contenedor_Codigo"
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
                                <asp:TextBox 
                                    ID="Dic_Contenedor_Nombre" 
                                    runat="server" 
                                    CssClass="TEXTO_EDICION_KCG"
                                    Width="400px" 
                                    ToolTip='<%# GetLocalResourceObject("Dic_Contenedor_NombreRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Dic_Contenedor_Nombre") %>'>
                                </asp:TextBox>
                                <asp:Button 
                                    ID="Button3" 
                                    runat="server" 
                                    CommandArgument="RutaDestino: ~/DIC/DIC_CONTENEDOR.aspx; 
                                                     Filtro: Dic_Contenedor_Codigo|Dic_Contenedor_Nombre; 
                                                     NoGuardar: Dic_con_Objeto_Id|Dic_con_Objeto_Codigo|Dic_con_Objeto_Nombre;"
                                    CommandName="Zoom" 
                                    Text="..." />
                                <asp:RequiredFieldValidator 
                                    runat="server" 
                                    ID="rvnombre"
                                    ControlToValidate="Dic_Contenedor_Nombre"
                                    ValidationGroup="I"
                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server" 
                                    ID="ValidatorCalloutExtender5"
                                    TargetControlID="rvnombre" />
                                <AjaxControlToolkit:AutoCompleteExtender
                                    runat="server" 
                                    BehaviorID="AutoCompleteEx1"
                                    ID="AutoCompleteExtender1" 
                                    TargetControlID="Dic_Contenedor_Nombre"
                                    ServicePath="~/DIC/DIC_CON_CAMPO.aspx" 
                                    ServiceMethod="GetContenedor"
                                    MinimumPrefixLength="0" 
                                    CompletionInterval="500"
                                    EnableCaching="true"
                                    CompletionSetCount="500"
                                    CompletionListCssClass="autocomplete_completionListElement" 
                                    CompletionListItemCssClass="autocomplete_listItem" 
                                    CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"                                        
                                    OnClientItemSelected="ItemSelectedContenedor">
                                    <Animations>
                                    <OnShow>
                                        <Sequence>
                                            <OpacityAction Opacity="0" />
                                            <HideAction Visible="true" />                                        
                                           
                                            <ScriptAction Script="
                                                // Cache the size and setup the initial size
                                                var behavior = $find('AutoCompleteEx1');
                                                if (!behavior._height) {
                                                    var target = behavior.get_completionList();
                                                    behavior._height = target.offsetHeight - 2;
                                                    target.style.height = '0px';
                                                }" />                                                
                                            
                                            <Parallel Duration=".4">
                                                <FadeIn />
                                                <Length PropertyKey="height" StartValue="0" 
                                                EndValueScript="$find('AutoCompleteEx1')._height" />
                                            </Parallel>
                                        </Sequence>
                                    </OnShow>
                                    <OnHide>
                                        <%-- Collapse down to 0px and fade out --%>
                                        <Parallel Duration=".4">
                                            <FadeOut />
                                            <Length PropertyKey="height" 
                                                StartValueScript="$find('AutoCompleteEx1')._height" 
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
                                    ID="lblobjeto" 
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
                              <asp:TextBox 
                                ID="Dic_Objeto_Nombre" 
                                runat="server" 
                                Width="400px"
                                CssClass="TEXTO_EDICION_KCG"
                                ToolTip='<%# GetLocalResourceObject("Dic_Objeto_NombreRecursoKCG.ToolTip").ToString() %>'
                                Text='<%# Bind("Dic_Objeto_Nombre") %>'>
                              </asp:TextBox>
                              <asp:Button 
                                    ID="Button1" 
                                    runat="server" 
                                    CommandArgument="RutaDestino: ~/DIC/DIC_OBJETO.aspx; 
                                                     Filtro: Dic_Objeto_Codigo|Dic_Objeto_Nombre;
                                                     NoGuardar: Dic_con_Objeto_Id|Dic_con_Objeto_Codigo|Dic_con_Objeto_Nombre;"
                                    CommandName="Zoom" 
                                    Text="..." />
                              <asp:RequiredFieldValidator 
                                runat="server" 
                                ID="rvobjetonombre"
                                ControlToValidate="Dic_Objeto_Nombre"
                                ValidationGroup="I"
                                ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                              <AjaxControlToolkit:ValidatorCalloutExtender 
                                runat="Server" 
                                ID="ValidatorCalloutExtender7"
                                TargetControlID="rvobjetonombre" /> 
                              <AjaxControlToolkit:AutoCompleteExtender
                                runat="server" 
                                BehaviorID="AutoCompleteEx2"
                                ID="AutoCompleteExtender2" 
                                TargetControlID="Dic_Objeto_Nombre"
                                ServicePath="~/DIC/DIC_CON_CAMPO.aspx" 
                                ServiceMethod="GetObjeto"
                                MinimumPrefixLength="0" 
                                CompletionInterval="500"
                                EnableCaching="true"
                                CompletionSetCount="500"
                                CompletionListCssClass="autocomplete_completionListElement" 
                                CompletionListItemCssClass="autocomplete_listItem" 
                                CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"                                        
                                OnClientItemSelected="ItemSelectedObjeto" >                                
                                <Animations>
                                <OnShow>
                                    <Sequence>
                                        <OpacityAction Opacity="0" />
                                        <HideAction Visible="true" />                                        
                                       
                                        <ScriptAction Script="
                                            // Cache the size and setup the initial size
                                            var behavior = $find('AutoCompleteEx2');
                                            if (!behavior._height) {
                                                var target = behavior.get_completionList();
                                                behavior._height = target.offsetHeight - 2;
                                                target.style.height = '0px';
                                            }" />                                                
                                        
                                        <Parallel Duration=".4">
                                            <FadeIn />
                                            <Length PropertyKey="height" StartValue="0" 
                                            EndValueScript="$find('AutoCompleteEx2')._height" />
                                        </Parallel>
                                    </Sequence>
                                </OnShow>
                                <OnHide>
                                    <%-- Collapse down to 0px and fade out --%>
                                    <Parallel Duration=".4">
                                        <FadeOut />
                                        <Length PropertyKey="height" 
                                            StartValueScript="$find('AutoCompleteEx2')._height" 
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
                                    ID="lblcontenedorobjeto" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Dic_Contenedor_NombreRecursoKCG.Text").ToString() %>'>
                            </asp:Label>   
                            </td>
                            <td>
                              <asp:TextBox 
                                ID="Dic_con_Objeto_Codigo" 
                                runat="server"
                                CssClass="TEXTO_EDICION_KCG"
                                ToolTip='<%# GetLocalResourceObject("Dic_con_Objeto_CodigoRecursoKCG.ToolTip").ToString() %>'
                                Text='<%# Bind("Dic_con_Objeto_Codigo") %>'>
                              </asp:TextBox>                              
                              <asp:TextBox 
                                ID="Dic_con_Objeto_Nombre" 
                                runat="server" 
                                Width="400px"
                                CssClass="TEXTO_EDICION_KCG"
                                ToolTip='<%# GetLocalResourceObject("Dic_con_Objeto_NombreRecursoKCG.ToolTip").ToString() %>'
                                Text='<%# Bind("Dic_con_Objeto_Nombre") %>'>
                              </asp:TextBox>
                              <asp:Button 
                                    ID="Button2" 
                                    runat="server" 
                                    CommandArgument="RutaDestino: ~/DIC/DIC_CON_OBJETO.aspx; 
                                                     Filtro: Dic_con_Objeto_Codigo|Dic_con_Objeto_Nombre|Dic_Contenedor_Codigo|Dic_Contenedor_Nombre|Dic_Objeto_Codigo|Dic_Objeto_Nombre;"
                                    CommandName="Zoom" 
                                    Text="..." />
                              <asp:RequiredFieldValidator 
                                runat="server" 
                                ID="rvconobjnombre"
                                ControlToValidate="Dic_con_Objeto_Nombre"
                                ValidationGroup="I"
                                ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                              <AjaxControlToolkit:ValidatorCalloutExtender 
                                runat="Server" 
                                ID="ValidatorCalloutExtender9"
                                TargetControlID="rvconobjnombre" /> 
                              <AjaxControlToolkit:AutoCompleteExtender
                                runat="server" 
                                BehaviorID="AutoCompleteEx3"
                                ID="AutoCompleteExtender3" 
                                TargetControlID="Dic_con_Objeto_Nombre"
                                ServicePath="~/DIC/DIC_CON_CAMPO.aspx" 
                                ServiceMethod="GetDicObjeto"
                                MinimumPrefixLength="0" 
                                CompletionInterval="500"
                                EnableCaching="true"
                                CompletionSetCount="500"
                                CompletionListCssClass="autocomplete_completionListElement" 
                                CompletionListItemCssClass="autocomplete_listItem" 
                                CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"                                        
                                OnClientItemSelected="ItemSelectedDicObjeto"
                                UseContextKey="true"
                                ContextKey="var3" >
                                <Animations>
                                <OnShow>
                                    <Sequence>
                                        <OpacityAction Opacity="0" />
                                        <HideAction Visible="true" />                                        
                                       
                                        <ScriptAction Script="
                                            // Cache the size and setup the initial size
                                            var behavior = $find('AutoCompleteEx3');
                                            if (!behavior._height) {
                                                var target = behavior.get_completionList();
                                                behavior._height = target.offsetHeight - 2;
                                                target.style.height = '0px';
                                            }" />                                                
                                        
                                        <Parallel Duration=".4">
                                            <FadeIn />
                                            <Length PropertyKey="height" StartValue="0" 
                                            EndValueScript="$find('AutoCompleteEx3')._height" />
                                        </Parallel>
                                    </Sequence>
                                </OnShow>
                                <OnHide>
                                    <%-- Collapse down to 0px and fade out --%>
                                    <Parallel Duration=".4">
                                        <FadeOut />
                                        <Length PropertyKey="height" 
                                            StartValueScript="$find('AutoCompleteEx3')._height" 
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
                                    ID="lblcampo" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Dic_Campo_NombreRecursoKCG.Text").ToString() %>'>
                            </asp:Label>   
                            </td>
                            <td>
                              <asp:TextBox 
                                ID="Dic_Campo_Codigo" 
                                runat="server"
                                CssClass="TEXTO_EDICION_KCG"
                                ToolTip='<%# GetLocalResourceObject("Dic_Campo_CodigoRecursoKCG.ToolTip").ToString() %>'
                                Text='<%# Bind("Dic_Campo_Codigo") %>'>
                              </asp:TextBox>                              
                              <asp:TextBox 
                                ID="Dic_Campo_Nombre" 
                                runat="server" 
                                CssClass="TEXTO_EDICION_KCG"
                                Width="400px"
                                ToolTip='<%# GetLocalResourceObject("Dic_Campo_NombreRecursoKCG.ToolTip").ToString() %>'
                                Text='<%# Bind("Dic_Campo_Nombre") %>'>
                               </asp:TextBox>
                               <asp:Button 
                                    ID="Button4" 
                                    runat="server" 
                                    CommandArgument="RutaDestino: ~/DIC/DIC_CAMPO.aspx; Filtro: Dic_Campo_Codigo|Dic_Campo_Nombre|Dic_Objeto_Codigo|Dic_Objeto_Nombre;"
                                    CommandName="Zoom" 
                                    Text="..." />
                               <asp:RequiredFieldValidator 
                                runat="server" 
                                ID="rvcamponom"
                                ControlToValidate="Dic_Campo_Nombre"
                                ValidationGroup="I"
                                ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                               <AjaxControlToolkit:ValidatorCalloutExtender 
                                runat="Server" 
                                ID="ValidatorCalloutExtender11"
                                TargetControlID="rvcamponom" />   
                               <AjaxControlToolkit:AutoCompleteExtender
                                runat="server" 
                                BehaviorID="AutoCompleteEx4"
                                ID="AutoCompleteExtender4" 
                                TargetControlID="Dic_Campo_Nombre"
                                ServicePath="~/DIC/DIC_CON_CAMPO.aspx" 
                                ServiceMethod="GetCampo"
                                MinimumPrefixLength="0" 
                                CompletionInterval="500"
                                EnableCaching="true"
                                CompletionSetCount="500"
                                CompletionListCssClass="autocomplete_completionListElement" 
                                CompletionListItemCssClass="autocomplete_listItem" 
                                CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"                                        
                                OnClientItemSelected="ItemSelectedCampo"
                                UseContextKey="true" >
                                <Animations>
                                <OnShow>
                                    <Sequence>
                                        <OpacityAction Opacity="0" />
                                        <HideAction Visible="true" />                                        
                                       
                                        <ScriptAction Script="
                                            // Cache the size and setup the initial size
                                            var behavior = $find('AutoCompleteEx4');
                                            if (!behavior._height) {
                                                var target = behavior.get_completionList();
                                                behavior._height = target.offsetHeight - 2;
                                                target.style.height = '0px';
                                            }" />                                                
                                        
                                        <Parallel Duration=".4">
                                            <FadeIn />
                                            <Length PropertyKey="height" StartValue="0" 
                                            EndValueScript="$find('AutoCompleteEx4')._height" />
                                        </Parallel>
                                    </Sequence>
                                </OnShow>
                                <OnHide>
                                    <%-- Collapse down to 0px and fade out --%>
                                    <Parallel Duration=".4">
                                        <FadeOut />
                                        <Length PropertyKey="height" 
                                            StartValueScript="$find('AutoCompleteEx4')._height" 
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
                                    ID="lblorden" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("OrdenRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                               <asp:TextBox 
                                    ID="Orden" 
                                    runat="server" 
                                    CssClass="TEXTO_EDICION_KCG"
                                    ToolTip='<%# GetLocalResourceObject("OrdenRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Orden") %>'>
                                </asp:TextBox>
                                <asp:RequiredFieldValidator 
                                    ID="RequiredFieldValidator2" 
                                    runat="server" 
                                    ControlToValidate="Orden"
                                    ValidationGroup="I"
                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/>
                                <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server" 
                                    ID="ValidatorCalloutExtender1"
                                    TargetControlID="RequiredFieldValidator2" />
                               <asp:CompareValidator 
                                    ID="CompareValidator2" 
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
                                    ID="ValidatorCalloutExtender3"
                                    TargetControlID="CompareValidator2" />  
                            </td>
                        </tr>
                         <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lblancho" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("AnchoRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                               <asp:TextBox 
                                  ID="Ancho" 
                                  runat="server" 
                                  CssClass="TEXTO_EDICION_KCG"
                                  ToolTip='<%# GetLocalResourceObject("AnchoRecursoKCG.ToolTip").ToString() %>'
                                  Text='<%# Bind("Ancho") %>' >
                               </asp:TextBox>
                               <asp:RequiredFieldValidator 
                                    ID="RequiredFieldValidator1" 
                                    runat="server" 
                                    ControlToValidate="Ancho"
                                    ValidationGroup="I"
                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/>
                                <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server" 
                                    ID="ValidatorCalloutExtender2"
                                    TargetControlID="RequiredFieldValidator1" />
                               <asp:CompareValidator 
                                    ID="CompareValidator1" 
                                    runat="server" 
                                    Operator="GreaterThan"
                                    Type="Integer" 
                                    ValidationGroup="I"
                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.ErrorMessage").ToString() %>'
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.Text").ToString() %>' 
                                    ValueToCompare="0"
                                    ControlToValidate="Ancho">
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
                                    ID="lblrotulo" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Dic_Rotulo_nombreRecursoKCG.Text").ToString() %>'>
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
                                <asp:TextBox 
                                    ID="Dic_Rotulo_nombre" 
                                    runat="server" 
                                    Width="400px"
                                    CssClass="TEXTO_EDICION_KCG"
                                    ToolTip='<%# GetLocalResourceObject("Dic_Rotulo_nombreRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Dic_Rotulo_nombre") %>'></asp:TextBox>
                                <asp:Button 
                                    ID="Button5" 
                                    runat="server" 
                                    CommandArgument="RutaDestino: ~/DIC/DIC_ROTULO.aspx; Filtro: Dic_Rotulo_Codigo|Dic_Rotulo_nombre;"
                                    CommandName="Zoom" 
                                    Text="..." />
                                <asp:RequiredFieldValidator 
                                    runat="server" 
                                    ID="rvrotulonom"
                                    ControlToValidate="Dic_Rotulo_nombre"
                                    ValidationGroup="I"
                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server" 
                                    ID="ValidatorCalloutExtender13"
                                    TargetControlID="rvrotulonom" />                                
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lblrotulotoop" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Tool_Dic_Rotulo_nombreRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td >
                                <asp:TextBox 
                                    ID="Tool_Dic_Rotulo_Codigo" 
                                    runat="server" 
                                    CssClass="TEXTO_EDICION_KCG"
                                    ToolTip='<%# GetLocalResourceObject("Tool_Dic_Rotulo_CodigoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Tool_Dic_Rotulo_Codigo") %>'>
                                </asp:TextBox>                                
                                <asp:TextBox 
                                    ID="Tool_Dic_Rotulo_nombre" 
                                    runat="server"
                                    CssClass="TEXTO_EDICION_KCG"
                                    Width="400px"
                                    ToolTip='<%# GetLocalResourceObject("Tool_Dic_Rotulo_nombreRecursoKCG.ToolTip").ToString() %>' 
                                    Text='<%# Bind("Tool_Dic_Rotulo_nombre") %>'>
                                 </asp:TextBox>
                                 <asp:Button 
                                    ID="Button6" 
                                    runat="server" 
                                    CommandArgument="RutaDestino: ~/DIC/DIC_ROTULO.aspx; Filtro: Tool_Dic_Rotulo_Codigo|Tool_Dic_Rotulo_nombre; Obtener:Tool_Dic_Rotulo_Codigo|Codigo,Tool_Dic_Rotulo_nombre|Nombre,Tool_Dic_Rotulo_Id|Id ; Alias:Tool;"
                                    CommandName="Zoom" 
                                    Text="..." />
                                 <asp:RequiredFieldValidator 
                                    runat="server" 
                                    ID="rvtoolnom"
                                    ControlToValidate="Tool_Dic_Rotulo_nombre"
                                    ValidationGroup="I"
                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server" 
                                    ID="ValidatorCalloutExtender15"
                                    TargetControlID="rvtoolnom" />                                
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
                            ID="Dic_Rotulo_Id" 
                            Style="display:none"                            
                            runat="server" 
                            Text='<%# Bind("Dic_Rotulo_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Id" 
                            Style="display:none"                            
                            runat="server" 
                            Text='<%# Bind("Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Dic_Campo_Id" 
                            Style="display:none"                            
                            runat="server" 
                            Text='<%# Bind("Dic_Campo_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Tool_Dic_Rotulo_Id" 
                            Style="display:none"                            
                            runat="server" 
                            Text='<%# Bind("Tool_Dic_Rotulo_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Campo_Dic_Objeto_Id" 
                            Style="display:none"                            
                            runat="server" 
                            Text='<%# Bind("Campo_Dic_Objeto_Id") %>'>
                        </asp:TextBox>                        
                        <asp:TextBox 
                            ID="Dic_Con_Objeto_Id" 
                            Style="display:none"                            
                            runat="server" 
                            Text='<%# Bind("Dic_Con_Objeto_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Dic_Objeto_Id" 
                            Style="display:none"                            
                            runat="server" 
                            Text='<%# Bind("Dic_Objeto_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Dic_Contenedor_Id" 
                            Style="display:none"                            
                            runat="server" 
                            Text='<%# Bind("Dic_Contenedor_Id") %>'>
                        </asp:TextBox>
                        
                        <%--CAMPOS NO VISIBLES--%>  
                        
                        <asp:TextBox 
                            ID="Codigo_int" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Codigo_int") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Campo_Dic_Objeto_Codigo" 
                            Visible="false"
                            runat="server" 
                            Text='<%# Bind("Campo_Dic_Objeto_Codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Nombre" 
                            Visible="false"
                            runat="server" 
                            Text='<%# Bind("Nombre") %>'>
                        </asp:TextBox>                        
                        <asp:TextBox 
                            ID="Tool_Ver_etiqueta_nombre"
                            Visible="false" 
                            runat="server" 
                            Text='<%# Bind("Tool_Ver_etiqueta_nombre") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Estado" 
                            Visible="false"
                            runat="server" 
                            Text='<%# Bind("Estado") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Ver_etiqueta_nombre" 
                            Visible="false"
                            runat="server" 
                            Text='<%# Bind("Ver_etiqueta_nombre") %>'>
                        </asp:TextBox>                        
                        <asp:TextBox 
                            ID="Campo_Dic_Objeto_Nombre" 
                            Visible="false"
                            runat="server" 
                            Text='<%# Bind("Campo_Dic_Objeto_Nombre") %>'>
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
                                    ID="lblcodigo" 
                                    runat="server"                                     
                                    Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                 <asp:TextBox 
                                    ID="Codigo" 
                                    runat="server" 
                                    CssClass="TEXTO_EDICION_KCG"
                                    ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'                                    
                                    Text='<%# Bind("Codigo") %>'>
                                 </asp:TextBox>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            <asp:Label 
                                    ID="lblcontenedor" 
                                    runat="server" 
                                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                    AssociatedControlID="Dic_Contenedor_Codigo"
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
                                <asp:TextBox 
                                    ID="Dic_Contenedor_Nombre" 
                                    runat="server" 
                                    Width="400px"
                                    CssClass="TEXTO_EDICION_KCG"
                                    ToolTip='<%# GetLocalResourceObject("Dic_Contenedor_NombreRecursoKCG.ToolTip").ToString() %>' 
                                    Text='<%# Bind("Dic_Contenedor_Nombre") %>'>
                                </asp:TextBox>
                                <asp:Button 
                                    ID="Button3" 
                                    runat="server" 
                                    CommandArgument="RutaDestino: ~/DIC/DIC_CONTENEDOR.aspx; 
                                                     Filtro: Dic_Contenedor_Codigo|Dic_Contenedor_Nombre; 
                                                     NoGuardar: Dic_con_Objeto_Id|Dic_con_Objeto_Codigo|Dic_con_Objeto_Nombre;"
                                    CommandName="Zoom" 
                                    Text="..." />
                                <asp:RequiredFieldValidator 
                                    runat="server" 
                                    ID="rvnombre"
                                    ControlToValidate="Dic_Contenedor_Nombre"
                                    ValidationGroup="I"
                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server" 
                                    ID="ValidatorCalloutExtender5"
                                    TargetControlID="rvnombre" />
                                <AjaxControlToolkit:AutoCompleteExtender
                                    runat="server" 
                                    BehaviorID="AutoCompleteEx1"
                                    ID="AutoCompleteExtender1" 
                                    TargetControlID="Dic_Contenedor_Nombre"
                                    ServicePath="~/DIC/DIC_CON_CAMPO.aspx" 
                                    ServiceMethod="GetContenedor"
                                    MinimumPrefixLength="0" 
                                    CompletionInterval="500"                                    
                                    EnableCaching="true"
                                    CompletionSetCount="500"
                                    CompletionListCssClass="autocomplete_completionListElement" 
                                    CompletionListItemCssClass="autocomplete_listItem" 
                                    CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"                                        
                                    OnClientItemSelected="ItemSelectedContenedor"
                                    >
                                    <Animations>
                                    <OnShow>
                                        <Sequence>
                                            <OpacityAction Opacity="0" />
                                            <HideAction Visible="true" />                                        
                                           
                                            <ScriptAction Script="
                                                // Cache the size and setup the initial size
                                                var behavior = $find('AutoCompleteEx1');
                                                if (!behavior._height) {
                                                    var target = behavior.get_completionList();
                                                    behavior._height = target.offsetHeight - 2;
                                                    target.style.height = '0px';
                                                }" />                                                
                                            
                                            <Parallel Duration=".4">
                                                <FadeIn />
                                                <Length PropertyKey="height" StartValue="0" 
                                                EndValueScript="$find('AutoCompleteEx1')._height" />
                                            </Parallel>
                                        </Sequence>
                                    </OnShow>
                                    <OnHide>
                                        <%-- Collapse down to 0px and fade out --%>
                                        <Parallel Duration=".4">
                                            <FadeOut />
                                            <Length PropertyKey="height" 
                                                StartValueScript="$find('AutoCompleteEx1')._height" 
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
                                    ID="lblobjeto" 
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
                              <asp:TextBox 
                                ID="Dic_Objeto_Nombre" 
                                runat="server"
                                Width="400px" 
                                CssClass="TEXTO_EDICION_KCG"
                                ToolTip='<%# GetLocalResourceObject("Dic_Objeto_NombreRecursoKCG.ToolTip").ToString() %>'
                                Text='<%# Bind("Dic_Objeto_Nombre") %>'>
                              </asp:TextBox>
                              <asp:Button 
                                    ID="Button1" 
                                    runat="server" 
                                    CommandArgument="RutaDestino: ~/DIC/DIC_OBJETO.aspx; 
                                                     Filtro: Dic_Objeto_Codigo|Dic_Objeto_Nombre;
                                                     NoGuardar: Dic_con_Objeto_Id|Dic_con_Objeto_Codigo|Dic_con_Objeto_Nombre;"
                                    CommandName="Zoom" 
                                    Text="..." />
                              <asp:RequiredFieldValidator 
                                runat="server" 
                                ID="rvobjetonombre"
                                ControlToValidate="Dic_Objeto_Nombre"
                                ValidationGroup="I"
                                ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                <AjaxControlToolkit:ValidatorCalloutExtender 
                                runat="Server" 
                                ID="ValidatorCalloutExtender7"
                                TargetControlID="rvobjetonombre" />
                              <AjaxControlToolkit:AutoCompleteExtender
                                runat="server" 
                                BehaviorID="AutoCompleteEx2"
                                ID="AutoCompleteExtender2" 
                                TargetControlID="Dic_Objeto_Nombre"
                                ServicePath="~/DIC/DIC_CON_CAMPO.aspx" 
                                ServiceMethod="GetObjeto"
                                MinimumPrefixLength="0" 
                                CompletionInterval="500"
                                EnableCaching="true"
                                CompletionSetCount="500"
                                CompletionListCssClass="autocomplete_completionListElement" 
                                CompletionListItemCssClass="autocomplete_listItem" 
                                CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"                                        
                                OnClientItemSelected="ItemSelectedObjeto" >
                                <Animations>
                                <OnShow>
                                    <Sequence>
                                        <OpacityAction Opacity="0" />
                                        <HideAction Visible="true" />                                        
                                       
                                        <ScriptAction Script="
                                            // Cache the size and setup the initial size
                                            var behavior = $find('AutoCompleteEx2');
                                            if (!behavior._height) {
                                                var target = behavior.get_completionList();
                                                behavior._height = target.offsetHeight - 2;
                                                target.style.height = '0px';
                                            }" />                                                
                                        
                                        <Parallel Duration=".4">
                                            <FadeIn />
                                            <Length PropertyKey="height" StartValue="0" 
                                            EndValueScript="$find('AutoCompleteEx2')._height" />
                                        </Parallel>
                                    </Sequence>
                                </OnShow>
                                <OnHide>
                                    <%-- Collapse down to 0px and fade out --%>
                                    <Parallel Duration=".4">
                                        <FadeOut />
                                        <Length PropertyKey="height" 
                                            StartValueScript="$find('AutoCompleteEx2')._height" 
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
                                    ID="lblcontenedorobjeto" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Dic_con_Objeto_NombreRecursoKCG.Text").ToString() %>'>
                            </asp:Label>   
                            </td>
                            <td>
                              <asp:TextBox 
                                ID="Dic_con_Objeto_Codigo" 
                                runat="server"
                                CssClass="TEXTO_EDICION_KCG"
                                ToolTip='<%# GetLocalResourceObject("Dic_con_Objeto_CodigoRecursoKCG.ToolTip").ToString() %>'
                                Text='<%# Bind("Dic_con_Objeto_Codigo") %>'>
                              </asp:TextBox>                              
                              <asp:TextBox 
                                ID="Dic_con_Objeto_Nombre" 
                                runat="server" 
                                Width="400px"
                                CssClass="TEXTO_EDICION_KCG"
                                ToolTip='<%# GetLocalResourceObject("Dic_con_Objeto_NombreRecursoKCG.ToolTip").ToString() %>'
                                Text='<%# Bind("Dic_con_Objeto_Nombre") %>'>
                              </asp:TextBox>
                              <asp:Button 
                                    ID="Button2" 
                                    runat="server" 
                                    CommandArgument="RutaDestino: ~/DIC/DIC_CON_OBJETO.aspx; 
                                                     Filtro: Dic_con_Objeto_Codigo|Dic_con_Objeto_Nombre|Dic_Contenedor_Codigo|Dic_Contenedor_Nombre|Dic_Objeto_Codigo|Dic_Objeto_Nombre;"
                                    CommandName="Zoom" 
                                    Text="..." />
                              <asp:RequiredFieldValidator runat="server" ID="rvconobjnombre"
                                ControlToValidate="Dic_con_Objeto_Nombre"
                                ValidationGroup="I"
                                ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                              <AjaxControlToolkit:ValidatorCalloutExtender 
                                runat="Server" 
                                ID="ValidatorCalloutExtender9"
                                TargetControlID="rvconobjnombre" /> 
                              <AjaxControlToolkit:AutoCompleteExtender
                                runat="server" 
                                BehaviorID="AutoCompleteEx3"
                                ID="AutoCompleteExtender3" 
                                TargetControlID="Dic_con_Objeto_Nombre"
                                ServicePath="~/DIC/DIC_CON_CAMPO.aspx" 
                                ServiceMethod="GetDicObjeto"
                                MinimumPrefixLength="0" 
                                CompletionInterval="500"
                                EnableCaching="true"
                                CompletionSetCount="500"
                                CompletionListCssClass="autocomplete_completionListElement" 
                                CompletionListItemCssClass="autocomplete_listItem" 
                                CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"                                        
                                OnClientItemSelected="ItemSelectedDicObjeto"                                
                                UseContextKey="true"                                
                                >
                                <Animations>
                                <OnShow>
                                    <Sequence>
                                        <OpacityAction Opacity="0" />
                                        <HideAction Visible="true" />                                        
                                       
                                        <ScriptAction Script="
                                            // Cache the size and setup the initial size
                                            var behavior = $find('AutoCompleteEx3');
                                            if (!behavior._height) {
                                                var target = behavior.get_completionList();
                                                behavior._height = target.offsetHeight - 2;
                                                target.style.height = '0px';
                                            }" />                                                
                                        
                                        <Parallel Duration=".4">
                                            <FadeIn />
                                            <Length PropertyKey="height" StartValue="0" 
                                            EndValueScript="$find('AutoCompleteEx3')._height" />
                                        </Parallel>
                                    </Sequence>
                                </OnShow>
                                <OnHide>
                                    <%-- Collapse down to 0px and fade out --%>
                                    <Parallel Duration=".4">
                                        <FadeOut />
                                        <Length PropertyKey="height" 
                                            StartValueScript="$find('AutoCompleteEx3')._height" 
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
                                    ID="lblcampo" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Dic_Campo_NombreRecursoKCG.Text").ToString() %>'>
                            </asp:Label>   
                            </td>
                            <td>
                              <asp:TextBox 
                                ID="Dic_Campo_Codigo" 
                                runat="server"
                                CssClass="TEXTO_EDICION_KCG"
                                ToolTip='<%# GetLocalResourceObject("Dic_Campo_CodigoRecursoKCG.ToolTip").ToString() %>'
                                Text='<%# Bind("Dic_Campo_Codigo") %>'>
                              </asp:TextBox>                               
                              <asp:TextBox 
                                ID="Dic_Campo_Nombre" 
                                runat="server" 
                                Width="400px"
                                CssClass="TEXTO_EDICION_KCG"
                                ToolTip='<%# GetLocalResourceObject("Dic_Campo_NombreRecursoKCG.ToolTip").ToString() %>'
                                Text='<%# Bind("Dic_Campo_Nombre") %>'>
                               </asp:TextBox>
                               <asp:Button 
                                    ID="Button4" 
                                    runat="server" 
                                    CommandArgument="RutaDestino: ~/DIC/DIC_CAMPO.aspx; Filtro: Dic_Campo_Codigo|Dic_Campo_Nombre|Dic_Objeto_Codigo|Dic_Objeto_Nombre;"
                                    CommandName="Zoom" 
                                    Text="..." />
                               <asp:RequiredFieldValidator 
                                runat="server" 
                                ID="rvcamponom"
                                ControlToValidate="Dic_Campo_Nombre"
                                ValidationGroup="I"
                                ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                <AjaxControlToolkit:ValidatorCalloutExtender 
                                runat="Server" 
                                ID="ValidatorCalloutExtender11"
                                TargetControlID="rvcamponom" />   
                               <AjaxControlToolkit:AutoCompleteExtender
                                runat="server" 
                                BehaviorID="AutoCompleteEx4"
                                ID="AutoCompleteExtender4" 
                                TargetControlID="Dic_Campo_Nombre"
                                ServicePath="~/DIC/DIC_CON_CAMPO.aspx" 
                                ServiceMethod="GetCampo"
                                MinimumPrefixLength="0" 
                                CompletionInterval="500"
                                EnableCaching="true"
                                CompletionSetCount="500"
                                CompletionListCssClass="autocomplete_completionListElement" 
                                CompletionListItemCssClass="autocomplete_listItem" 
                                CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"                                        
                                OnClientItemSelected="ItemSelectedCampo" 
                                OnClientPopulating="SelectedPopulatingCampo"
                                UseContextKey="true" >
                                <Animations>
                                <OnShow>
                                    <Sequence>
                                        <OpacityAction Opacity="0" />
                                        <HideAction Visible="true" />                                        
                                       
                                        <ScriptAction Script="
                                            // Cache the size and setup the initial size
                                            var behavior = $find('AutoCompleteEx4');
                                            if (!behavior._height) {
                                                var target = behavior.get_completionList();
                                                behavior._height = target.offsetHeight - 2;
                                                target.style.height = '0px';
                                            }" />                                                
                                        
                                        <Parallel Duration=".4">
                                            <FadeIn />
                                            <Length PropertyKey="height" StartValue="0" 
                                            EndValueScript="$find('AutoCompleteEx4')._height" />
                                        </Parallel>
                                    </Sequence>
                                </OnShow>
                                <OnHide>
                                    <%-- Collapse down to 0px and fade out --%>
                                    <Parallel Duration=".4">
                                        <FadeOut />
                                        <Length PropertyKey="height" 
                                            StartValueScript="$find('AutoCompleteEx4')._height" 
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
                                    ID="lblorden" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("OrdenRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                               <asp:TextBox 
                                ID="Orden" 
                                runat="server" 
                                CssClass="TEXTO_EDICION_KCG"
                                ToolTip='<%# GetLocalResourceObject("OrdenRecursoKCG.ToolTip").ToString() %>'
                                Text='<%# Bind("Orden") %>'>
                                </asp:TextBox>
                                <asp:RequiredFieldValidator 
                                    ID="RequiredFieldValidator2" 
                                    runat="server" 
                                    ControlToValidate="Orden"
                                    ValidationGroup="I"
                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/>
                                <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server" 
                                    ID="ValidatorCalloutExtender1"
                                    TargetControlID="RequiredFieldValidator2" />
                               <asp:CompareValidator 
                                    ID="CompareValidator2" 
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
                                    ID="ValidatorCalloutExtender3"
                                    TargetControlID="CompareValidator2" />  
                            </td>
                        </tr>
                         <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lblancho" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("AnchoRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                               <asp:TextBox 
                                  ID="Ancho" 
                                  runat="server" 
                                  CssClass="TEXTO_EDICION_KCG"
                                  ToolTip='<%# GetLocalResourceObject("AnchoRecursoKCG.ToolTip").ToString() %>'
                                  Text='<%# Bind("Ancho") %>' >
                               </asp:TextBox>
                               <asp:RequiredFieldValidator 
                                    ID="RequiredFieldValidator1" 
                                    runat="server" 
                                    ControlToValidate="Ancho"
                                    ValidationGroup="I"
                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/>
                                <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server" 
                                    ID="ValidatorCalloutExtender2"
                                    TargetControlID="RequiredFieldValidator1" />
                               <asp:CompareValidator 
                                    ID="CompareValidator1" 
                                    runat="server" 
                                    Operator="GreaterThan"
                                    Type="Integer" 
                                    ValidationGroup="I"
                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.ErrorMessage").ToString() %>'
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.Text").ToString() %>' 
                                    ValueToCompare="0"
                                    ControlToValidate="Ancho">
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
                                    ID="lblrotulo" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Dic_Rotulo_nombreRecursoKCG.Text").ToString() %>'>
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
                                <asp:TextBox 
                                    ID="Dic_Rotulo_nombre" 
                                    runat="server" 
                                    Width="400px"
                                    CssClass="TEXTO_EDICION_KCG"
                                    ToolTip='<%# GetLocalResourceObject("Dic_Rotulo_nombreRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Dic_Rotulo_nombre") %>'>
                                </asp:TextBox>
                                <asp:Button 
                                    ID="Button5" 
                                    runat="server" 
                                    CommandArgument="RutaDestino: ~/DIC/DIC_ROTULO.aspx; Filtro: Dic_Rotulo_Codigo|Dic_Rotulo_nombre;"
                                    CommandName="Zoom" 
                                    Text="..." />
                                <asp:RequiredFieldValidator runat="server" ID="rvrotulonom"
                                    ControlToValidate="Dic_Rotulo_nombre"
                                    ValidationGroup="I"
                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server" 
                                    ID="ValidatorCalloutExtender13"
                                    TargetControlID="rvrotulonom" />                                
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            <asp:Label 
                                    ID="lblrotulotoop" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Tool_Dic_Rotulo_nombreRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                            </td>
                            <td >
                                <asp:TextBox 
                                    ID="Tool_Dic_Rotulo_Codigo" 
                                    runat="server" 
                                    CssClass="TEXTO_EDICION_KCG"
                                    ToolTip='<%# GetLocalResourceObject("Tool_Dic_Rotulo_CodigoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Tool_Dic_Rotulo_Codigo") %>'>
                                </asp:TextBox>                                
                                <asp:TextBox 
                                    ID="Tool_Dic_Rotulo_nombre" 
                                    runat="server"
                                    Width="400px"
                                    CssClass="TEXTO_EDICION_KCG" 
                                    ToolTip='<%# GetLocalResourceObject("Tool_Dic_Rotulo_nombreRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Tool_Dic_Rotulo_nombre") %>'>
                                 </asp:TextBox>
                                 <asp:Button 
                                    ID="Button6" 
                                    runat="server" 
                                    CommandArgument="RutaDestino: ~/DIC/DIC_ROTULO.aspx; Filtro: Tool_Dic_Rotulo_Codigo|Tool_Dic_Rotulo_nombre; Obtener:Tool_Dic_Rotulo_Codigo|Codigo,Tool_Dic_Rotulo_nombre|Nombre,Tool_Dic_Rotulo_Id|Id ; Alias:Tool;"
                                    CommandName="Zoom" 
                                    Text="..." />
                                 <asp:RequiredFieldValidator runat="server" ID="rvtoolnom"
                                    ControlToValidate="Tool_Dic_Rotulo_nombre"
                                    ValidationGroup="I"
                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server" 
                                    ID="ValidatorCalloutExtender15"
                                    TargetControlID="rvtoolnom" />                                
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
                        <%--Id's--%>  
                        <asp:TextBox 
                            ID="Dic_Rotulo_Id" 
                            Style="display:none"                            
                            runat="server" 
                            Text='<%# Bind("Dic_Rotulo_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Id" 
                            Style="display:none"                            
                            runat="server" 
                            Text='<%# Bind("Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Dic_Campo_Id" 
                            Style="display:none"
                            runat="server" 
                            Text='<%# Bind("Dic_Campo_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Tool_Dic_Rotulo_Id" 
                            Style="display:none"
                            runat="server" 
                            Text='<%# Bind("Tool_Dic_Rotulo_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Campo_Dic_Objeto_Id" 
                            Style="display:none"
                            runat="server" 
                            Text='<%# Bind("Campo_Dic_Objeto_Id") %>'>
                        </asp:TextBox>                        
                        <asp:TextBox 
                            ID="Dic_Con_Objeto_Id" 
                            Style="display:none"
                            runat="server" 
                            Text='<%# Bind("Dic_Con_Objeto_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Dic_Objeto_Id" 
                            Style="display:none"
                            runat="server" 
                            Text='<%# Bind("Dic_Objeto_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Dic_Contenedor_Id" 
                            Style="display:none"
                            runat="server" 
                            Text='<%# Bind("Dic_Contenedor_Id") %>'>
                        </asp:TextBox>
                        
                        <%--CAMPOS NO VISIBLES--%>    
                        
                        <asp:TextBox 
                            ID="Codigo_int" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Codigo_int") %>'>
                        </asp:TextBox>             
                        
                        <asp:TextBox 
                            ID="Campo_Dic_Objeto_Codigo" 
                            Visible="false"
                            runat="server" 
                            Text='<%# Bind("Campo_Dic_Objeto_Codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Nombre" 
                            Visible="false"
                            runat="server" 
                            Text='<%# Bind("Nombre") %>'>
                        </asp:TextBox>                        
                        <asp:TextBox 
                            ID="Tool_Ver_etiqueta_nombre"
                            Visible="false" 
                            runat="server" 
                            Text='<%# Bind("Tool_Ver_etiqueta_nombre") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Estado" 
                            Visible="false"
                            runat="server" 
                            Text='<%# Bind("Estado") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Ver_etiqueta_nombre" 
                            Visible="false"
                            runat="server" 
                            Text='<%# Bind("Ver_etiqueta_nombre") %>'>
                        </asp:TextBox>                        
                        <asp:TextBox 
                            ID="Campo_Dic_Objeto_Nombre" 
                            Visible="false"
                            runat="server" 
                            Text='<%# Bind("Campo_Dic_Objeto_Nombre") %>'>
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
                                ID="lblcodigo" 
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
                                ID="lblcontenedor" 
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
                                Text='<%# Bind("Dic_Contenedor_Codigo") %>'></asp:TextBox>
                            <asp:TextBox 
                                ID="Dic_Contenedor_Nombre" 
                                runat="server"  
                                Width="400px"  
                                ReadOnly="true"
                                TabIndex="-1"                                                             
                                ToolTip='<%# GetLocalResourceObject("Dic_Contenedor_NombreRecursoKCG.ToolTip").ToString() %>'
                                Text='<%# Bind("Dic_Contenedor_Nombre") %>'></asp:TextBox>
                            <asp:Button 
                                ID="Button3" 
                                runat="server" 
                                Enabled="false" 
                                CommandArgument="rutaDestino: ~/DIC/DIC_CONTENEDOR.aspx; filtro: Dic_Contenedor_Id;"
                                CommandName="Zoom" 
                                Text="..." />
                           
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                         <asp:Label 
                                ID="lblobjeto" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("Dic_Objeto_NombreRecursoKCG.Text").ToString() %>'>
                        </asp:Label>   
                        </td>
                        <td>
                          <asp:TextBox 
                            ID="Dic_Objeto_Codigo" 
                            runat="server" 
                            ReadOnly="true"
                            TabIndex="-1"
                            ToolTip='<%# GetLocalResourceObject("Dic_Objeto_CodigoRecursoKCG.ToolTip").ToString() %>'
                            Text='<%# Bind("Dic_Objeto_Codigo") %>'></asp:TextBox> 
                          <asp:TextBox 
                            ID="Dic_Objeto_Nombre" 
                            runat="server" 
                            Width="400px"  
                            ReadOnly="true"
                            TabIndex="-1"                                                      
                            ToolTip='<%# GetLocalResourceObject("Dic_Objeto_NombreRecursoKCG.ToolTip").ToString() %>'
                            Text='<%# Bind("Dic_Objeto_Nombre") %>'></asp:TextBox>
                          <asp:Button 
                                ID="Button7" 
                                runat="server" 
                                Enabled="false" 
                                CommandArgument="rutaDestino: ~/DIC/DIC_OBJETO.aspx; filtro: Dic_Objeto_Id;"
                                CommandName="Zoom" 
                                Text="..." />
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                         <asp:Label 
                                ID="lblcontenedorobjeto" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("Dic_con_Objeto_NombreRecursoKCG.Text").ToString() %>'>
                        </asp:Label>   
                        </td>
                        <td>
                          <asp:TextBox 
                            ID="Dic_con_Objeto_Codigo" 
                            runat="server" 
                            ReadOnly="true"
                            TabIndex="-1"
                            ToolTip='<%# GetLocalResourceObject("Dic_con_Objeto_CodigoRecursoKCG.ToolTip").ToString() %>'
                            Text='<%# Bind("Dic_con_Objeto_Codigo") %>'></asp:TextBox>
                          <asp:TextBox 
                            ID="Dic_con_Objeto_Nombre" 
                            runat="server" 
                            Width="400px" 
                            ReadOnly="true"
                            TabIndex="-1"                                                       
                            ToolTip='<%# GetLocalResourceObject("Dic_con_Objeto_NombreRecursoKCG.ToolTip").ToString() %>'
                            Text='<%# Bind("Dic_con_Objeto_Nombre") %>'></asp:TextBox>                          
                          <asp:Button 
                                ID="Button2" 
                                runat="server" 
                                Enabled="false"
                                CommandArgument="RutaDestino: ~/DIC/DIC_CON_OBJETO.aspx; Filtro: Dic_con_Objeto_Id;"
                                CommandName="Zoom" 
                                Text="..." />
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                         <asp:Label 
                                ID="lblcampo" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("Dic_Campo_NombreRecursoKCG.Text").ToString() %>'>
                        </asp:Label>   
                        </td>
                        <td>
                          <asp:TextBox 
                            ID="Dic_Campo_Codigo" 
                            runat="server" 
                            ReadOnly="true"
                            TabIndex="-1"
                            ToolTip='<%# GetLocalResourceObject("Dic_Campo_CodigoRecursoKCG.ToolTip").ToString() %>'
                            Text='<%# Bind("Dic_Campo_Codigo") %>'></asp:TextBox>                           
                          <asp:TextBox 
                            ID="Dic_Campo_Nombre" 
                            runat="server"    
                            ReadOnly="true"
                            TabIndex="-1"
                            Width="400px"                             
                            ToolTip='<%# GetLocalResourceObject("Dic_Campo_NombreRecursoKCG.ToolTip").ToString() %>'
                            Text='<%# Bind("Dic_Campo_Nombre") %>'></asp:TextBox>                            
                          <asp:Button 
                            ID="Button4" 
                            runat="server" 
                            Enabled="false" 
                            CommandArgument="RutaDestino: ~/DIC/DIC_CAMPO.aspx; Filtro: Dic_Campo_Id;"
                            CommandName="Zoom" 
                            Text="..." />
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            <asp:Label 
                                ID="lblorden" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("OrdenRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                           <asp:TextBox 
                            ID="Orden" 
                            runat="server"  
                            ReadOnly="true"
                            TabIndex="-1"                           
                            ToolTip='<%# GetLocalResourceObject("OrdenRecursoKCG.ToolTip").ToString() %>'
                            Text='<%# Bind("Orden") %>'>
                            </asp:TextBox>
                            
                        </td>
                    </tr>
                     <tr align="left">
                        <td>
                            <asp:Label 
                                ID="lblancho" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("AnchoRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                           <asp:TextBox 
                              ID="Ancho" 
                              runat="server"
                              ReadOnly="true"
                              TabIndex="-1"                               
                              ToolTip='<%# GetLocalResourceObject("AnchoRecursoKCG.ToolTip").ToString() %>'
                              Text='<%# Bind("Ancho") %>' >
                           </asp:TextBox>
                           
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                        <asp:Label 
                                ID="lblrotulo" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("Dic_Rotulo_nombreRecursoKCG.Text").ToString() %>'>
                        </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="Dic_Rotulo_Codigo" 
                                runat="server" 
                                ReadOnly="true"
                                TabIndex="-1"
                                ToolTip='<%# GetLocalResourceObject("Dic_Rotulo_CodigoRecursoKCG.ToolTip").ToString() %>'
                                Text='<%# Bind("Dic_Rotulo_Codigo") %>'></asp:TextBox>                            
                            <asp:TextBox 
                                ID="Dic_Rotulo_nombre" 
                                runat="server"
                                ReadOnly="true"
                                TabIndex="-1"
                                Width="400px"                                 
                                ToolTip='<%# GetLocalResourceObject("Dic_Rotulo_nombreRecursoKCG.ToolTip").ToString() %>'
                                Text='<%# Bind("Dic_Rotulo_nombre") %>'></asp:TextBox>                            
                            <asp:Button 
                                ID="Button5" 
                                runat="server"
                                Enabled="false"  
                                CommandArgument="RutaDestino: ~/DIC/DIC_ROTULO.aspx; Filtro: Dic_Rotulo_Id;"
                                CommandName="Zoom" 
                                Text="..." />
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                        <asp:Label 
                                ID="lblrotulotoop" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("Tool_Dic_Rotulo_nombreRecursoKCG.Text").ToString() %>'>
                        </asp:Label>
                        </td>
                        <td >
                            <asp:TextBox 
                                ID="Tool_Dic_Rotulo_Codigo" 
                                runat="server" 
                                ReadOnly="true"
                                TabIndex="-1"
                                ToolTip='<%# GetLocalResourceObject("Tool_Dic_Rotulo_CodigoRecursoKCG.ToolTip").ToString() %>'
                                Text='<%# Bind("Tool_Dic_Rotulo_Codigo") %>'></asp:TextBox>                            
                            <asp:TextBox 
                                ID="Tool_Dic_Rotulo_nombre" 
                                runat="server" 
                                ReadOnly="true"
                                TabIndex="-1"
                                Width="400px"                               
                                ToolTip='<%# GetLocalResourceObject("Tool_Dic_Rotulo_nombreRecursoKCG.ToolTip").ToString() %>'
                                Text='<%# Bind("Tool_Dic_Rotulo_nombre") %>'></asp:TextBox>                             
                            <asp:Button 
                                ID="Button6" 
                                runat="server" 
                                Enabled="false"
                                CommandArgument="RutaDestino: ~/DIC/DIC_ROTULO.aspx; Filtro: Tool_Dic_Rotulo_Id; Alias:Tool;"
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
                           <uc1:wucMensajeEliminar ID="WucMensajeEliminar1" runat="server" />
                         </td>
                    </tr>
                </table> 
                    <%--Id's--%>  
                        <asp:TextBox 
                            ID="Dic_Rotulo_Id" 
                            Style="display:none"                            
                            runat="server" 
                            Text='<%# Bind("Dic_Rotulo_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Id" 
                            Style="display:none"
                            runat="server" 
                            Text='<%# Bind("Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Dic_Campo_Id" 
                            Style="display:none"
                            runat="server" 
                            Text='<%# Bind("Dic_Campo_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Tool_Dic_Rotulo_Id" 
                            Style="display:none"
                            runat="server" 
                            Text='<%# Bind("Tool_Dic_Rotulo_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Campo_Dic_Objeto_Id" 
                            Style="display:none"
                            runat="server" 
                            Text='<%# Bind("Campo_Dic_Objeto_Id") %>'>
                        </asp:TextBox>                        
                        <asp:TextBox 
                            ID="Dic_Con_Objeto_Id" 
                            Style="display:none"
                            runat="server" 
                            Text='<%# Bind("Dic_Con_Objeto_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Dic_Objeto_Id" 
                            Style="display:none"
                            runat="server" 
                            Text='<%# Bind("Dic_Objeto_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Dic_Contenedor_Id" 
                            Style="display:none"
                            runat="server" 
                            Text='<%# Bind("Dic_Contenedor_Id") %>'>
                        </asp:TextBox>
                        
                        <%--CAMPOS NO VISIBLES--%>       
                        
                        <asp:TextBox 
                            ID="Codigo_int" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Codigo_int") %>'>
                        </asp:TextBox>          
                        
                        <asp:TextBox 
                            ID="Campo_Dic_Objeto_Codigo" 
                            Visible="false"
                            runat="server" 
                            Text='<%# Bind("Campo_Dic_Objeto_Codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Nombre" 
                            Visible="false"
                            runat="server" 
                            Text='<%# Bind("Nombre") %>'>
                        </asp:TextBox>                        
                        <asp:TextBox 
                            ID="Tool_Ver_etiqueta_nombre"
                            Visible="false" 
                            runat="server" 
                            Text='<%# Bind("Tool_Ver_etiqueta_nombre") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Estado" 
                            Visible="false"
                            runat="server" 
                            Text='<%# Bind("Estado") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Ver_etiqueta_nombre" 
                            Visible="false"
                            runat="server" 
                            Text='<%# Bind("Ver_etiqueta_nombre") %>'>
                        </asp:TextBox>                        
                        <asp:TextBox 
                            ID="Campo_Dic_Objeto_Nombre" 
                            Visible="false"
                            runat="server" 
                            Text='<%# Bind("Campo_Dic_Objeto_Nombre") %>'>
                        </asp:TextBox>
                    </ItemTemplate>
                 </asp:FormView>                
        </asp:Panel>
        </ContentTemplate> 
        <Triggers>
            <asp:AsyncPostBackTrigger 
                ControlID="gvdicconcampo" 
                EventName="SelectedIndexChanged" />
        </Triggers>   
    </asp:UpdatePanel>
    <asp:ObjectDataSource 
        ID="odsdiccampo" 
        runat="server" 
        ConflictDetection="CompareAllValues"
        DeleteMethod="Delete" 
        InsertMethod="Insert" 
        OldValuesParameterFormatString="original{0}"
        SelectMethod="GetById" 
        SortParameterName="sortExpression" 
        TypeName="FEL.DIC.BO_Dic_Con_Campo"
        UpdateMethod="Update">
        <SelectParameters>
            <asp:SessionParameter 
            Name="s" 
            SessionField="Scope" 
            Type="Object" />
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
        <table>
            <tr>            
                <td>
                    <koala:KNavegacion ID="nav"
                    runat="server"
                    GridViewID="gvdicconcampo"
                    FormViewID="FormView1" OnNavegar="nav_Siguiente" />
                </td>
                <td>
                    <koala:KFiltro 
                        ID="kftFiltro" 
                        runat="server" 
                        Contenedor="DIC_CON_CAMPO" 
                        Objeto="DIC_CON_CAMPO" 
                        IndiceScope ="Scope"
                        Orden="1"
                        ObjectDataSourceID="odsgvdicconcampo"/>
                </td>
                <td>
                    <asp:Button
                        id="BtnEtiqueta"
                        runat="server"                        
                        OnClick="BtnEtiqueta_Click" />   
                </td>
            </tr>
        </table>        
          <asp:Panel 
            runat="server" 
            ID="pnlDatosGrid" 
            meta:resourcekey="Rec_Listado_Dic_Con_CampoRecursoKCG">
                <koala:KGrid 
                    ID="gvdicconcampo" 
                    runat="server" 
                    AllowPaging="True" 
                    AllowSorting="True"
                    AutoGenerateColumns="False" 
                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>'
                    DataKeyNames="Id" 
                    DataSourceID="odsgvdicconcampo">
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
                            DataField="Dic_Campo_Nombre" 
                            meta:resourcekey="BoundDic_Campo_NombreRecursoKCG"
                            SortExpression="Dic_Campo_Nombre" >
                            <itemstyle width="80mm" wrap="True" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Orden" 
                            meta:resourcekey="BoundOrdenRecursoKCG" 
                            SortExpression="Orden" >
                            <itemstyle horizontalalign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Dic_Rotulo_nombre" 
                            meta:resourcekey="BoundDic_Rotulo_nombreRecursoKCG" 
                            SortExpression="Dic_Rotulo_nombre" >
                            <itemstyle width="40mm" wrap="True" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Tool_Dic_Rotulo_nombre" 
                            meta:resourcekey="BoundTool_Dic_Rotulo_nombreRecursoKCG"
                            SortExpression="Tool_Dic_Rotulo_nombre" >
                            <itemstyle width="40mm" wrap="True" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Ver_etiqueta_nombre" 
                            HeaderText="Etiqueta"
                            SortExpression="Ver_etiqueta_nombre">
                            <itemstyle width="50mm" wrap="True" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Dic_Contenedor_Nombre" 
                            HeaderText="Contenedor"
                            SortExpression="Dic_Contenedor_Nombre">
                            <itemstyle width="80mm" wrap="True" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Dic_Objeto_Nombre" 
                            HeaderText="Objeto" 
                            SortExpression="Dic_Objeto_Nombre">
                            <itemstyle width="80mm" wrap="True" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Estado_Nombre" 
                            SortExpression="Estado_Nombre" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Dic_Contenedor_Codigo" 
                            HeaderText="Dic_Contenedor_Codigo"
                            SortExpression="Dic_Contenedor_Codigo" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Dic_Objeto_Codigo" 
                            HeaderText="Dic_Objeto_Codigo" 
                            SortExpression="Dic_Objeto_Codigo" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Dic_con_Objeto_Codigo" 
                            HeaderText="Dic_con_Objeto_Codigo"
                            SortExpression="Dic_con_Objeto_Codigo" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Dic_con_Objeto_Nombre" 
                            meta:resourcekey="BoundDic_con_Objeto_NombreRecursoKCG"
                            SortExpression="Dic_con_Objeto_Nombre" Visible="False" />
                        <asp:BoundField 
                            DataField="Dic_Campo_Codigo" 
                            HeaderText="Dic_Campo_Codigo" 
                            SortExpression="Dic_Campo_Codigo" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Ancho" 
                            meta:resourcekey="BoundAnchoRecursoKCG"
                            SortExpression="Ancho" Visible="False" />
                        <asp:BoundField 
                            DataField="Dic_Rotulo_Codigo" 
                            HeaderText="Dic_Rotulo_Codigo" 
                            SortExpression="Dic_Rotulo_Codigo" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Tool_Dic_Rotulo_Codigo" 
                            HeaderText="Tool_Dic_Rotulo_Codigo"
                            SortExpression="Tool_Dic_Rotulo_Codigo" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Dic_Rotulo_Id" 
                            HeaderText="Dic_Rotulo_Id" 
                            SortExpression="Dic_Rotulo_Id"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Id" 
                            HeaderText="Id" 
                            SortExpression="Id" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Campo_Dic_Objeto_Codigo" 
                            HeaderText="Campo_Dic_Objeto_Codigo"
                            SortExpression="Campo_Dic_Objeto_Codigo" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Nombre" 
                            HeaderText="Nombre" 
                            SortExpression="Nombre" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Codigo_int" 
                            HeaderText="Codigo_int" 
                            SortExpression="Codigo_int" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Dic_Campo_Id" 
                            HeaderText="Dic_Campo_Id" 
                            SortExpression="Dic_Campo_Id"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Tool_Dic_Rotulo_Id" 
                            HeaderText="Tool_Dic_Rotulo_Id" 
                            SortExpression="Tool_Dic_Rotulo_Id"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Campo_Dic_Objeto_Id" 
                            HeaderText="Campo_Dic_Objeto_Id"
                            SortExpression="Campo_Dic_Objeto_Id" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Dic_Con_Objeto_Id" 
                            HeaderText="Dic_Con_Objeto_Id" 
                            SortExpression="Dic_Con_Objeto_Id"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Tool_Ver_etiqueta_nombre" 
                            HeaderText="Tool_Ver_etiqueta_nombre"
                            SortExpression="Tool_Ver_etiqueta_nombre" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Estado" 
                            HeaderText="Estado" 
                            SortExpression="Estado" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Dic_Objeto_Id" 
                            HeaderText="Dic_Objeto_Id" 
                            SortExpression="Dic_Objeto_Id"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Campo_Dic_Objeto_Nombre" 
                            HeaderText="Campo_Dic_Objeto_Nombre"
                            SortExpression="Campo_Dic_Objeto_Nombre" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Dic_Contenedor_Id" 
                            HeaderText="Dic_Contenedor_Id" 
                            SortExpression="Dic_Contenedor_Id"
                            Visible="False" />
                    </Columns>
                </koala:KGrid>
          </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>    
    <asp:ObjectDataSource 
        ID="odsgvdicconcampo" 
        runat="server" 
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="Get" 
        TypeName="FEL.DIC.BO_Dic_Con_Campo">
        <SelectParameters>
            <asp:SessionParameter 
                Name="s" 
                SessionField="Scope" 
                Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>    
</asp:Content>