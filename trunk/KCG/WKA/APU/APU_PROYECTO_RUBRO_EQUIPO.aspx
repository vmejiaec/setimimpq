<%@ Page Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="APU_PROYECTO_RUBRO_EQUIPO.aspx.cs" 
    Inherits="APU_APU_PROYECTO_RUBRO_EQUIPO" 
    meta:resourcekey="Tit_Apu_Proyecto_Rubro_EquipoRecursoKCG" 
    Theme="EstiloKCG"
    StylesheetTheme="EstiloKCG" %>
    
<%@ Register tagprefix="koala" 
    assembly="KoalaWebControls" 
    namespace="Koala.KoalaWebControls" %>
    
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
     
<asp:Content ID="Content1" 
    ContentPlaceHolderID="ContentPlaceHolder1" 
    Runat="Server">
    
    <script type="text/javascript">
        // Work around browser behavior of "auto-submitting" simple forms
        Sys.Application.add_load(page_load);
        Sys.Application.add_unload(page_unload);
                                            
        var costo_hora = null;
        var Cantidad = null;
        
        function page_load(sender, e){
        Cantidad = $get("ctl00_ContentPlaceHolder1_fvApuProyectoRubroEquipo_Cantidad");
        costo_hora = $get("ctl00_ContentPlaceHolder1_fvApuProyectoRubroEquipo_costo_hora");
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
            
            var Apu_Equipo_Id = $get("ctl00_ContentPlaceHolder1_fvApuProyectoRubroEquipo_Apu_Equipo_Id");
            
            Apu_Equipo_Id.value = temp[0];
            costo_hora.value = temp[1];
            
            Calcular();    
        }
                                                                                
        function Calcular()
        {
            var resultado = 0.00;
            var costo_hora_x_cantidad = $get("ctl00_ContentPlaceHolder1_fvApuProyectoRubroEquipo_costo_hora_x_cantidad");
                            
            var numCosto_hora = Number.parseLocale(costo_hora.value);
            if(isNaN(numCosto_hora)) return;
            
            var numCantidad = Number.parseLocale(Cantidad.value);
            if(isNaN(numCantidad)) return;
            
            resultado = numCosto_hora *  numCantidad;
            resultado = Redondear(resultado, 4);
            costo_hora_x_cantidad.value = resultado.localeFormat("N4");
            
            var rendimiento_equipo_hora = $get("ctl00_ContentPlaceHolder1_fvApuProyectoRubroEquipo_rendimiento_equipo_hora");
            var numRendimiento_equipo_hora = Number.parseLocale(rendimiento_equipo_hora.value);
            if(isNaN(numRendimiento_equipo_hora)) return;
            
            resultado = resultado * numRendimiento_equipo_hora;
            resultado = Redondear(resultado, 4);
            
            costo_x_rendimiento_hora = $get("ctl00_ContentPlaceHolder1_fvApuProyectoRubroEquipo_costo_x_rendimiento_hora");
            costo_x_rendimiento_hora.value = resultado.localeFormat("N4"); 
        }
        
        function Redondear(x,numeroDecimales) {
            return (Math.round(x*Math.pow(10,numeroDecimales)))/Math.pow(10,numeroDecimales);
        }                                                                        
        
    </script>
    <asp:UpdatePanel ID="uppFv" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:FormView ID="fvApuProyectoRubroEquipo" 
                runat="server" 
                DataSourceID="odsFvApuProyectoRubroEquipo" 
                DefaultMode="Insert">
                <EditItemTemplate>
                    <asp:Panel ID="pnlProyecto" 
                        runat="server"
                        meta:resourcekey ="Rec_Proyecto_Rubro_Equipo_ProyectoRecursoKCG">  
                        <table>
                            <tr align="left">
                                <td >
                                    <asp:Label 
                                        ID="lblApu_Proyecto_Nombre"
                                        runat="server"  
                                        Text='<%# GetLocalResourceObject("Apu_Proyecto_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>                                
                                <td >
                                    <asp:TextBox ID="Apu_Proyecto_Codigo" 
                                        ReadOnly="True"
                                        TabIndex="-1"
                                        runat="server" 
                                        Text='<%# Bind("Apu_Proyecto_Codigo") %>'
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_CodigoRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <asp:TextBox ID="Apu_Proyecto_Nombre"
                                        Width="400px"
                                        Height="50px"
                                        ReadOnly="True"
                                        TabIndex="-1" 
                                        runat="server" 
                                        TextMode="MultiLine"
                                        CssClass="TEXTO_LECTURA_KCG"
                                        Text='<%# Bind("Apu_Proyecto_Nombre") %>'
                                        ToolTip='<%# GetLocalResourceObject("Apu_Proyecto_NombreRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    
                    <asp:Panel ID="pnlRubro" 
                        runat="server"
                        meta:resourcekey ="Rec_Apu_Proyecto_Rubro_Equipo_RubroRecursoKCG">
                        <table>
                            <tr align="left">
                                <td valign="top">
                                    <asp:Label 
                                        ID="lblApu_Rubro_Nombre"
                                        runat="server"  
                                        Text='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox ID="Apu_Rubro_Codigo"
                                        ReadOnly="True" 
                                        TabIndex="-1"
                                        runat="server" 
                                        Text='<%# Bind("Apu_Rubro_Codigo") %>'
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_CodigoRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:TextBox>
                                    <asp:TextBox ID="Apu_Rubro_Nombre"
                                        Width="400px"
                                        ReadOnly="True" 
                                        TabIndex="-1"
                                        runat="server" 
                                        Text='<%# Bind("Apu_Rubro_Nombre") %>'
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblApu_Rubro_Unidad"
                                        runat="server"  
                                        Text='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Apu_Rubro_Unidad"
                                        ReadOnly="True" 
                                        TabIndex="-1"
                                        runat="server" 
                                        Text='<%# Bind("Apu_Rubro_Unidad") %>'
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    
                    <asp:Panel ID="pnlEquipo" 
                        runat="server"
                        meta:resourcekey ="Rec_Apu_Proyecto_Rubro_EquipoRecursoKCG">
                        <table>
                            <tr align="right">
                                <td colspan="4">
                                    <asp:Label ID="Estado_Nombre" 
                                        runat="server" 
                                        Text='<%# Bind("Estado_Nombre") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblApu_Equipo_Nombre"
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                        AssociatedControlID="Apu_Equipo_Nombre" 
                                        runat="server"  
                                        Text='<%# GetLocalResourceObject("Apu_Equipo_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td colspan="3" style="white-space:nowrap">
                                    <asp:TextBox ID="Apu_Equipo_Nombre"
                                        CssClass="TEXTO_COMBOPER_KCG"
                                        Style="text-transform:uppercase"
                                        TextMode="MultiLine" 
                                        Width="400px" 
                                        Height="50px"
                                        runat="server" 
                                        Text='<%# Bind("Apu_Equipo_Nombre") %>'
                                        ToolTip='<%# GetLocalResourceObject("Apu_Equipo_NombreRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" 
                                        ID="rfvApu_Equipo_Nombre"
                                        ControlToValidate="Apu_Equipo_Nombre"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" ID="vceApu_Equipo_Nombre"
                                        TargetControlID="rfvApu_Equipo_Nombre" />
                                    
                                    <AjaxControlToolkit:AutoCompleteExtender
                                        runat="server" 
                                        BehaviorID="AutoCompleteEx"
                                        ID="autoComplete1" 
                                        TargetControlID="Apu_Equipo_Nombre"
                                        ServicePath="~/APU/APU_PROYECTO_RUBRO_EQUIPO.aspx" 
                                        ServiceMethod="GetEquipo"
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
                                        ID="lblCantidad"
                                        runat="server"  
                                        Text='<%# GetLocalResourceObject("CantidadRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox ID="Cantidad" 
                                        CssClass="TEXTO_EDICION_KCG"
                                        Style="text-align:right"
                                        runat="server" 
                                        Text='<%# Bind("Cantidad") %>'
                                        ToolTip='<%# GetLocalResourceObject("CantidadRecursoKCG.ToolTip").ToString() %>'>
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
                                        ClearMaskOnLostFocus="True" />

                                    <AjaxControlToolkit:MaskedEditValidator ID="mevCantidad" runat="server"
                                        ControlExtender="meeCantidad"
                                        ControlToValidate="Cantidad"
                                        IsValidEmpty="False"
                                        EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        MinimumValue="0.0000"
                                        MaximumValue="9999999999999.9999" 
                                        Display="Dynamic"
                                        EmptyValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>'
                                        InvalidValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>'
                                        MaximumValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>' 
                                        MinimumValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>'
                                        ValidationGroup="I" />  
                                      
                                      <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="vceCantidad"
                                        TargetControlID="mevCantidad"/> 
                                   
                                    
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblcosto_hora"
                                        runat="server"  
                                        Text='<%# GetLocalResourceObject("costo_horaRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox ID="costo_hora"
                                        Style="text-align:right"
                                        ReadOnly="True" 
                                        TabIndex="-1"
                                        runat="server" 
                                        Text='<%# Bind("costo_hora","{0:N4}") %>'
                                        ToolTip='<%# GetLocalResourceObject("costo_horaRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:TextBox>
                                    <asp:Label
                                        ID="lbl" 
                                        runat="server" 
                                        Text='<%# Eval("int_moneda_simbolo") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblcosto_hora_x_cantidad"
                                        runat="server"  
                                        Text='<%# GetLocalResourceObject("costo_hora_x_cantidadRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox ID="costo_hora_x_cantidad"
                                        Style="text-align:right"
                                        TabIndex="-1"
                                        ReadOnly="True" 
                                        runat="server" 
                                        Text='<%# Bind("costo_hora_x_cantidad","{0:N4}") %>'
                                        ToolTip='<%# GetLocalResourceObject("costo_hora_x_cantidadRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:TextBox>
                                    <asp:Label
                                        ID="Label1" 
                                        runat="server" 
                                        Text='<%# Eval("int_moneda_simbolo") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblrendimiento_equipo_hora"
                                        runat="server"  
                                        Text='<%# GetLocalResourceObject("rendimiento_equipo_horaRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="rendimiento_equipo_hora"
                                        Style="text-align:right"
                                        TabIndex="-1"
                                        ReadOnly="True" 
                                        runat="server" 
                                        Text='<%# Bind("rendimiento_equipo_hora","{0:N4}") %>'
                                        ToolTip='<%# GetLocalResourceObject("rendimiento_equipo_horaRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label 
                                        ID="lblcosto_x_rendimiento_hora"
                                        runat="server"  
                                        Text='<%# GetLocalResourceObject("costo_x_rendimiento_horaRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox ID="costo_x_rendimiento_hora"
                                        Style="text-align:right"
                                        TabIndex="-1"
                                        ReadOnly="True" 
                                        runat="server" 
                                        Text='<%# Bind("costo_x_rendimiento_hora","{0:N4}") %>'
                                        ToolTip='<%# GetLocalResourceObject("costo_x_rendimiento_horaRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:TextBox>
                                    <asp:Label
                                        ID="Label2" 
                                        runat="server" 
                                        Text='<%# Eval("int_moneda_simbolo") %>'>
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
                     
                    <%--ids--%>
                    <asp:TextBox Style="display:none"
                        ID="Apu_Proyecto_Rubro_Id" 
                        runat="server" 
                        Text='<%# Bind("Apu_Proyecto_Rubro_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox Style="display:none"
                        ID="Apu_Equipo_Id" 
                        runat="server" 
                        Text='<%# Bind("Apu_Equipo_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox Style="display:none"
                        ID="Creacion_Per_Personal_Id" 
                        runat="server" 
                        Text='<%# Bind("Creacion_Per_Personal_Id") %>'>
                    </asp:TextBox> 
                    <asp:TextBox Style="display:none"
                        ID="Update_Per_Personal_Id" 
                        runat="server" 
                        Text='<%# Bind("Update_Per_Personal_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox Style="display:none"
                        ID="Apu_Proyecto_Id" 
                        runat="server" 
                        Text='<%# Bind("Apu_Proyecto_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox Style="display:none"
                        ID="Apu_Rubro_Id" 
                        runat="server" 
                        Text='<%# Bind("Apu_Rubro_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox Style="display:none"
                        ID="Id" 
                        runat="server" 
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    
                    <%--Campos ocultos--%>
                    <asp:TextBox Visible="false"
                        ID="Fecha_Creacion" 
                        runat="server" 
                        Text='<%# Bind("Fecha_Creacion") %>'>
                    </asp:TextBox>
                    <asp:TextBox Visible="false"
                        ID="Fecha_Update" 
                        runat="server" 
                        Text='<%# Bind("Fecha_Update") %>'>
                    </asp:TextBox>
                    <asp:TextBox Visible="false"
                        ID="Apu_Proyecto_Rubro_Codigo" 
                        runat="server" 
                        Text='<%# Bind("Apu_Proyecto_Rubro_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox Visible="false"
                        ID="Apu_Proyecto_Etapa" 
                        runat="server" 
                        Text='<%# Bind("Apu_Proyecto_Etapa") %>'>
                    </asp:TextBox>
                    <asp:TextBox Visible="false"
                        ID="Apu_Equipo_Codigo" 
                        runat="server" 
                        Text='<%# Bind("Apu_Equipo_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox Visible="false"
                        ID="Creacion_Per_Personal_Codigo" 
                        runat="server" 
                        Text='<%# Bind("Creacion_Per_Personal_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox Visible="false"
                        ID="Creacion_Per_Personal_Nombre" 
                        runat="server" 
                        Text='<%# Bind("Creacion_Per_Personal_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox Visible="false"
                        ID="Update_Per_Personal_Codigo" 
                        runat="server" 
                        Text='<%# Bind("Update_Per_Personal_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox Visible="false"
                        ID="Update_Per_Personal_Nombre" 
                        runat="server" 
                        Text='<%# Bind("Update_Per_Personal_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox Visible="false"
                        ID="costo_diario" 
                        runat="server" 
                        Text='<%# Bind("costo_diario") %>'>
                    </asp:TextBox>
                    <asp:TextBox Visible="false"
                        ID="int_moneda_simbolo" 
                        runat="server" 
                        Text='<%# Bind("int_moneda_simbolo") %>'>
                    </asp:TextBox>
                    <asp:TextBox Visible="false"
                        ID="Codigo" 
                        runat="server" 
                        Text='<%# Bind("Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox Visible="false"
                        ID="Nombre" 
                        runat="server" 
                        Text='<%# Bind("Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox Visible="false"
                        ID="Estado" 
                        runat="server" 
                        Text='<%# Bind("Estado") %>'>
                    </asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:Panel ID="pnlProyecto" 
                        runat="server"
                        meta:resourcekey ="Rec_Proyecto_Rubro_Equipo_ProyectoRecursoKCG">  
                        <table>
                            <tr align="left">
                                <td valign="top"  >
                                    <asp:Label 
                                        ID="lblApu_Proyecto_Nombre"
                                        runat="server"  
                                        Text='<%# GetLocalResourceObject("Apu_Proyecto_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Apu_Proyecto_Codigo" 
                                        ReadOnly="True"
                                        TabIndex="-1"
                                        runat="server" 
                                        Text='<%# Bind("Apu_Proyecto_Codigo") %>'
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_CodigoRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <asp:TextBox ID="Apu_Proyecto_Nombre"
                                        Width="400px"
                                        Height="50px"
                                        ReadOnly="True" 
                                        TabIndex="-1"
                                        runat="server" 
                                        TextMode="MultiLine"
                                        CssClass="TEXTO_LECTURA_KCG"
                                        Text='<%# Bind("Apu_Proyecto_Nombre") %>'
                                        ToolTip='<%# GetLocalResourceObject("Apu_Proyecto_NombreRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    
                    <asp:Panel ID="pnlRubro" 
                        runat="server"
                        meta:resourcekey ="Rec_Apu_Proyecto_Rubro_Equipo_RubroRecursoKCG">
                        <table>
                            <tr align="left">
                                <td valign ="top">
                                    <asp:Label 
                                        ID="lblApu_Rubro_Nombre"
                                        runat="server"  
                                        Text='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox ID="Apu_Rubro_Codigo"
                                        ReadOnly="True" 
                                        TabIndex="-1"
                                        runat="server" 
                                        Text='<%# Bind("Apu_Rubro_Codigo") %>'
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_CodigoRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:TextBox>
                                    <asp:TextBox ID="Apu_Rubro_Nombre"
                                        Width="400px"
                                        
                                        TabIndex="-1"
                                        ReadOnly="True" 
                                        runat="server" 
                                        Text='<%# Bind("Apu_Rubro_Nombre") %>'
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblApu_Rubro_Unidad"
                                        runat="server"  
                                        Text='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Apu_Rubro_Unidad"
                                        ReadOnly="True" 
                                        TabIndex="-1"
                                        runat="server" 
                                        Text='<%# Bind("Apu_Rubro_Unidad") %>'
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    
                    <asp:Panel ID="pnlEquipo" 
                        runat="server"
                        meta:resourcekey ="Rec_Apu_Proyecto_Rubro_EquipoRecursoKCG">
                        <table>
                            <tr align="right">
                                <td colspan="4">
                                    <asp:Label ID="Estado_Nombre"
                                        runat="server" 
                                        Text='<%# Bind("Estado_Nombre") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                        AssociatedControlID="Apu_Equipo_Nombre" 
                                        ID="lblApu_Equipo_Nombre"
                                        runat="server"  
                                        Text='<%# GetLocalResourceObject("Apu_Equipo_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td colspan="3" style="white-space:nowrap">
                                    <asp:TextBox ID="Apu_Equipo_Nombre"
                                        CssClass="TEXTO_COMBOPER_KCG"
                                        Style="text-transform:uppercase"
                                        TextMode="MultiLine" 
                                        Width="400px" 
                                        Height="50px"
                                        runat="server" 
                                        Text='<%# Bind("Apu_Equipo_Nombre") %>'
                                        ToolTip='<%# GetLocalResourceObject("Apu_Equipo_NombreRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:TextBox>
                                    
                                    <asp:RequiredFieldValidator runat="server" 
                                    ID="rfvApu_Equipo_Nombre"
                                    ControlToValidate="Apu_Equipo_Nombre"
                                    ValidationGroup="I"
                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                   <AjaxControlToolkit:ValidatorCalloutExtender 
                                   runat="Server" ID="vceApu_Equipo_Nombre"
                                   TargetControlID="rfvApu_Equipo_Nombre" />
                                    
                                    
                                    <AjaxControlToolkit:AutoCompleteExtender
                                    runat="server" 
                                    BehaviorID="AutoCompleteEx"
                                    ID="autoComplete1" 
                                    TargetControlID="Apu_Equipo_Nombre"
                                    ServicePath="~/APU/APU_PROYECTO_RUBRO_EQUIPO.aspx" 
                                    ServiceMethod="GetEquipo"
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
                                <td >
                                    <asp:Label 
                                        ID="lblCantidad"
                                        runat="server"  
                                        Text='<%# GetLocalResourceObject("CantidadRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox ID="Cantidad" 
                                        CssClass="TEXTO_EDICION_KCG"
                                        Style="text-align:right"
                                        runat="server" 
                                        Text='<%# Bind("Cantidad") %>'
                                        ToolTip='<%# GetLocalResourceObject("CantidadRecursoKCG.ToolTip").ToString() %>'>
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

                                    <AjaxControlToolkit:MaskedEditValidator ID="mevCantidad" runat="server"
                                        ControlExtender="meeCantidad"
                                        ControlToValidate="Cantidad"
                                        IsValidEmpty="False"
                                        EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        MinimumValue="0.0000"
                                        MaximumValue="9999999999999.9999" 
                                        Display="Dynamic"
                                        EmptyValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>'
                                        InvalidValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>'
                                        MaximumValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>' 
                                        MinimumValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>'
                                        ValidationGroup="I" />  
                                      
                                      <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="vceCantidad"
                                        TargetControlID="mevCantidad"/> 
                                    
                                    
                                </td>
                            </tr>
                            <tr align="left">
                                <td >
                                    <asp:Label 
                                        ID="lblcosto_hora"
                                        runat="server"  
                                        Text='<%# GetLocalResourceObject("costo_horaRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                    
                                    
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox ID="costo_hora"
                                        Style="text-align:right"
                                        TabIndex="-1"
                                        ReadOnly="True" 
                                        runat="server" 
                                        Text='<%# Bind("costo_hora","{0:N4}") %>'
                                        ToolTip='<%# GetLocalResourceObject("costo_horaRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:TextBox>
                                    <asp:Label
                                        ID="lbl" 
                                        runat="server" 
                                        Text='<%# Eval("int_moneda_simbolo") %>'>
                                    </asp:Label>
                                    
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblcosto_hora_x_cantidad"
                                        runat="server"  
                                        Text='<%# GetLocalResourceObject("costo_hora_x_cantidadRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox ID="costo_hora_x_cantidad"
                                        Style="text-align:right"
                                        TabIndex="-1"
                                        ReadOnly="True" 
                                        runat="server" 
                                        Text='<%# Bind("costo_hora_x_cantidad","{0:N4}") %>'
                                        ToolTip='<%# GetLocalResourceObject("costo_hora_x_cantidadRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:TextBox>
                                    <asp:Label
                                        ID="Label3" 
                                        runat="server" 
                                        Text='<%# Eval("int_moneda_simbolo") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblrendimiento_equipo_hora"
                                        runat="server"  
                                        Text='<%# GetLocalResourceObject("rendimiento_equipo_horaRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="rendimiento_equipo_hora"
                                        Style="text-align:right"
                                        TabIndex="-1"
                                        ReadOnly="True" 
                                        runat="server" 
                                        Text='<%# Bind("rendimiento_equipo_hora","{0:N4}") %>'
                                        ToolTip='<%# GetLocalResourceObject("rendimiento_equipo_horaRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label 
                                        ID="lblcosto_x_rendimiento_hora"
                                        runat="server"  
                                        Text='<%# GetLocalResourceObject("costo_x_rendimiento_horaRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox ID="costo_x_rendimiento_hora"
                                        Style="text-align:right"
                                        TabIndex="-1"
                                        ReadOnly="True" 
                                        runat="server" 
                                        Text='<%# Bind("costo_x_rendimiento_hora","{0:N4}") %>'
                                        ToolTip='<%# GetLocalResourceObject("costo_x_rendimiento_horaRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:TextBox>
                                    <asp:Label
                                        ID="Label4" 
                                        runat="server" 
                                        Text='<%# Eval("int_moneda_simbolo") %>'>
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
                     
                    <%--ids--%>
                    <asp:TextBox Style="display:none"
                        ID="Apu_Proyecto_Rubro_Id" 
                        runat="server" 
                        Text='<%# Bind("Apu_Proyecto_Rubro_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox Style="display:none"
                        ID="Apu_Equipo_Id" 
                        runat="server" 
                        Text='<%# Bind("Apu_Equipo_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox Style="display:none"
                        ID="Creacion_Per_Personal_Id" 
                        runat="server" 
                        Text='<%# Bind("Creacion_Per_Personal_Id") %>'>
                    </asp:TextBox> 
                    <asp:TextBox Style="display:none"
                        ID="Update_Per_Personal_Id" 
                        runat="server" 
                        Text='<%# Bind("Update_Per_Personal_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox Style="display:none"
                        ID="Apu_Proyecto_Id" 
                        runat="server" 
                        Text='<%# Bind("Apu_Proyecto_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox Style="display:none"
                        ID="Apu_Rubro_Id" 
                        runat="server" 
                        Text='<%# Bind("Apu_Rubro_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox Style="display:none"
                        ID="Id" 
                        runat="server" 
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    
                    <%--Campos ocultos--%>
                    <asp:TextBox Visible="false"
                        ID="Fecha_Creacion" 
                        runat="server" 
                        Text='<%# Bind("Fecha_Creacion") %>'>
                    </asp:TextBox>
                    <asp:TextBox Visible="false"
                        ID="Fecha_Update" 
                        runat="server" 
                        Text='<%# Bind("Fecha_Update") %>'>
                    </asp:TextBox>
                    <asp:TextBox Visible="false"
                        ID="Apu_Proyecto_Rubro_Codigo" 
                        runat="server" 
                        Text='<%# Bind("Apu_Proyecto_Rubro_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox Visible="false"
                        ID="Apu_Proyecto_Etapa" 
                        runat="server" 
                        Text='<%# Bind("Apu_Proyecto_Etapa") %>'>
                    </asp:TextBox>
                    <asp:TextBox Visible="false"
                        ID="Apu_Equipo_Codigo" 
                        runat="server" 
                        Text='<%# Bind("Apu_Equipo_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox Visible="false"
                        ID="Creacion_Per_Personal_Codigo" 
                        runat="server" 
                        Text='<%# Bind("Creacion_Per_Personal_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox Visible="false"
                        ID="Creacion_Per_Personal_Nombre" 
                        runat="server" 
                        Text='<%# Bind("Creacion_Per_Personal_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox Visible="false"
                        ID="Update_Per_Personal_Codigo" 
                        runat="server" 
                        Text='<%# Bind("Update_Per_Personal_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox Visible="false"
                        ID="Update_Per_Personal_Nombre" 
                        runat="server" 
                        Text='<%# Bind("Update_Per_Personal_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox Visible="false"
                        ID="costo_diario" 
                        runat="server" 
                        Text='<%# Bind("costo_diario") %>'>
                    </asp:TextBox>
                    <asp:TextBox Visible="false"
                        ID="int_moneda_simbolo" 
                        runat="server" 
                        Text='<%# Bind("int_moneda_simbolo") %>'>
                    </asp:TextBox>
                    <asp:TextBox Visible="false"
                        ID="Codigo" 
                        runat="server" 
                        Text='<%# Bind("Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox Visible="false"
                        ID="Nombre" 
                        runat="server" 
                        Text='<%# Bind("Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox Visible="false"
                        ID="Estado" 
                        runat="server" 
                        Text='<%# Bind("Estado") %>'>
                    </asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Panel ID="pnlProyecto" 
                        runat="server"
                        meta:resourcekey ="Rec_Proyecto_Rubro_Equipo_ProyectoRecursoKCG">  
                        <table>
                            <tr align="left">
                                <td valign ="top" >
                                    <asp:Label 
                                        ID="lblApu_Proyecto_Nombre"
                                        runat="server"  
                                        Text='<%# GetLocalResourceObject("Apu_Proyecto_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Apu_Proyecto_Codigo" 
                                        ReadOnly="True"
                                        TabIndex="-1"
                                        runat="server" 
                                        Text='<%# Bind("Apu_Proyecto_Codigo") %>'
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_CodigoRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <asp:TextBox ID="Apu_Proyecto_Nombre"
                                        Width="400px"
                                        Height="50px"
                                        ReadOnly="True" 
                                        TabIndex="-1"
                                        runat="server" 
                                        TextMode="MultiLine"
                                        CssClass="TEXTO_LECTURA_KCG"
                                        Text='<%# Bind("Apu_Proyecto_Nombre") %>'
                                        ToolTip='<%# GetLocalResourceObject("Apu_Proyecto_NombreRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    
                    <asp:Panel ID="pnlRubro" 
                        runat="server"
                        meta:resourcekey ="Rec_Apu_Proyecto_Rubro_Equipo_RubroRecursoKCG">
                        <table>
                            <tr align="left">
                                <td valign ="top" >
                                    <asp:Label 
                                        ID="lblApu_Rubro_Nombre"
                                        runat="server"  
                                        Text='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td >
                                <td style="white-space:nowrap">
                                    <asp:TextBox ID="Apu_Rubro_Codigo"
                                        ReadOnly="True" 
                                        TabIndex="-1"
                                        runat="server" 
                                        Text='<%# Bind("Apu_Rubro_Codigo") %>'
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_CodigoRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:TextBox>
                                    <asp:TextBox ID="Apu_Rubro_Nombre"
                                        Width="400px"
                                        
                                        ReadOnly="True" 
                                        TabIndex="-1"
                                        runat="server" 
                                        Text='<%# Bind("Apu_Rubro_Nombre") %>'
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblApu_Rubro_Unidad"
                                        runat="server"  
                                        Text='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Apu_Rubro_Unidad"
                                        ReadOnly="True" 
                                        TabIndex="-1"
                                        runat="server" 
                                        Text='<%# Bind("Apu_Rubro_Unidad") %>'
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    
                    <asp:Panel ID="pnlEquipo" 
                        runat="server"
                        meta:resourcekey ="Rec_Apu_Proyecto_Rubro_EquipoRecursoKCG">
                        <table>
                            <tr align="right">
                                <td colspan="4">
                                    <asp:Label ID="Estado_Nombre" 
                                        runat="server" 
                                        Text='<%# Bind("Estado_Nombre") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblApu_Equipo_Nombre"
                                        runat="server"  
                                        Text='<%# GetLocalResourceObject("Apu_Equipo_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td colspan="3">
                                    <asp:TextBox ID="Apu_Equipo_Nombre"
                                        ReadOnly="True"
                                        TabIndex="-1"
                                        CssClass ="TEXTO_LECTURA_KCG"
                                        TextMode="MultiLine" 
                                        Width="400px" 
                                        Height="50px"
                                        runat="server" 
                                        Text='<%# Bind("Apu_Equipo_Nombre") %>'
                                        ToolTip='<%# GetLocalResourceObject("Apu_Equipo_NombreRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblCantidad"
                                        runat="server"  
                                        Text='<%# GetLocalResourceObject("CantidadRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Cantidad"
                                        Style="text-align:right"
                                        TabIndex="-1"
                                        ReadOnly="True" 
                                        runat="server" 
                                        Text='<%# Bind("Cantidad","{0:N4}") %>'
                                        ToolTip='<%# GetLocalResourceObject("CantidadRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblcosto_hora"
                                        runat="server"  
                                        Text='<%# GetLocalResourceObject("costo_horaRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox ID="costo_hora"
                                        Style="text-align:right"
                                        TabIndex="-1"
                                        ReadOnly="True" 
                                        runat="server" 
                                        Text='<%# Bind("costo_hora","{0:N4}") %>'
                                        ToolTip='<%# GetLocalResourceObject("costo_horaRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:TextBox>
                                    <asp:Label
                                        ID="lbl" 
                                        runat="server" 
                                        Text='<%# Eval("int_moneda_simbolo") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblcosto_hora_x_cantidad"
                                        runat="server"  
                                        Text='<%# GetLocalResourceObject("costo_hora_x_cantidadRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox ID="costo_hora_x_cantidad"
                                        Style="text-align:right"
                                        TabIndex="-1"
                                        ReadOnly="True" 
                                        runat="server" 
                                        Text='<%# Bind("costo_hora_x_cantidad","{0:N4}") %>'
                                        ToolTip='<%# GetLocalResourceObject("costo_hora_x_cantidadRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:TextBox>
                                    <asp:Label
                                        ID="Label5" 
                                        runat="server" 
                                        Text='<%# Eval("int_moneda_simbolo") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblrendimiento_equipo_hora"
                                        runat="server"  
                                        Text='<%# GetLocalResourceObject("rendimiento_equipo_horaRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="rendimiento_equipo_hora"
                                        Style="text-align:right"
                                        TabIndex="-1"
                                        ReadOnly="True" 
                                        runat="server" 
                                        Text='<%# Bind("rendimiento_equipo_hora","{0:N4}") %>'
                                        ToolTip='<%# GetLocalResourceObject("rendimiento_equipo_horaRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label 
                                        ID="lblcosto_x_rendimiento_hora"
                                        runat="server"  
                                        Text='<%# GetLocalResourceObject("costo_x_rendimiento_horaRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox ID="costo_x_rendimiento_hora"
                                        Style="text-align:right"
                                        TabIndex="-1"
                                        ReadOnly="True" 
                                        runat="server" 
                                        Text='<%# Bind("costo_x_rendimiento_hora","{0:N4}") %>'
                                        ToolTip='<%# GetLocalResourceObject("costo_x_rendimiento_horaRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:TextBox>
                                    <asp:Label
                                        ID="Label6" 
                                        runat="server" 
                                        Text='<%# Eval("int_moneda_simbolo") %>'>
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
                                        Enabled='<%# HER.PermisosMovimientos.Movimiento_Apu_Proyecto_Rubro_Equipo(Request.QueryString["Estado"], Request.QueryString["Apu_Presupuesto_Estado"], HER.PermisosMovimientos.ModoOperacion.Editar ) %>'
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_EditarRecursoKCG.AccesKey").ToString() %>'  
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_EditRecursoKCG.Text").ToString() %>'
                                        ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_EditRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:Button>
                                    <asp:Button 
                                        ID="DeleteButton" 
                                        runat="server" 
                                        CausesValidation="False" 
                                        CommandName="Delete"
                                        Enabled='<%# HER.PermisosMovimientos.Movimiento_Apu_Proyecto_Rubro_Equipo(Request.QueryString["Estado"], Request.QueryString["Apu_Presupuesto_Estado"], HER.PermisosMovimientos.ModoOperacion.Eliminar ) %>'
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_EliminarRecursoKCG.AccesKey").ToString() %>'  
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_DeleteRecursoKCG.Text").ToString() %>'
                                        ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_DeleteRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:Button>
                                    <asp:Button 
                                        ID="NewButton" 
                                        runat="server" 
                                        CausesValidation="False" 
                                        CommandName="New"
                                        Enabled='<%# HER.PermisosMovimientos.Movimiento_Apu_Proyecto_Rubro_Equipo(Request.QueryString["Estado"], Request.QueryString["Apu_Presupuesto_Estado"], HER.PermisosMovimientos.ModoOperacion.Nuevo ) %>'
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_NuevoRecursoKCG.AccesKey").ToString() %>'  
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_NewRecursoKCG.Text").ToString() %>'
                                        ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_NewRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:Button>
                                    <uc2:wucMensajeEliminar ID="WucMensajeEliminar1" runat="server" /> 
                                </td>
                            </tr>
                        </table>
                     </asp:Panel>
                     
                    <%--ids--%>
                    <asp:TextBox Style="display:none"
                        ID="Apu_Proyecto_Rubro_Id" 
                        runat="server" 
                        Text='<%# Bind("Apu_Proyecto_Rubro_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox Style="display:none"
                        ID="Apu_Equipo_Id" 
                        runat="server" 
                        Text='<%# Bind("Apu_Equipo_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox Style="display:none"
                        ID="Creacion_Per_Personal_Id" 
                        runat="server" 
                        Text='<%# Bind("Creacion_Per_Personal_Id") %>'>
                    </asp:TextBox> 
                    <asp:TextBox Style="display:none"
                        ID="Update_Per_Personal_Id" 
                        runat="server" 
                        Text='<%# Bind("Update_Per_Personal_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox Style="display:none"
                        ID="Apu_Proyecto_Id" 
                        runat="server" 
                        Text='<%# Bind("Apu_Proyecto_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox Style="display:none"
                        ID="Apu_Rubro_Id" 
                        runat="server" 
                        Text='<%# Bind("Apu_Rubro_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox Style="display:none"
                        ID="Id" 
                        runat="server" 
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    
                    <%--Campos ocultos--%>
                    <asp:TextBox Visible="false"
                        ID="Fecha_Creacion" 
                        runat="server" 
                        Text='<%# Bind("Fecha_Creacion") %>'>
                    </asp:TextBox>
                    <asp:TextBox Visible="false"
                        ID="Fecha_Update" 
                        runat="server" 
                        Text='<%# Bind("Fecha_Update") %>'>
                    </asp:TextBox>
                    <asp:TextBox Visible="false"
                        ID="Apu_Proyecto_Rubro_Codigo" 
                        runat="server" 
                        Text='<%# Bind("Apu_Proyecto_Rubro_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox Visible="false"
                        ID="Apu_Proyecto_Etapa" 
                        runat="server" 
                        Text='<%# Bind("Apu_Proyecto_Etapa") %>'>
                    </asp:TextBox>
                    <asp:TextBox Visible="false"
                        ID="Apu_Equipo_Codigo" 
                        runat="server" 
                        Text='<%# Bind("Apu_Equipo_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox Visible="false"
                        ID="Creacion_Per_Personal_Codigo" 
                        runat="server" 
                        Text='<%# Bind("Creacion_Per_Personal_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox Visible="false"
                        ID="Creacion_Per_Personal_Nombre" 
                        runat="server" 
                        Text='<%# Bind("Creacion_Per_Personal_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox Visible="false"
                        ID="Update_Per_Personal_Codigo" 
                        runat="server" 
                        Text='<%# Bind("Update_Per_Personal_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox Visible="false"
                        ID="Update_Per_Personal_Nombre" 
                        runat="server" 
                        Text='<%# Bind("Update_Per_Personal_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox Visible="false"
                        ID="costo_diario" 
                        runat="server" 
                        Text='<%# Bind("costo_diario") %>'>
                    </asp:TextBox>
                    <asp:TextBox Visible="false"
                        ID="int_moneda_simbolo" 
                        runat="server" 
                        Text='<%# Bind("int_moneda_simbolo") %>'>
                    </asp:TextBox>
                    <asp:TextBox Visible="false"
                        ID="Codigo" 
                        runat="server" 
                        Text='<%# Bind("Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox Visible="false"
                        ID="Nombre" 
                        runat="server" 
                        Text='<%# Bind("Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox Visible="false"
                        ID="Estado" 
                        runat="server" 
                        Text='<%# Bind("Estado") %>'>
                    </asp:TextBox>
                </ItemTemplate>
            </asp:FormView>
            
            <koala:KNavegacion 
                ID="nav"
                runat="server"
                GridViewID="gvApuProyectoRubroEquipo" 
                OnNavegar="nav_Siguiente" />

        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger 
            ControlID="gvApuProyectoRubroEquipo" 
            EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
    
    <asp:ObjectDataSource ID="odsFvApuProyectoRubroEquipo" 
        runat="server" DeleteMethod="Delete"
        InsertMethod="Insert" 
        OldValuesParameterFormatString="original{0}" 
        SelectMethod="GetById"
        TypeName="FEL.APU.BO_Apu_Proyecto_Rubro_Equipo" 
        UpdateMethod="Update" 
        ConflictDetection="CompareAllValues" SortParameterName="SortExpression">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
            <asp:Parameter Name="Id" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    
    <asp:UpdatePanel 
        ID="uppBotones" 
        runat="server">
        <ContentTemplate>
            <asp:Button 
                ID="bRegreso" 
                runat="server" 
                Visible="False" />
            <asp:Button 
                ID="bResponderZoom" 
                runat="server" 
                Visible="False" />     
         </ContentTemplate>
    </asp:UpdatePanel>

    <asp:UpdatePanel ID="uppGv" runat="server">
        <ContentTemplate>
            <koala:KFiltro ID="kftFiltro" 
                runat="server" 
                Contenedor="APU_PROYECTO_RUBRO_EQUIPO" 
                Objeto="APU_PROYECTO_RUBRO_EQUIPO" 
                IndiceScope ="Scope"
                Orden="1" 
                ObjectDataSourceID="odsGvApuProyectoRubroEquipo"/>
                
            <asp:Button ID="btn_Apu_Proyecto_Rubro" runat="server"
                Text="Rubro"/>
            <asp:Panel ID="pnlGv" 
                runat="server"
                meta:resourcekey="Rec_Listado_Apu_Proyecto_Rubro_EquipoRecursoKCG">
              
            <koala:KGrid ID="gvApuProyectoRubroEquipo"  
                runat="server" 
                AllowSorting="True"
                AllowPaging="True" 
                AutoGenerateColumns="False"
                DataSourceID="odsGvApuProyectoRubroEquipo" 
                AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>'
                DataKeyNames="Id">
                
                <AlternatingRowStyle CssClass="alternatingrowstyle" />
                <HeaderStyle CssClass="headerstyle" />
                <PagerStyle CssClass="pagerstyle" />
                <SelectedRowStyle CssClass="selectedrowstyle" />
                
                <Columns>
                    <asp:CommandField ButtonType="Button" 
                        SelectText="..." ShowSelectButton="True" />
                    
                    <asp:BoundField DataField="Apu_Equipo_Codigo" 
                        meta:resourcekey="BoundApu_Equipo_CodigoRecursoKCG" 
                        SortExpression="Apu_Equipo_Codigo" >
                        <ItemStyle wrap="True" horizontalalign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Apu_Equipo_Nombre" 
                        meta:resourcekey="BoundApu_Equipo_NombreRecursoKCG" 
                        SortExpression="Apu_Equipo_Nombre">
                        <itemstyle wrap="True" width="80mm" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Cantidad" 
                        meta:resourcekey="BoundCantidadRecursoKCG" 
                        SortExpression="Cantidad" 
                        dataformatstring="{0:N4}">
                        <ItemStyle wrap="True" horizontalalign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="costo_hora" 
                        meta:resourcekey="Boundcosto_horaRecursoKCG"  
                        SortExpression="costo_hora"  
                        dataformatstring="{0:N4}">
                        <ItemStyle wrap="True" horizontalalign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="costo_hora_x_cantidad" 
                        meta:resourcekey="Boundcosto_hora_x_cantidadRecursoKCG" 
                        SortExpression="costo_hora_x_cantidad"  
                        dataformatstring="{0:N4}">
                        <ItemStyle wrap="True" horizontalalign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="rendimiento_equipo_hora" 
                        meta:resourcekey="Boundrendimiento_equipo_horaRecursoKCG" 
                        SortExpression="rendimiento_equipo_hora"  
                        dataformatstring="{0:N4}">
                        <ItemStyle wrap="True" horizontalalign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="costo_x_rendimiento_hora" 
                        meta:resourcekey="Boundcosto_x_rendimiento_horaRecursoKCG" 
                        SortExpression="costo_x_rendimiento_hora"  
                        dataformatstring="{0:N4}">
                        <ItemStyle wrap="True" horizontalalign="Right" />
                    </asp:BoundField>
                    
                    
                    <asp:BoundField DataField="Apu_Proyecto_Rubro_Id" Visible="False" HeaderText="Apu_Proyecto_Rubro_Id"
                        SortExpression="Apu_Proyecto_Rubro_Id" />
                    <asp:BoundField DataField="Apu_Equipo_Id" Visible="False" HeaderText="Apu_Equipo_Id" SortExpression="Apu_Equipo_Id" />
                    <asp:BoundField DataField="Fecha_Creacion" Visible="False" HeaderText="Fecha_Creacion" SortExpression="Fecha_Creacion" />
                    <asp:BoundField DataField="Creacion_Per_Personal_Id" Visible="False" HeaderText="Creacion_Per_Personal_Id"
                        SortExpression="Creacion_Per_Personal_Id" />
                    <asp:BoundField DataField="Fecha_Update" Visible="False" HeaderText="Fecha_Update" SortExpression="Fecha_Update" />
                    <asp:BoundField DataField="Update_Per_Personal_Id" Visible="False" HeaderText="Update_Per_Personal_Id"
                        SortExpression="Update_Per_Personal_Id" />
                    <asp:BoundField DataField="Apu_Proyecto_Rubro_Codigo" Visible="False" HeaderText="Apu_Proyecto_Rubro_Codigo"
                        SortExpression="Apu_Proyecto_Rubro_Codigo" />
                    <asp:BoundField DataField="Apu_Proyecto_Id" Visible="False" HeaderText="Apu_Proyecto_Id" SortExpression="Apu_Proyecto_Id" />
                    <asp:BoundField DataField="Apu_Proyecto_Codigo" Visible="False" HeaderText="Apu_Proyecto_Codigo"
                        SortExpression="Apu_Proyecto_Codigo" />
                    <asp:BoundField DataField="Apu_Proyecto_Nombre" Visible="False" HeaderText="Apu_Proyecto_Nombre"
                        SortExpression="Apu_Proyecto_Nombre" />
                    <asp:BoundField DataField="Apu_Proyecto_Etapa" Visible="False" HeaderText="Apu_Proyecto_Etapa" SortExpression="Apu_Proyecto_Etapa" />
                    <asp:BoundField DataField="Apu_Rubro_Id" Visible="False" HeaderText="Apu_Rubro_Id" SortExpression="Apu_Rubro_Id" />
                    <asp:BoundField DataField="Apu_Rubro_Codigo" Visible="False" HeaderText="Apu_Rubro_Codigo" SortExpression="Apu_Rubro_Codigo" />
                    <asp:BoundField DataField="Apu_Rubro_Nombre" Visible="False" HeaderText="Apu_Rubro_Nombre" SortExpression="Apu_Rubro_Nombre" />
                    <asp:BoundField DataField="Apu_Rubro_Unidad" Visible="False" HeaderText="Apu_Rubro_Unidad" SortExpression="Apu_Rubro_Unidad" />
                    
                    <asp:BoundField DataField="Creacion_Per_Personal_Codigo" Visible="False" HeaderText="Creacion_Per_Personal_Codigo"
                        SortExpression="Creacion_Per_Personal_Codigo" />
                    <asp:BoundField DataField="Creacion_Per_Personal_Nombre" Visible="False" HeaderText="Creacion_Per_Personal_Nombre"
                        SortExpression="Creacion_Per_Personal_Nombre" />
                    <asp:BoundField DataField="Update_Per_Personal_Codigo" Visible="False" HeaderText="Update_Per_Personal_Codigo"
                        SortExpression="Update_Per_Personal_Codigo" />
                    <asp:BoundField DataField="Update_Per_Personal_Nombre" Visible="False" HeaderText="Update_Per_Personal_Nombre"
                        SortExpression="Update_Per_Personal_Nombre" />
                    <asp:BoundField DataField="costo_diario" Visible="False" HeaderText="costo_diario" SortExpression="costo_diario" />
                    <asp:BoundField DataField="int_moneda_simbolo" Visible="False" HeaderText="int_moneda_simbolo" SortExpression="int_moneda_simbolo" />
                    <asp:BoundField DataField="Estado_Nombre" Visible="False" HeaderText="Estado_Nombre" SortExpression="Estado_Nombre" />
                    <asp:BoundField DataField="Id" Visible="False" HeaderText="Id" SortExpression="Id" />
                    <asp:BoundField DataField="Codigo" Visible="False" HeaderText="Codigo" SortExpression="Codigo_int" />
                    <asp:BoundField DataField="Nombre" Visible="False" HeaderText="Nombre" SortExpression="Nombre" />
                    <asp:BoundField DataField="Estado" Visible="False" HeaderText="Estado" SortExpression="Estado" />
                </Columns>
            </koala:KGrid>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    
    <asp:ObjectDataSource ID="odsGvApuProyectoRubroEquipo" 
        runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetByRubro"
        TypeName="FEL.APU.BO_Apu_Proyecto_Rubro_Equipo">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
            <asp:QueryStringParameter Name="Apu_Proyecto_Rubro_Id" QueryStringField="Apu_Proyecto_Rubro_Id"
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    
    
    
    
</asp:Content>

