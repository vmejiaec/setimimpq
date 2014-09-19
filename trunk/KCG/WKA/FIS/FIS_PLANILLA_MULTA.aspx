<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="FIS_PLANILLA_MULTA.aspx.cs" 
    Inherits="FIS_FIS_PLANILLA_MULTA" 
    StylesheetTheme="EstiloKCG"
    Theme="EstiloKCG"
    meta:resourcekey="Tit_Fis_Planilla_MultaRecursoKCG"%>
    
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
                
                var Nro_Dias = null;
                var Fraccion_Mil  = null;
                var Valor_Planilla = null;
                
                function page_load(sender, e)
                {
                    Nro_Dias = $get("ctl00_ContentPlaceHolder1_Nro_Dias");                    
                    if(Nro_Dias)          
                        $addHandler(Nro_Dias, "change", Nro_Dias_onchange);
                    
                    Fraccion_Mil  = $get("ctl00_ContentPlaceHolder1_Fraccion_Mil");                    
                    if(Fraccion_Mil)          
                        $addHandler(Fraccion_Mil, "change", Fraccion_Mil_onchange);
                        
                    Valor_Planilla  = $get("ctl00_ContentPlaceHolder1_Valor_Planilla");                    
                    if(Valor_Planilla)          
                        $addHandler(Valor_Planilla, "change", Valor_Planilla_onchange);
                    
                    Calculo_ResultadoMc();
                }
                
                function page_unload(sender, e)
                {
                    if(Nro_Dias)                    
                        $removeHandler(Nro_Dias, "change", Nro_Dias_onchange);
                        
                    if(Fraccion_Mil)                    
                        $removeHandler(Fraccion_Mil, "change", Fraccion_Mil_onchange);
                        
                    if(Valor_Planilla)                    
                        $removeHandler(Valor_Planilla, "change", Valor_Planilla_onchange);
                }
                
                function Nro_Dias_onchange(sender, e)
                {                    
                    Calculo_ResultadoMc();
                }  
                
                function Fraccion_Mil_onchange(sender, e)
                {                    
                    Calculo_ResultadoMc();
                }  
                
                function Valor_Planilla_onchange(sender, e)
                {                    
                    Calculo_ResultadoVP();
                }
                
                function Calculo_ResultadoVP()
                { 
                    var Resultado_VP = $get("ctl00_ContentPlaceHolder1_Resultado_VP");
                    var multiplica = 0.00;  
                    var numValor_Planilla = Number.parseLocale(Valor_Planilla.value);  
                    var numFraccion_Mil = Number.parseLocale(Fraccion_Mil.value); 
                    
                    if(isNaN(numFraccion_Mil))
                        numFraccion_Mil = 0.00; 
                    if(isNaN(numValor_Planilla))
                        numValor_Planilla = 0.00;    
                    
                    multiplica = (numFraccion_Mil * numValor_Planilla)/1000;                                                                                                                                      
                    Resultado_VP.value = multiplica.localeFormat("N2");                 
                }
                
                function Calculo_ResultadoMc()
                {
                    var Resultado_Mc = $get("ctl00_ContentPlaceHolder1_Resultado_Mc");
                    var Monto_Contrato = $get("ctl00_ContentPlaceHolder1_Monto_Contrato");  
                    var multip = 0.00;  
                    var numNro_Dias = Number.parseLocale(Nro_Dias.value);  
                    var numFraccion_Mil = Number.parseLocale(Fraccion_Mil.value);
                    var numMonto_Contrato = Number.parseLocale(Monto_Contrato.value);
                    
                    if(isNaN(numNro_Dias))
                        numNro_Dias = 0.00; 
                    if(isNaN(numFraccion_Mil))
                        numFraccion_Mil = 0.00;  
                    if(isNaN(numMonto_Contrato))
                        numMonto_Contrato = 0.00;                                               
                                                                   
                    multip = ((numNro_Dias * numFraccion_Mil) * numMonto_Contrato)/1000;                                                                                                                                      
                    Resultado_Mc.value = multip.localeFormat("N2");
                    
                    Calculo_ResultadoVP();
                }        
                
                function ItemSelected_FisMulNom( source, eventArgs ) 
                {   
                    var valor = eventArgs.get_value();
                    var temp = new Array();
                    temp = valor.split('||');
                                                        
                    var Fis_Multa_Id = $get("ctl00_ContentPlaceHolder1_Fv_Fis_Planilla_Multa_Fis_Multa_Id");
                    Fis_Multa_Id.value = temp[0];                                                                                                                                                                                              
                }      
            
            </script>
            
            <asp:Panel 
                ID="pnl_Proyecto" 
                runat="server" 
                meta:resourcekey="Rec_Fis_Planilla_Multa_ProyectoRecursoKCG" >
                <table>
                    <tr>
                        <td>
                            <asp:Label 
                                ID="lbl_Proy_Codigo" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("Lbl_CodigoRecursoKCG.Text").ToString() %>' >
                            </asp:Label>
                        </td>                        
                        <td>
                            <asp:Label 
                                ID="lbl_Proy_CodInst" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("Lbl_Codigo_InstitucionalRecursoKCG.Text").ToString() %>' >
                            </asp:Label>
                        </td>                        
                        <td>
                            <asp:Label 
                                ID="lbl_Proy_FechaI" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("Lbl_Fecha_InicioRecursoKCG.Text").ToString() %>' >
                            </asp:Label>
                        </td>                        
                        <td>
                            <asp:Label 
                                ID="lbl_Proy_Plazo" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("Lbl_PlazoRecursoKCG.Text").ToString() %>' >
                            </asp:Label>
                        </td>                        
                        <td>
                            <asp:Label 
                                ID="lbl_FechaF" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("Lbl_Fecha_FinRecursoKCG.Text").ToString() %>' >
                            </asp:Label>
                        </td>                        
                        <td>
                            <asp:Label 
                                ID="lbl_Proy_Estado" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("Lbl_EstadoRecursoKCG.Text").ToString() %>' >
                                </asp:Label>
                        </td>                                                                     
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox 
                                ID="Proy_Codigo" 
                                runat="server"
                                onfocus="this.blur()" 
                                TabIndex="-1"
                                style="text-align:right"
                                ToolTip='<%# GetLocalResourceObject("Lbl_CodigoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="Proy_CodInst" 
                                runat="server"
                                onfocus="this.blur()" 
                                TabIndex="-1"
                                style="text-align:right"
                                ToolTip='<%# GetLocalResourceObject("Lbl_Codigo_InstitucionalRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>                        
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="Proy_FechaI" 
                                runat="server"
                                onfocus="this.blur()" 
                                TabIndex="-1"
                                ToolTip='<%# GetLocalResourceObject("Lbl_Fecha_InicioRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="Proy_Plazo" 
                                runat="server"
                                onfocus="this.blur()" 
                                TabIndex="-1"
                                style="text-align:right"
                                ToolTip='<%# GetLocalResourceObject("Lbl_PlazoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="Proy_FechaF" 
                                runat="server"
                                onfocus="this.blur()" 
                                TabIndex="-1"
                                ToolTip='<%# GetLocalResourceObject("Lbl_Fecha_FinRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="Proy_Estado" 
                                runat="server"
                                onfocus="this.blur()" 
                                TabIndex="-1"
                                ToolTip='<%# GetLocalResourceObject("Lbl_EstadoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>   
                    </tr>
                </table>
                <table>
                    <tr>
                        <td>
                            <asp:Label 
                                ID="lbl_Proy_Proyecto" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("Lbl_ProyectoRecursoKCG.Text").ToString() %>' >
                                </asp:Label>
                            <asp:TextBox 
                                ID="txt_p3" 
                                Width="5px"
                                TabIndex="-1"
                                BorderColor="white"
                                BorderStyle="Solid"
                                ReadOnly="true"
                                runat="server"
                                Text="">
                            </asp:TextBox>   
                        </td>                        
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox 
                                ID="Proy_Proyecto" 
                                runat="server"
                                onfocus="this.blur()" 
                                TabIndex="-1"
                                Width="700px"
                                TextMode="MultiLine"
                                Height="50px"
                                CssClass="TEXTO_LECTURA_KCG"
                                ToolTip='<%# GetLocalResourceObject("Lbl_ProyectoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:FormView 
                ID="Fv_Fis_Planilla_Multa" 
                runat="server" 
                DataSourceID="odsFv_Fis_Planilla_Multa"
                DefaultMode="Insert">
                <EditItemTemplate>
                    <asp:Panel 
                        ID="pnl_Planilla" 
                        runat="server" 
                        meta:resourcekey="Rec_Fis_Planilla_Multa_PlanillaRecursoKCG" >
                        <table>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lbl_NoPlanilla" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Fis_Planilla_Numero_PlanillaRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Fis_Planilla_Numero_Planilla" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("Fis_Planilla_Numero_PlanillaRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Fis_Planilla_Numero_Planilla") %>'>
                                    </asp:TextBox>
                                </td>     
                                <td>
                                    <asp:Label 
                                        ID="lbl_Presentacion" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Fis_Planilla_Fecha_Ultimo_IngresoRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>     
                                <td>
                                    <asp:TextBox 
                                        ID="Fis_Planilla_Fecha_Ultimo_Ingreso" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Fis_Planilla_Fecha_Ultimo_IngresoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Fis_Planilla_Fecha_Ultimo_Ingreso","{0:dd/MM/yyyy}") %>'>
                                    </asp:TextBox>
                                </td>    
                                <td>
                                    <asp:Label 
                                        ID="lbl_Monto" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Fis_Planilla_TotalRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>     
                                <td>
                                    <asp:TextBox 
                                        ID="Fis_Planilla_Total" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("Fis_Planilla_TotalRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Fis_Planilla_Total","{0:N2}") %>'>
                                    </asp:TextBox>
                                </td>   
                                <td>
                                    <asp:Label 
                                        ID="lbl_Tipo" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Fis_Planilla_Tipo_NombreRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>  
                                <td>
                                    <asp:TextBox 
                                        ID="Fis_Planilla_Tipo_Nombre" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Fis_Planilla_Tipo_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Fis_Planilla_Tipo_Nombre") %>'>
                                    </asp:TextBox>
                                </td>        
                            </tr>
                        </table>
                    </asp:Panel>
                    <asp:Panel 
                        ID="pnl_Multas" 
                        runat="server" 
                        meta:resourcekey="Rec_Fis_Planilla_MultaRecursoKCG" >
                        <table>
                            <tr>    
                                <td>    
                                    <asp:Label 
                                        ID="lbl_Codigo" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>
                                <td>    
                                    <asp:TextBox 
                                        ID="Codigo" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Codigo") %>'>
                                    </asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label 
                                        ID="lbl_TipoMulta" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Fis_Multa_NombreRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Fis_Multa_Nombre" 
                                        runat="server" 
                                        Width="400px"
                                        CssClass="TEXTO_COMBOPER_KCG"
                                        ToolTip='<%# GetLocalResourceObject("Fis_Multa_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Fis_Multa_Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        ID="rfv_FisMulNom"
                                        runat="server" 
                                        ControlToValidate="Fis_Multa_Nombre"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="vce_FisMulNom"
                                        TargetControlID="rfv_FisMulNom"/>
                                    <AjaxControlToolkit:AutoCompleteExtender
                                        runat="server" 
                                        BehaviorID="AutoCompEx_FisMulNom"
                                        ID="ace_FisMulNom"                                         
                                        TargetControlID="Fis_Multa_Nombre"
                                        ServicePath="~/FIS/FIS_PLANILLA_MULTA.aspx" 
                                        ServiceMethod="Get_FisMulNom"
                                        MinimumPrefixLength="0" 
                                        CompletionInterval="500"
                                        EnableCaching="true"
                                        CompletionSetCount="500"
                                        CompletionListCssClass="autocomplete_completionListElement" 
                                        CompletionListItemCssClass="autocomplete_listItem" 
                                        CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                        OnClientItemSelected="ItemSelected_FisMulNom" >
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
                                                        var behavior = $find('AutoCompEx_FisMulNom');
                                                        if (!behavior._height) {
                                                            var target = behavior.get_completionList();
                                                            behavior._height = target.offsetHeight - 2;
                                                            target.style.height = '0px';
                                                        }" />                                                    
                                                    <%-- Expand from 0px to the appropriate size while fading in --%>
                                                    <Parallel Duration=".4">
                                                        <FadeIn />
                                                        <Length PropertyKey="height" StartValue="0" EndValueScript="$find('AutoCompEx_FisMulNom')._height" />
                                                    </Parallel>
                                                </Sequence>
                                            </OnShow>
                                            <OnHide>
                                                <%-- Collapse down to 0px and fade out --%>
                                                <Parallel Duration=".4">
                                                    <FadeOut />
                                                    <Length PropertyKey="height" StartValueScript="$find('AutoCompEx_FisMulNom')._height" EndValue="0" />
                                                </Parallel>
                                            </OnHide>
                                        </Animations>
                                    </AjaxControlToolkit:AutoCompleteExtender>
                                </td>                                
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lbl_ValorMulta" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("ValorRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Valor" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG"
                                        style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("ValorRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Valor","{0:N2}") %>'>
                                    </asp:TextBox>
                                    <AjaxControlToolkit:MaskedEditExtender 
                                        ID="mee_Valor" 
                                        runat="server"
                                        TargetControlID="Valor"
                                        Mask="9,999,999,999,999.99"
                                        MessageValidatorTip="false"
                                        OnFocusCssClass="MaskedEditFocus"
                                        OnInvalidCssClass="MaskedEditError"
                                        MaskType="Number"
                                        InputDirection="RightToLeft"
                                        AcceptNegative="Left"
                                        DisplayMoney="None"
                                        ErrorTooltipEnabled="false"
                                        ClearMaskOnLostFocus="True" />      
                                    <AjaxControlToolkit:MaskedEditValidator 
                                        ID="mev_Valor" 
                                        runat="server"
                                        ControlExtender="mee_Valor"
                                        ControlToValidate="Valor"
                                        IsValidEmpty="False"
                                        EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        MinimumValue="-9999999999999.99"
                                        MaximumValue="9999999999999.99"
                                        Display="Dynamic"
                                        EmptyValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>'
                                        InvalidValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>'
                                        MaximumValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>' 
                                        MinimumValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>'
                                        ValidationGroup="I" />                                        
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="vce_Valor"
                                        TargetControlID="mev_Valor"/>  
                                </td>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Observ" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("DescripcionRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Descripcion" 
                                        runat="server" 
                                        Width="400px"
                                        Height="50px"
                                        TextMode="MultiLine"
                                        CssClass="TEXTO_EDICION_KCG"
                                        ToolTip='<%# GetLocalResourceObject("DescripcionRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Descripcion") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lbl_FechaApr" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("FechaRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Fecha" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG"
                                        ToolTip='<%# GetLocalResourceObject("FechaRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Fecha","{0:dd/MM/yyyy}") %>'>
                                    </asp:TextBox>
                                    <AjaxControlToolkit:CalendarExtender
                                        ID="ce_Fecha" 
                                        runat="server" 
                                        TargetControlID="Fecha" 
                                        Format="dd/MM/yyyy">          
                                    </AjaxControlToolkit:CalendarExtender>
                                    <AjaxControlToolkit:MaskedEditExtender 
                                        TargetControlID="Fecha" 
                                        Mask="99/99/9999" 
                                        MaskType="Date"  
                                        ID="mee_Fecha"          
                                        OnFocusCssClass="MaskedEditFocus"
                                        runat="server">
                                   </AjaxControlToolkit:MaskedEditExtender>
                                    <AjaxControlToolkit:MaskedEditValidator
                                        ControlToValidate="Fecha" 
                                        ControlExtender="mee_Fecha" 
                                        id="mev_Fecha"   
                                        TooltipMessage="Formato (dd/MM/yyyy)"  
                                        runat="server" 
                                        IsValidEmpty="false" 
                                        MaximumValue="01/01/2079"
                                        MaximumValueMessage="Fecha < 01/01/2079"
                                        MinimumValueMessage="Fecha > 01/01/1900"
                                        MinimumValue="01/01/1900"
                                        EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                        InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ7RecursoKCG.ErrorMessage").ToString() %>'                                        
                                        EmptyValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'
                                        InvalidValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ7RecursoKCG.Text").ToString() %>' 
                                        ValidationGroup="I"
                                        Display="Dynamic" />  
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="vce_Fecha"
                                        TargetControlID="mev_Fecha" />
                                </td>
                            </tr>
                            <tr>
                                <td align="left" colspan="2" >
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
                                    <uc2:wucMensajeActualizar 
                                        ID="WucMensajeActualizar1" 
                                        runat="server" />                                   
                                </td>                               
                            </tr>                            
                        </table>
                    </asp:Panel>                    
                    
                    <%--Id's--%>
                    
                    <asp:TextBox 
                        ID="Fis_Planilla_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Fis_Planilla_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Fis_Multa_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Fis_Multa_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    
                    <%--campos no visibles--%>                                       
                    
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
                        ID="pnl_Planilla" 
                        runat="server" 
                        meta:resourcekey="Rec_Fis_Planilla_Multa_PlanillaRecursoKCG" >
                        <table>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lbl_NoPlanilla" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Fis_Planilla_Numero_PlanillaRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Fis_Planilla_Numero_Planilla" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("Fis_Planilla_Numero_PlanillaRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Fis_Planilla_Numero_Planilla") %>'>
                                    </asp:TextBox>
                                </td>     
                                <td>
                                    <asp:Label 
                                        ID="lbl_Presentacion" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Fis_Planilla_Fecha_Ultimo_IngresoRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>     
                                <td>
                                    <asp:TextBox 
                                        ID="Fis_Planilla_Fecha_Ultimo_Ingreso" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Fis_Planilla_Fecha_Ultimo_IngresoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Fis_Planilla_Fecha_Ultimo_Ingreso","{0:dd/MM/yyyy}") %>'>
                                    </asp:TextBox>
                                </td>    
                                <td>
                                    <asp:Label 
                                        ID="lbl_Monto" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Fis_Planilla_TotalRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>     
                                <td>
                                    <asp:TextBox 
                                        ID="Fis_Planilla_Total" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("Fis_Planilla_TotalRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Fis_Planilla_Total","{0:N2}") %>'>
                                    </asp:TextBox>
                                </td>   
                                <td>
                                    <asp:Label 
                                        ID="lbl_Tipo" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Fis_Planilla_Tipo_NombreRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>  
                                <td>
                                    <asp:TextBox 
                                        ID="Fis_Planilla_Tipo_Nombre" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Fis_Planilla_Tipo_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Fis_Planilla_Tipo_Nombre") %>'>
                                    </asp:TextBox>
                                </td>        
                            </tr>
                        </table>
                    </asp:Panel>
                    <asp:Panel 
                        ID="pnl_Multas" 
                        runat="server" 
                        meta:resourcekey="Rec_Fis_Planilla_MultaRecursoKCG" >
                        <table>
                            <tr>    
                                <td>    
                                    <asp:Label 
                                        ID="lbl_Codigo" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>' >
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
                                <td>
                                    <asp:Label 
                                        ID="lbl_TipoMulta" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Fis_Multa_NombreRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Fis_Multa_Nombre" 
                                        runat="server" 
                                        Width="400px"
                                        CssClass="TEXTO_COMBOPER_KCG"
                                        ToolTip='<%# GetLocalResourceObject("Fis_Multa_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Fis_Multa_Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        ID="rfv_FisMulNom"
                                        runat="server" 
                                        ControlToValidate="Fis_Multa_Nombre"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="vce_FisMulNom"
                                        TargetControlID="rfv_FisMulNom"/>
                                    <AjaxControlToolkit:AutoCompleteExtender
                                        runat="server" 
                                        BehaviorID="AutoCompEx_FisMulNom"
                                        ID="ace_FisMulNom"                                         
                                        TargetControlID="Fis_Multa_Nombre"
                                        ServicePath="~/FIS/FIS_PLANILLA_MULTA.aspx" 
                                        ServiceMethod="Get_FisMulNom"
                                        MinimumPrefixLength="0" 
                                        CompletionInterval="500"
                                        EnableCaching="true"
                                        CompletionSetCount="500"
                                        CompletionListCssClass="autocomplete_completionListElement" 
                                        CompletionListItemCssClass="autocomplete_listItem" 
                                        CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                        OnClientItemSelected="ItemSelected_FisMulNom" >
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
                                                        var behavior = $find('AutoCompEx_FisMulNom');
                                                        if (!behavior._height) {
                                                            var target = behavior.get_completionList();
                                                            behavior._height = target.offsetHeight - 2;
                                                            target.style.height = '0px';
                                                        }" />                                                    
                                                    <%-- Expand from 0px to the appropriate size while fading in --%>
                                                    <Parallel Duration=".4">
                                                        <FadeIn />
                                                        <Length PropertyKey="height" StartValue="0" EndValueScript="$find('AutoCompEx_FisMulNom')._height" />
                                                    </Parallel>
                                                </Sequence>
                                            </OnShow>
                                            <OnHide>
                                                <%-- Collapse down to 0px and fade out --%>
                                                <Parallel Duration=".4">
                                                    <FadeOut />
                                                    <Length PropertyKey="height" StartValueScript="$find('AutoCompEx_FisMulNom')._height" EndValue="0" />
                                                </Parallel>
                                            </OnHide>
                                        </Animations>
                                    </AjaxControlToolkit:AutoCompleteExtender>
                                </td>                                
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lbl_ValorMulta" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("ValorRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Valor" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG"
                                        style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("ValorRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Valor") %>'>
                                    </asp:TextBox>
                                    <AjaxControlToolkit:MaskedEditExtender 
                                        ID="mee_Valor" 
                                        runat="server"
                                        TargetControlID="Valor"
                                        Mask="9,999,999,999,999.99"
                                        MessageValidatorTip="false"
                                        OnFocusCssClass="MaskedEditFocus"
                                        OnInvalidCssClass="MaskedEditError"
                                        MaskType="Number"
                                        InputDirection="RightToLeft"
                                        AcceptNegative="Left"
                                        DisplayMoney="None"
                                        ErrorTooltipEnabled="false"
                                        ClearMaskOnLostFocus="True" />      
                                    <AjaxControlToolkit:MaskedEditValidator 
                                        ID="mev_Valor" 
                                        runat="server"
                                        ControlExtender="mee_Valor"
                                        ControlToValidate="Valor"
                                        IsValidEmpty="False"
                                        EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        MinimumValue="-9999999999999.99"
                                        MaximumValue="9999999999999.99"
                                        Display="Dynamic"
                                        EmptyValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>'
                                        InvalidValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>'
                                        MaximumValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>' 
                                        MinimumValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>'
                                        ValidationGroup="I" />                                        
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="vce_Valor"
                                        TargetControlID="mev_Valor"/>  
                                </td>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Observ" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("DescripcionRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Descripcion" 
                                        runat="server" 
                                        Width="400px"
                                        Height="50px"
                                        TextMode="MultiLine"
                                        CssClass="TEXTO_EDICION_KCG"
                                        ToolTip='<%# GetLocalResourceObject("DescripcionRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Descripcion") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lbl_FechaApr" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("FechaRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Fecha" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG"
                                        ToolTip='<%# GetLocalResourceObject("FechaRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Fecha") %>'>
                                    </asp:TextBox>
                                    <AjaxControlToolkit:CalendarExtender
                                        ID="ce_Fecha" 
                                        runat="server" 
                                        TargetControlID="Fecha" 
                                        Format="dd/MM/yyyy">          
                                    </AjaxControlToolkit:CalendarExtender>
                                    <AjaxControlToolkit:MaskedEditExtender 
                                        TargetControlID="Fecha" 
                                        Mask="99/99/9999" 
                                        MaskType="Date"  
                                        ID="mee_Fecha"          
                                        OnFocusCssClass="MaskedEditFocus"
                                        runat="server">
                                   </AjaxControlToolkit:MaskedEditExtender>
                                    <AjaxControlToolkit:MaskedEditValidator
                                        ControlToValidate="Fecha" 
                                        ControlExtender="mee_Fecha" 
                                        id="mev_Fecha"   
                                        TooltipMessage="Formato (dd/MM/yyyy)"  
                                        runat="server" 
                                        IsValidEmpty="false" 
                                        MaximumValue="01/01/2079"
                                        MaximumValueMessage="Fecha < 01/01/2079"
                                        MinimumValueMessage="Fecha > 01/01/1900"
                                        MinimumValue="01/01/1900"
                                        EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                        InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ7RecursoKCG.ErrorMessage").ToString() %>'                                        
                                        EmptyValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'
                                        InvalidValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ7RecursoKCG.Text").ToString() %>' 
                                        ValidationGroup="I"
                                        Display="Dynamic" />  
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="vce_Fecha"
                                        TargetControlID="mev_Fecha" />
                                </td>
                            </tr>
                            <tr>
                                <td align="left" colspan="2">
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
                        ID="Fis_Planilla_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Fis_Planilla_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Fis_Multa_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Fis_Multa_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    
                    <%--campos no visibles--%>                                       
                    
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
                        ID="pnl_Planilla" 
                        runat="server" 
                        meta:resourcekey="Rec_Fis_Planilla_Multa_PlanillaRecursoKCG" >
                        <table>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lbl_NoPlanilla" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Fis_Planilla_Numero_PlanillaRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Fis_Planilla_Numero_Planilla" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("Fis_Planilla_Numero_PlanillaRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Fis_Planilla_Numero_Planilla") %>'>
                                    </asp:TextBox>
                                </td>     
                                <td>
                                    <asp:Label 
                                        ID="lbl_Presentacion" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Fis_Planilla_Fecha_Ultimo_IngresoRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>     
                                <td>
                                    <asp:TextBox 
                                        ID="Fis_Planilla_Fecha_Ultimo_Ingreso" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Fis_Planilla_Fecha_Ultimo_IngresoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Fis_Planilla_Fecha_Ultimo_Ingreso","{0:dd/MM/yyyy}") %>'>
                                    </asp:TextBox>
                                </td>    
                                <td>
                                    <asp:Label 
                                        ID="lbl_Monto" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Fis_Planilla_TotalRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>     
                                <td>
                                    <asp:TextBox 
                                        ID="Fis_Planilla_Total" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("Fis_Planilla_TotalRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Fis_Planilla_Total","{0:N2}") %>'>
                                    </asp:TextBox>
                                </td>   
                                <td>
                                    <asp:Label 
                                        ID="lbl_Tipo" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Fis_Planilla_Tipo_NombreRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>  
                                <td>
                                    <asp:TextBox 
                                        ID="Fis_Planilla_Tipo_Nombre" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Fis_Planilla_Tipo_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Fis_Planilla_Tipo_Nombre") %>'>
                                    </asp:TextBox>
                                </td>        
                            </tr>
                        </table>
                    </asp:Panel>
                    <asp:Panel 
                        ID="pnl_Multas" 
                        runat="server" 
                        meta:resourcekey="Rec_Fis_Planilla_MultaRecursoKCG" >
                        <table>
                            <tr>    
                                <td>    
                                    <asp:Label 
                                        ID="lbl_Codigo" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>
                                <td>    
                                    <asp:TextBox 
                                        ID="Codigo" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Codigo") %>'>
                                    </asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label 
                                        ID="lbl_TipoMulta" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Fis_Multa_NombreRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Fis_Multa_Nombre" 
                                        runat="server" 
                                        Width="400px"
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Fis_Multa_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Fis_Multa_Nombre") %>'>
                                    </asp:TextBox>                                    
                                </td>                                
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lbl_ValorMulta" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("ValorRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Valor" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("ValorRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Valor","{0:N2}") %>'>
                                    </asp:TextBox>                                     
                                </td>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Observ" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("DescripcionRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Descripcion" 
                                        runat="server" 
                                        Width="400px"
                                        Height="50px"
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        TextMode="MultiLine"
                                        CssClass="TEXTO_LECTURA_KCG"
                                        ToolTip='<%# GetLocalResourceObject("DescripcionRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Descripcion") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lbl_FechaApr" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("FechaRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Fecha" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("FechaRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Fecha","{0:dd/MM/yyyy}") %>'>
                                    </asp:TextBox>                                    
                                </td>
                            </tr>
                            <tr>
                                <td align="left" colspan="2">
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
                        ID="Fis_Planilla_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Fis_Planilla_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Fis_Multa_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Fis_Multa_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    
                    <%--campos no visibles--%>                                       
                    
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
                ID="odsFv_Fis_Planilla_Multa" 
                runat="server" 
                ConflictDetection="CompareAllValues"
                DeleteMethod="Delete" 
                InsertMethod="Insert" 
                OldValuesParameterFormatString="original{0}"
                SelectMethod="GetById" 
                SortParameterName="sortExpression" 
                TypeName="FEL.FIS.BO_Fis_Planilla_Multa"
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
            <asp:Panel 
                ID="pnl_Facilidad" 
                runat="server" 
                meta:resourcekey="Rec_Fis_Planilla_Multa_FacilidadRecursoKCG" >
                <table>
                    <tr>
                        <td>
                            <asp:Label 
                                ID="lbl_NroDias" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("Lbl_Numero_DiasRecursoKCG.Text").ToString() %>' >
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="Nro_Dias" 
                                runat="server"       
                                style="text-align:right"                                     
                                CssClass="TEXTO_EDICION_KCG"
                                ToolTip='<%# GetLocalResourceObject("Lbl_Numero_DiasRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <AjaxControlToolkit:MaskedEditExtender 
                                ID="mee_Nro_Dias" 
                                runat="server"
                                TargetControlID="Nro_Dias"
                                Mask="9999999999999"
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
                                ID="mev_Nro_Dias" 
                                runat="server"
                                ControlExtender="mee_Nro_Dias"
                                ControlToValidate="Nro_Dias"
                                IsValidEmpty="False"
                                EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                MinimumValue="1"
                                MaximumValue="9999999999999" 
                                Display="Dynamic"
                                EmptyValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>'
                                InvalidValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>'
                                MaximumValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>' 
                                MinimumValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>'
                                ValidationGroup="I" />                                        
                            <AjaxControlToolkit:ValidatorCalloutExtender 
                                runat="Server" 
                                ID="vce_Nro_Dias"
                                TargetControlID="mev_Nro_Dias"/> 
                        </td>
                        <td>
                            <asp:Label 
                                ID="lbl_FraccionMin" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("Lbl_Fraccion_x_MilRecursoKCG.Text").ToString() %>' >
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="Fraccion_Mil" 
                                runat="server"              
                                style="text-align:right"                           
                                CssClass="TEXTO_EDICION_KCG"
                                ToolTip='<%# GetLocalResourceObject("Lbl_Fraccion_x_MilRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <AjaxControlToolkit:MaskedEditExtender 
                                ID="mee_FracMil" 
                                runat="server"
                                TargetControlID="Fraccion_Mil"
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
                                ID="mev_FracMil" 
                                runat="server"
                                ControlExtender="mee_FracMil"
                                ControlToValidate="Fraccion_Mil"
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
                                ID="vce_FracMil"
                                TargetControlID="mev_FracMil"/>  
                        </td>
                        <td>
                            <asp:Label 
                                ID="lbl_MontoContrato" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("Lbl_Monto_ContratoRecursoKCG.Text").ToString() %>' >
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="Monto_Contrato" 
                                runat="server"       
                                onfocus="this.blur()"                                   
                                TabIndex="-1"
                                style="text-align:right"   
                                ToolTip='<%# GetLocalResourceObject("Lbl_Monto_ContratoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                        <td>
                            <asp:Label 
                                ID="lbl_ResultadoMc" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("Lbl_Resultado_MCRecursoKCG.Text").ToString() %>' >
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="Resultado_Mc" 
                                runat="server"      
                                style="text-align:right"                                      
                                ReadOnly="true"
                                TabIndex="-1"
                                ToolTip='<%# GetLocalResourceObject("Lbl_Resultado_MCRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">                            
                        </td>
                        <td>
                            <asp:Label 
                                ID="lbl_Valor_Plan" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("Lbl_Valor_PlanillaRecursoKCG.Text").ToString() %>' >
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="Valor_Planilla" 
                                runat="server"                                         
                                onfocus="this.blur()" 
                                TabIndex="-1"
                                style="text-align:right"   
                                ToolTip='<%# GetLocalResourceObject("Lbl_Valor_PlanillaRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                        <td>
                            <asp:Label 
                                ID="lbl_Resultado_Vp" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("Lbl_Resultado_VPRecursoKCG.Text").ToString() %>' >
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="Resultado_VP" 
                                runat="server"         
                                style="text-align:right"                                   
                                ReadOnly="true"
                                TabIndex="-1"
                                ToolTip='<%# GetLocalResourceObject("Lbl_Resultado_VPRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
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
                            ID="nav"
                            runat="server"
                            GridViewID="Gv_Fis_Planilla_Multa"
                            FormViewID="Fv_Fis_Planilla_Multa" 
                            OnNavegar="nav_Siguiente" />
                    </td>
                    <td>
                        <koala:KFiltro 
                            ID="kftFiltro" 
                            runat="server" 
                            Contenedor="FIS_PLANILLA_MULTA" 
                            Objeto="Fis_Planilla_Multa" 
                            IndiceScope ="Scope"
                            Orden="1" 
                            ObjectDataSourceID="odsGv_Fis_Planilla_Multa"/>
                    </td>
                    <td>
                        <asp:Button 
                            ID="Btn_Fis_Planilla_Multa_Fiscalizacion" 
                            runat="server" 
                            meta:resourcekey="Btn_Fis_Planilla_Multa_FiscalizacionRecursoKCG" 
                            OnClick="Btn_Fis_Planilla_Multa_Fiscalizacion_Click" />
                    </td>
                    <td>
                        <asp:Button 
                            ID="Btn_Fis_Planilla_Multas_Planilla" 
                            runat="server" 
                            meta:resourcekey="Btn_Fis_Planilla_Multas_PlanillaRecursoKCG" 
                            OnClick="Btn_Fis_Planilla_Multas_Planilla_Click" />
                    </td>                    
                </tr>
            </table>
            <asp:Panel 
                ID="pnl_Listado" 
                runat="server" 
                meta:resourcekey="Rec_Fis_Planilla_Multa_ListadoRecursoKCG" >
                <koala:KGrid
                    ID="Gv_Fis_Planilla_Multa" 
                    runat="server" 
                    AllowPaging="True" 
                    AllowSorting="True"
                    AutoGenerateColumns="False" 
                    DataKeyNames="Id" 
                    DataSourceID="odsGv_Fis_Planilla_Multa"
                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>'>
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
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Fis_Multa_Nombre" 
                            meta:resourcekey="BoundFis_Multa_NombreRecursoKCG"
                            SortExpression="Fis_Multa_Nombre">
                            <ItemStyle Width="80mm" Wrap="true" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Valor" 
                            meta:resourcekey="BoundValorRecursoKCG"
                            SortExpression="Valor"
                            DataFormatString="{0:N2}">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Fecha" 
                            meta:resourcekey="BoundFechaRecursoKCG"
                            SortExpression="Fecha"
                            DataFormatString="{0:dd/MM/yyyy}">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Descripcion" 
                            meta:resourcekey="BoundDescripcionRecursoKCG"
                            SortExpression="Descripcion">
                            <ItemStyle Width="80mm" Wrap="true" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Fis_Planilla_Id" 
                            HeaderText="Fis_Planilla_Id" 
                            SortExpression="Fis_Planilla_Id"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Fis_Multa_Id" 
                            HeaderText="Fis_Multa_Id" 
                            SortExpression="Fis_Multa_Id"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Fis_Planilla_Numero_Planilla" 
                            HeaderText="Fis_Planilla_Numero_Planilla"
                            SortExpression="Fis_Planilla_Numero_Planilla" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Fis_Planilla_Fecha_Ultimo_Ingreso" 
                            HeaderText="Fis_Planilla_Fecha_Ultimo_Ingreso"
                            SortExpression="Fis_Planilla_Fecha_Ultimo_Ingreso" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Fis_Planilla_Total" 
                            HeaderText="Fis_Planilla_Total" 
                            SortExpression="Fis_Planilla_Total"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Fis_Planilla_Tipo_Nombre" 
                            HeaderText="Fis_Planilla_Tipo_Nombre"
                            SortExpression="Fis_Planilla_Tipo_Nombre" 
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
                    ID="odsGv_Fis_Planilla_Multa" 
                    runat="server" 
                    ConflictDetection="CompareAllValues"
                    OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetByPlanilla" 
                    TypeName="FEL.FIS.BO_Fis_Planilla_Multa">
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

