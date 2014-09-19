<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="FIS_PLANILLA_DET.aspx.cs" 
    StylesheetTheme="EstiloKCG"
    Theme="EstiloKCG"
    Inherits="FIS_FIS_PLANILLA_DET" 
    meta:resourcekey="Tit_Fis_Plantilla_DetRecursoKCG" %>

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
        runat="server">
        <ContentTemplate>
            
            <script type="text/javascript">     
                Sys.Application.add_load(page_load);
                Sys.Application.add_unload(page_unload);
                
                var Cantidad = null;
                var Costo = null;
                var Subtotal = null;
                
                function page_load(sender, e)
                {    
                    Cantidad = $get("ctl00_ContentPlaceHolder1_Fv_Fis_Planilla_Det_Cantidad");                            
                    Costo = $get("ctl00_ContentPlaceHolder1_Fv_Fis_Planilla_Det_Costo"); 
                    Subtotal = $get("ctl00_ContentPlaceHolder1_Fv_Fis_Planilla_Det_Subtotal");
                    
                    $addHandler(Cantidad, "change", Cantidad_Costo_onchange);
                    $addHandler(Costo, "change", Cantidad_Costo_onchange);                                                                                                                                                 
                }
                
                function page_unload(sender, e)
                {                            
                    $removeHandler(Cantidad, "change", Cantidad_Costo_onchange);
                    $removeHandler(Costo, "change", Cantidad_Costo_onchange);
                }
                
                function Cantidad_Costo_onchange(sender, e)
                {
                    Calcular_Cantidad_Costo();
                }
                
                function Calcular_Cantidad_Costo()
                {
                    var resultado = 0.00;
                    var Subtotal = $get("ctl00_ContentPlaceHolder1_Fv_Fis_Planilla_Det_Subtotal");       
                                    
                    var numCosto = Number.parseLocale(Costo.value);
                    if(isNaN(numCosto))
                        numCosto = 0.0; 
                    
                    var numCantidad = Number.parseLocale(Cantidad.value);
                    if(isNaN(numCantidad)) 
                         numCantidad = 0.0;
                    
                    resultado = numCantidad * numCosto;                
                    Subtotal.value =resultado.localeFormat("N2");                    
                }         
                        
                function ItemSelected_Apu_Rubro_Nombre( source, eventArgs ) 
                {   
                    var valor = eventArgs.get_value();
                    var temp = new Array();
                    temp = valor.split('||');
                                                        
//                    var Apu_Rubro_Id = $get("ctl00_ContentPlaceHolder1_Apu_Rubro_Id");
//                    Apu_Rubro_Id.value = temp[0];    
                    var txt_Tipo_Planilla = $get("ctl00_ContentPlaceHolder1_txt_Tipo_Planilla"); 
                    var Apu_Rubro_Codigo = $get("ctl00_ContentPlaceHolder1_Fv_Fis_Planilla_Det_Apu_Rubro_Codigo"); 
                    Apu_Rubro_Codigo.value = temp[0]; 
                    var Apu_Prespuesto_Rubro_Id = $get("ctl00_ContentPlaceHolder1_Fv_Fis_Planilla_Det_Apu_Prespuesto_Rubro_Id");    
                    if(txt_Tipo_Planilla.value == "AVA")                    
                        Apu_Prespuesto_Rubro_Id.value = temp[1];  
                    else 
                        Apu_Prespuesto_Rubro_Id.value = "";  
                    var Apu_Rubro_Unidad = $get("ctl00_ContentPlaceHolder1_Fv_Fis_Planilla_Det_Apu_Rubro_Unidad"); 
                    Apu_Rubro_Unidad.value = temp[2];                          
                    var Costo = $get("ctl00_ContentPlaceHolder1_Fv_Fis_Planilla_Det_Costo"); 
                    Costo.value = temp[3];    
                                        
                    if(txt_Tipo_Planilla.value == "AVA")
                    {
                        Apu_Rubro_Codigo.disabled = true;     
                        Apu_Rubro_Unidad.disabled = true;     
                        Cantidad.disabled = false;     
                        Costo.disabled = true;     
                    }
                    Calcular_Cantidad_Costo();                                                                                                                                                                      
                }                        
            </script>
            <asp:TextBox
                ID="Apu_Rubro_Id"
                runat="server"
                style="display:none">
            </asp:TextBox>
            <asp:TextBox
                ID="txt_Tipo_Planilla"
                runat="server"
                style="display:none">
            </asp:TextBox>
            <asp:TextBox
                ID="Apu_Presupuesto_Id"
                runat="server"
                style="display:none">
            </asp:TextBox>
            <asp:TextBox
                ID="Fiscalizador_Id"
                runat="server"
                style="display:none">
            </asp:TextBox>
            <asp:Panel 
                ID="pnl_Fisca" 
                runat="server" 
                meta:resourcekey="Rec_Fis_Planilla_Det_FiscalizacionRecursoKCG">
                <table>
                    <tr>
                        <td 
                            colspan="4"
                            align="right">
                            <asp:label
                                id="lbl_Estado"
                                runat="server"
                                ForeColor="Red"                                        
                                Text='<%# Bind("Estado_Nombre") %>'>
                            </asp:label>                                  
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label 
                                ID="lbl_Codigo" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("Apu_Origen_CodigoRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                            Código
                        </td>
                        <td style="white-space:nowrap">
                            <asp:TextBox 
                                ID="Apu_Origen_Codigo" 
                                runat="server"
                                onfocus="this.blur()" 
                                TabIndex="-1"
                                ToolTip='<%# GetLocalResourceObject("Apu_Origen_CodigoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:Label 
                                ID="lbl_Codigo_Institucional" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("Codigo_InstitucionRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                            Código Institucional
                            <asp:TextBox 
                                ID="Codigo_Institucional" 
                                runat="server"
                                onfocus="this.blur()" 
                                TabIndex="-1"
                                ToolTip='<%# GetLocalResourceObject("Codigo_InstitucionRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label 
                                ID="lbl_Fecha_Inicio" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("Fecha_Ini_ContratoRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                            Fecha Inicio
                        </td>
                        <td style="white-space:nowrap">
                            <asp:TextBox 
                                ID="Fecha_Ini_Contrato" 
                                runat="server"
                                onfocus="this.blur()" 
                                TabIndex="-1"
                                ToolTip='<%# GetLocalResourceObject("Fecha_Ini_ContratoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:Label 
                                ID="lbl_Plazo" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("Plazo_ContratoRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                            Plazo
                            <asp:TextBox 
                                ID="Plazo_Contrato" 
                                runat="server"
                                onfocus="this.blur()" 
                                TabIndex="-1"
                                style="text-align:right"
                                ToolTip='<%# GetLocalResourceObject("Plazo_ContratoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:Label 
                                ID="lbl_Fecha_Fin" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("Fecha_Fin_ContratoRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                            Fecha Fin
                            <asp:TextBox 
                                ID="Fecha_Fin_Contrato" 
                                runat="server"
                                onfocus="this.blur()" 
                                TabIndex="-1"
                                ToolTip='<%# GetLocalResourceObject("Fecha_Fin_ContratoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label 
                                ID="lbl_Proyecto" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("Apu_Origen_NombreRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                            Proyecto
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="Apu_Origen_Nombre" 
                                runat="server"
                                Width="400px"
                                Height="50px"
                                onfocus="this.blur()" 
                                TabIndex="-1"
                                CssClass="TEXTO_LECTURA_KCG"
                                TextMode="MultiLine"
                                ToolTip='<%# GetLocalResourceObject("Apu_Origen_NombreRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:Panel 
                ID="pnl_Planilla" 
                runat="server" 
                meta:resourcekey="Rec_Fis_Planilla_Det_PlanillaRecursoKCG">
                <table>
                    <tr>
                        <td>
                            <asp:Label 
                                ID="lbl_Numero_Planilla" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("Numero_PlanillaRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td style="white-space:nowrap">
                            <asp:TextBox 
                                ID="Numero_Planilla" 
                                runat="server"
                                style="text-align:right"
                                onfocus="this.blur()" 
                                TabIndex="-1"
                                ToolTip='<%# GetLocalResourceObject("Numero_PlanillaRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:Label 
                                ID="lbl_Presentacion" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("Fecha_Ultimo_IngresoRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                            <asp:TextBox 
                                ID="Fecha_Ultimo_Ingreso" 
                                runat="server"
                                onfocus="this.blur()" 
                                TabIndex="-1"
                                ToolTip='<%# GetLocalResourceObject("Fecha_Ultimo_IngresoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:Label 
                                ID="lbl_Monto" 
                                runat="server"                                 
                                Text='<%# GetLocalResourceObject("TotalRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                            <asp:TextBox 
                                ID="Total" 
                                runat="server"
                                style="text-align:right"
                                onfocus="this.blur()" 
                                TabIndex="-1"
                                ToolTip='<%# GetLocalResourceObject("TotalRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label 
                                ID="lbl_Tipo" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("Tipo_NombreRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="Tipo_Nombre" 
                                runat="server"
                                onfocus="this.blur()" 
                                TabIndex="-1"
                                ToolTip='<%# GetLocalResourceObject("Tipo_NombreRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:FormView 
                ID="Fv_Fis_Planilla_Det" 
                runat="server" 
                DataSourceID="odsFv_Fis_Planilla_Det"
                DefaultMode="Insert">
                <EditItemTemplate>
                    <asp:Panel
                        ID="pnl_Detalle"
                        runat="server"
                        meta:resourcekey="Rec_Fis_Planilla_DetRecursoKCG">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Rubro" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Apu_Rubro_Codigo" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG" 
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Rubro_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Apu_Rubro_Nombre" 
                                        runat="server" 
                                        Width="400px"
                                        CssClass="TEXTO_COMBOPER_KCG"  
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Rubro_Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        ID="rfv_Apu_Rubro_Nombre"
                                        runat="server" 
                                        ControlToValidate="Apu_Rubro_Nombre"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="vce_Apu_Rubro_Nombre"
                                        TargetControlID="rfv_Apu_Rubro_Nombre"/>
                                     <AjaxControlToolkit:AutoCompleteExtender
                                        runat="server" 
                                        BehaviorID="AutoCompleteEx_Rubro_Nombre"
                                        ID="AutoCo_Rubro_Nombre" 
                                        TargetControlID="Apu_Rubro_Nombre"
                                        ServicePath="~/FIS/FIS_PLANILLA_DET.aspx" 
                                        ServiceMethod="Get_Apu_Rubro_Nombre"
                                        MinimumPrefixLength="0" 
                                        CompletionInterval="500"
                                        EnableCaching="true"
                                        CompletionSetCount="500"
                                        CompletionListCssClass="autocomplete_completionListElement" 
                                        CompletionListItemCssClass="autocomplete_listItem" 
                                        CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                        OnClientItemSelected="ItemSelected_Apu_Rubro_Nombre"
                                        UseContextKey="true">     
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
                                                        var behavior = $find('AutoCompleteEx_Rubro_Nombre');
                                                        if (!behavior._height) {
                                                            var target = behavior.get_completionList();
                                                            behavior._height = target.offsetHeight - 2;
                                                            target.style.height = '0px';
                                                        }" />                                                    
                                                    <%-- Expand from 0px to the appropriate size while fading in --%>
                                                    <Parallel Duration=".4">
                                                        <FadeIn />
                                                        <Length PropertyKey="height" StartValue="0" EndValueScript="$find('AutoCompleteEx_Rubro_Nombre')._height" />
                                                    </Parallel>
                                                </Sequence>
                                            </OnShow>
                                            <OnHide>
                                                <%-- Collapse down to 0px and fade out --%>
                                                <Parallel Duration=".4">
                                                    <FadeOut />
                                                    <Length PropertyKey="height" StartValueScript="$find('AutoCompleteEx_Rubro_Nombre')._height" EndValue="0" />
                                                </Parallel>
                                            </OnHide>
                                        </Animations>
                                    </AjaxControlToolkit:AutoCompleteExtender> 
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Unidad" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Apu_Rubro_Unidad" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG"  
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Rubro_Unidad") %>'>
                                    </asp:TextBox>
                                    <asp:Label 
                                        ID="lbl_Cantidad" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("CantidadRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                    <asp:TextBox 
                                        ID="Cantidad" 
                                        runat="server" 
                                        style="text-align:right"
                                        CssClass="TEXTO_EDICION_KCG"  
                                        ToolTip='<%# GetLocalResourceObject("CantidadRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Cantidad") %>'>
                                    </asp:TextBox>
                                    <AjaxControlToolkit:MaskedEditExtender 
                                        ID="fCantidad" 
                                        runat="server"
                                        TargetControlID="Cantidad"
                                        Mask="9,999,999,999,999.99"
                                        MessageValidatorTip="false"
                                        OnFocusCssClass="MaskedEditFocus"
                                        OnInvalidCssClass="MaskedEditError"
                                        MaskType="Number"
                                        InputDirection="RightToLeft"
                                        AcceptNegative="None"
                                        DisplayMoney="None"
                                        ErrorTooltipEnabled="false"
                                        ClearMaskOnLostFocus="True" />      
                                    <AjaxControlToolkit:MaskedEditValidator 
                                        ID="mev_Cantidad" 
                                        runat="server"
                                        ControlExtender="fCantidad"
                                        ControlToValidate="Cantidad"
                                        IsValidEmpty="False"
                                        EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        MinimumValue="0.00"
                                        MaximumValue="9999999999999.99" 
                                        Display="Dynamic"
                                        EmptyValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>'
                                        InvalidValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>'
                                        MaximumValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>' 
                                        MinimumValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>'
                                        ValidationGroup="I" />                                        
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="vce_Cantidad"
                                        TargetControlID="mev_Cantidad"/> 
                                    <asp:Label 
                                        ID="lbl_Precio_Unitario" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("CostoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                    <asp:TextBox 
                                        ID="Costo" 
                                        runat="server" 
                                        style="text-align:right"
                                        CssClass="TEXTO_EDICION_KCG"   
                                        ToolTip='<%# GetLocalResourceObject("CostoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Costo","{0:N2}") %>'>
                                    </asp:TextBox> 
                                    <AjaxControlToolkit:MaskedEditExtender 
                                        ID="mee_Costo" 
                                        runat="server"
                                        TargetControlID="Costo"
                                        Mask="9,999,999,999,999.99"
                                        MessageValidatorTip="false"
                                        OnFocusCssClass="MaskedEditFocus"
                                        OnInvalidCssClass="MaskedEditError"
                                        MaskType="Number"
                                        InputDirection="RightToLeft"
                                        AcceptNegative="None"
                                        DisplayMoney="None"
                                        ErrorTooltipEnabled="false"
                                        ClearMaskOnLostFocus="True" />      
                                    <AjaxControlToolkit:MaskedEditValidator 
                                        ID="mev_Costo" 
                                        runat="server"
                                        ControlExtender="mee_Costo"
                                        ControlToValidate="Costo"
                                        IsValidEmpty="False"
                                        EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        MinimumValue="0.00"
                                        MaximumValue="9999999999999.99" 
                                        Display="Dynamic"
                                        EmptyValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>'
                                        InvalidValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>'
                                        MaximumValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>' 
                                        MinimumValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>'
                                        ValidationGroup="I" />                                        
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="vce_Costo"
                                        TargetControlID="mev_Costo"/> 
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Subtotal" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("SubTotalRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="SubTotal" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("SubTotalRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("SubTotal","{0:N2}") %>'>
                                    </asp:TextBox>
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
                        ID="Fis_Planilla_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Fis_Planilla_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Prespuesto_Rubro_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Apu_Prespuesto_Rubro_Id") %>'>
                    </asp:TextBox>
                    
                        <%--CAMPOS OCULTOS--%>
                    
                    <asp:TextBox 
                        ID="Fis_Planilla_Codigo" 
                        runat="server" 
                        Visible="false" 
                        Text='<%# Bind("Fis_Planilla_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Descripcion" 
                        runat="server" 
                        Visible="false" 
                        Text='<%# Bind("Descripcion") %>'>
                    </asp:TextBox>                                                                                                   
                    <asp:TextBox 
                        ID="Apu_Prespuesto_Rubro_Codigo" 
                        runat="server" 
                        Visible="false" 
                        Text='<%# Bind("Apu_Prespuesto_Rubro_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Prespuesto_Rubro_Cantidad" 
                        runat="server" 
                        Visible="false" 
                        Text='<%# Bind("Apu_Prespuesto_Rubro_Cantidad") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Acumulado" 
                        runat="server" 
                        Visible="false" 
                        Text='<%# Bind("Acumulado") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Diferencia" 
                        runat="server" 
                        Visible="false" 
                        Text='<%# Bind("Diferencia") %>'>
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
                        ID="pnl_Detalle"
                        runat="server"
                        meta:resourcekey="Rec_Fis_Planilla_DetRecursoKCG">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Rubro" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Apu_Rubro_Codigo" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG"     
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Rubro_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Apu_Rubro_Nombre" 
                                        runat="server" 
                                        Width="400px"
                                        CssClass="TEXTO_COMBOPER_KCG"  
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Rubro_Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        ID="rfv_Apu_Rubro_Nombre"
                                        runat="server" 
                                        ControlToValidate="Apu_Rubro_Nombre"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="vce_Apu_Rubro_Nombre"
                                        TargetControlID="rfv_Apu_Rubro_Nombre"/>
                                     <AjaxControlToolkit:AutoCompleteExtender
                                        runat="server" 
                                        BehaviorID="AutoCompleteEx_Rubro_Nombre"
                                        ID="AutoCo_Rubro_Nombre" 
                                        TargetControlID="Apu_Rubro_Nombre"
                                        ServicePath="~/FIS/FIS_PLANILLA_DET.aspx" 
                                        ServiceMethod="Get_Apu_Rubro_Nombre"
                                        MinimumPrefixLength="0" 
                                        CompletionInterval="500"
                                        EnableCaching="true"
                                        CompletionSetCount="500"
                                        CompletionListCssClass="autocomplete_completionListElement" 
                                        CompletionListItemCssClass="autocomplete_listItem" 
                                        CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                        OnClientItemSelected="ItemSelected_Apu_Rubro_Nombre"
                                        UseContextKey="true">     
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
                                                        var behavior = $find('AutoCompleteEx_Rubro_Nombre');
                                                        if (!behavior._height) {
                                                            var target = behavior.get_completionList();
                                                            behavior._height = target.offsetHeight - 2;
                                                            target.style.height = '0px';
                                                        }" />                                                    
                                                    <%-- Expand from 0px to the appropriate size while fading in --%>
                                                    <Parallel Duration=".4">
                                                        <FadeIn />
                                                        <Length PropertyKey="height" StartValue="0" EndValueScript="$find('AutoCompleteEx_Rubro_Nombre')._height" />
                                                    </Parallel>
                                                </Sequence>
                                            </OnShow>
                                            <OnHide>
                                                <%-- Collapse down to 0px and fade out --%>
                                                <Parallel Duration=".4">
                                                    <FadeOut />
                                                    <Length PropertyKey="height" StartValueScript="$find('AutoCompleteEx_Rubro_Nombre')._height" EndValue="0" />
                                                </Parallel>
                                            </OnHide>
                                        </Animations>
                                    </AjaxControlToolkit:AutoCompleteExtender> 
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Unidad" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Apu_Rubro_Unidad" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Rubro_Unidad") %>'>
                                    </asp:TextBox>
                                    <asp:Label 
                                        ID="lbl_Cantidad" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("CantidadRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                    <asp:TextBox 
                                        ID="Cantidad" 
                                        runat="server" 
                                        style="text-align:right"
                                        CssClass="TEXTO_EDICION_KCG"    
                                        ToolTip='<%# GetLocalResourceObject("CantidadRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Cantidad","{0:N2}") %>'>
                                    </asp:TextBox>
                                    <AjaxControlToolkit:MaskedEditExtender 
                                        ID="fCantidad" 
                                        runat="server"
                                        TargetControlID="Cantidad"
                                        Mask="9,999,999,999,999.99"
                                        MessageValidatorTip="false"
                                        OnFocusCssClass="MaskedEditFocus"
                                        OnInvalidCssClass="MaskedEditError"
                                        MaskType="Number"
                                        InputDirection="RightToLeft"
                                        AcceptNegative="None"
                                        DisplayMoney="None"
                                        ErrorTooltipEnabled="false"
                                        ClearMaskOnLostFocus="True" />      
                                    <AjaxControlToolkit:MaskedEditValidator 
                                        ID="mev_Cantidad" 
                                        runat="server"
                                        ControlExtender="fCantidad"
                                        ControlToValidate="Cantidad"
                                        IsValidEmpty="False"
                                        EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        MinimumValue="0.00"
                                        MaximumValue="9999999999999.99" 
                                        Display="Dynamic"
                                        EmptyValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>'
                                        InvalidValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>'
                                        MaximumValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>' 
                                        MinimumValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>'
                                        ValidationGroup="I" />                                        
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="vce_Cantidad"
                                        TargetControlID="mev_Cantidad"/> 
                                    <asp:Label 
                                        ID="lbl_Precio_Unitario" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("CostoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                    <asp:TextBox 
                                        ID="Costo" 
                                        runat="server" 
                                        style="text-align:right"
                                        CssClass="TEXTO_EDICION_KCG"    
                                        ToolTip='<%# GetLocalResourceObject("CostoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Costo","{0:N2}") %>'>
                                    </asp:TextBox> 
                                    <AjaxControlToolkit:MaskedEditExtender 
                                        ID="mee_Costo" 
                                        runat="server"
                                        TargetControlID="Costo"
                                        Mask="9,999,999,999,999.99"
                                        MessageValidatorTip="false"
                                        OnFocusCssClass="MaskedEditFocus"
                                        OnInvalidCssClass="MaskedEditError"
                                        MaskType="Number"
                                        InputDirection="RightToLeft"
                                        AcceptNegative="None"
                                        DisplayMoney="None"
                                        ErrorTooltipEnabled="false"
                                        ClearMaskOnLostFocus="True" />      
                                    <AjaxControlToolkit:MaskedEditValidator 
                                        ID="mev_Costo" 
                                        runat="server"
                                        ControlExtender="mee_Costo"
                                        ControlToValidate="Costo"
                                        IsValidEmpty="False"
                                        EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        MinimumValue="0.00"
                                        MaximumValue="9999999999999.99" 
                                        Display="Dynamic"
                                        EmptyValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>'
                                        InvalidValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>'
                                        MaximumValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>' 
                                        MinimumValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>'
                                        ValidationGroup="I" />                                        
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="vce_Costo"
                                        TargetControlID="mev_Costo"/> 
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Subtotal" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("SubTotalRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="SubTotal" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("SubTotalRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("SubTotal","{0:N2}") %>'>
                                    </asp:TextBox>
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
                        ID="Fis_Planilla_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Fis_Planilla_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Prespuesto_Rubro_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Apu_Prespuesto_Rubro_Id") %>'>
                    </asp:TextBox>
                    
                        <%--CAMPOS OCULTOS--%>
                    
                    <asp:TextBox 
                        ID="Fis_Planilla_Codigo" 
                        runat="server" 
                        Visible="false" 
                        Text='<%# Bind("Fis_Planilla_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Descripcion" 
                        runat="server" 
                        Visible="false" 
                        Text='<%# Bind("Descripcion") %>'>
                    </asp:TextBox>                                                                                                   
                    <asp:TextBox 
                        ID="Apu_Prespuesto_Rubro_Codigo" 
                        runat="server" 
                        Visible="false" 
                        Text='<%# Bind("Apu_Prespuesto_Rubro_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Prespuesto_Rubro_Cantidad" 
                        runat="server" 
                        Visible="false" 
                        Text='<%# Bind("Apu_Prespuesto_Rubro_Cantidad") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Acumulado" 
                        runat="server" 
                        Visible="false" 
                        Text='<%# Bind("Acumulado") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Diferencia" 
                        runat="server" 
                        Visible="false" 
                        Text='<%# Bind("Diferencia") %>'>
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
                        ID="pnl_Detalle"
                        runat="server"
                        meta:resourcekey="Rec_Fis_Planilla_DetRecursoKCG">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Rubro" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Apu_Rubro_Codigo" 
                                        runat="server"
                                        ReadOnly="true" 
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Rubro_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Apu_Rubro_Nombre" 
                                        runat="server" 
                                        Width="400px"
                                        ReadOnly="true" 
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Rubro_Nombre") %>'>
                                    </asp:TextBox>                                                                                                                 
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Unidad" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Apu_Rubro_Unidad" 
                                        runat="server" 
                                        ReadOnly="true" 
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Rubro_Unidad") %>'>
                                    </asp:TextBox>
                                    <asp:Label 
                                        ID="lbl_Cantidad" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("CantidadRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                    <asp:TextBox 
                                        ID="Cantidad" 
                                        runat="server" 
                                        ReadOnly="true" 
                                        TabIndex="-1" 
                                        style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("CantidadRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Cantidad","{0:N2}") %>'>
                                    </asp:TextBox>
                                    <asp:Label 
                                        ID="lbl_Precio_Unitario" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("CostoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                    <asp:TextBox 
                                        ID="Costo" 
                                        runat="server" 
                                        ReadOnly="true" 
                                        TabIndex="-1"
                                        style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("CostoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Costo","{0:N2}") %>'>
                                    </asp:TextBox> 
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Subtotal" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("SubTotalRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="SubTotal" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("SubTotalRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("SubTotal","{0:N2}") %>'>
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
                
                        <%--ID's--%>
                    
                    <asp:TextBox 
                        ID="Fis_Planilla_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Fis_Planilla_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Prespuesto_Rubro_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Apu_Prespuesto_Rubro_Id") %>'>
                    </asp:TextBox>
                    
                        <%--CAMPOS OCULTOS--%>
                    
                    <asp:TextBox 
                        ID="Fis_Planilla_Codigo" 
                        runat="server" 
                        Visible="false" 
                        Text='<%# Bind("Fis_Planilla_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Descripcion" 
                        runat="server" 
                        Visible="false" 
                        Text='<%# Bind("Descripcion") %>'>
                    </asp:TextBox>                                                                                                   
                    <asp:TextBox 
                        ID="Apu_Prespuesto_Rubro_Codigo" 
                        runat="server" 
                        Visible="false" 
                        Text='<%# Bind("Apu_Prespuesto_Rubro_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Prespuesto_Rubro_Cantidad" 
                        runat="server" 
                        Visible="false" 
                        Text='<%# Bind("Apu_Prespuesto_Rubro_Cantidad") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Acumulado" 
                        runat="server" 
                        Visible="false" 
                        Text='<%# Bind("Acumulado") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Diferencia" 
                        runat="server" 
                        Visible="false" 
                        Text='<%# Bind("Diferencia") %>'>
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
                ID="odsFv_Fis_Planilla_Det" 
                runat="server" 
                ConflictDetection="CompareAllValues"
                DeleteMethod="Delete" 
                InsertMethod="Insert" 
                OldValuesParameterFormatString="original{0}"
                SelectMethod="GetById" 
                SortParameterName="sortExpression" 
                TypeName="FEL.FIS.BO_Fis_Planilla_Det"
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
                            GridViewID="Gv_Fis_Planilla_Det"
                            OnNavegar="nav_Siguiente" />
                    </td>
                    <td>
                        <koala:KFiltro 
                            ID="KFiltro" 
                            runat="server" 
                            Contenedor="FIS_PLANILLA_DET" 
                            Objeto="Fis_Planilla_Det" 
                            IndiceScope ="Scope"
                            Orden="1"
                            ObjectDataSourceID="odsGv_Fis_Planilla_Det" />
                    </td>  
                    <td>
                        <asp:Button
                            ID="Btn_Proyecto"
                            runat="server"
                            meta:resourcekey="Btn_Fis_Planilla_Det_ProyectoRecursoKCG"
                            OnClick="Btn_Proyecto_Click" />
                    </td>
                    <td>
                        <asp:Button
                            ID="Btn_Planilla_Proyecto"
                            runat="server"
                            meta:resourcekey="Btn_Fis_Planilla_Det_PlanillaRecursoKCG"
                            OnClick="Btn_Planilla_Proyecto_Click" />
                    </td>
                    <td>
                        <asp:Button
                            ID="Btn_Resumen_Planilla"
                            runat="server"
                            meta:resourcekey="Btn_Fis_Planilla_Det_ResumenRecursoKCG"
                            OnClick="Btn_Resumen_Planilla_Click" />
                    </td>
                    <td>
                        <asp:Button
                            ID="Btn_Fis_Planilla_Periodo"
                            runat="server"
                            meta:resourcekey="Btn_Fis_Planilla_PeriodoRecursoKCG"
                            OnClick="Btn_Fis_Planilla_Periodo_Click" />
                    </td>
                </tr>
            </table>
            <asp:Panel 
                ID="pnl_Listado" 
                runat="server" 
                meta:resourcekey="Rec_Fis_Planilla_Det_ListadoRecursoKCG">
                <koala:KGrid  
                    ID="Gv_Fis_Planilla_Det" 
                    runat="server" 
                    AllowPaging="True" 
                    AllowSorting="True"
                    AutoGenerateColumns="False" 
                    DataKeyNames="Id" 
                    DataSourceID="odsGv_Fis_Planilla_Det"
                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>' >                    
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
                            DataField="Apu_Rubro_Codigo" 
                            meta:resourcekey="BoundApu_Rubro_CodigoRecursoKCG"
                            SortExpression="Apu_Rubro_Codigo">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Apu_Rubro_Nombre" 
                            meta:resourcekey="BoundApu_Rubro_NombreRecursoKCG"
                            SortExpression="Apu_Rubro_Nombre">
                            <ItemStyle HorizontalAlign="Left" Width="80mm" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Apu_Rubro_Unidad" 
                            meta:resourcekey="BoundApu_Rubro_UnidadRecursoKCG"
                            SortExpression="Apu_Rubro_Unidad">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Cantidad" 
                            meta:resourcekey="BoundCantidadRecursoKCG"
                            SortExpression="Cantidad"
                            DataFormatString="{0:N2}">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Costo" 
                            meta:resourcekey="BoundCostoRecursoKCG"
                            SortExpression="Costo"
                            DataFormatString="{0:N2}">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="SubTotal" 
                            meta:resourcekey="BoundSubTotalRecursoKCG"
                            SortExpression="SubTotal"
                            DataFormatString="{0:N2}">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Apu_Prespuesto_Rubro_Cantidad" 
                            meta:resourcekey="BoundApu_Prespuesto_Rubro_CantidadRecursoKCG"
                            SortExpression="Apu_Prespuesto_Rubro_Cantidad"
                            visible="False"
                            DataFormatString="{0:N2}">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Acumulado" 
                            meta:resourcekey="BoundAcumuladoRecursoKCG"
                            SortExpression="Acumulado"
                            visible="False"
                            DataFormatString="{0:N2}">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Diferencia" 
                            meta:resourcekey="BoundDiferenciaRecursoKCG"
                            SortExpression="Diferencia"
                            visible="False"
                            DataFormatString="{0:N2}">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Fis_Planilla_Id" 
                            HeaderText="Fis_Planilla_Id" 
                            SortExpression="Fis_Planilla_Id"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Fis_Planilla_Codigo" 
                            HeaderText="Fis_Planilla_Codigo"
                            SortExpression="Fis_Planilla_Codigo" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Descripcion" 
                            HeaderText="Descripcion" 
                            SortExpression="Descripcion"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Prespuesto_Rubro_Id" 
                            HeaderText="Apu_Prespuesto_Rubro_Id"
                            SortExpression="Apu_Prespuesto_Rubro_Id" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Prespuesto_Rubro_Codigo" 
                            HeaderText="Apu_Prespuesto_Rubro_Codigo"
                            SortExpression="Apu_Prespuesto_Rubro_Codigo" 
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
                            DataField="Codigo" 
                            HeaderText="Codigo" 
                            SortExpression="Codigo" 
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
                    ID="odsGv_Fis_Planilla_Det" 
                    runat="server" 
                    OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetByPlanilla" 
                    TypeName="FEL.FIS.BO_Fis_Planilla_Det" 
                    ConflictDetection="CompareAllValues">
                    <SelectParameters>
                        <asp:SessionParameter 
                            Name="s" 
                            SessionField="Scope" 
                            Type="Object" />
                        <asp:QueryStringParameter 
                            Name="Fis_Planilla_Id" 
                            QueryStringField="Fis_Planilla_Id"
                            Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

