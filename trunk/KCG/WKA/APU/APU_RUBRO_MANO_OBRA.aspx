<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="APU_RUBRO_MANO_OBRA.aspx.cs" 
    Inherits="APU_APU_RUBRO_MANO_OBRA" 
    meta:resourcekey="Tit_Apu_Rubro_Mano_ObraRecursoKCG" 
    Theme="EstiloKCG"
    StylesheetTheme="EstiloKCG" %>
    
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
            <asp:FormView 
                ID="fvapu_rubro_mano_obra" 
                runat="server" 
                DataSourceID="odsapu_rubro_mano_obra"
                DefaultMode="Insert">
                <EditItemTemplate>
                    <asp:Panel
                        runat="server"
                        id="Panel1"
                        meta:resourcekey="Rec_Apu_Rubro_Mano_Obra_RubroRecursoKCG">
                        <table>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblrubro" 
                                        runat="server" 
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                        AssociatedControlID="Apu_Rubro_Codigo"
                                        Text='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td> 
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Rubro_Codigo" 
                                        runat="server"                                        
                                        TabIndex="-1"  
                                        Readonly="true"                                                                             
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Rubro_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Apu_Rubro_Nombre" 
                                        runat="server"                                         
                                        Readonly="true"
                                        TabIndex="-1"  
                                        width="300px"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Rubro_Nombre") %>'>
                                       <%-- autocomplete="off" >--%>
                                    </asp:TextBox>    
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblunidad" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Rubro_Unidad" 
                                        runat="server"                                         
                                        Readonly="true"
                                        TabIndex="-1"  
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Rubro_Unidad") %>'>
                                    </asp:TextBox>    
                                </td>
                            </tr>    
                        </table>  
                    </asp:Panel>  
                    <asp:Panel
                        runat="server"
                        id="Panel2"
                        meta:resourcekey="Rec_Apu_Rubro_Mano_ObraRecursoKCG">
                        <table>
                            <tr  align="right">
                                <td colspan="2">
                                    <asp:Label 
                                        ID="lblestadonombre" 
                                        runat="server" 
                                        Text='<%# Bind("Estado_Nombre") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr align="left">  
                                <td>
                                    <asp:Label 
                                        ID="lblmanoobra" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Apu_Mano_Obra_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td 
                                    colspan="3">
                                    <asp:TextBox 
                                        ID="Apu_Mano_Obra_Nombre" 
                                        runat="server" 
                                        Style="text-transform:uppercase"
                                        CssClass="TEXTO_COMBOPER_KCG"
                                        width="400px"
                                        Height="50px"
                                        TextMode ="MultiLine" 
                                        ToolTip='<%# GetLocalResourceObject("Apu_Mano_Obra_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Mano_Obra_Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:Button 
                                        ID="btnZoomManoObra" 
                                        runat="server" 
                                        CommandArgument="RutaDestino: ~/APU/APU_MANO_OBRA.aspx; Filtro: Apu_Mano_Obra_Nombre; Obtener: costo_hora|Costo_Hora"
                                        CommandName="Zoom" 
                                        Text="..." />                                    
                                    <asp:RequiredFieldValidator 
                                        runat="server" 
                                        ID="rfvnombre"
                                        ControlToValidate="Apu_Mano_Obra_Nombre"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/>   
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server"  ID="arvGeneral"
                                        TargetControlID="rfvnombre" />
                                    <AjaxControlToolkit:AutoCompleteExtender
                                        runat="server" 
                                        BehaviorID="AutoCompleteEx"
                                        ID="autoComplete1" 
                                        TargetControlID="Apu_Mano_Obra_Nombre"
                                        ServicePath="~/APU/APU_RUBRO_MANO_OBRA.aspx" 
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
                                    <script type="text/javascript">
                                       
                                        Sys.Application.add_load(page_load);
                                        Sys.Application.add_unload(page_unload);
                                        
                                                                            
                                        var Cantidad = null;
                                        var costo_hora = null; 
                                        var apu_rubro_rendimiento_mano_obra_hora=null; 
//                                        var costo_hora_x_cantidad = null; 
//                                        var costo_x_rendimiento_hora = null;
                                        

                                        function page_load(sender, e){
                                            Cantidad = $get("ctl00_ContentPlaceHolder1_fvapu_rubro_mano_obra_Cantidad");
                                            costo_hora = $get("ctl00_ContentPlaceHolder1_fvapu_rubro_mano_obra_costo_hora");
                                            $addHandler(Cantidad, "change", Cantidad_onchange);
                                            
                                            CalcularCosto_hora_x_cantidad();                                        
                                        }
                                        
                                        function page_unload(sender, e){
                                        $removeHandler(Cantidad, "change", Cantidad_onchange);
                                        }
                                      
                                        
                                        function Cantidad_onchange(sender, e){
                                        CalcularCosto_hora_x_cantidad();
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
                                            
                                            var Apu_Mano_Obra_Id = $get("ctl00_ContentPlaceHolder1_fvapu_rubro_mano_obra_Apu_Mano_Obra_Id");
                                            Apu_Mano_Obra_Id.value = temp[0];                                            
                                            
                                            costo_hora.value = temp[2];
                                            
                                            var Apu_Categoria_Codigo = $get("ctl00_ContentPlaceHolder1_fvapu_rubro_mano_obra_Apu_Categoria_Codigo");
                                            Apu_Categoria_Codigo.value = temp[4];
                                            
                                            
                                            var Apu_Categoria_Nombre = $get("ctl00_ContentPlaceHolder1_fvapu_rubro_mano_obra_Apu_Categoria_Nombre");
                                            Apu_Categoria_Nombre.value = temp[5];                                            
                                           
                                            CalcularCosto_hora_x_cantidad ();                                 
                                        }                                    
                                        
                                        function CalcularCosto_hora_x_cantidad()
                                        {
                                            var numCosto_hora_x_cantidad = 0.00;
                                            var Costo_Hora_x_Cantidad = $get("ctl00_ContentPlaceHolder1_fvapu_rubro_mano_obra_costo_hora_x_cantidad");
                                                            
                                            var numcosto_hora = Number.parseLocale(costo_hora.value);
                                            if(isNaN(numcosto_hora))
                                                numcosto_hora = 0.0;                                             
                                            
                                            var numCantidad = Number.parseLocale(Cantidad.value);
                                            if(isNaN(numCantidad))
                                                numCantidad = 0.0;                                            
                                            numCosto_hora_x_cantidad = numcosto_hora *  numCantidad;
                                            Costo_Hora_x_Cantidad.value = numCosto_hora_x_cantidad.localeFormat("N4");
                                            
                                            //CALCULO TOTAL                                           
                                                                          
                                            var apu_rubro_rendimiento_mano_obra_hora = $get("ctl00_ContentPlaceHolder1_fvapu_rubro_mano_obra_apu_rubro_rendimiento_mano_obra_hora");
                                            var costo_x_rendimiento_hora = $get("ctl00_ContentPlaceHolder1_fvapu_rubro_mano_obra_costo_x_rendimiento_hora");
                                            
                                            var numapu_rubro_rendimiento_mano_obra_hora = Number.parseLocale(apu_rubro_rendimiento_mano_obra_hora.value);
                                            if(!isNaN(numapu_rubro_rendimiento_mano_obra_hora))
                                            {
                                            var numCostoTotal = numapu_rubro_rendimiento_mano_obra_hora * numCosto_hora_x_cantidad;
                                            costo_x_rendimiento_hora.value = numCostoTotal.localeFormat("N4");
                                            }
                                        }
                                    </script>
                                    <%-- Prevent enter in textbox from causing the collapsible panel from operating --%>
                                    <input type="submit" style="display:none;" />                                                                  
                                </td>
                            </tr> 
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblcategoria" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Apu_Categoria_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td colspan="2">
                                    <asp:TextBox 
                                        ID="Apu_Categoria_Codigo" 
                                        runat="server" 
                                        readonly="true"
                                        Width="100px"
                                        TabIndex="-1"  
                                        ToolTip='<%# GetLocalResourceObject("Apu_Categoria_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Categoria_Codigo") %>'>
                                    </asp:TextBox>                                    
                                    <asp:TextBox 
                                        ID="Apu_Categoria_Nombre" 
                                        runat="server"                                         
                                        Readonly="true"
                                        Width="300px"
                                        TabIndex="-1"  
                                        ToolTip='<%# GetLocalResourceObject("Apu_Categoria_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Categoria_Nombre") %>'>
                                    </asp:TextBox>   
                                </td>
                            </tr>  
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblcantidad" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("CantidadRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>    
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Cantidad" 
                                        runat="server"
                                        Style="text-align:right" 
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
                                    ErrorTooltipEnabled="False"
                                    ClearMaskOnLostFocus="True"
                                    />

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
                                        ID="lblcostohora" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("costo_horaRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>    
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="costo_hora" 
                                        runat="server" 
                                        Style="text-align:right"                                        
                                        Readonly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("costo_horaRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("costo_hora","{0:N4}") %>'>
                                    </asp:TextBox> 
                                    <asp:Label 
                                        ID="lblmoneda1" 
                                        runat="server"                                         
                                        Text='<%# Bind("int_moneda_simbolo") %>'>
                                    </asp:Label>   
                                </td>
                            </tr>  
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblcostohoracantidad" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("costo_hora_x_cantidadRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>    
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="costo_hora_x_cantidad" 
                                        runat="server"                                         
                                        ReadOnly="true"                                        
                                        Style="text-align:right"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("costo_hora_x_cantidadRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("costo_hora_x_cantidad","{0:N4}") %>'>
                                    </asp:TextBox>   
                                    <asp:Label 
                                        ID="lblmoneda2" 
                                        runat="server"                                         
                                        Text='<%# Bind("int_moneda_simbolo") %>'>
                                    </asp:Label>      
                                </td>
                            </tr> 
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblrendimiento" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("apu_rubro_rendimiento_mano_obra_horaRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td colspan="2">
                                    <asp:TextBox 
                                        ID="apu_rubro_rendimiento_mano_obra_hora" 
                                        runat="server"                                        
                                        Readonly="true"
                                        Style="text-align:right"
                                        tabindex="-1"
                                        ToolTip='<%# GetLocalResourceObject("apu_rubro_rendimiento_mano_obra_horaRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("apu_rubro_rendimiento_mano_obra_hora","{0:N4}") %>'>
                                    </asp:TextBox>                                    
                                    <asp:Label 
                                        ID="lblcostototal" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("costo_x_rendimiento_horaRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>    
                                    <asp:TextBox 
                                        ID="costo_x_rendimiento_hora" 
                                        runat="server"                                         
                                        ReadOnly="true"
                                        Style="text-align:right"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("costo_x_rendimiento_horaRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("costo_x_rendimiento_hora","{0:N4}") %>'>
                                    </asp:TextBox>  
                                    <asp:Label 
                                        ID="lblmoneda3" 
                                        runat="server"                                         
                                        Text='<%# Bind("int_moneda_simbolo") %>'>
                                    </asp:Label>   
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
                                  <uc2:wucMensajeActualizar ID="WucMensajeActualizar1" runat="server" />
                                </td>   
                            </tr>          
                        </table>  
                    </asp:Panel> 
                    
                    <%--Id's--%>
                    <asp:TextBox 
                        ID="Apu_Mano_Obra_Id" 
                        runat="server"
                        Visible="true"
                        Style="display:none" 
                        Text='<%# Bind("Apu_Mano_Obra_Id") %>'>
                    </asp:TextBox>                    
                    <asp:TextBox 
                        ID="Update_Per_Personal_Id" 
                        runat="server"
                        Visible="true" 
                        Style="display:none"
                        Text='<%# Bind("Update_Per_Personal_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Id" 
                        runat="server"
                        Visible="true" 
                        Style="display:none"
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Rubro_Id" 
                        runat="server"
                        Visible="true" 
                        Style="display:none"
                        Text='<%# Bind("Apu_Rubro_Id") %>'>
                    </asp:TextBox>                    
                    <asp:TextBox 
                        ID="Apu_Categoria_Id" 
                        runat="server" 
                        Visible="true" 
                        Style="display:none"
                        Text='<%# Bind("Apu_Categoria_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Creacion_Per_Personal_Id" 
                        runat="server"
                        Visible="true" 
                        Style="display:none"
                        Text='<%# Bind("Creacion_Per_Personal_Id") %>'>
                    </asp:TextBox>
                    <%--CAMPOS NO VISIBLES--%>
                    
                    <asp:TextBox 
                        ID="Estado_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Estado_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Fecha_Update" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Fecha_Update") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="costo_diario" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("costo_diario") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Update_Per_Personal_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Update_Per_Personal_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Fecha_Creacion" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Fecha_Creacion") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Update_Per_Personal_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Update_Per_Personal_Nombre") %>'>
                    </asp:TextBox>                    
                    <asp:TextBox 
                        ID="Apu_Mano_Obra_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Apu_Mano_Obra_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="int_moneda_simbolo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("int_moneda_simbolo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Creacion_Per_Personal_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Creacion_Per_Personal_Nombre") %>'>
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
                    <asp:TextBox 
                        ID="Creacion_Per_Personal_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Creacion_Per_Personal_Codigo") %>'>
                    </asp:TextBox>  
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:Panel
                        runat="server"
                        id="pnlInsertTemplate"
                        meta:resourcekey="Rec_Apu_Rubro_Mano_Obra_RubroRecursoKCG">
                        <table>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblrubro" 
                                        runat="server" 
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                        AssociatedControlID="Apu_Rubro_Codigo"
                                        Text='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td> 
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Rubro_Codigo" 
                                        runat="server"                                        
                                        Readonly="true"    
                                        TabIndex="-1"                                      
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Rubro_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Apu_Rubro_Nombre" 
                                        runat="server"                                         
                                        Readonly="true"
                                        width="300px"
                                        TabIndex="-1"  
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Rubro_Nombre") %>'>
                                        <%--autocomplete="off" >--%>
                                    </asp:TextBox>
                                    
                                    <%--Text='<%# Bind("Apu_Rubro_Nombre") %>'--%>
                                    
                                    
                                                       
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblunidad" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Rubro_Unidad" 
                                        runat="server"                                         
                                        Readonly="true"
                                        TabIndex="-1"  
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Rubro_Unidad") %>'>
                                    </asp:TextBox>    
                                </td>
                            </tr>    
                        </table>  
                    </asp:Panel>  
                    <asp:Panel
                        runat="server"
                        id="Panel2"
                        meta:resourcekey="Rec_Apu_Rubro_Mano_ObraRecursoKCG">
                        <table>
                            <tr  align="right">
                                <td colspan="2">
                                    <asp:Label 
                                        ID="lblestadonombre" 
                                        runat="server" 
                                        Text='<%# Bind("Estado_Nombre") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr align="left">  
                                <td>
                                    <asp:Label 
                                        ID="lblmanoobra" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Apu_Mano_Obra_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td colspan="3">
                                    <asp:TextBox 
                                        ID="Apu_Mano_Obra_Nombre" 
                                        runat="server" 
                                        width="400px"
                                        Height="50px"
                                        TextMode ="MultiLine" 
                                        Style="text-transform:uppercase"
                                        CssClass="TEXTO_COMBOPER_KCG"                                        
                                        ToolTip='<%# GetLocalResourceObject("Apu_Mano_Obra_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Mano_Obra_Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:Button 
                                        ID="btnZoomManoObra" 
                                        runat="server" 
                                        CommandArgument="RutaDestino: ~/APU/APU_MANO_OBRA.aspx; Filtro: Apu_Mano_Obra_Nombre; Obtener: costo_hora|Costo_Hora"
                                        CommandName="Zoom" 
                                        Text="..." />
                                    <asp:RequiredFieldValidator 
                                        runat="server" 
                                        ID="rfvnombre"
                                        ControlToValidate="Apu_Mano_Obra_Nombre"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/>   
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server"  ID="arvGeneral"
                                        TargetControlID="rfvnombre" />
                                    <AjaxControlToolkit:AutoCompleteExtender
                                        runat="server" 
                                        BehaviorID="AutoCompleteEx"
                                        ID="autoComplete1" 
                                        TargetControlID="Apu_Mano_Obra_Nombre"
                                        ServicePath="~/APU/APU_RUBRO_MANO_OBRA.aspx" 
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
                                    
                                    <script type="text/javascript">
                                       
                                        Sys.Application.add_load(page_load);
                                        Sys.Application.add_unload(page_unload);
                                        
                                                                            
                                        var Cantidad = null;
                                        var costo_hora = null; 
                                        var apu_rubro_rendimiento_mano_obra_hora=null; 
//                                        var costo_hora_x_cantidad = null; 
//                                        var costo_x_rendimiento_hora = null;
                                        

                                        function page_load(sender, e){
                                            Cantidad = $get("ctl00_ContentPlaceHolder1_fvapu_rubro_mano_obra_Cantidad");
                                            costo_hora = $get("ctl00_ContentPlaceHolder1_fvapu_rubro_mano_obra_costo_hora");
                                            $addHandler(Cantidad, "change", Cantidad_onchange);
                                            
                                            CalcularCosto_hora_x_cantidad();                                        
                                        }
                                        
                                        function page_unload(sender, e){
                                        $removeHandler(Cantidad, "change", Cantidad_onchange);
                                        }
                                      
                                        
                                        function Cantidad_onchange(sender, e){
                                        CalcularCosto_hora_x_cantidad();
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
                                            
                                            var Apu_Mano_Obra_Id = $get("ctl00_ContentPlaceHolder1_fvapu_rubro_mano_obra_Apu_Mano_Obra_Id");
                                            Apu_Mano_Obra_Id.value = temp[0];

                                            costo_hora.value = temp[2];
                                            
                                            var Apu_Categoria_Codigo = $get("ctl00_ContentPlaceHolder1_fvapu_rubro_mano_obra_Apu_Categoria_Codigo");
                                            Apu_Categoria_Codigo.value = temp[4];
                                            
                                            
                                            var Apu_Categoria_Nombre = $get("ctl00_ContentPlaceHolder1_fvapu_rubro_mano_obra_Apu_Categoria_Nombre");
                                            Apu_Categoria_Nombre.value = temp[5];                                            
                                           
                                            CalcularCosto_hora_x_cantidad ();                                 
                                        }                                    
                                        
                                        function CalcularCosto_hora_x_cantidad()
                                        {
                                            var numCosto_hora_x_cantidad = 0.00;
                                            var Costo_Hora_x_Cantidad = $get("ctl00_ContentPlaceHolder1_fvapu_rubro_mano_obra_costo_hora_x_cantidad");
                                                            
                                            var numcosto_hora = Number.parseLocale(costo_hora.value);
                                            if(isNaN(numcosto_hora))
                                                numcosto_hora = 0.0;                                             
                                            
                                            var numCantidad = Number.parseLocale(Cantidad.value);
                                            if(isNaN(numCantidad))
                                                numCantidad = 0.0;                                            
                                            numCosto_hora_x_cantidad = numcosto_hora *  numCantidad;
                                            Costo_Hora_x_Cantidad.value = numCosto_hora_x_cantidad.localeFormat("N4");
                                            
                                            //CALCULO TOTAL                                           
                                                                          
                                            var apu_rubro_rendimiento_mano_obra_hora = $get("ctl00_ContentPlaceHolder1_fvapu_rubro_mano_obra_apu_rubro_rendimiento_mano_obra_hora");
                                            var costo_x_rendimiento_hora = $get("ctl00_ContentPlaceHolder1_fvapu_rubro_mano_obra_costo_x_rendimiento_hora");
                                            
                                            var numapu_rubro_rendimiento_mano_obra_hora = Number.parseLocale(apu_rubro_rendimiento_mano_obra_hora.value);
                                            if(!isNaN(numapu_rubro_rendimiento_mano_obra_hora))
                                            {
                                            var numCostoTotal = numapu_rubro_rendimiento_mano_obra_hora * numCosto_hora_x_cantidad;
                                            costo_x_rendimiento_hora.value = numCostoTotal.localeFormat("N4");
                                            }
                                        }
                                    </script>
                                    <%-- Prevent enter in textbox from causing the collapsible panel from operating --%>
                                    <input type="submit" style="display:none;" />                           
                                </td>
                            </tr> 
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblcategoria" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Apu_Categoria_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td colspan="2">
                                    <asp:TextBox 
                                        ID="Apu_Categoria_Codigo" 
                                        runat="server"  
                                        Readonly="true"   
                                        Width="100px"
                                        TabIndex="-1"                                                                                                                    
                                        Text='<%# Bind("Apu_Categoria_Codigo") %>'>
                                    </asp:TextBox>                                    
                                    <asp:TextBox 
                                        ID="Apu_Categoria_Nombre" 
                                        runat="server"                                          
                                        Readonly="true"
                                        Width="300px"
                                        TabIndex="-1"  
                                        ToolTip='<%# GetLocalResourceObject("Apu_Categoria_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Categoria_Nombre") %>'>
                                    </asp:TextBox>   
                                </td>
                            </tr>  
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblcantidad" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("CantidadRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>    
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Cantidad" 
                                        runat="server"
                                        Style="text-align:right"
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
                                    ErrorTooltipEnabled="False"
                                    ClearMaskOnLostFocus="True"
                                    />

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
                                        ID="lblcostohora" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("costo_horaRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>    
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="costo_hora" 
                                        runat="server" 
                                        Style="text-align:right"                                        
                                        Readonly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("costo_horaRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("costo_hora","{0:N4}") %>'>
                                    </asp:TextBox>    
                                    <asp:Label
                                        ID="label1" 
                                        runat="server"                                         
                                        Text='<%# Bind("int_moneda_simbolo") %>'>
                                    </asp:Label>
                                </td>
                            </tr>  
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblcostohoracantidad" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("costo_hora_x_cantidadRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>    
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="costo_hora_x_cantidad" 
                                        runat="server" 
                                        ReadOnly="true"  
                                        TabIndex="-1"                                                                          
                                        Style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("costo_hora_x_cantidadRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("costo_hora_x_cantidad","{0:N4}") %>'>
                                    </asp:TextBox>    
                                    <asp:Label
                                        ID="label2" 
                                        runat="server"                                         
                                        Text='<%# Bind("int_moneda_simbolo") %>'>
                                    </asp:Label>    
                                </td>
                            </tr> 
                                <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblrendimiento" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("apu_rubro_rendimiento_mano_obra_horaRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td colspan="2">
                                    <asp:TextBox 
                                        ID="apu_rubro_rendimiento_mano_obra_hora" 
                                        runat="server"                                        
                                        Style="text-align:right"                                        
                                        Readonly="true"
                                        tabindex="-1"
                                        ToolTip='<%# GetLocalResourceObject("apu_rubro_rendimiento_mano_obra_horaRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("apu_rubro_rendimiento_mano_obra_hora","{0:N4}") %>'>
                                    </asp:TextBox>                                  
                                    <asp:Label 
                                        ID="lblcostototal" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("costo_x_rendimiento_horaRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>    
                                    <asp:TextBox 
                                        ID="costo_x_rendimiento_hora" 
                                        runat="server" 
                                        ReadOnly="true"   
                                        TabIndex="-1"                                     
                                        Style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("costo_x_rendimiento_horaRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("costo_x_rendimiento_hora","{0:N4}") %>'>
                                    </asp:TextBox>   
                                    <asp:Label
                                        ID="label3" 
                                        runat="server"                                         
                                        Text='<%# Bind("int_moneda_simbolo") %>'>
                                    </asp:Label> 
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
                    <%--Id's--%>
                    <asp:TextBox 
                        ID="Apu_Mano_Obra_Id" 
                        runat="server"
                        Visible="true"
                        Style="display:none"
                        Text='<%# Bind("Apu_Mano_Obra_Id") %>'>
                    </asp:TextBox>                    
                    <asp:TextBox 
                        ID="Update_Per_Personal_Id" 
                        runat="server"
                        Visible="true" 
                        Style="display:none"
                        Text='<%# Bind("Update_Per_Personal_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Id" 
                        runat="server"
                        Visible="true" 
                        Style="display:none"
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Rubro_Id" 
                        runat="server"
                        Visible="true" 
                        Style="display:none"
                        Text='<%# Bind("Apu_Rubro_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Categoria_Id" 
                        runat="server" 
                        Visible="true" 
                        Style="display:none"
                        Text='<%# Bind("Apu_Categoria_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Creacion_Per_Personal_Id" 
                        runat="server"
                        Visible="true" 
                        Style="display:none"
                        Text='<%# Bind("Creacion_Per_Personal_Id") %>'>
                    </asp:TextBox>
                    <%--CAMPOS NO VISIBLES--%>
                    
                    <asp:TextBox 
                        ID="Estado_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Estado_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Fecha_Update" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Fecha_Update") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="costo_diario" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("costo_diario") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Update_Per_Personal_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Update_Per_Personal_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Fecha_Creacion" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Fecha_Creacion") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Update_Per_Personal_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Update_Per_Personal_Nombre") %>'>
                    </asp:TextBox>                   
                    <asp:TextBox 
                        ID="Apu_Mano_Obra_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Apu_Mano_Obra_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="int_moneda_simbolo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("int_moneda_simbolo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Creacion_Per_Personal_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Creacion_Per_Personal_Nombre") %>'>
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
                    <asp:TextBox 
                        ID="Creacion_Per_Personal_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Creacion_Per_Personal_Codigo") %>'>
                    </asp:TextBox>      
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Panel
                        runat="server"
                        id="Panel1"
                        meta:resourcekey="Rec_Apu_Rubro_Mano_Obra_RubroRecursoKCG">
                        <table>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblrubro" 
                                        runat="server"                                          
                                        Text='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td> 
                                <td colspan="2">
                                    <asp:TextBox 
                                        ID="Apu_Rubro_Codigo" 
                                        runat="server"                                        
                                        Readonly="true"  
                                        TabIndex="-1"                                        
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Rubro_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Apu_Rubro_Nombre" 
                                        runat="server"                                         
                                        Readonly="true"
                                        width="300px"
                                        TabIndex="-1"  
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Rubro_Nombre") %>'>
                                    </asp:TextBox>    
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblunidad" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Rubro_Unidad" 
                                        runat="server"                                         
                                        Readonly="true"
                                        TabIndex="-1"  
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Rubro_Unidad") %>'>
                                    </asp:TextBox>    
                                </td>
                            </tr>    
                        </table>  
                    </asp:Panel>  
                    <asp:Panel
                        runat="server"
                        id="Panel2"
                        meta:resourcekey="Rec_Apu_Rubro_Mano_ObraRecursoKCG">
                        <table>
                            <tr  align="right">
                                <td colspan="2">
                                    <asp:Label 
                                        ID="lblestadonombre" 
                                        runat="server" 
                                        Text='<%# Bind("Estado_Nombre") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr align="left">  
                                <td>
                                    <asp:Label 
                                        ID="lblmanoobra" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Apu_Mano_Obra_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Mano_Obra_Nombre" 
                                        runat="server" 
                                        ReadOnly="true" 
                                        CssClass ="TEXTO_LECTURA_KCG"
                                        width="400px"
                                        Height="50px"
                                        TextMode ="MultiLine" 
                                        TabIndex="-1"  
                                        ToolTip='<%# GetLocalResourceObject("Apu_Mano_Obra_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Mano_Obra_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr> 
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblcategoria" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Apu_Categoria_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Categoria_Codigo" 
                                        runat="server" 
                                        Readonly="true"
                                        Width="100px"
                                        TabIndex="-1"  
                                        ToolTip='<%# GetLocalResourceObject("Apu_Categoria_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Categoria_Codigo") %>'>
                                    </asp:TextBox>                                    
                                    <asp:TextBox 
                                        ID="Apu_Categoria_Nombre" 
                                        runat="server"                                         
                                        Readonly="true"
                                        Width="300px"
                                        TabIndex="-1"  
                                        ToolTip='<%# GetLocalResourceObject("Apu_Categoria_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Categoria_Nombre") %>'>
                                    </asp:TextBox>   
                                </td>
                            </tr>  
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblcantidad" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("CantidadRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>    
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Cantidad" 
                                        runat="server" 
                                        Readonly="true"
                                        Style="text-align:right" 
                                        TabIndex="-1"                                         
                                        ToolTip='<%# GetLocalResourceObject("CantidadRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Cantidad","{0:N4}") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr> 
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblcostohora" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("costo_horaRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>    
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="costo_hora" 
                                        runat="server"                                         
                                        Readonly="true"
                                        TabIndex="-1"  
                                        Style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("costo_horaRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("costo_hora","{0:N4}") %>'>
                                    </asp:TextBox>  
                                    <asp:Label
                                        ID="label3" 
                                        runat="server"                                         
                                        Text='<%# Bind("int_moneda_simbolo") %>'>
                                    </asp:Label>   
                                </td>
                            </tr>  
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblcostohoracantidad" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("costo_hora_x_cantidadRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>    
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="costo_hora_x_cantidad" 
                                        runat="server" 
                                        Readonly="true"
                                        TabIndex="-1"  
                                        Style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("costo_hora_x_cantidadRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("costo_hora_x_cantidad","{0:N4}") %>'>
                                    </asp:TextBox> 
                                    <asp:Label
                                        ID="label4" 
                                        runat="server"                                         
                                        Text='<%# Bind("int_moneda_simbolo") %>'>
                                    </asp:Label>        
                                </td>
                            </tr> 
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblrendimiento" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("apu_rubro_rendimiento_mano_obra_horaRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td colspan="2">
                                    <asp:TextBox 
                                        ID="apu_rubro_rendimiento_mano_obra_hora" 
                                        runat="server"                                        
                                        Readonly="true"
                                        TabIndex="-1"  
                                        Style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("apu_rubro_rendimiento_mano_obra_horaRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("apu_rubro_rendimiento_mano_obra_hora","{0:N4}") %>'>
                                    </asp:TextBox>                                    
                                    <asp:Label 
                                        ID="lblcostototal" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("costo_x_rendimiento_horaRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>  
                                    <asp:TextBox 
                                        ID="costo_x_rendimiento_hora" 
                                        runat="server" 
                                        Readonly="true"
                                        TabIndex="-1"  
                                        Style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("costo_x_rendimiento_horaRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("costo_x_rendimiento_hora","{0:N4}") %>'>
                                    </asp:TextBox>  
                                    <asp:Label
                                        ID="label5" 
                                        runat="server"                                         
                                        Text='<%# Bind("int_moneda_simbolo") %>'>
                                    </asp:Label>   
                                </td>
                            </tr>            
                        </table>
                        <table>
                            <tr align="left">
                                <td>
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
                    <%--Id's--%>
                    <asp:TextBox 
                        ID="Apu_Mano_Obra_Id" 
                        runat="server"
                        Visible="true"
                        Style="display:none"
                        Text='<%# Bind("Apu_Mano_Obra_Id") %>'>
                    </asp:TextBox>                    
                    <asp:TextBox 
                        ID="Update_Per_Personal_Id" 
                        runat="server"
                        Visible="true" 
                        Style="display:none"
                        Text='<%# Bind("Update_Per_Personal_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Id" 
                        runat="server"
                        Visible="true" 
                        Style="display:none"
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Rubro_Id" 
                        runat="server"
                        Visible="true" 
                        Style="display:none"
                        Text='<%# Bind("Apu_Rubro_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Categoria_Id" 
                        runat="server" 
                        Visible="true" 
                        Style="display:none"
                        Text='<%# Bind("Apu_Categoria_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Creacion_Per_Personal_Id" 
                        runat="server"
                        Visible="true" 
                        Style="display:none"
                        Text='<%# Bind("Creacion_Per_Personal_Id") %>'>
                    </asp:TextBox>
                    <%--CAMPOS NO VISIBLES--%>
                    
                    <asp:TextBox 
                        ID="Estado_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Estado_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Fecha_Update" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Fecha_Update") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="costo_diario" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("costo_diario") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Update_Per_Personal_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Update_Per_Personal_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Fecha_Creacion" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Fecha_Creacion") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Update_Per_Personal_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Update_Per_Personal_Nombre") %>'>
                    </asp:TextBox>                   
                    <asp:TextBox 
                        ID="Apu_Mano_Obra_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Apu_Mano_Obra_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="int_moneda_simbolo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("int_moneda_simbolo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Creacion_Per_Personal_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Creacion_Per_Personal_Nombre") %>'>
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
                    <asp:TextBox 
                        ID="Creacion_Per_Personal_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Creacion_Per_Personal_Codigo") %>'>
                    </asp:TextBox>  
                </ItemTemplate>
            </asp:FormView>
                  <koala:KNavegacion ID="nav"
                    runat="server"
                    GridViewID="gvapu_rubro_mano_obra"
                    FormViewID="FormView1" 
                    OnNavegar="nav_Siguiente" />
        </ContentTemplate> 
        <Triggers>
            <asp:AsyncPostBackTrigger 
                ControlID="gvapu_rubro_mano_obra" 
                EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:ObjectDataSource 
                ID="odsapu_rubro_mano_obra" 
                runat="server" 
                ConflictDetection="CompareAllValues"
                DeleteMethod="Delete" 
                InsertMethod="Insert" 
                OldValuesParameterFormatString="original{0}"
                SelectMethod="GetById" 
                SortParameterName="sortExpression" 
                TypeName="FEL.APU.BO_Apu_Rubro_Mano_Obra"
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
                <koala:KFiltro 
                ID="kftFiltro" 
                runat="server" 
                Contenedor="APU_RUBRO_MANO_OBRA" 
                Objeto="APU_RUBRO_MANO_OBRA" 
                IndiceScope ="Scope"
                Orden="1"
                ObjectDataSourceID="odsgvapu_rubro_mano_obra"/>
             </td>
             <td>               
                 <asp:Button 
                    ID="BtnRubro" 
                    runat="server"                        
                    OnClick="BtnRubro_Click"/>
            </td>
        </tr>
        </table>  
            <asp:Panel 
                runat="server"
                id="pnlDatosGrid"
                meta:resourcekey="Rec_Listado_Apu_Rubro_Mano_ObraRecursoKCG">
                <koala:KGrid 
                    ID="gvapu_rubro_mano_obra" 
                    runat="server" 
                    AllowPaging="True" 
                    AllowSorting="True"
                    AutoGenerateColumns="False" 
                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>'                      
                    DataKeyNames="Id" 
                    DataSourceID="odsgvapu_rubro_mano_obra">
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
                            SortExpression="Apu_Mano_Obra_Nombre" >
                            <itemstyle wrap="True" width="80mm"  />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Cantidad" 
                            meta:resourcekey="BoundCantidadRecursoKCG" 
                            SortExpression="Cantidad" DataFormatString = "{0:N4}">
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
                            DataField="apu_rubro_rendimiento_mano_obra_hora" 
                            meta:resourcekey="Boundapu_rubro_rendimiento_mano_obra_horaRecursoKCG"
                            SortExpression="apu_rubro_rendimiento_mano_obra_hora" DataFormatString = "{0:N4}">                          
                            <itemstyle horizontalalign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="costo_x_rendimiento_hora" 
                            meta:resourcekey="Boundcosto_x_rendimiento_horaRecursoKCG"
                            SortExpression="costo_x_rendimiento_hora" DataFormatString = "{0:N4}">
                            <itemstyle horizontalalign="Right" />
                        </asp:BoundField>                        
                        <asp:BoundField 
                            DataField="Apu_Categoria_Nombre" 
                            meta:resourcekey="BoundApu_Categoria_NombreRecursoKCG"
                            SortExpression="Apu_Categoria_Nombre" />
                        <asp:BoundField 
                            DataField="Fecha_Update" 
                            meta:resourcekey="BoundFecha_UpdateRecursoKCG" 
                            SortExpression="Fecha_Update" />
                        <asp:BoundField 
                            DataField="Estado_Nombre" 
                            HeaderText="Estado_Nombre" 
                            SortExpression="Estado_Nombre"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Mano_Obra_Id" 
                            HeaderText="Apu_Mano_Obra_Id" 
                            SortExpression="Apu_Mano_Obra_Id"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="costo_diario" 
                            HeaderText="costo_diario" 
                            SortExpression="costo_diario"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Update_Per_Personal_Codigo" 
                            HeaderText="Update_Per_Personal_Codigo"
                            SortExpression="Update_Per_Personal_Codigo" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Fecha_Creacion" 
                            HeaderText="Fecha_Creacion" 
                            SortExpression="Fecha_Creacion"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Update_Per_Personal_Nombre" 
                            HeaderText="Update_Per_Personal_Nombre"
                            SortExpression="Update_Per_Personal_Nombre" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Update_Per_Personal_Id" 
                            HeaderText="Update_Per_Personal_Id"
                            SortExpression="Update_Per_Personal_Id" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Id" 
                            HeaderText="Id" 
                            SortExpression="Id" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Rubro_Codigo" 
                            HeaderText="Apu_Rubro_Codigo" 
                            SortExpression="Apu_Rubro_Codigo"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Rubro_Nombre" 
                            HeaderText="Apu_Rubro_Nombre" 
                            SortExpression="Apu_Rubro_Nombre"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Categoria_Codigo" 
                            HeaderText="Apu_Categoria_Codigo"
                            SortExpression="Apu_Categoria_Codigo" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Codigo" 
                            HeaderText="Codigo" 
                            SortExpression="Codigo_int" 
                            Visible="False" />                        
                        <asp:BoundField 
                            DataField="int_moneda_simbolo" 
                            HeaderText="int_moneda_simbolo" 
                            SortExpression="int_moneda_simbolo"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Creacion_Per_Personal_Nombre" 
                            HeaderText="Creacion_Per_Personal_Nombre"
                            SortExpression="Creacion_Per_Personal_Nombre" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Rubro_Unidad" 
                            HeaderText="Apu_Rubro_Unidad" 
                            SortExpression="Apu_Rubro_Unidad"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Rubro_Id" 
                            HeaderText="Apu_Rubro_Id" 
                            SortExpression="Apu_Rubro_Id"
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
                        <asp:BoundField 
                            DataField="Creacion_Per_Personal_Codigo" 
                            HeaderText="Creacion_Per_Personal_Codigo"
                            SortExpression="Creacion_Per_Personal_Codigo" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Creacion_Per_Personal_Id" 
                            HeaderText="Creacion_Per_Personal_Id"
                            SortExpression="Creacion_Per_Personal_Id" 
                            Visible="False" />
                    </Columns>
                </koala:KGrid>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:ObjectDataSource 
        ID="odsgvapu_rubro_mano_obra" 
        runat="server" 
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetByRubro" 
        TypeName="FEL.APU.BO_Apu_Rubro_Mano_Obra">
            <SelectParameters>
                <asp:SessionParameter 
                    Name="s" 
                    SessionField="Scope" 
                    Type="Object" />
                <asp:QueryStringParameter 
                    Name="Apu_Rubro_Id" 
                    QueryStringField="Apu_Rubro_Id"
                    Type="String" />
            </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

