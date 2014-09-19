<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="APU_PROYECTO_EQUIPO.aspx.cs"
    Inherits="APU_APU_PROYECTO_EQUIPO" 
    Theme="EstiloKCG" 
    StylesheetTheme="EstiloKCG"
    meta:resourcekey="Tit_Apu_Proyecto_EquipoRecursoKCG" %>

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
    TagPrefix="koala" 
    Assembly="KoalaWebControls" 
    Namespace="Koala.KoalaWebControls" %>
<asp:Content 
    ID="Content1" 
    ContentPlaceHolderID="ContentPlaceHolder1" 
    runat="Server">
    <asp:UpdatePanel 
        ID="UpdatePanel1" 
        runat="server" 
        UpdateMode="Conditional">
        <ContentTemplate>
            
        <script type="text/javascript">
                // Work around browser behavior of "auto-submitting" simple forms
                Sys.Application.add_load(page_load);
                Sys.Application.add_unload(page_unload);
                                
                var Costo_Combustible=null;
                var Costo_Repuesto = null;
                var Costo_Mantenimiento= null;
                var Costo_Alquiler= null; 
                var Costo_Otros=null;                
//                                            var Costo_Hora = null;
                var Costo_Total = null;                

                function page_load(sender, e){
                
                Costo_Combustible = $get("ctl00_ContentPlaceHolder1_fvApu_Proyecto_Equipo_Costo_Combustible");
                Costo_Repuesto = $get("ctl00_ContentPlaceHolder1_fvApu_Proyecto_Equipo_Costo_Repuesto");
                Costo_Mantenimiento = $get("ctl00_ContentPlaceHolder1_fvApu_Proyecto_Equipo_Costo_Mantenimiento");
                Costo_Alquiler = $get("ctl00_ContentPlaceHolder1_fvApu_Proyecto_Equipo_Costo_Alquiler");
                Costo_Otros = $get("ctl00_ContentPlaceHolder1_fvApu_Proyecto_Equipo_Costo_Otros");
                
                Costo_Hora = $get("ctl00_ContentPlaceHolder1_fvApu_Proyecto_Equipo_Costo_Hora");
                Costo_Total = $get("ctl00_ContentPlaceHolder1_fvApu_Proyecto_Equipo_Costo_Total");
                    
                    $addHandler(Costo_Combustible, "change", datos_onchange);
                    $addHandler(Costo_Repuesto, "change", datos_onchange);
                    $addHandler(Costo_Mantenimiento, "change", datos_onchange);
                    $addHandler(Costo_Alquiler, "change", datos_onchange);
                    $addHandler(Costo_Otros, "change", datos_onchange);

                }
                
                function page_unload(sender, e){
                $removeHandler(Costo_Combustible, "change", datos_onchange);
                $removeHandler(Costo_Repuesto, "change", datos_onchange);
                $removeHandler(Costo_Mantenimiento, "change", datos_onchange);
                $removeHandler(Costo_Alquiler, "change", datos_onchange);
                $removeHandler(Costo_Otros, "change", datos_onchange);
                }
                
                function datos_onchange(sender, e){
                Calcular();
                }
                                        
                function Calcular()
                {                   
                    //var numCosto_Total = $get("ctl00_ContentPlaceHolder1_fvApu_Proyecto_Equipo_Costo_Total");
                    
                    var costoTotalCalculado = 0.00;  
//                                                var costoHoraCalculado = 0.00;                                                            
                    var numCosto_Combustible = Number.parseLocale(Costo_Combustible.value);                                
                    var numCosto_Repuesto = Number.parseLocale(Costo_Repuesto.value);                                
                    var numCosto_Mantenimiento = Number.parseLocale(Costo_Mantenimiento.value);                                
                    var numCosto_Alquiler = Number.parseLocale(Costo_Alquiler.value);                                
                    var numCosto_Otros = Number.parseLocale(Costo_Otros.value);
                    
                    if(!isNaN(numCosto_Combustible))
                       costoTotalCalculado += numCosto_Combustible;

                    if(!isNaN(numCosto_Repuesto))
                       costoTotalCalculado += numCosto_Repuesto; 
                       
                    if(!isNaN(numCosto_Mantenimiento))
                       costoTotalCalculado += numCosto_Mantenimiento;
                    
                    if(!isNaN(numCosto_Alquiler))
                       costoTotalCalculado += numCosto_Alquiler;
                       
                    if(!isNaN(numCosto_Otros))
                       costoTotalCalculado += numCosto_Otros;
                                                    
                    costoHoraCalculado = costoTotalCalculado / 8;
                    costoHoraCalculado = Redondear(costoHoraCalculado, 4);
                    
                    Costo_Hora.value = costoHoraCalculado.localeFormat("N4");
                    Costo_Total.value = costoTotalCalculado.localeFormat("N4");
                }
                function Redondear(x,numeroDecimales) {
                        return (Math.round(x*Math.pow(10,numeroDecimales)))/Math.pow(10,numeroDecimales);
                    }
        </script>
            <asp:FormView ID="fvApu_Proyecto_Equipo" runat="server" DataSourceID="odsfvapu_proyecto_equipo"
                DefaultMode="Insert">
                <EditItemTemplate>
                    <asp:Panel ID="Panel1" runat="server" meta:resourcekey="Rec_Apu_Proyecto_Equipo_ProyectoRecursoKCG">
                        <table>
                            <tr align="left">
                                <td>
                                    <asp:Label ID="lblProyecto" runat="server" Text='<%# GetLocalResourceObject("Apu_Proyecto_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Proyecto_Codigo" 
                                        runat="server" 
                                        TabIndex="-1" 
                                        ReadOnly="true"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Proyecto_CodigoRecursoKCG.ToolTip").ToString() %>'
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
                                        ReadOnly="true"
                                        Width="400px" 
                                        Height="50px"
                                        TextMode="MultiLine"
                                        CssClass="TEXTO_LECTURA_KCG"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Proyecto_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Proyecto_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <asp:Panel ID="PanelI2" runat="server" meta:resourcekey="Rec_Apu_Proyecto_EquipoRecursoKCG">
                        <table>
                            <tr align="right">
                                <td colspan="2">
                                    <asp:Label ID="lblEstadoNombre" runat="server" Text='<%# Bind("Estado_Nombre") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label ID="lblCodigo" runat="server" Text='<%# GetLocalResourceObject("Apu_Equipo_CodigoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Apu_Equipo_Codigo" runat="server" TabIndex="-1" ReadOnly="true"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Equipo_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Equipo_Codigo") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label ID="lblNombre" runat="server" Text='<%# GetLocalResourceObject("Apu_Equipo_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Apu_Equipo_Nombre" runat="server" TabIndex="-1" ReadOnly="true"
                                        Width="400px" Height="50px" CssClass="TEXTO_LECTURA_KCG" TextMode="MultiLine"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Equipo_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Equipo_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label ID="lblCostoCombustible" runat="server" Text='<%# GetLocalResourceObject("Costo_CombustibleRecursoKCG.Text").ToString() %>'>                                        
                                    </asp:Label>
                                </td>
                                <td style="white-space: nowrap">
                                    <asp:TextBox ID="Costo_Combustible" runat="server" CssClass="TEXTO_EDICION_KCG" Style="text-align: right"
                                        ToolTip='<%# GetLocalResourceObject("Costo_CombustibleRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Costo_Combustible") %>'>
                                    </asp:TextBox>
                                    <asp:Label ID="lblMonedaSimbolo1" runat="server" Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                                    <AjaxControlToolkit:MaskedEditExtender ID="meeCosto_Combustible" runat="server" TargetControlID="Costo_Combustible"
                                        Mask="9,999,999,999,999.9999" MessageValidatorTip="false" OnFocusCssClass="MaskedEditFocus"
                                        OnInvalidCssClass="MaskedEditError" MaskType="Number" InputDirection="RightToLeft"
                                        AcceptNegative="None" DisplayMoney="None" ErrorTooltipEnabled="false" ClearMaskOnLostFocus="True" />
                                    <AjaxControlToolkit:MaskedEditValidator ID="MaskedEditValidator2" runat="server"
                                        ControlExtender="meeCosto_Combustible" ControlToValidate="Costo_Combustible"
                                        IsValidEmpty="False" EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        MinimumValue="0.0000" MaximumValue="9999999999999.9999" Display="Dynamic" EmptyValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>'
                                        InvalidValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>'
                                        MaximumValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>'
                                        MinimumValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>'
                                        ValidationGroup="I" />
                                    <AjaxControlToolkit:ValidatorCalloutExtender runat="Server" ID="ValidatorCalloutExtender10"
                                        TargetControlID="MaskedEditValidator2" />
                                    <asp:TextBox ID="Apu_Equipo_Costo_Combustible" runat="server" ReadOnly="true" Style="text-align: right"
                                        TabIndex="-1" ToolTip='<%# GetLocalResourceObject("Apu_Equipo_Costo_CombustibleRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Equipo_Costo_Combustible","{0:N4}") %>'>
                                    </asp:TextBox>
                                    <asp:Label ID="lblMonedaSimbolo2" runat="server" Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label ID="lblRepuesto" runat="server" Text='<%# GetLocalResourceObject("Costo_RepuestoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space: nowrap">
                                    <asp:TextBox ID="Costo_Repuesto" runat="server" CssClass="TEXTO_EDICION_KCG" Style="text-align: right"
                                        ToolTip='<%# GetLocalResourceObject("Costo_RepuestoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Costo_Repuesto") %>'>
                                    </asp:TextBox>
                                    <asp:Label ID="lblMonedaSimbolo3" runat="server" Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                                    <AjaxControlToolkit:MaskedEditExtender ID="meeCosto_Repuesto" runat="server" TargetControlID="Costo_Repuesto"
                                        Mask="9,999,999,999,999.9999" MessageValidatorTip="false" OnFocusCssClass="MaskedEditFocus"
                                        OnInvalidCssClass="MaskedEditError" MaskType="Number" InputDirection="RightToLeft"
                                        AcceptNegative="None" DisplayMoney="None" ErrorTooltipEnabled="false" ClearMaskOnLostFocus="True" />
                                    <AjaxControlToolkit:MaskedEditValidator ID="MaskedEditValidator1" runat="server"
                                        ControlExtender="meeCosto_Repuesto" ControlToValidate="Costo_Repuesto" IsValidEmpty="False"
                                        EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        MinimumValue="0.0000" MaximumValue="9999999999999.9999" Display="Dynamic" EmptyValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>'
                                        InvalidValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>'
                                        MaximumValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>'
                                        MinimumValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>'
                                        ValidationGroup="I" />
                                    <AjaxControlToolkit:ValidatorCalloutExtender runat="Server" ID="ValidatorCalloutExtender1"
                                        TargetControlID="MaskedEditValidator1" />
                                    <asp:TextBox ID="Apu_Equipo_Costo_Repuesto" runat="server" ReadOnly="true" Style="text-align: right"
                                        TabIndex="-1" ToolTip='<%# GetLocalResourceObject("Apu_Equipo_Costo_RepuestoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Equipo_Costo_Repuesto","{0:N4}") %>'>
                                    </asp:TextBox>
                                    <asp:Label ID="lblMonedaSimbolo4" runat="server" Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label ID="lblMantenimiento" runat="server" Text='<%# GetLocalResourceObject("Costo_MantenimientoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space: nowrap">
                                    <asp:TextBox ID="Costo_Mantenimiento" runat="server" CssClass="TEXTO_EDICION_KCG"
                                        Style="text-align: right" ToolTip='<%# GetLocalResourceObject("Costo_MantenimientoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Costo_Mantenimiento") %>'>
                                    </asp:TextBox>
                                    <asp:Label ID="lblMonedaSimbolo5" runat="server" Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                                    <AjaxControlToolkit:MaskedEditExtender ID="meeCosto_Mantenimiento" runat="server"
                                        TargetControlID="Costo_Mantenimiento" Mask="9,999,999,999,999.9999" MessageValidatorTip="false"
                                        OnFocusCssClass="MaskedEditFocus" OnInvalidCssClass="MaskedEditError" MaskType="Number"
                                        InputDirection="RightToLeft" AcceptNegative="None" DisplayMoney="None" ErrorTooltipEnabled="false"
                                        ClearMaskOnLostFocus="True" />
                                    <AjaxControlToolkit:MaskedEditValidator ID="MaskedEditValidator3" runat="server"
                                        ControlExtender="meeCosto_Mantenimiento" ControlToValidate="Costo_Mantenimiento"
                                        IsValidEmpty="False" EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        MinimumValue="0.0000" MaximumValue="9999999999999.9999" Display="Dynamic" EmptyValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>'
                                        InvalidValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>'
                                        MaximumValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>'
                                        MinimumValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>'
                                        ValidationGroup="I" />
                                    <AjaxControlToolkit:ValidatorCalloutExtender runat="Server" ID="ValidatorCalloutExtender11"
                                        TargetControlID="MaskedEditValidator3" />
                                    <asp:TextBox 
                                        ID="Apu_Equipo_Costo_Mantenimiento" 
                                        runat="server" ReadOnly="true" 
                                        Style="text-align: right"
                                        TabIndex="-1" ToolTip='<%# GetLocalResourceObject("Apu_Equipo_Costo_MantenimientoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Equipo_Costo_Mantenimiento","{0:N4}") %>'>
                                    </asp:TextBox>
                                    <asp:Label ID="lblMonedaSimbolo6" runat="server" Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label ID="lblAlquiler" runat="server" Text='<%# GetLocalResourceObject("Costo_AlquilerRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space: nowrap">
                                    <asp:TextBox ID="Costo_Alquiler" runat="server" CssClass="TEXTO_EDICION_KCG" Style="text-align: right"
                                        ToolTip='<%# GetLocalResourceObject("Costo_AlquilerRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Costo_Alquiler") %>'>
                                    </asp:TextBox>
                                    <asp:Label ID="lblMonedaSimbolo7" runat="server" Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                                    <AjaxControlToolkit:MaskedEditExtender ID="meeCosto_Alquiler" runat="server" TargetControlID="Costo_Alquiler"
                                        Mask="9,999,999,999,999.9999" MessageValidatorTip="false" OnFocusCssClass="MaskedEditFocus"
                                        OnInvalidCssClass="MaskedEditError" MaskType="Number" InputDirection="RightToLeft"
                                        AcceptNegative="None" DisplayMoney="None" ErrorTooltipEnabled="false" ClearMaskOnLostFocus="True" />
                                    <AjaxControlToolkit:MaskedEditValidator ID="MaskedEditValidator4" runat="server"
                                        ControlExtender="meeCosto_Alquiler" ControlToValidate="Costo_Alquiler" IsValidEmpty="False"
                                        EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        MinimumValue="0.0000" MaximumValue="9999999999999.9999" Display="Dynamic" EmptyValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>'
                                        InvalidValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>'
                                        MaximumValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>'
                                        MinimumValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>'
                                        ValidationGroup="I" />
                                    <AjaxControlToolkit:ValidatorCalloutExtender runat="Server" ID="ValidatorCalloutExtender12"
                                        TargetControlID="MaskedEditValidator4" />
                                    <asp:TextBox ID="Apu_Equipo_Costo_Alquiler" runat="server" ReadOnly="true" Style="text-align: right"
                                        TabIndex="-1" ToolTip='<%# GetLocalResourceObject("Apu_Equipo_Costo_AlquilerRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Equipo_Costo_Alquiler","{0:N4}") %>'>
                                    </asp:TextBox>
                                    <asp:Label ID="lblMonedaSimbolo8" runat="server" Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label ID="lblOtros" runat="server" Text='<%# GetLocalResourceObject("Costo_OtrosRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td colspan="2">
                                    <asp:TextBox ID="Costo_Otros" runat="server" CssClass="TEXTO_EDICION_KCG" Style="text-align: right"
                                        ToolTip='<%# GetLocalResourceObject("Costo_OtrosRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Costo_Otros") %>'>
                                    </asp:TextBox>
                                    <asp:Label ID="lblMonedaSimbolo9" runat="server" Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                                    <AjaxControlToolkit:MaskedEditExtender ID="meeCosto_Otros" runat="server" TargetControlID="Costo_Otros"
                                        Mask="9,999,999,999,999.9999" MessageValidatorTip="false" OnFocusCssClass="MaskedEditFocus"
                                        OnInvalidCssClass="MaskedEditError" MaskType="Number" InputDirection="RightToLeft"
                                        AcceptNegative="None" DisplayMoney="None" ErrorTooltipEnabled="false" ClearMaskOnLostFocus="True" />
                                    <AjaxControlToolkit:MaskedEditValidator ID="MaskedEditValidator5" runat="server"
                                        ControlExtender="meeCosto_Otros" ControlToValidate="Costo_Otros" IsValidEmpty="False"
                                        EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        MinimumValue="0.0000" MaximumValue="9999999999999.9999" Display="Dynamic" EmptyValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>'
                                        InvalidValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>'
                                        MaximumValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>'
                                        MinimumValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>'
                                        ValidationGroup="I" />
                                    <AjaxControlToolkit:ValidatorCalloutExtender runat="Server" ID="ValidatorCalloutExtender13"
                                        TargetControlID="MaskedEditValidator5" />
                                    <asp:TextBox ID="Apu_Equipo_Costo_Otros" runat="server" ReadOnly="true" Style="text-align: right"
                                        TabIndex="-1" ToolTip='<%# GetLocalResourceObject("Apu_Equipo_Costo_OtrosRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Equipo_Costo_Otros","{0:N4}") %>'>
                                    </asp:TextBox>
                                    <asp:Label ID="lblMonedaSimbolo10" runat="server" Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label ID="lblCostoDiario" runat="server" Text='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Costo_Total" runat="server" Style="text-align: right" ReadOnly="true"
                                        TabIndex="-1" ToolTip='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Costo_Total","{0:N4}") %>'>
                                    </asp:TextBox>
                                    <asp:Label ID="lblMonedaSimbolo11" runat="server" Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label ID="lblCostoHora" runat="server" Text='<%# GetLocalResourceObject("Costo_HoraRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Costo_Hora" runat="server" Style="text-align: right" ReadOnly="true"
                                        TabIndex="-1" ToolTip='<%# GetLocalResourceObject("Costo_HoraRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Costo_Hora","{0:N4}") %>'>
                                    </asp:TextBox>
                                    <asp:Label ID="lblMonedaSimbolo12" runat="server" Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr align="left">
                                <td colspan="2">
                                    <asp:Button ID="UpdateButton" runat="server" ValidationGroup="I" CausesValidation="True"
                                        CommandName="Update" AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_ActualizarRecursoKCG.AccesKey").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_UpdateRecursoKCG.Text").ToString() %>'
                                        ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_UpdateRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:Button>
                                    <asp:Button ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_CancelarRecursoKCG.AccesKey").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_CancelRecursoKCG.Text").ToString() %>'
                                        ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_CancelRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:Button>
                                    <uc2:wucMensajeActualizar ID="WucMensajeActualizar1" runat="server" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <%-- Ids--%>
                    <asp:TextBox ID="Apu_Equipo_Id" runat="server" Visible="true" Style="display: none"
                        Text='<%# Bind("Apu_Equipo_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox ID="Id" runat="server" Visible="true" Style="display: none" Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox ID="Apu_Proyecto_Id" runat="server" Visible="true" Style="display: none"
                        Text='<%# Bind("Apu_Proyecto_Id") %>'>
                    </asp:TextBox>
                    <%--CAMPOS NO VISIBLES--%>
                    <asp:TextBox ID="Estado_Nombre" runat="server" Visible="false" Text='<%# Bind("Estado_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox ID="Apu_Proyecto_Etapa" runat="server" Visible="false" Text='<%# Bind("Apu_Proyecto_Etapa") %>'>
                    </asp:TextBox>
                    <asp:TextBox ID="Cantidad_equipo_X_Costo" runat="server" Visible="false" Text='<%# Bind("Cantidad_equipo_X_Costo") %>'>
                    </asp:TextBox>
                    <asp:TextBox ID="Estado" runat="server" Visible="false" Text='<%# Bind("Estado") %>'>
                    </asp:TextBox>
                    <asp:TextBox ID="Codigo" runat="server" Visible="false" Text='<%# Bind("Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox ID="Int_Moneda_Simbolo" runat="server" Visible="false" Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                    </asp:TextBox>
                    <asp:TextBox ID="Nombre" runat="server" Visible="false" Text='<%# Bind("Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox ID="Cantidad_equipo" runat="server" Visible="false" Text='<%# Bind("Cantidad_equipo") %>'>
                    </asp:TextBox>
                    <asp:TextBox ID="Suma_porcentaje_Equipo_1" runat="server" Visible="false" Text='<%# Bind("Suma_porcentaje_Equipo_1") %>'>
                    </asp:TextBox>
                    <asp:TextBox ID="Suma_porcentaje_Equipo" runat="server" Visible="false" Text='<%# Bind("Suma_porcentaje_Equipo") %>'>
                    </asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:Panel ID="Panel1" runat="server" meta:resourcekey="Rec_Apu_Proyecto_Equipo_ProyectoRecursoKCG">
                        <table>
                            <tr align="left">
                                <td>
                                    <asp:Label ID="lblProyecto" runat="server" Text='<%# GetLocalResourceObject("Apu_Proyecto_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Proyecto_Codigo" 
                                        runat="server" 
                                        TabIndex="-1" 
                                        ReadOnly="true"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Proyecto_CodigoRecursoKCG.ToolTip").ToString() %>'
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
                                        ReadOnly="true" 
                                        TabIndex="-1"
                                        Width="400px" 
                                        Height="50px"
                                        TextMode="MultiLine"
                                        CssClass="TEXTO_LECTURA_KCG"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Proyecto_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Proyecto_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <asp:Panel ID="PanelI2" runat="server" meta:resourcekey="Rec_Apu_Proyecto_EquipoRecursoKCG">
                        <table>
                            <tr align="right">
                                <td colspan="2">
                                    <asp:Label ID="lblEstadoNombre" runat="server" Text='<%# Bind("Estado_Nombre") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label ID="lblCodigo" runat="server" Visible="false" Text='<%# GetLocalResourceObject("Apu_Equipo_CodigoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Apu_Equipo_Codigo" runat="server" ReadOnly="true" Visible="false"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Equipo_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Equipo_Codigo") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label ID="lblNombre" runat="server" Text='<%# GetLocalResourceObject("Apu_Equipo_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Apu_Equipo_Nombre" runat="server" Width="400px" Height="50px" TextMode="MultiLine"
                                        CssClass="TEXTO_LECTURA_KCG" ToolTip='<%# GetLocalResourceObject("Apu_Equipo_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Equipo_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label ID="lblCostoCombustible" runat="server" Text='<%# GetLocalResourceObject("Costo_CombustibleRecursoKCG.Text").ToString() %>'>                                        
                                    </asp:Label>
                                </td>
                                <td style="white-space: nowrap">
                                    <asp:TextBox ID="Costo_Combustible" runat="server" Style="text-align: right" ToolTip='<%# GetLocalResourceObject("Costo_CombustibleRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Costo_Combustible","{0:N4}") %>'>
                                    </asp:TextBox>
                                    <asp:Label ID="lblMonedaSimbolo1" runat="server" Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                                    <asp:TextBox ID="Apu_Equipo_Costo_Combustible" runat="server" ReadOnly="true" Style="text-align: right"
                                        TabIndex="-1" ToolTip='<%# GetLocalResourceObject("Apu_Equipo_Costo_CombustibleRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Equipo_Costo_Combustible","{0:N4}") %>'>
                                    </asp:TextBox>
                                    <asp:Label ID="lblMonedaSimbolo2" runat="server" Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label ID="lblRepuesto" runat="server" Text='<%# GetLocalResourceObject("Costo_RepuestoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space: nowrap">
                                    <asp:TextBox ID="Costo_Repuesto" runat="server" Style="text-align: right" ToolTip='<%# GetLocalResourceObject("Costo_RepuestoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Costo_Repuesto","{0:N4}") %>'>
                                    </asp:TextBox>
                                    <asp:Label ID="lblMonedaSimbolo3" runat="server" Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                                    <asp:TextBox ID="Apu_Equipo_Costo_Repuesto" runat="server" ReadOnly="true" Style="text-align: right"
                                        TabIndex="-1" ToolTip='<%# GetLocalResourceObject("Apu_Equipo_Costo_RepuestoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Equipo_Costo_Repuesto","{0:N4}") %>'>
                                    </asp:TextBox>
                                    <asp:Label ID="lblMonedaSimbolo4" runat="server" Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label ID="lblMantenimiento" runat="server" Text='<%# GetLocalResourceObject("Costo_MantenimientoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space: nowrap">
                                    <asp:TextBox ID="Costo_Mantenimiento" runat="server" Style="text-align: right" ToolTip='<%# GetLocalResourceObject("Costo_MantenimientoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Costo_Mantenimiento","{0:N4}") %>'>
                                    </asp:TextBox>
                                    <asp:Label ID="lblMonedaSimbolo5" runat="server" Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                                    <asp:TextBox ID="Apu_Equipo_Costo_Mantenimiento" runat="server" TabIndex="-1" ReadOnly="true"
                                        Style="text-align: right" ToolTip='<%# GetLocalResourceObject("Apu_Equipo_Costo_MantenimientoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Equipo_Costo_Mantenimiento","{0:N4}") %>'>
                                    </asp:TextBox>
                                    <asp:Label ID="lblMonedaSimbolo6" runat="server" Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label ID="lblAlquiler" runat="server" Text='<%# GetLocalResourceObject("Costo_AlquilerRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space: nowrap">
                                    <asp:TextBox ID="Costo_Alquiler" runat="server" Style="text-align: right" ToolTip='<%# GetLocalResourceObject("Costo_AlquilerRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Costo_Alquiler","{0:N4}") %>'>
                                    </asp:TextBox>
                                    <asp:Label ID="lblMonedaSimbolo7" runat="server" Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                                    <asp:TextBox ID="Apu_Equipo_Costo_Alquiler" runat="server" TabIndex="-1" ReadOnly="true"
                                        Style="text-align: right" ToolTip='<%# GetLocalResourceObject("Apu_Equipo_Costo_AlquilerRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Equipo_Costo_Alquiler","{0:N4}") %>'>
                                    </asp:TextBox>
                                    <asp:Label ID="lblMonedaSimbolo8" runat="server" Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label ID="lblOtros" runat="server" Text='<%# GetLocalResourceObject("Costo_OtrosRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space: nowrap">
                                    <asp:TextBox ID="Costo_Otros" runat="server" Style="text-align: right" ToolTip='<%# GetLocalResourceObject("Costo_OtrosRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Costo_Otros","{0:N4}") %>'>
                                    </asp:TextBox>
                                    <asp:Label ID="lblMonedaSimbolo9" runat="server" Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                                    <asp:TextBox ID="Apu_Equipo_Costo_Otros" runat="server" TabIndex="-1" ReadOnly="true"
                                        Style="text-align: right" ToolTip='<%# GetLocalResourceObject("Apu_Equipo_Costo_OtrosRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Equipo_Costo_Otros","{0:N4}") %>'>
                                    </asp:TextBox>
                                    <asp:Label ID="lblMonedaSimbolo10" runat="server" Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label ID="lblCostoDiario" runat="server" Text='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Costo_Total" runat="server" ReadOnly="true" Style="text-align: right"
                                        TabIndex="-1" ToolTip='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Costo_Total","{0:N4}") %>'>
                                    </asp:TextBox>
                                    <asp:Label ID="lblMonedaSimbolo11" runat="server" Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label ID="lblCostoHora" runat="server" Text='<%# GetLocalResourceObject("Costo_HoraRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Costo_Hora" runat="server" Style="text-align: right" ReadOnly="true"
                                        TabIndex="-1" ToolTip='<%# GetLocalResourceObject("Costo_HoraRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Costo_Hora","{0:N4}") %>'>
                                    </asp:TextBox>
                                    <asp:Label ID="lblMonedaSimbolo12" runat="server" Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                        </table>
                        <table>
                            <tr align="left">
                                <td colspan="2">
                                    <asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                        ValidationGroup="I" AccessKey="I" Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_InsertRecursoKCG.Text").ToString() %>'
                                        ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_InsertRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:Button>
                                </td>
                                <td>
                                    <asp:Button ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                                        AccessKey="C" Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_CancelRecursoKCG.Text").ToString() %>'
                                        ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_CancelRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:Button>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <%-- Ids--%>
                    <asp:TextBox ID="Apu_Equipo_Id" runat="server" Visible="true" Style="display: none"
                        Text='<%# Bind("Apu_Equipo_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox ID="Id" runat="server" Visible="true" Style="display: none" Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox ID="Apu_Proyecto_Id" runat="server" Visible="true" Style="display: none"
                        Text='<%# Bind("Apu_Proyecto_Id") %>'>
                    </asp:TextBox>
                    <%--CAMPOS NO VISIBLES--%>
                    <asp:TextBox ID="Estado_Nombre" runat="server" Visible="false" Text='<%# Bind("Estado_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox ID="Apu_Proyecto_Etapa" runat="server" Visible="false" Text='<%# Bind("Apu_Proyecto_Etapa") %>'>
                    </asp:TextBox>
                    <asp:TextBox ID="Cantidad_equipo_X_Costo" runat="server" Visible="false" Text='<%# Bind("Cantidad_equipo_X_Costo") %>'>
                    </asp:TextBox>
                    <asp:TextBox ID="Estado" runat="server" Visible="false" Text='<%# Bind("Estado") %>'>
                    </asp:TextBox>
                    <asp:TextBox ID="Codigo" runat="server" Visible="false" Text='<%# Bind("Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox ID="Int_Moneda_Simbolo" runat="server" Visible="false" Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                    </asp:TextBox>
                    <asp:TextBox ID="Nombre" runat="server" Visible="false" Text='<%# Bind("Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox ID="Cantidad_equipo" runat="server" Visible="false" Text='<%# Bind("Cantidad_equipo") %>'>
                    </asp:TextBox>
                    <asp:TextBox ID="Suma_porcentaje_Equipo_1" runat="server" Visible="false" Text='<%# Bind("Suma_porcentaje_Equipo_1") %>'>
                    </asp:TextBox>
                    <asp:TextBox ID="Suma_porcentaje_Equipo" runat="server" Visible="false" Text='<%# Bind("Suma_porcentaje_Equipo") %>'>
                    </asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Panel ID="Panel1" runat="server" meta:resourcekey="Rec_Apu_Proyecto_Equipo_ProyectoRecursoKCG">
                        <table>
                            <tr align="left">
                                <td>
                                    <asp:Label ID="lblProyecto" runat="server" Text='<%# GetLocalResourceObject("Apu_Proyecto_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Proyecto_Codigo" 
                                        runat="server" 
                                        TabIndex="-1" 
                                        ReadOnly="true"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Proyecto_CodigoRecursoKCG.ToolTip").ToString() %>'
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
                                        ReadOnly="true"
                                        Width="400px" 
                                        Height="50px"
                                        TextMode="MultiLine"
                                        CssClass="TEXTO_LECTURA_KCG"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Proyecto_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Proyecto_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <asp:Panel ID="PanelI2" runat="server" meta:resourcekey="Rec_Apu_Proyecto_EquipoRecursoKCG">
                        <table>
                            <tr align="right">
                                <td colspan="2">
                                    <asp:Label ID="lblEstadoNombre" runat="server" Text='<%# Bind("Estado_Nombre") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label ID="lblCodigo" runat="server" Text='<%# GetLocalResourceObject("Apu_Equipo_CodigoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Apu_Equipo_Codigo" runat="server" TabIndex="-1" ReadOnly="true"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Equipo_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Equipo_Codigo") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label ID="lblNombre" runat="server" Text='<%# GetLocalResourceObject("Apu_Equipo_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Apu_Equipo_Nombre" runat="server" ReadOnly="true" TabIndex="-1"
                                        Height="50px" TextMode="MultiLine" CssClass="TEXTO_LECTURA_KCG" Width="400px"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Equipo_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Equipo_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label ID="lblCostoCombustible" runat="server" Text='<%# GetLocalResourceObject("Costo_CombustibleRecursoKCG.Text").ToString() %>'>                                        
                                    </asp:Label>
                                </td>
                                <td style="white-space: nowrap">
                                    <asp:TextBox ID="Costo_Combustible" runat="server" TabIndex="-1" ReadOnly="true"
                                        Style="text-align: right" ToolTip='<%# GetLocalResourceObject("Costo_CombustibleRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Costo_Combustible","{0:N4}") %>'>
                                    </asp:TextBox>
                                    <asp:Label ID="lblMonedaSimbolo1" runat="server" Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                                    <asp:TextBox ID="Apu_Equipo_Costo_Combustible" runat="server" TabIndex="-1" ReadOnly="true"
                                        Style="text-align: right" ToolTip='<%# GetLocalResourceObject("Apu_Equipo_Costo_CombustibleRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Equipo_Costo_Combustible","{0:N4}") %>'>
                                    </asp:TextBox>
                                    <asp:Label ID="lblMonedaSimbolo2" runat="server" Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label ID="lblRepuesto" runat="server" Text='<%# GetLocalResourceObject("Costo_RepuestoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space: nowrap">
                                    <asp:TextBox ID="Costo_Repuesto" runat="server" TabIndex="-1" ReadOnly="true" Style="text-align: right"
                                        ToolTip='<%# GetLocalResourceObject("Costo_RepuestoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Costo_Repuesto","{0:N4}") %>'>
                                    </asp:TextBox>
                                    <asp:Label ID="lblMonedaSimbolo3" runat="server" Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                                    <asp:TextBox ID="Apu_Equipo_Costo_Repuesto" runat="server" TabIndex="-1" ReadOnly="true"
                                        Style="text-align: right" ToolTip='<%# GetLocalResourceObject("Apu_Equipo_Costo_RepuestoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Equipo_Costo_Repuesto","{0:N4}") %>'>
                                    </asp:TextBox>
                                    <asp:Label ID="lblMonedaSimbolo4" runat="server" Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label ID="lblMantenimiento" runat="server" Text='<%# GetLocalResourceObject("Costo_MantenimientoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space: nowrap">
                                    <asp:TextBox ID="Costo_Mantenimiento" runat="server" TabIndex="-1" ReadOnly="true"
                                        Style="text-align: right" ToolTip='<%# GetLocalResourceObject("Costo_MantenimientoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Costo_Mantenimiento","{0:N4}") %>'>
                                    </asp:TextBox>
                                    <asp:Label ID="lblMonedaSimbolo5" runat="server" Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                                    <asp:TextBox ID="Apu_Equipo_Costo_Mantenimiento" runat="server" TabIndex="-1" ReadOnly="true"
                                        Style="text-align: right" ToolTip='<%# GetLocalResourceObject("Apu_Equipo_Costo_MantenimientoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Equipo_Costo_Mantenimiento","{0:N4}") %>'>
                                    </asp:TextBox>
                                    <asp:Label ID="lblMonedaSimbolo6" runat="server" Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label ID="lblAlquiler" runat="server" Text='<%# GetLocalResourceObject("Costo_AlquilerRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space: nowrap">
                                    <asp:TextBox ID="Costo_Alquiler" runat="server" TabIndex="-1" ReadOnly="true" Style="text-align: right"
                                        ToolTip='<%# GetLocalResourceObject("Costo_AlquilerRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Costo_Alquiler","{0:N4}") %>'>
                                    </asp:TextBox>
                                    <asp:Label ID="lblMonedaSimbolo7" runat="server" Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                                    <asp:TextBox ID="Apu_Equipo_Costo_Alquiler" runat="server" TabIndex="-1" ReadOnly="true"
                                        Style="text-align: right" ToolTip='<%# GetLocalResourceObject("Apu_Equipo_Costo_AlquilerRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Equipo_Costo_Alquiler","{0:N4}") %>'>
                                    </asp:TextBox>
                                    <asp:Label ID="lblMonedaSimbolo8" runat="server" Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label ID="lblOtros" runat="server" Text='<%# GetLocalResourceObject("Costo_OtrosRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space: nowrap">
                                    <asp:TextBox ID="Costo_Otros" runat="server" TabIndex="-1" ReadOnly="true" Style="text-align: right"
                                        ToolTip='<%# GetLocalResourceObject("Costo_OtrosRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Costo_Otros","{0:N4}") %>'>
                                    </asp:TextBox>
                                    <asp:Label ID="lblMonedaSimbolo9" runat="server" Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                                    <asp:TextBox ID="Apu_Equipo_Costo_Otros" runat="server" TabIndex="-1" ReadOnly="true"
                                        Style="text-align: right" ToolTip='<%# GetLocalResourceObject("Apu_Equipo_Costo_OtrosRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Equipo_Costo_Otros","{0:N4}") %>'>
                                    </asp:TextBox>
                                    <asp:Label ID="lblMonedaSimbolo10" runat="server" Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label ID="lblCostoDiario" runat="server" Text='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Costo_Total" runat="server" TabIndex="-1" Style="text-align: right"
                                        ReadOnly="true" ToolTip='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Costo_Total","{0:N4}") %>'>
                                    </asp:TextBox>
                                    <asp:Label ID="lblMonedaSimbolo11" runat="server" Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label ID="lblCostoHora" runat="server" Text='<%# GetLocalResourceObject("Costo_HoraRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Costo_Hora" runat="server" TabIndex="-1" ReadOnly="true" Style="text-align: right"
                                        ToolTip='<%# GetLocalResourceObject("Costo_HoraRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Costo_Hora","{0:N4}") %>'>
                                    </asp:TextBox>
                                    <asp:Label ID="lblMonedaSimbolo12" runat="server" Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr align="left">
                                <td colspan="2">
                                    <asp:Button ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_EditarRecursoKCG.AccesKey").ToString() %>'
                                        Enabled='<%# HER.PermisosMovimientos.Movimiento_Apu_Proyecto_Equipo(Request.QueryString["Estado"], HER.PermisosMovimientos.ModoOperacion.Editar ) %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_EditRecursoKCG.Text").ToString() %>'
                                        ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_EditRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:Button>
                                    <asp:Button ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_EliminarRecursoKCG.AccesKey").ToString() %>'
                                        Enabled="false"
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_DeleteRecursoKCG.Text").ToString() %>'
                                        ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_DeleteRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:Button>
                                    <asp:Button ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_NuevoRecursoKCG.AccesKey").ToString() %>'
                                        Enabled="false"
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_NewRecursoKCG.Text").ToString() %>'
                                        ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_NewRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:Button>
                                    <uc1:wucMensajeEliminar ID="WucMensajeEliminar1" runat="server" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <%-- Ids--%>
                    <asp:TextBox ID="Apu_Equipo_Id" runat="server" Visible="true" Style="display: none"
                        Text='<%# Bind("Apu_Equipo_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox ID="Id" runat="server" Visible="true" Style="display: none" Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox ID="Apu_Proyecto_Id" runat="server" Visible="true" Style="display: none"
                        Text='<%# Bind("Apu_Proyecto_Id") %>'>
                    </asp:TextBox>
                    <%--CAMPOS NO VISIBLES--%>
                    <asp:TextBox ID="Estado_Nombre" runat="server" Visible="false" Text='<%# Bind("Estado_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox ID="Apu_Proyecto_Etapa" runat="server" Visible="false" Text='<%# Bind("Apu_Proyecto_Etapa") %>'>
                    </asp:TextBox>
                    <asp:TextBox ID="Cantidad_equipo_X_Costo" runat="server" Visible="false" Text='<%# Bind("Cantidad_equipo_X_Costo") %>'>
                    </asp:TextBox>
                    <asp:TextBox ID="Estado" runat="server" Visible="false" Text='<%# Bind("Estado") %>'>
                    </asp:TextBox>
                    <asp:TextBox ID="Codigo" runat="server" Visible="false" Text='<%# Bind("Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox ID="Int_Moneda_Simbolo" runat="server" Visible="false" Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                    </asp:TextBox>
                    <asp:TextBox ID="Nombre" runat="server" Visible="false" Text='<%# Bind("Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox ID="Cantidad_equipo" runat="server" Visible="false" Text='<%# Bind("Cantidad_equipo") %>'>
                    </asp:TextBox>
                    <asp:TextBox ID="Suma_porcentaje_Equipo_1" runat="server" Visible="false" Text='<%# Bind("Suma_porcentaje_Equipo_1") %>'>
                    </asp:TextBox>
                    <asp:TextBox ID="Suma_porcentaje_Equipo" runat="server" Visible="false" Text='<%# Bind("Suma_porcentaje_Equipo") %>'>
                    </asp:TextBox>
                </ItemTemplate>
            </asp:FormView>
            <koala:KNavegacion ID="nav" runat="server" GridViewID="gvApu_Proyecto_Equipo" FormViewID="FormView1"
                OnNavegar="nav_Siguiente" />
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="gvApu_Proyecto_Equipo" EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:ObjectDataSource ID="odsfvapu_proyecto_equipo" runat="server" OldValuesParameterFormatString="original{0}"
        SelectMethod="GetById" TypeName="FEL.APU.BO_Apu_Proyecto_Equipo" ConflictDetection="CompareAllValues"
        SortParameterName="sortExpression" UpdateMethod="Update">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
            <asp:Parameter Name="Id" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <asp:Button ID="Atras" runat="server" Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_AtrasRecursoKCG.Text").ToString() %>'
                ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_AtrasRecursoKCG.ToolTip").ToString() %>'
                Visible="False" />
            <asp:Button ID="Seleccionar" runat="server" Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_SeleccionRecursoKCG.Text").ToString() %>'
                ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_SeleccionRecursoKCG.ToolTip").ToString() %>'
                Visible="False" />
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
        <ContentTemplate>
            <table>
                <tr>
                    <td>
                        <koala:KFiltro ID="kftFiltro" runat="server" Contenedor="APU_PROYECTO_EQUIPO" Objeto="APU_PROYECTO_EQUIPO"
                            IndiceScope="Scope" Orden="1" ObjectDataSourceID="odsgvApu_proyecto_equipo" />
                    </td>
                    <td>
                        <asp:Button ID="BtnProyecto" runat="server" OnClick="BtnProyecto_Click" />
                    </td>

                </tr>
            </table>
            <asp:Panel runat="server" ID="PaneldatosGrid" meta:resourcekey="Rec_Apu_Proyecto_Equipo_ListadoRecursoKCG">
                <koala:KGrid ID="gvApu_Proyecto_Equipo" runat="server" AllowPaging="True" AllowSorting="True"
                    AutoGenerateColumns="False" AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>'
                    DataKeyNames="Id" DataSourceID="odsgvApu_proyecto_equipo">
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
                            DataField="Apu_Equipo_Codigo" 
                            meta:resourcekey="BoundApu_Equipo_CodigoRecursoKCG"
                            SortExpression="Apu_Equipo_Codigo" />
                        <asp:BoundField 
                            DataField="Apu_Equipo_Nombre" 
                            meta:resourcekey="BoundApu_Equipo_NombreRecursoKCG"
                            SortExpression="Apu_Equipo_Nombre">
                            <headerstyle width="350px" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Costo_Total" 
                            meta:resourcekey="BoundCosto_TotalRecursoKCG"
                            SortExpression="Costo_Total" 
                            dataformatstring="{0:N4}" >
                            <itemstyle wrap="False" horizontalalign="Right" />
                        </asp:BoundField>  
                        <asp:BoundField 
                            DataField="Costo_Hora" 
                            meta:resourcekey="BoundCosto_HoraRecursoKCG"
                            SortExpression="Costo_Hora" 
                            dataformatstring="{0:N4}" >
                            <itemstyle wrap="False" horizontalalign="Right" />
                        </asp:BoundField>  
                        <asp:BoundField 
                            DataField="Estado_Nombre" 
                            HeaderText="Estado_Nombre" 
                            SortExpression="Estado_Nombre"
                            Visible="False" />
                        <asp:BoundField DataField="Apu_Proyecto_Etapa" HeaderText="Apu_Proyecto_Etapa" SortExpression="Apu_Proyecto_Etapa"
                            Visible="False" />
                        <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" Visible="False" />
                        <asp:BoundField DataField="Costo_Mantenimiento" HeaderText="Costo_Mantenimiento"
                            SortExpression="Costo_Mantenimiento" Visible="False" />
                        <asp:BoundField DataField="Cantidad_equipo_X_Costo" HeaderText="Cantidad_equipo_X_Costo"
                            SortExpression="Cantidad_equipo_X_Costo" Visible="False" />
                        <asp:BoundField DataField="Apu_Equipo_Costo_Mantenimiento" HeaderText="Apu_Equipo_Costo_Mantenimiento"
                            SortExpression="Apu_Equipo_Costo_Mantenimiento" Visible="False" />
                        <asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado" Visible="False" />
                        <asp:BoundField DataField="Codigo" HeaderText="Codigo" SortExpression="Codigo_int"
                            Visible="False" />
                        <asp:BoundField DataField="Costo_Combustible" HeaderText="Costo_Combustible" SortExpression="Costo_Combustible"
                            Visible="False" />
                        <asp:BoundField DataField="Int_Moneda_Simbolo" HeaderText="Int_Moneda_Simbolo" SortExpression="Int_Moneda_Simbolo"
                            Visible="False" />
                        <asp:BoundField DataField="Apu_Equipo_Costo_Combustible" HeaderText="Apu_Equipo_Costo_Combustible"
                            SortExpression="Apu_Equipo_Costo_Combustible" Visible="False" />
                        <asp:BoundField DataField="Apu_Proyecto_Nombre" HeaderText="Apu_Proyecto_Nombre"
                            SortExpression="Apu_Proyecto_Nombre" Visible="False" />
                        <asp:BoundField DataField="Apu_Equipo_Costo_Alquiler" HeaderText="Apu_Equipo_Costo_Alquiler"
                            SortExpression="Apu_Equipo_Costo_Alquiler" Visible="False" />
                        <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" Visible="False" />
                        <asp:BoundField DataField="Costo_Otros" HeaderText="Costo_Otros" SortExpression="Costo_Otros"
                            Visible="False" />
                        <asp:BoundField DataField="Cantidad_equipo" HeaderText="Cantidad_equipo" SortExpression="Cantidad_equipo"
                            Visible="False" />
                        <asp:BoundField DataField="Apu_Equipo_Id" HeaderText="Apu_Equipo_Id" SortExpression="Apu_Equipo_Id"
                            Visible="False" />
                        <asp:BoundField DataField="Suma_porcentaje_Equipo_1" HeaderText="Suma_porcentaje_Equipo_1"
                            SortExpression="Suma_porcentaje_Equipo_1" Visible="False" />
                        <asp:BoundField DataField="Apu_Proyecto_Codigo" HeaderText="Apu_Proyecto_Codigo"
                            SortExpression="Apu_Proyecto_Codigo" Visible="False" />
                        <asp:BoundField DataField="Costo_Alquiler" HeaderText="Costo_Alquiler" SortExpression="Costo_Alquiler"
                            Visible="False" />
                        <asp:BoundField DataField="Apu_Proyecto_Id" HeaderText="Apu_Proyecto_Id" SortExpression="Apu_Proyecto_Id"
                            Visible="False" />
                        <asp:BoundField DataField="Suma_porcentaje_Equipo" HeaderText="Suma_porcentaje_Equipo"
                            SortExpression="Suma_porcentaje_Equipo" Visible="False" />
                        <asp:BoundField DataField="Apu_Equipo_Costo_Otros" HeaderText="Apu_Equipo_Costo_Otros"
                            SortExpression="Apu_Equipo_Costo_Otros" Visible="False" />
                        <asp:BoundField DataField="Apu_Equipo_Costo_Repuesto" HeaderText="Apu_Equipo_Costo_Repuesto"
                            SortExpression="Apu_Equipo_Costo_Repuesto" Visible="False" />
                    </Columns>
                </koala:KGrid>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:ObjectDataSource ID="odsgvApu_proyecto_equipo" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetByProyecto" TypeName="FEL.APU.BO_Apu_Proyecto_Equipo">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
            <asp:QueryStringParameter Name="apu_proyecto_Id" QueryStringField="Apu_Proyecto_Id"
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
