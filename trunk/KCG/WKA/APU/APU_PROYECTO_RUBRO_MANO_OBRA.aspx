<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="APU_PROYECTO_RUBRO_MANO_OBRA.aspx.cs" 
    Inherits="APU_APU_PROYECTO_RUBRO_MANO_OBRA"     
    Theme="EstiloKCG"
    StylesheetTheme="EstiloKCG" 
    meta:resourcekey="Tit_Apu_Proyecto_Rubro_Mano_ObraRecursoKCG" %>
    
<%@ Register 
    Src="../WebUserControls/wucMensajeActualizar.ascx" 
    TagName="wucMensajeActualizar"
    TagPrefix="uc1" %>
    
<%@ Register 
    Src="../WebUserControls/wucMensajeEliminar.ascx" 
    TagName="wucMensajeEliminar"
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
    
    <script type="text/javascript">
    // Work around browser behavior of "auto-submitting" simple forms
    Sys.Application.add_load(page_load);
    Sys.Application.add_unload(page_unload);
        
    var costo_hora = null;
    var Cantidad = null;    

    function page_load(sender, e){
    Cantidad = $get("ctl00_ContentPlaceHolder1_fvapu_proyecto_rubro_mano_obra_Cantidad");
    costo_hora = $get("ctl00_ContentPlaceHolder1_fvapu_proyecto_rubro_mano_obra_costo_hora");
    //Costo_Hora.onfocus = function preventFocus(e) { this.blur(); };
    $addHandler(Cantidad, "change", Cantidad_onchange);
    }    
   
    function page_unload(sender, e){
    $removeHandler(Cantidad, "change", Cantidad_onchange);
    }
    
    function Cantidad_onchange(sender, e){
    Calcular();
    }
    
    var frm = document.getElementById("aspnetForm");
    if (frm) {
        frm.onsubmit = function() { return false; };
    }
    
    function ItemSelected( source, eventArgs ) 
    {
        var valor = eventArgs.get_value();
        var temp = new Array();
        temp = valor.split('||');
        
        var Apu_Mano_Obra_Id = $get("ctl00_ContentPlaceHolder1_fvapu_proyecto_rubro_mano_obra_Apu_Mano_Obra_Id");
        Apu_Mano_Obra_Id.value = temp[0];
        
        var Apu_Categoria_Codigo = $get("ctl00_ContentPlaceHolder1_fvapu_proyecto_rubro_mano_obra_Apu_Categoria_Codigo");
        Apu_Categoria_Codigo.value = temp[1];
        
        var Apu_Categoria_Nombre = $get("ctl00_ContentPlaceHolder1_fvapu_proyecto_rubro_mano_obra_Apu_Categoria_Nombre");
        Apu_Categoria_Nombre.value = temp[2];
        
        costo_hora.value = temp[3];
        
        Calcular();    
    }
    
    function Calcular()
    {
        var resultado = 0.00;
        var costo_hora_x_cantidad = $get("ctl00_ContentPlaceHolder1_fvapu_proyecto_rubro_mano_obra_costo_hora_x_cantidad");
                        
        var numCosto_hora = Number.parseLocale(costo_hora.value);
        if(isNaN(numCosto_hora)) return;
        
        var numCantidad = Number.parseLocale(Cantidad.value);
        if(isNaN(numCantidad)) return;
        
        resultado = numCosto_hora *  numCantidad;
        costo_hora_x_cantidad.value = resultado.localeFormat("N4");
        
        var rendimiento_mano_obra_hora = $get("ctl00_ContentPlaceHolder1_fvapu_proyecto_rubro_mano_obra_rendimiento_mano_obra_hora");
       
        var numRendimiento_mano_obra_hora = Number.parseLocale(rendimiento_mano_obra_hora.value);
        if(isNaN(numRendimiento_mano_obra_hora)) return;
        
        resultado = resultado * numRendimiento_mano_obra_hora;
        
        costo_x_rendimiento_hora = $get("ctl00_ContentPlaceHolder1_fvapu_proyecto_rubro_mano_obra_costo_x_rendimiento_hora");
        costo_x_rendimiento_hora.value = resultado.localeFormat("N4"); 
    }
</script>
    <asp:UpdatePanel 
    ID="UpdatePanel1" 
    runat="server"
    UpdateMode="Conditional">
        <ContentTemplate>
            <asp:FormView 
                ID="fvapu_proyecto_rubro_mano_obra" 
                runat="server" 
                DataSourceID="odsapu_proyecto_rubro_mano_obra"
                DefaultMode="Insert">
                <EditItemTemplate>
                <asp:Panel
                    id="Panel1"
                    runat="server"
                    meta:resourcekey="Rec_Proyecto_Rubro_Mano_Obra_ProyectoRecursoKCG">
                    <table>
                        <tr align="left">
                            <td>
                                <asp:Label
                                    id="lblproyecto"
                                    runat="server"
                                    Text='<%# GetLocalResourceObject("Apu_Proyecto_NombreRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Apu_Proyecto_Codigo" 
                                    TabIndex="-1"
                                    runat="server"  
                                    ToolTip='<%# GetLocalResourceObject("Apu_Proyecto_CodigoRecursoKCG.ToolTip").ToString() %>'                                   
                                    ReadOnly="TRUE"
                                    Text='<%# Bind("Apu_Proyecto_Codigo") %>'>
                                </asp:TextBox> 
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Apu_Proyecto_Nombre" 
                                    runat="server"   
                                    TabIndex="-1"                                  
                                    ReadOnly="TRUE"
                                    ToolTip='<%# GetLocalResourceObject("Apu_Proyecto_NombreRecursoKCG.ToolTip").ToString() %>'
                                    width="400px"
                                    Height="50px"
                                    TextMode="MultiLine"
                                    CssClass="TEXTO_LECTURA_KCG"
                                    Text='<%# Bind("Apu_Proyecto_Nombre") %>'>
                                </asp:TextBox>                                   
                            </td>
                        </tr>                        
                    </table>
                </asp:Panel>
                <asp:Panel
                    id="Panel2"
                    runat="server"
                    meta:resourcekey="Rec_Apu_Proyecto_Rubro_Mano_Obra_RubroRecursoKCG">
                    <table>
                        <tr align="left">
                            <td>
                                <asp:Label
                                    id="lblrubro"
                                    runat="server"
                                    Text='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td style="white-space:nowrap">
                                <asp:TextBox 
                                    ID="Apu_Rubro_Codigo" 
                                    runat="server"  
                                    TabIndex="-1"                                   
                                    ReadOnly="TRUE"
                                    ToolTip='<%# GetLocalResourceObject("Apu_Rubro_CodigoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Rubro_Codigo") %>'>
                                </asp:TextBox>                    
                                <asp:TextBox 
                                    ID="Apu_Rubro_Nombre" 
                                    runat="server"    
                                    TabIndex="-1"                                 
                                    ReadOnly="TRUE"
                                    width="400px"
                                    ToolTip='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Rubro_Nombre") %>'>
                                </asp:TextBox>                                     
                            </td>
                        </tr>  
                        <tr align="left">
                            <td>
                                <asp:Label
                                    id="lblunidad"
                                    runat="server"
                                    Text='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.Text").ToString() %>'>
                                </asp:Label>    
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Apu_Rubro_Unidad" 
                                    runat="server" 
                                    TabIndex="-1"                                    
                                    ReadOnly="TRUE"
                                    ToolTip='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Rubro_Unidad") %>'>
                                </asp:TextBox>    
                            </td>
                        </tr>                      
                    </table>
                </asp:Panel>
                <asp:Panel 
                    id="pnlManoObra"
                    runat="server"
                    meta:Resourcekey="Rec_Apu_Proyecto_Rubro_Mano_ObraRecursoKCG">
                    <table>
                        <tr align="right">
                            <td colspan="2">
                                <asp:Label 
                                    ID="lblestado" 
                                    runat="server" 
                                    Text='<%# Bind("Estado_Nombre") %>'>
                                </asp:Label>    
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:Label
                                    id="lblmano_obra_nombre"
                                    runat="server"
                                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                    AssociatedControlID="Apu_Mano_Obra_Nombre" 
                                    Text='<%# GetLocalResourceObject("Apu_Mano_Obra_NombreRecursoKCG.Text").ToString() %>'>
                                </asp:Label>    
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Apu_Mano_Obra_Nombre" 
                                    CssClass="TEXTO_COMBOPER_KCG"
                                    runat="server" 
                                    Style="text-transform:uppercase"
                                    Width="400px"
                                    Height="50px"
                                    TextMode="MultiLine" 
                                    ToolTip='<%# GetLocalResourceObject("Apu_Mano_Obra_NombreRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Mano_Obra_Nombre") %>'>
                                </asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" 
                                    ID="rfvApu_Mano_Obra_Nombre"
                                    ControlToValidate="Apu_Mano_Obra_Nombre"
                                    ValidationGroup="I"
                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                   <AjaxControlToolkit:ValidatorCalloutExtender 
                                   runat="Server" ID="vceApu_Mano_obra_Nombre"
                                   TargetControlID="rfvApu_Mano_Obra_Nombre" />
                                <AjaxControlToolkit:AutoCompleteExtender
                                        runat="server" 
                                        BehaviorID="AutoCompleteEx"
                                        ID="autoComplete1" 
                                        TargetControlID="Apu_Mano_Obra_Nombre"
                                        ServicePath="~/APU/APU_PROYECTO_RUBRO_MANO_OBRA.aspx" 
                                        ServiceMethod="GetManoDeObra"
                                        MinimumPrefixLength="1" 
                                        CompletionInterval="500"
                                        EnableCaching="true"
                                        CompletionSetCount="500"
                                        CompletionListCssClass="autocomplete_completionListElement" 
                                        CompletionListItemCssClass="autocomplete_listItem" 
                                        CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                        DelimiterCharacters=""
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
                            </td>
                        </tr>   
                        <tr align="left">
                            <td>
                                <asp:Label
                                    id="lblcategoria"
                                    runat="server"
                                    Text='<%# GetLocalResourceObject("Apu_Categoria_NombreRecursoKCG.Text").ToString() %>'>
                                </asp:Label>    
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Apu_Categoria_Codigo" 
                                    runat="server"  
                                    TabIndex="-1"                                   
                                    ReadOnly="TRUE"
                                    ToolTip='<%# GetLocalResourceObject("Apu_Categoria_CodigoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Categoria_Codigo") %>'>
                                </asp:TextBox>                    
                                <asp:TextBox 
                                    ID="Apu_Categoria_Nombre" 
                                    runat="server"   
                                    TabIndex="-1"                                  
                                    ReadOnly="TRUE"
                                    width="200px"
                                    ToolTip='<%# GetLocalResourceObject("Apu_Categoria_NombreRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Categoria_Nombre") %>'>
                                </asp:TextBox>    
                            </td>
                        </tr>   
                        <tr align="left">
                            <td>
                                <asp:Label
                                    id="lblcantidad"
                                    runat="server"
                                    Text='<%# GetLocalResourceObject("CantidadRecursoKCG.Text").ToString() %>'>
                                </asp:Label>       
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Cantidad" 
                                    runat="server"
                                    style="text-align:right"
                                    CssClass="TEXTO_EDICION_KCG"
                                    ToolTip='<%# GetLocalResourceObject("CantidadRecursoKCG.ToolTip").ToString() %>' 
                                    Text='<%# Bind("Cantidad") %>'>
                                </asp:TextBox> 
                                <AjaxControlToolkit:MaskedEditExtender   
                                    ID="meeCantidad" 
                                    runat="server"
                                    TargetControlID="Cantidad"
                                    Mask="9,999,999,999,999.9999"
                                    MessageValidatorTip="false"
                                    OnFocusCssClass="MaskedEditFocus"
                                    OnInvalidCssClass="MaskedEditError"
                                    MaskType="Number"
                                    InputDirection="RightToLeft"
                                    AcceptNegative="None"
                                    DisplayMoney="None"
                                    ErrorTooltipEnabled="false"
                                    ClearMaskOnLostFocus="True"/>                                       
                                  
                                    <AjaxControlToolkit:MaskedEditValidator ID="MaskedEditValidator2" runat="server"
                                    ControlExtender="meeCantidad"
                                    ControlToValidate="Cantidad"
                                    IsValidEmpty="False"
                                    EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.ErrorMessage").ToString() %>'
                                    InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.ErrorMessage").ToString() %>'
                                    MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.ErrorMessage").ToString() %>'
                                    MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.ErrorMessage").ToString() %>'
                                    MinimumValue="0.0001"
                                    MaximumValue="9999999999999.9999" 
                                    Display="Dynamic"
                                    EmptyValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'
                                    InvalidValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.Text").ToString() %>'
                                    MaximumValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.Text").ToString() %>' 
                                    MinimumValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.Text").ToString() %>'
                                    ValidationGroup="I" />
                                  
                                  <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server" 
                                    ID="ValidatorCalloutExtender1"
                                    TargetControlID="MaskedEditValidator2"/>                                 
                            </td>
                        </tr> 
                        <tr align="left">
                            <td>
                                <asp:Label
                                    id="lblcostohora"
                                    runat="server"
                                    Text='<%# GetLocalResourceObject("costo_horaRecursoKCG.Text").ToString() %>'>
                                </asp:Label>    
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="costo_hora" 
                                    runat="server"                                     
                                    ReadOnly="TRUE"
                                    tabindex="-1"
                                    style="text-align:right"
                                    ToolTip='<%# GetLocalResourceObject("costo_horaRecursoKCG.ToolTip").ToString() %>' 
                                    Text='<%# Bind("costo_hora") %>'>
                                </asp:TextBox> 
                                <asp:Label
                                    id="lblmoneda1"
                                    runat="server"
                                    Text='<%# Bind("int_moneda_simbolo") %>'>
                                </asp:Label>    
                            </td>
                        </tr>   
                        <tr align="left">
                            <td>
                                <asp:Label
                                    id="lblcostohoraxcantidad"
                                    runat="server"
                                    Text='<%# GetLocalResourceObject("costo_hora_x_cantidadRecursoKCG.Text").ToString() %>'>
                                </asp:Label>    
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="costo_hora_x_cantidad" 
                                    runat="server" 
                                    tabindex="-1"
                                    ReadOnly="TRUE"
                                    style="text-align:right"
                                    ToolTip='<%# GetLocalResourceObject("costo_hora_x_cantidadRecursoKCG.ToolTip").ToString() %>' 
                                    Text='<%# Bind("costo_hora_x_cantidad") %>'>
                                </asp:TextBox>
                                <asp:Label
                                    id="lblmoneda2"
                                    runat="server"
                                    Text='<%# Bind("int_moneda_simbolo") %>'>
                                </asp:Label>
                            </td>
                        </tr>  
                        <tr align="left">
                            <td>
                                <asp:Label
                                    id="lblrendimiento"
                                    runat="server"
                                    Text='<%# GetLocalResourceObject("rendimiento_mano_obra_horaRecursoKCG.Text").ToString() %>'>
                                </asp:Label>    
                            </td>
                            <td style="white-space:nowrap">
                                <asp:TextBox 
                                    ID="rendimiento_mano_obra_hora" 
                                    runat="server" 
                                    tabindex="-1"
                                    ReadOnly="TRUE"
                                    style="text-align:right"
                                    ToolTip='<%# GetLocalResourceObject("rendimiento_mano_obra_horaRecursoKCG.ToolTip").ToString() %>' 
                                    Text='<%# Bind("rendimiento_mano_obra_hora") %>'>
                                </asp:TextBox> 
                                 <asp:Label
                                    id="Lblcostototal"
                                    runat="server"
                                    Text='<%# GetLocalResourceObject("costo_x_rendimiento_horaRecursoKCG.Text").ToString() %>'>
                                </asp:Label> 
                                <asp:TextBox 
                                    ID="costo_x_rendimiento_hora" 
                                    runat="server" 
                                    tabindex="-1"
                                    ReadOnly="TRUE"
                                    style="text-align:right"
                                    ToolTip='<%# GetLocalResourceObject("costo_x_rendimiento_horaRecursoKCG.ToolTip").ToString() %>' 
                                    Text='<%# Bind("costo_x_rendimiento_hora") %>'>
                                </asp:TextBox>  
                                <asp:Label
                                    id="Label1"
                                    runat="server"
                                    Text='<%# Bind("int_moneda_simbolo") %>'>
                                </asp:Label> 
                            </td>
                        </tr>            
                        <tr align="left">
                            <td colspan="2">
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
                                     <uc1:wucMensajeActualizar ID="WucMensajeActualizar1" runat="server" />  
                            </td>
                        </tr>
                    </table>                    
                </asp:Panel>
                
                        <%--Id's--%>
                
                        <asp:TextBox 
                            ID="Apu_Proyecto_Rubro_Id" 
                            runat="server" 
                            STYLE="display:none"
                            Visible="true"
                            Text='<%# Bind("Apu_Proyecto_Rubro_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Apu_Mano_Obra_Id" 
                            runat="server"
                            STYLE="display:none"
                            Visible="true" 
                            Text='<%# Bind("Apu_Mano_Obra_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Creacion_Per_Personal_Id" 
                            runat="server" 
                            STYLE="display:none"
                            Visible="true"
                            Text='<%# Bind("Creacion_Per_Personal_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Update_Per_Personal_Id" 
                            runat="server" 
                            STYLE="display:none"
                            Visible="true"
                            Text='<%# Bind("Update_Per_Personal_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Apu_Proyecto_Id" 
                            runat="server"
                            STYLE="display:none"
                            Visible="true" 
                            Text='<%# Bind("Apu_Proyecto_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Apu_Rubro_Id" 
                            runat="server" 
                            STYLE="display:none"
                            Visible="true"
                            Text='<%# Bind("Apu_Rubro_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Apu_Categoria_Id" 
                            runat="server" 
                            STYLE="display:none"
                            Visible="true"
                            Text='<%# Bind("Apu_Categoria_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Id" 
                            runat="server" 
                            STYLE="display:none"
                            Visible="true"
                            Text='<%# Bind("Id") %>'>
                        </asp:TextBox>
                
                     <%--CAMPOS NO VISIBLES--%>
                    
                        <asp:TextBox 
                            ID="Fecha_Creacion" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Fecha_Creacion") %>'>
                        </asp:TextBox>                    
                        <asp:TextBox 
                            ID="Fecha_Update" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Fecha_Update") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Apu_Proyecto_Rubro_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Apu_Proyecto_Rubro_Codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Apu_Proyecto_Etapa" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Apu_Proyecto_Etapa") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Apu_Mano_Obra_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Apu_Mano_Obra_Codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Creacion_Per_Personal_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Creacion_Per_Personal_Codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Creacion_Per_Personal_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Creacion_Per_Personal_Nombre") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Update_Per_Personal_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Update_Per_Personal_Codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Update_Per_Personal_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Update_Per_Personal_Nombre") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="costo_diario" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("costo_diario") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="int_moneda_simbolo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("int_moneda_simbolo") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Estado_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Estado_Nombre") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Codigo" 
                            runat="server"
                            Visible="false" 
                            Text='<%# Bind("Codigo") %>'>
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
                    id="Panel1"
                    runat="server"
                    meta:resourcekey="Rec_Proyecto_Rubro_Mano_Obra_ProyectoRecursoKCG">
                    <table>
                        <tr align="left">
                            <td>
                                <asp:Label
                                    id="lblproyecto"
                                    runat="server"
                                    Text='<%# GetLocalResourceObject("Apu_Proyecto_NombreRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Apu_Proyecto_Codigo" 
                                    runat="server"     
                                    TabIndex="-1"                                 
                                    ReadOnly="TRUE"
                                    Text='<%# Bind("Apu_Proyecto_Codigo") %>'>
                                </asp:TextBox> 
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Apu_Proyecto_Nombre" 
                                    runat="server" 
                                    TabIndex="-1" 
                                    width="400px"
                                    Height="50px"
                                    ReadOnly="TRUE"
                                    TextMode="MultiLine"
                                    CssClass="TEXTO_LECTURA_KCG"
                                    Text='<%# Bind("Apu_Proyecto_Nombre") %>'>
                                </asp:TextBox>                                   
                            </td>
                        </tr>                        
                    </table>
                </asp:Panel>
                <asp:Panel
                    id="Panel2"
                    runat="server"
                    meta:resourcekey="Rec_Apu_Proyecto_Rubro_Mano_Obra_RubroRecursoKCG">
                    <table>
                        <tr align="left">
                            <td>
                                <asp:Label
                                    id="lblrubro"
                                    runat="server"
                                    Text='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Apu_Rubro_Codigo" 
                                    runat="server"  
                                    TabIndex="-1"                                    
                                    ReadOnly="TRUE"
                                    ToolTip='<%# GetLocalResourceObject("Apu_Rubro_CodigoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Rubro_Codigo") %>'>
                                </asp:TextBox>                    
                                <asp:TextBox 
                                    ID="Apu_Rubro_Nombre" 
                                    runat="server"    
                                    TabIndex="-1"                                  
                                    ReadOnly="TRUE"
                                    width="400px"
                                    ToolTip='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Rubro_Nombre") %>'>
                                </asp:TextBox>                                     
                            </td>
                        </tr>  
                        <tr align="left">
                            <td>
                                <asp:Label
                                    id="lblunidad"
                                    runat="server"
                                    Text='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.Text").ToString() %>'>
                                </asp:Label>    
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Apu_Rubro_Unidad" 
                                    runat="server"                                     
                                    ReadOnly="TRUE"
                                    TabIndex="-1" 
                                    ToolTip='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Rubro_Unidad") %>'>
                                </asp:TextBox>    
                            </td>
                        </tr>                      
                    </table>
                </asp:Panel>
                <asp:Panel 
                    id="pnlManoObra"
                    runat="server"
                    meta:Resourcekey="Rec_Apu_Proyecto_Rubro_Mano_ObraRecursoKCG">
                    <table>
                        <tr align="right">
                            <td colspan="2">
                                <asp:Label 
                                    ID="lblestado" 
                                    runat="server" 
                                    Text='<%# Bind("Estado_Nombre") %>'>
                                </asp:Label>    
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:Label
                                    id="lblmano_obra_nombre"
                                    runat="server"
                                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                    AssociatedControlID="Apu_Mano_Obra_Nombre" 
                                    Text='<%# GetLocalResourceObject("Apu_Mano_Obra_NombreRecursoKCG.Text").ToString() %>'>
                                </asp:Label>    
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Apu_Mano_Obra_Nombre" 
                                    CssClass="TEXTO_COMBOPER_KCG"
                                    runat="server" 
                                    Style="text-transform:uppercase"
                                    Width="400px"
                                    Height="50px"
                                    TextMode="MultiLine"
                                    ToolTip='<%# GetLocalResourceObject("Apu_Mano_Obra_NombreRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Mano_Obra_Nombre") %>'>
                                </asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" 
                                    ID="rfvApu_Mano_Obra_Nombre"
                                    ControlToValidate="Apu_Mano_Obra_Nombre"
                                    ValidationGroup="I"
                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                   <AjaxControlToolkit:ValidatorCalloutExtender 
                                   runat="Server" ID="vceApu_Mano_obra_Nombre"
                                   TargetControlID="rfvApu_Mano_Obra_Nombre" />
                                <AjaxControlToolkit:AutoCompleteExtender
                                        runat="server" 
                                        BehaviorID="AutoCompleteEx"
                                        ID="autoComplete1" 
                                        TargetControlID="Apu_Mano_Obra_Nombre"
                                        ServicePath="~/APU/APU_PROYECTO_RUBRO_MANO_OBRA.aspx" 
                                        ServiceMethod="GetManoDeObra"
                                        MinimumPrefixLength="1" 
                                        CompletionInterval="500"
                                        EnableCaching="true"
                                        CompletionSetCount="500"
                                        CompletionListCssClass="autocomplete_completionListElement" 
                                        CompletionListItemCssClass="autocomplete_listItem" 
                                        CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                        DelimiterCharacters=""
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
                                    
                                <%-- Prevent enter in textbox from causing the collapsible panel from operating --%>
                                <input type="submit" style="display:none;" value="Submit Query" />
                            </td>
                        </tr>   
                        <tr align="left">
                            <td>
                                <asp:Label
                                    id="lblcategoria"
                                    runat="server"
                                    Text='<%# GetLocalResourceObject("Apu_Categoria_NombreRecursoKCG.Text").ToString() %>'>
                                </asp:Label>    
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Apu_Categoria_Codigo" 
                                    runat="server" 
                                    TabIndex="-1"
                                    ReadOnly="TRUE"
                                    ToolTip='<%# GetLocalResourceObject("Apu_Categoria_CodigoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Categoria_Codigo") %>'>
                                </asp:TextBox>                    
                                <asp:TextBox 
                                    ID="Apu_Categoria_Nombre" 
                                    runat="server"       
                                    TabIndex="-1"                              
                                    ReadOnly="TRUE"
                                    ToolTip='<%# GetLocalResourceObject("Apu_Categoria_NombreRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Categoria_Nombre") %>'>
                                </asp:TextBox>    
                            </td>
                        </tr>   
                        <tr align="left">
                            <td>
                                <asp:Label
                                    id="lblcantidad"
                                    runat="server"
                                    Text='<%# GetLocalResourceObject("CantidadRecursoKCG.Text").ToString() %>'>
                                </asp:Label>       
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Cantidad" 
                                    runat="server"
                                    CssClass="TEXTO_EDICION_KCG"
                                    style="text-align:right"
                                    ToolTip='<%# GetLocalResourceObject("CantidadRecursoKCG.ToolTip").ToString() %>' 
                                    Text='<%# Bind("Cantidad") %>'>
                                </asp:TextBox> 
                                <AjaxControlToolkit:MaskedEditExtender   
                                    ID="meeCantidad" 
                                    runat="server"
                                    TargetControlID="Cantidad"
                                    Mask="9,999,999,999,999.9999"
                                    MessageValidatorTip="false"
                                    OnFocusCssClass="MaskedEditFocus"
                                    OnInvalidCssClass="MaskedEditError"
                                    MaskType="Number"
                                    InputDirection="RightToLeft"
                                    AcceptNegative="None"
                                    DisplayMoney="None"
                                    ErrorTooltipEnabled="false"
                                    ClearMaskOnLostFocus="True"/>                                       
                                  
                                    <AjaxControlToolkit:MaskedEditValidator ID="MaskedEditValidator2" runat="server"
                                    ControlExtender="meeCantidad"
                                    ControlToValidate="Cantidad"
                                    IsValidEmpty="False"
                                    EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.ErrorMessage").ToString() %>'
                                    InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.ErrorMessage").ToString() %>'
                                    MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.ErrorMessage").ToString() %>'
                                    MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.ErrorMessage").ToString() %>'
                                    MinimumValue="0.0001"
                                    MaximumValue="9999999999999.9999" 
                                    Display="Dynamic"
                                    EmptyValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'
                                    InvalidValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.Text").ToString() %>'
                                    MaximumValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.Text").ToString() %>' 
                                    MinimumValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.Text").ToString() %>'
                                    ValidationGroup="I" />
                                  
                                  <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server" 
                                    ID="ValidatorCalloutExtender1"
                                    TargetControlID="MaskedEditValidator2"/>   
                                
                                
                                
                            </td>
                        </tr> 
                        <tr align="left">
                            <td>
                                <asp:Label
                                    id="lblcostohora"
                                    runat="server"
                                    Text='<%# GetLocalResourceObject("costo_horaRecursoKCG.Text").ToString() %>'>
                                </asp:Label>    
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="costo_hora" 
                                    runat="server" 
                                    tabindex="-1"
                                    ReadOnly="TRUE"
                                    style="text-align:right"
                                    ToolTip='<%# GetLocalResourceObject("costo_horaRecursoKCG.ToolTip").ToString() %>' 
                                    Text='<%# Bind("costo_hora") %>'>
                                </asp:TextBox> 
                                <asp:Label
                                    id="lblmoneda1"
                                    runat="server"
                                    Text='<%# Bind("int_moneda_simbolo") %>'>
                                </asp:Label>    
                            </td>
                        </tr>   
                        <tr align="left">
                            <td>
                                <asp:Label
                                    id="lblcostohoraxcantidad"
                                    runat="server"
                                    Text='<%# GetLocalResourceObject("costo_hora_x_cantidadRecursoKCG.Text").ToString() %>'>
                                </asp:Label>    
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="costo_hora_x_cantidad" 
                                    runat="server" 
                                    tabindex="-1"
                                    ReadOnly="TRUE"
                                    style="text-align:right"
                                    ToolTip='<%# GetLocalResourceObject("costo_hora_x_cantidadRecursoKCG.ToolTip").ToString() %>' 
                                    Text='<%# Bind("costo_hora_x_cantidad") %>'>
                                </asp:TextBox>
                                <asp:Label
                                    id="lblmoneda2"
                                    runat="server"
                                    Text='<%# Bind("int_moneda_simbolo") %>'>
                                </asp:Label>
                            </td>
                        </tr>  
                        <tr align="left">
                            <td>
                                <asp:Label
                                    id="lblrendimiento"
                                    runat="server"
                                    Text='<%# GetLocalResourceObject("rendimiento_mano_obra_horaRecursoKCG.Text").ToString() %>'>
                                </asp:Label>    
                            </td>
                            <td style="white-space:nowrap">
                                <asp:TextBox 
                                    ID="rendimiento_mano_obra_hora" 
                                    runat="server" 
                                    tabindex="-1"
                                    ReadOnly="TRUE"
                                    style="text-align:right"
                                    ToolTip='<%# GetLocalResourceObject("rendimiento_mano_obra_horaRecursoKCG.ToolTip").ToString() %>' 
                                    Text='<%# Bind("rendimiento_mano_obra_hora") %>'>
                                </asp:TextBox> 
                                 <asp:Label
                                    id="Lblcostototal"
                                    runat="server"
                                    Text='<%# GetLocalResourceObject("costo_x_rendimiento_horaRecursoKCG.Text").ToString() %>'>
                                </asp:Label> 
                                <asp:TextBox 
                                    ID="costo_x_rendimiento_hora" 
                                    runat="server" 
                                    tabindex="-1"
                                    ReadOnly="TRUE"
                                    style="text-align:right"
                                    ToolTip='<%# GetLocalResourceObject("costo_x_rendimiento_horaRecursoKCG.ToolTip").ToString() %>' 
                                    Text='<%# Bind("costo_x_rendimiento_hora") %>'>
                                </asp:TextBox>  
                                <asp:Label
                                    id="Label1"
                                    runat="server"
                                    Text='<%# Bind("int_moneda_simbolo") %>'>
                                </asp:Label> 
                            </td>
                        </tr>            
                        <tr align="left">
                            <td colspan="4">
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
                </asp:Panel>
                
                        <%--Id's--%>
                
                        <asp:TextBox 
                            ID="Apu_Proyecto_Rubro_Id" 
                            runat="server" 
                            STYLE="display:none"
                            Visible="true"
                            Text='<%# Bind("Apu_Proyecto_Rubro_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Apu_Mano_Obra_Id" 
                            runat="server"
                            STYLE="display:none"
                            Visible="true" 
                            Text='<%# Bind("Apu_Mano_Obra_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Creacion_Per_Personal_Id" 
                            runat="server" 
                            STYLE="display:none"
                            Visible="true"
                            Text='<%# Bind("Creacion_Per_Personal_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Update_Per_Personal_Id" 
                            runat="server" 
                            STYLE="display:none"
                            Visible="true"
                            Text='<%# Bind("Update_Per_Personal_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Apu_Proyecto_Id" 
                            runat="server"
                            STYLE="display:none"
                            Visible="true" 
                            Text='<%# Bind("Apu_Proyecto_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Apu_Rubro_Id" 
                            runat="server" 
                            STYLE="display:none"
                            Visible="true"
                            Text='<%# Bind("Apu_Rubro_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Apu_Categoria_Id" 
                            runat="server" 
                            STYLE="display:none"
                            Visible="true"
                            Text='<%# Bind("Apu_Categoria_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Id" 
                            runat="server" 
                            STYLE="display:none"
                            Visible="true"
                            Text='<%# Bind("Id") %>'>
                        </asp:TextBox>
                
                     <%--CAMPOS NO VISIBLES--%>
                    
                        <asp:TextBox 
                            ID="Fecha_Creacion" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Fecha_Creacion") %>'>
                        </asp:TextBox>                    
                        <asp:TextBox 
                            ID="Fecha_Update" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Fecha_Update") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Apu_Proyecto_Rubro_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Apu_Proyecto_Rubro_Codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Apu_Proyecto_Etapa" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Apu_Proyecto_Etapa") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Apu_Mano_Obra_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Apu_Mano_Obra_Codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Creacion_Per_Personal_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Creacion_Per_Personal_Codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Creacion_Per_Personal_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Creacion_Per_Personal_Nombre") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Update_Per_Personal_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Update_Per_Personal_Codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Update_Per_Personal_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Update_Per_Personal_Nombre") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="costo_diario" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("costo_diario") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="int_moneda_simbolo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("int_moneda_simbolo") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Estado_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Estado_Nombre") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Codigo" 
                            runat="server"
                            Visible="false" 
                            Text='<%# Bind("Codigo") %>'>
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
                    id="Panel1"
                    runat="server"
                    meta:resourcekey="Rec_Proyecto_Rubro_Mano_Obra_ProyectoRecursoKCG">
                    <table >
                        <tr align="left">
                            <td>
                                <asp:Label
                                    id="lblproyecto"
                                    runat="server"
                                    Text='<%# GetLocalResourceObject("Apu_Proyecto_NombreRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Apu_Proyecto_Codigo" 
                                    runat="server"    
                                    TabIndex="-1"                                 
                                    ReadOnly="TRUE"
                                    Text='<%# Bind("Apu_Proyecto_Codigo") %>'>
                                </asp:TextBox> 
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Apu_Proyecto_Nombre" 
                                    runat="server" 
                                    TabIndex="-1"
                                    width="400px"
                                    Height="50px"
                                    ReadOnly="TRUE"
                                    TextMode="MultiLine"
                                    CssClass="TEXTO_LECTURA_KCG"
                                    Text='<%# Bind("Apu_Proyecto_Nombre") %>'>
                                </asp:TextBox>                                   
                            </td>
                        </tr>                        
                    </table>
                </asp:Panel>
                <asp:Panel
                    id="Panel2"
                    runat="server"
                    meta:resourcekey="Rec_Apu_Proyecto_Rubro_Mano_Obra_RubroRecursoKCG">
                    <table style="white-space:nowrap">
                        <tr align="left">
                            <td>
                                <asp:Label
                                    id="lblrubro"
                                    runat="server"
                                    Text='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Apu_Rubro_Codigo" 
                                    runat="server" 
                                    TabIndex="-1"
                                    ReadOnly="TRUE"
                                    ToolTip='<%# GetLocalResourceObject("Apu_Rubro_CodigoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Rubro_Codigo") %>'>
                                </asp:TextBox>                    
                                <asp:TextBox 
                                    ID="Apu_Rubro_Nombre" 
                                    runat="server" 
                                    TabIndex="-1"
                                    ReadOnly="TRUE"
                                    width="400px"
                                    ToolTip='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Rubro_Nombre") %>'>
                                </asp:TextBox>                                     
                            </td>
                        </tr>  
                        <tr align="left">
                            <td>
                                <asp:Label
                                    id="lblunidad"
                                    runat="server"
                                    Text='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.Text").ToString() %>'>
                                </asp:Label>    
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Apu_Rubro_Unidad" 
                                    runat="server" 
                                    TabIndex="-1"
                                    ReadOnly="TRUE"
                                    ToolTip='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Rubro_Unidad") %>'>
                                </asp:TextBox>    
                            </td>
                        </tr>                      
                    </table>
                </asp:Panel>
                <asp:Panel 
                    id="pnlManoObra"
                    runat="server"
                    meta:Resourcekey="Rec_Apu_Proyecto_Rubro_Mano_ObraRecursoKCG">
                    <table>
                        <tr align="right">
                            <td colspan="2">
                                <asp:Label 
                                    ID="lblestado" 
                                    runat="server" 
                                    Text='<%# Bind("Estado_Nombre") %>'>
                                </asp:Label>    
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:Label
                                    id="lblmano_obra_nombre"
                                    runat="server"                                    
                                    Text='<%# GetLocalResourceObject("Apu_Mano_Obra_NombreRecursoKCG.Text").ToString() %>'>
                                </asp:Label>    
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Apu_Mano_Obra_Nombre"                                     
                                    runat="server"  
                                    TabIndex="-1"
                                    Height="50px"  
                                    TextMode="MultiLine"  
                                    CssClass="TEXTO_LECTURA_KCG"                                 
                                    Width="400px"
                                    ReadOnly="true"
                                    ToolTip='<%# GetLocalResourceObject("Apu_Mano_Obra_NombreRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Mano_Obra_Nombre") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>   
                        <tr align="left">
                            <td>
                                <asp:Label
                                    id="lblcategoria"
                                    runat="server"
                                    Text='<%# GetLocalResourceObject("Apu_Categoria_NombreRecursoKCG.Text").ToString() %>'>
                                </asp:Label>    
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Apu_Categoria_Codigo" 
                                    runat="server"      
                                    TabIndex="-1"                               
                                    ReadOnly="TRUE"
                                    ToolTip='<%# GetLocalResourceObject("Apu_Categoria_CodigoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Categoria_Codigo") %>'>
                                </asp:TextBox>                    
                                <asp:TextBox 
                                    ID="Apu_Categoria_Nombre" 
                                    runat="server" 
                                    TabIndex="-1"
                                    ReadOnly="TRUE"
                                    ToolTip='<%# GetLocalResourceObject("Apu_Categoria_NombreRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Categoria_Nombre") %>'>
                                </asp:TextBox>    
                            </td>
                        </tr>   
                        <tr align="left">
                            <td>
                                <asp:Label
                                    id="lblcantidad"
                                    runat="server"
                                    Text='<%# GetLocalResourceObject("CantidadRecursoKCG.Text").ToString() %>'>
                                </asp:Label>       
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Cantidad" 
                                    runat="server"
                                    TabIndex="-1"
                                    style="text-align:right"
                                    ToolTip='<%# GetLocalResourceObject("CantidadRecursoKCG.ToolTip").ToString() %>' 
                                    Text='<%# Bind("Cantidad") %>'>
                                </asp:TextBox>                                 
                            </td>
                        </tr> 
                        <tr align="left">
                            <td>
                                <asp:Label
                                    id="lblcostohora"
                                    runat="server"
                                    Text='<%# GetLocalResourceObject("costo_horaRecursoKCG.Text").ToString() %>'>
                                </asp:Label>    
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="costo_hora" 
                                    runat="server" 
                                    TabIndex="-1"                                   
                                    ReadOnly="TRUE"
                                    style="text-align:right"
                                    ToolTip='<%# GetLocalResourceObject("costo_horaRecursoKCG.ToolTip").ToString() %>' 
                                    Text='<%# Bind("costo_hora") %>'>
                                </asp:TextBox> 
                                <asp:Label
                                    id="lblmoneda1"
                                    runat="server"
                                    Text='<%# Bind("int_moneda_simbolo") %>'>
                                </asp:Label>    
                            </td>
                        </tr>   
                        <tr align="left">
                            <td>
                                <asp:Label
                                    id="lblcostohoraxcantidad"
                                    runat="server"
                                    Text='<%# GetLocalResourceObject("costo_hora_x_cantidadRecursoKCG.Text").ToString() %>'>
                                </asp:Label>    
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="costo_hora_x_cantidad" 
                                    runat="server"    
                                    TabIndex="-1"                                 
                                    ReadOnly="TRUE"
                                    style="text-align:right"
                                    ToolTip='<%# GetLocalResourceObject("costo_hora_x_cantidadRecursoKCG.ToolTip").ToString() %>' 
                                    Text='<%# Bind("costo_hora_x_cantidad") %>'>
                                </asp:TextBox>
                                <asp:Label
                                    id="lblmoneda2"
                                    runat="server"
                                    Text='<%# Bind("int_moneda_simbolo") %>'>
                                </asp:Label>
                            </td>
                        </tr>  
                        <tr align="left">
                            <td>
                                <asp:Label
                                    id="lblrendimiento"
                                    runat="server"
                                    Text='<%# GetLocalResourceObject("rendimiento_mano_obra_horaRecursoKCG.Text").ToString() %>'>
                                </asp:Label>    
                            </td>
                            <td style="white-space:nowrap">
                                <asp:TextBox 
                                    ID="rendimiento_mano_obra_hora" 
                                    runat="server" 
                                    TabIndex="-1"
                                    ReadOnly="TRUE"
                                    style="text-align:right"
                                    ToolTip='<%# GetLocalResourceObject("rendimiento_mano_obra_horaRecursoKCG.ToolTip").ToString() %>' 
                                    Text='<%# Bind("rendimiento_mano_obra_hora") %>'>
                                </asp:TextBox> 
                                <asp:Label
                                    id="Lblcostototal"
                                    runat="server"
                                    Text='<%# GetLocalResourceObject("costo_x_rendimiento_horaRecursoKCG.Text").ToString() %>'>
                                </asp:Label> 
                                <asp:TextBox 
                                    ID="costo_x_rendimiento_hora" 
                                    runat="server" 
                                    TabIndex="-1"
                                    ReadOnly="TRUE"
                                    style="text-align:right"
                                    ToolTip='<%# GetLocalResourceObject("costo_x_rendimiento_horaRecursoKCG.ToolTip").ToString() %>' 
                                    Text='<%# Bind("costo_x_rendimiento_hora") %>'>
                                </asp:TextBox>  
                                <asp:Label
                                    id="Label1"
                                    runat="server"
                                    Text='<%# Bind("int_moneda_simbolo") %>'>
                                </asp:Label> 
                            </td>
                        </tr>                                    
                        <tr>
                            <td colspan="2">
                                <asp:Button 
                                    ID="EditButton" 
                                    runat="server"
                                    CausesValidation="False" 
                                    CommandName="Edit"
                                    Enabled='<%# HER.PermisosMovimientos.Movimiento_Apu_Proyecto_Rubro_Mano_Obra(Request.QueryString["Estado"], Request.QueryString["Apu_Presupuesto_Estado"], HER.PermisosMovimientos.ModoOperacion.Editar ) %>'
                                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_EditarRecursoKCG.AccesKey").ToString() %>'  
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_EditRecursoKCG.Text").ToString() %>'
                                    ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_EditRecursoKCG.ToolTip").ToString() %>'>
                                </asp:Button>
                                <asp:Button 
                                    ID="DeleteButton" 
                                    runat="server" 
                                    CausesValidation="False" 
                                    CommandName="Delete"
                                    Enabled='<%# HER.PermisosMovimientos.Movimiento_Apu_Proyecto_Rubro_Mano_Obra(Request.QueryString["Estado"], Request.QueryString["Apu_Presupuesto_Estado"], HER.PermisosMovimientos.ModoOperacion.Eliminar ) %>'
                                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_EliminarRecursoKCG.AccesKey").ToString() %>'  
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_DeleteRecursoKCG.Text").ToString() %>'
                                    ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_DeleteRecursoKCG.ToolTip").ToString() %>'>
                                </asp:Button>
                                <asp:Button 
                                    ID="NewButton" 
                                    runat="server" 
                                    CausesValidation="False" 
                                    CommandName="New"
                                    Enabled='<%# HER.PermisosMovimientos.Movimiento_Apu_Proyecto_Rubro_Mano_Obra(Request.QueryString["Estado"], Request.QueryString["Apu_Presupuesto_Estado"], HER.PermisosMovimientos.ModoOperacion.Nuevo ) %>'
                                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_NuevoRecursoKCG.AccesKey").ToString() %>'  
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_NewRecursoKCG.Text").ToString() %>'
                                    ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_NewRecursoKCG.ToolTip").ToString() %>'>
                                </asp:Button>
                                <uc2:wucMensajeEliminar ID="WucMensajeEliminar1" runat="server" /> 
                            </td>
                        </tr>
                    </table>                    
                </asp:Panel>
                
                        <%--Id's--%>
                
                        <asp:TextBox 
                            ID="Apu_Proyecto_Rubro_Id" 
                            runat="server" 
                            STYLE="display:none"
                            Visible="true"
                            Text='<%# Bind("Apu_Proyecto_Rubro_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Apu_Mano_Obra_Id" 
                            runat="server"
                            STYLE="display:none"
                            Visible="true" 
                            Text='<%# Bind("Apu_Mano_Obra_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Creacion_Per_Personal_Id" 
                            runat="server" 
                            STYLE="display:none"
                            Visible="true"
                            Text='<%# Bind("Creacion_Per_Personal_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Update_Per_Personal_Id" 
                            runat="server" 
                            STYLE="display:none"
                            Visible="true"
                            Text='<%# Bind("Update_Per_Personal_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Apu_Proyecto_Id" 
                            runat="server"
                            STYLE="display:none"
                            Visible="true" 
                            Text='<%# Bind("Apu_Proyecto_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Apu_Rubro_Id" 
                            runat="server" 
                            STYLE="display:none"
                            Visible="true"
                            Text='<%# Bind("Apu_Rubro_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Apu_Categoria_Id" 
                            runat="server" 
                            STYLE="display:none"
                            Visible="true"
                            Text='<%# Bind("Apu_Categoria_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Id" 
                            runat="server" 
                            STYLE="display:none"
                            Visible="true"
                            Text='<%# Bind("Id") %>'>
                        </asp:TextBox>
                
                     <%--CAMPOS NO VISIBLES--%>
                    
                        <asp:TextBox 
                            ID="Fecha_Creacion" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Fecha_Creacion") %>'>
                        </asp:TextBox>                    
                        <asp:TextBox 
                            ID="Fecha_Update" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Fecha_Update") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Apu_Proyecto_Rubro_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Apu_Proyecto_Rubro_Codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Apu_Proyecto_Etapa" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Apu_Proyecto_Etapa") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Apu_Mano_Obra_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Apu_Mano_Obra_Codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Creacion_Per_Personal_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Creacion_Per_Personal_Codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Creacion_Per_Personal_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Creacion_Per_Personal_Nombre") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Update_Per_Personal_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Update_Per_Personal_Codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Update_Per_Personal_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Update_Per_Personal_Nombre") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="costo_diario" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("costo_diario") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="int_moneda_simbolo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("int_moneda_simbolo") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Estado_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Estado_Nombre") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Codigo" 
                            runat="server"
                            Visible="false" 
                            Text='<%# Bind("Codigo") %>'>
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
            <koala:KNavegacion ID="nav"
                runat="server"
                GridViewID="gvapu_proyecto_rubro_mano_obra"
                FormViewID="FormView1" OnNavegar="nav_Siguiente" />           
        </ContentTemplate> 
        <Triggers>
            <asp:AsyncPostBackTrigger 
                ControlID="gvapu_proyecto_rubro_mano_obra" 
                EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>   
    <asp:ObjectDataSource 
        ID="odsapu_proyecto_rubro_mano_obra" 
        runat="server" 
        ConflictDetection="CompareAllValues"
        DeleteMethod="Delete" 
        InsertMethod="Insert" 
        OldValuesParameterFormatString="original{0}"
        SelectMethod="GetById" 
        SortParameterName="sortExpression" 
        TypeName="FEL.APU.BO_Apu_Proyecto_Rubro_Mano_Obra"
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
                    <koala:KFiltro 
                        ID="kftFiltro" 
                        runat="server" 
                        Contenedor="APU_PROYECTO_RUBRO_MANO_OBRA" 
                        Objeto="APU_PROYECTO_RUBRO_MANO_OBRA" 
                        IndiceScope ="Scope"
                        Orden="1"
                        ObjectDataSourceID="odsgvapu_proyecto_rubro_mano_obra" />
                </td>
                <td>
                    <asp:Button 
                        ID="BtnProyectoRubro" 
                        runat="server"                           
                        OnClick="BtnProyectoRubro_Click"/>
                </td>
            </tr> 
        </table>            
            <asp:Panel 
                runat="server"
                id="pnlDatosGrid"
                meta:resourcekey="Rec_Listado_Apu_Proyecto_Rubro_Mano_ObraRecursoKCG">                 
                <koala:KGrid  
                ID="gvapu_proyecto_rubro_mano_obra" 
                runat="server"
                AllowPaging="True" 
                AllowSorting="True"
                AutoGenerateColumns="False"
                AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>'                                 
                DataKeyNames="Id" 
                DataSourceID="odsgvapu_proyecto_rubro_mano_obra">
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
                        DataField="Apu_Mano_Obra_Codigo" 
                        meta:resourcekey="BoundApu_Mano_Obra_CodigoRecursoKCG"
                        SortExpression="Apu_Mano_Obra_Codigo" >
                        <itemstyle horizontalalign="Right" />
                    </asp:BoundField>
                    <asp:BoundField 
                        DataField="Apu_Mano_Obra_Nombre" 
                        meta:resourcekey="BoundApu_Mano_Obra_NombreRecursoKCG"
                        SortExpression="Apu_Mano_Obra_Nombre">
                        <itemstyle wrap="False" width="80mm" />
                    </asp:BoundField>                    
                    <asp:BoundField 
                        DataField="Cantidad" 
                        meta:resourcekey="BoundCantidadRecursoKCG" 
                        SortExpression="Cantidad" 
                        dataformatstring="{0:N4}">
                        <itemstyle horizontalalign="Right" />
                    </asp:BoundField>
                    <asp:BoundField 
                        DataField="costo_hora" 
                        meta:resourcekey="Boundcosto_horaRecursoKCG"
                        SortExpression="costo_hora" 
                        dataformatstring="{0:N4}">
                        <itemstyle horizontalalign="Right" />
                    </asp:BoundField>
                    <asp:BoundField 
                        DataField="costo_hora_x_cantidad" 
                        meta:resourcekey="Boundcosto_hora_x_cantidadRecursoKCG"
                        SortExpression="costo_hora_x_cantidad" 
                        dataformatstring="{0:N4}">
                        <itemstyle horizontalalign="Right" />
                    </asp:BoundField>
                    <asp:BoundField 
                        DataField="rendimiento_mano_obra_hora" 
                        meta:resourcekey="Boundrendimiento_mano_obra_horaRecursoKCG"
                        SortExpression="rendimiento_mano_obra_hora" 
                        dataformatstring="{0:N4}">
                        <itemstyle horizontalalign="Right" />
                    </asp:BoundField>
                    <asp:BoundField 
                        DataField="costo_x_rendimiento_hora" 
                        meta:resourcekey="Boundcosto_x_rendimiento_horaRecursoKCG"
                        SortExpression="costo_x_rendimiento_hora" 
                        dataformatstring="{0:N4}">
                        <itemstyle horizontalalign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Apu_Proyecto_Rubro_Id" HeaderText="Apu_Proyecto_Rubro_Id"
                        SortExpression="Apu_Proyecto_Rubro_Id" Visible="False" />
                    <asp:BoundField DataField="Apu_Mano_Obra_Id" HeaderText="Apu_Mano_Obra_Id" SortExpression="Apu_Mano_Obra_Id"
                        Visible="False" />
                    <asp:BoundField DataField="Fecha_Creacion" HeaderText="Fecha_Creacion" SortExpression="Fecha_Creacion"
                        Visible="False" />
                    <asp:BoundField DataField="Creacion_Per_Personal_Id" HeaderText="Creacion_Per_Personal_Id"
                        SortExpression="Creacion_Per_Personal_Id" Visible="False" />
                    <asp:BoundField DataField="Fecha_Update" HeaderText="Fecha_Update" SortExpression="Fecha_Update"
                        Visible="False" />
                    <asp:BoundField DataField="Update_Per_Personal_Id" HeaderText="Update_Per_Personal_Id"
                        SortExpression="Update_Per_Personal_Id" Visible="False" />
                    <asp:BoundField DataField="Apu_Proyecto_Rubro_Codigo" HeaderText="Apu_Proyecto_Rubro_Codigo"
                        SortExpression="Apu_Proyecto_Rubro_Codigo" Visible="False" />
                    <asp:BoundField DataField="Apu_Proyecto_Id" HeaderText="Apu_Proyecto_Id" SortExpression="Apu_Proyecto_Id"
                        Visible="False" />
                    <asp:BoundField DataField="Apu_Proyecto_Codigo" HeaderText="Apu_Proyecto_Codigo"
                        SortExpression="Apu_Proyecto_Codigo" Visible="False" />
                    <asp:BoundField DataField="Apu_Proyecto_Nombre" HeaderText="Apu_Proyecto_Nombre"
                        SortExpression="Apu_Proyecto_Nombre" Visible="False" />
                    <asp:BoundField DataField="Apu_Proyecto_Etapa" HeaderText="Apu_Proyecto_Etapa" SortExpression="Apu_Proyecto_Etapa"
                        Visible="False" />
                    <asp:BoundField DataField="Apu_Rubro_Id" HeaderText="Apu_Rubro_Id" SortExpression="Apu_Rubro_Id"
                        Visible="False" />
                    <asp:BoundField DataField="Apu_Rubro_Codigo" HeaderText="Apu_Rubro_Codigo" SortExpression="Apu_Rubro_Codigo"
                        Visible="False" />
                    <asp:BoundField DataField="Apu_Rubro_Nombre" HeaderText="Apu_Rubro_Nombre" SortExpression="Apu_Rubro_Nombre"
                        Visible="False" />
                    <asp:BoundField DataField="Apu_Rubro_Unidad" HeaderText="Apu_Rubro_Unidad" SortExpression="Apu_Rubro_Unidad"
                        Visible="False" />
                    <asp:BoundField DataField="Apu_Categoria_Id" HeaderText="Apu_Categoria_Id" SortExpression="Apu_Categoria_Id"
                        Visible="False" />
                    <asp:BoundField DataField="Apu_Categoria_Codigo" HeaderText="Apu_Categoria_Codigo"
                        SortExpression="Apu_Categoria_Codigo" Visible="False" />
                    <asp:BoundField DataField="Apu_Categoria_Nombre" HeaderText="Apu_Categoria_Nombre"
                        SortExpression="Apu_Categoria_Nombre" Visible="False" />
                    <asp:BoundField DataField="Creacion_Per_Personal_Codigo" HeaderText="Creacion_Per_Personal_Codigo"
                        SortExpression="Creacion_Per_Personal_Codigo" Visible="False" />
                    <asp:BoundField DataField="Creacion_Per_Personal_Nombre" HeaderText="Creacion_Per_Personal_Nombre"
                        SortExpression="Creacion_Per_Personal_Nombre" Visible="False" />
                    <asp:BoundField DataField="Update_Per_Personal_Codigo" HeaderText="Update_Per_Personal_Codigo"
                        SortExpression="Update_Per_Personal_Codigo" Visible="False" />
                    <asp:BoundField DataField="Update_Per_Personal_Nombre" HeaderText="Update_Per_Personal_Nombre"
                        SortExpression="Update_Per_Personal_Nombre" Visible="False" />
                    <asp:BoundField DataField="costo_diario" HeaderText="costo_diario" SortExpression="costo_diario"
                        Visible="False" />
                    <asp:BoundField DataField="int_moneda_simbolo" HeaderText="int_moneda_simbolo" SortExpression="int_moneda_simbolo"
                        Visible="False" />
                    <asp:BoundField DataField="Estado_Nombre" HeaderText="Estado_Nombre" SortExpression="Estado_Nombre"
                        Visible="False" />
                    <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" Visible="False" />
                    <asp:BoundField DataField="Codigo" HeaderText="Codigo" SortExpression="Codigo_int" Visible="False" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" Visible="False" />
                    <asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado" Visible="False" />
                </Columns>
                </koala:KGrid>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:ObjectDataSource 
        ID="odsgvapu_proyecto_rubro_mano_obra" 
        runat="server" 
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetByRubro" 
        TypeName="FEL.APU.BO_Apu_Proyecto_Rubro_Mano_Obra">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
            <asp:QueryStringParameter Name="Apu_Proyecto_Rubro_id" QueryStringField="Apu_Proyecto_Rubro_id"
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

