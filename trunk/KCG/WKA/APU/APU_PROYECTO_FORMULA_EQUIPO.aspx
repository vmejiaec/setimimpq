<%@ Page Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="APU_PROYECTO_FORMULA_EQUIPO.aspx.cs" 
    Inherits="APU_APU_PROYECTO_FORMULA_EQUIPO" 
    Theme="EstiloKCG"
    StylesheetTheme="EstiloKCG" 
    meta:resourcekey="Tit_Apu_Proyecto_Formula_EquipoRecursoKCG" %>

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
    
<asp:Content ID="Content1" 
    ContentPlaceHolderID="ContentPlaceHolder1" 
    Runat="Server">               
    <asp:Panel 
        ID="pnlProyecto" 
        runat="server"
        meta:resourcekey="Rec_Apu_Proyecto_Formula_Equipo_ProyectoRecursoKCG">
        <table>
            <tr align="right">
                <td>
                    <asp:Label ID="Estado_Nombre" 
                        runat="server" 
                        >
                    </asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblNombre" 
                        runat="server" 
                        Text='<%# GetLocalResourceObject("Apu_Proyecto_NombreRecursoKCG.Text") %>'>
                    </asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="Codigo"
                        ReadOnly="True" 
                        TabIndex="-1"
                        runat="server" 
                        
                        ToolTip= '<%# GetLocalResourceObject("Apu_Proyecto_CodigoRecursoKCG.ToolTip").ToString() %>'>
                    </asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    <asp:TextBox ID="Nombre"
                        Width="400px" 
                        Height="50px"
                        ReadOnly="True" 
                        TabIndex="-1"
                        runat="server"                                         
                        TextMode="MultiLine"
                        CssClass="TEXTO_LECTURA_KCG"
                        ToolTip= '<%# GetLocalResourceObject("Apu_Proyecto_NombreRecursoKCG.ToolTip").ToString() %>'>
                    </asp:TextBox>
                </td>
            </tr>
        </table>
    </asp:Panel>
                    
    <asp:TextBox 
        ID="Apu_Proyecto_Id" 
        runat="server"
        Style="display:none">
    </asp:TextBox>                                                             
    
    <asp:Panel 
        ID="pnlIndice" 
        runat="server"
        meta:resourcekey="Rec_Apu_Proyecto_Formula_Equipo_IndiceRecursoKCG">   
        <asp:UpdatePanel 
            ID="uppFvDetalle" 
            runat="server" 
            UpdateMode="Conditional">
            <ContentTemplate>    
                <asp:FormView 
                    ID="fvDetalleApuProyectoFormulaEquipo" 
                    runat="server" 
                    DataSourceID="odsFvDetalleApuProyectoEquipoIndice"
                    DefaultMode="Insert" 
                    Width="100%">
                    <EditItemTemplate>
                        <table>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblApu_Indice_Nombre"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Apu_Indice_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Indice_Nombre"
                                        Style="text-transform:uppercase"
                                        CssClass="TEXTO_COMBOPER_KCG"
                                        TextMode="MultiLine" 
                                        Height="50px"
                                        Width="400px" 
                                        runat="server" 
                                        Text='<%# Bind("Apu_Indice_Nombre") %>'
                                        ToolTip='<%# GetLocalResourceObject("Apu_Indice_NombreRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:TextBox>                                    
                                    <asp:RequiredFieldValidator 
                                        ID="rfvApu_Indice_Nombre" 
                                        runat="server"                                                
                                        ValidationGroup="I"
                                        ControlToValidate="Apu_Indice_Nombre" 
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                        <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="vceApu_Indice_Nombre"
                                        TargetControlID="rfvApu_Indice_Nombre"/>                                    
                                    <AjaxControlToolkit:AutoCompleteExtender
                                        runat="server" 
                                        BehaviorID="AutoCompleteEx"
                                        ID="autoComplete1" 
                                        TargetControlID="Apu_Indice_Nombre"
                                        ServicePath="~/APU/APU_PROYECTO_FORMULA_EQUIPO.aspx" 
                                        ServiceMethod="GetIndiceEquipo"
                                        MinimumPrefixLength="0" 
                                        CompletionInterval="500"
                                        EnableCaching="true"
                                        CompletionSetCount="500"
                                        CompletionListCssClass="autocomplete_completionListElement" 
                                        CompletionListItemCssClass="autocomplete_listItem" 
                                        CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                        DelimiterCharacters=""
                                        OnClientItemSelected="ItemSelected">
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
                                    <input type="submit" style="display:none;" />
                                </td>
                            </tr>                                                        
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblApu_Proyecto_Equipo_Costo_Total"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Apu_Proyecto_Equipo_Costo_TotalRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Apu_Proyecto_Equipo_Costo_Total"
                                        Style="text-align:right" 
                                        TabIndex="-1"
                                        ReadOnly="true" 
                                        runat="server" 
                                        Text='<%# Bind("Apu_Proyecto_Equipo_Costo_Total","{0:N4}") %>'
                                        ToolTip='<%# GetLocalResourceObject("Apu_Proyecto_Equipo_Costo_TotalRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:TextBox>
                                    <asp:Label 
                                        ID="lblMonedaCosto" 
                                        runat="server"
                                        Text='<%#Eval("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblPorcentaje"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("PorcentajeRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Porcentaje"
                                        Style="text-align:right" 
                                        CssClass="TEXTO_EDICION_KCG" 
                                        runat="server" 
                                        Text='<%# Bind("Porcentaje") %>'
                                        ToolTip='<%# GetLocalResourceObject("PorcentajeRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:TextBox>%
                                    <AjaxControlToolkit:MaskedEditExtender 
                                        ID="meePorcentaje" 
                                        runat="server"
                                        TargetControlID="Porcentaje"
                                        Mask="999.99"
                                        MessageValidatorTip="false"
                                        OnFocusCssClass="MaskedEditFocus"
                                        OnInvalidCssClass="MaskedEditError"
                                        MaskType="Number"
                                        InputDirection="RightToLeft"
                                        AcceptNegative="None"
                                        DisplayMoney="None"
                                        ErrorTooltipEnabled="False"
                                        ClearMaskOnLostFocus="True"/>
                                    <AjaxControlToolkit:MaskedEditValidator 
                                        ID="MaskedEditValidator2" 
                                        runat="server"
                                        ControlExtender="meePorcentaje"
                                        ControlToValidate="Porcentaje"
                                        IsValidEmpty="False"
                                        EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ24RecursoKCG.ErrorMessage").ToString() %>'
                                        InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ24RecursoKCG.ErrorMessage").ToString() %>'
                                        MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ24RecursoKCG.ErrorMessage").ToString() %>'
                                        MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ24RecursoKCG.ErrorMessage").ToString() %>'
                                        MinimumValue="0.01"
                                        MaximumValue="100.00" 
                                        Display="Dynamic"
                                        EmptyValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.Text").ToString() %>'
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
                                        ID="lblCosto_Indice"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Costo_IndiceRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Costo_Indice"
                                        Style="text-align:right" 
                                        TabIndex="-1"
                                        ReadOnly="True" 
                                        runat="server" 
                                        Text='<%# Bind("Costo_Indice","{0:N4}") %>'
                                        ToolTip='<%# GetLocalResourceObject("Costo_IndiceRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:TextBox>
                                    <asp:Label ID="lblMoneda" 
                                        runat="server"
                                        Text='<%#Eval("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
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
                                 <uc2:wucMensajeActualizar ID= "wucMensajeActualizar1" runat="server" />
                                </td>
                            </tr>                                  
                        </table>
                        
                        <%--IDs--%>
                    
                        <asp:TextBox Style="display:none" 
                            ID="Apu_Proyecto_Equipo_Id" 
                            runat="server" 
                            Text='<%# Bind("Apu_Proyecto_Equipo_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox Style="display:none" 
                            ID="Apu_Indice_Id" 
                            runat="server" 
                            Text='<%# Bind("Apu_Indice_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox Style="display:none" 
                            ID="Apu_Proyecto_Id" 
                            runat="server" 
                            Text='<%# Bind("Apu_Proyecto_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox Style="display:none" 
                            ID="Apu_Equipo_Id" 
                            runat="server" 
                            Text='<%# Bind("Apu_Equipo_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox Style="display:none" 
                            ID="Id" 
                            runat="server" 
                            Text='<%# Bind("Id") %>'>
                        </asp:TextBox>
                        
                        <%--Ocultos--%>
                        <asp:TextBox Visible="False" 
                            ID="Apu_Proyecto_Equipo_Codigo" 
                            runat="server" 
                            Text='<%# Bind("Apu_Proyecto_Equipo_Codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox Visible="False" 
                            ID="Apu_Proyecto_Codigo" 
                            runat="server" 
                            Text='<%# Bind("Apu_Proyecto_Codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox Visible="False" 
                            ID="Apu_Proyecto_Nombre" 
                            runat="server" 
                            Text='<%# Bind("Apu_Proyecto_Nombre") %>'>
                        </asp:TextBox>
                        <asp:TextBox Visible="False" 
                            ID="Apu_Proyecto_Etapa" 
                            runat="server" 
                            Text='<%# Bind("Apu_Proyecto_Etapa") %>'>
                        </asp:TextBox>
                        <asp:TextBox Visible="False" 
                            ID="Apu_Equipo_Codigo" 
                            runat="server" 
                            Text='<%# Bind("Apu_Equipo_Codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox Visible="False" 
                            ID="Apu_Equipo_Nombre" 
                            runat="server" 
                            Text='<%# Bind("Apu_Equipo_Nombre") %>'>
                        </asp:TextBox>
                        <asp:TextBox Visible="False" 
                            ID="Apu_Indice_Codigo" 
                            runat="server" 
                            Text='<%# Bind("Apu_Indice_Codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox Visible="False" 
                            ID="Int_Moneda_Simbolo" 
                            runat="server" 
                            Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                        </asp:TextBox>
                        <asp:TextBox Visible="False" 
                            ID="Estado_Nombre" 
                            runat="server" 
                            Text='<%# Bind("Estado_Nombre") %>'>
                        </asp:TextBox>                       
                        <asp:TextBox Visible="False" 
                            ID="Codigo" 
                            runat="server" 
                            Text='<%# Bind("Codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox Visible="False" 
                            ID="Nombre" 
                            runat="server" 
                            Text='<%# Bind("Nombre") %>'>
                        </asp:TextBox>
                        <asp:TextBox Visible="False" 
                            ID="Estado" 
                            runat="server" 
                            Text='<%# Bind("Estado") %>'>
                        </asp:TextBox>                                     
                    </EditItemTemplate>
                    
                    <InsertItemTemplate>
                        <table>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblApu_Indice_Nombre"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Apu_Indice_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Indice_Nombre"
                                        Style="text-transform:uppercase"
                                        CssClass="TEXTO_COMBOPER_KCG"
                                        TextMode="MultiLine" 
                                        Height="50px"
                                        Width="400px" 
                                        runat="server" 
                                        Text='<%# Bind("Apu_Indice_Nombre") %>'
                                        ToolTip='<%# GetLocalResourceObject("Apu_Indice_NombreRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:TextBox>
                                    
                                    <asp:RequiredFieldValidator 
                                        ID="rfvApu_Indice_Nombre" 
                                        runat="server"                                                
                                        ValidationGroup="I"
                                        ControlToValidate="Apu_Indice_Nombre" 
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                        <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="vceApu_Indice_Nombre"
                                        TargetControlID="rfvApu_Indice_Nombre"/>                                    
                                    <AjaxControlToolkit:AutoCompleteExtender
                                        runat="server" 
                                        BehaviorID="AutoCompleteEx"
                                        ID="autoComplete1" 
                                        TargetControlID="Apu_Indice_Nombre"
                                        ServicePath="~/APU/APU_PROYECTO_FORMULA_EQUIPO.aspx" 
                                        ServiceMethod="GetIndiceEquipo"
                                        MinimumPrefixLength="0" 
                                        CompletionInterval="500"
                                        EnableCaching="true"
                                        CompletionSetCount="500"
                                        CompletionListCssClass="autocomplete_completionListElement" 
                                        CompletionListItemCssClass="autocomplete_listItem" 
                                        CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                        DelimiterCharacters=""
                                        OnClientItemSelected="ItemSelected">
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
                                        // Work around browser behavior of "auto-submitting" simple forms
                                        Sys.Application.add_load(page_load);
                                        Sys.Application.add_unload(page_unload);
                                        
                                        
                                        var Porcentaje = null;

                                        function page_load(sender, e){
                                            Porcentaje = $get("ctl00_ContentPlaceHolder1_fvDetalleApuProyectoFormulaEquipo_Porcentaje");
                                            $addHandler(Porcentaje, "change", Porcentaje_onchange);
                                        }
                                        
                                       
                                        function page_unload(sender, e){
                                            $removeHandler(Porcentaje, "change", Porcentaje_onchange);
                                        }
                                        
                                        function Porcentaje_onchange(sender, e){
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

                                            var Apu_Indice_Id = $get("ctl00_ContentPlaceHolder1_fvDetalleApuProyectoFormulaEquipo_Apu_Indice_Id");
                                            Apu_Indice_Id.value = temp[0];
                                            var Porcentaje = $get("ctl00_ContentPlaceHolder1_fvDetalleApuProyectoFormulaEquipo_Porcentaje");
                                            Porcentaje.value = temp[2];
                                            
                                            Calcular();
                                        }
                                        
                                        function Calcular()
                                        {
                                            var numApu_Proyecto_Equipo_Costo_Total = 0.00;
                                            var Apu_Proyecto_Equipo_Costo_Total = $get("ctl00_ContentPlaceHolder1_fvDetalleApuProyectoFormulaEquipo_Apu_Proyecto_Equipo_Costo_Total");
                                                            
                                            var numApu_Proyecto_Equipo_Costo_Total = Number.parseLocale(Apu_Proyecto_Equipo_Costo_Total.value);
                                            if(isNaN(numApu_Proyecto_Equipo_Costo_Total))
                                                numApu_Proyecto_Equipo_Costo_Total = 0.0; 
                                            
                                            var numPorcentaje = Number.parseLocale(Porcentaje.value);
                                            if(isNaN(numPorcentaje))
                                                numPorcentaje = 0.0;
                                            
                                            numCosto_Indice = numPorcentaje * numApu_Proyecto_Equipo_Costo_Total / 100;
                                            numCosto_Indice = Redondear(numCosto_Indice, 4);
                                            Costo_Indice = $get("ctl00_ContentPlaceHolder1_fvDetalleApuProyectoFormulaEquipo_Costo_Indice");
                                            Costo_Indice.value = numCosto_Indice.localeFormat("N4");

                                        }
                                        
                                        function Redondear(x,numeroDecimales) {
                                            return (Math.round(x*Math.pow(10,numeroDecimales)))/Math.pow(10,numeroDecimales);
                                        }                                                                                                                        
                                    </script>
                                    <%-- Prevent enter in textbox from causing the collapsible panel from operating --%>
                                    <input type="submit" style="display:none;" />                                                                                                                                                        
                                </td>
                            </tr>                                                        
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblApu_Proyecto_Equipo_Costo_Total"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Apu_Proyecto_Equipo_Costo_TotalRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Apu_Proyecto_Equipo_Costo_Total"
                                        Style="text-align:right" 
                                        ReadOnly="true" 
                                        TabIndex="-1"
                                        runat="server" 
                                        Text='<%# Bind("Apu_Proyecto_Equipo_Costo_Total","{0:N4}") %>'
                                        ToolTip='<%# GetLocalResourceObject("Apu_Proyecto_Equipo_Costo_TotalRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:TextBox>
                                    <asp:Label 
                                        ID="lblMonedaCosto" 
                                        runat="server"
                                        Text='<%#Eval("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblPorcentaje"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("PorcentajeRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Porcentaje"
                                        Style="text-align:right" 
                                        CssClass="TEXTO_EDICION_KCG" 
                                        runat="server" 
                                        Text='<%# Bind("Porcentaje") %>'
                                        ToolTip='<%# GetLocalResourceObject("PorcentajeRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:TextBox>%
                                    <AjaxControlToolkit:MaskedEditExtender 
                                        ID="meePorcentaje" 
                                        runat="server"
                                        TargetControlID="Porcentaje"
                                        Mask="999.99"
                                        MessageValidatorTip="false"
                                        OnFocusCssClass="MaskedEditFocus"
                                        OnInvalidCssClass="MaskedEditError"
                                        MaskType="Number"
                                        InputDirection="RightToLeft"
                                        AcceptNegative="None"
                                        DisplayMoney="None"
                                        ErrorTooltipEnabled="False"
                                        ClearMaskOnLostFocus="True"/>
                                    <AjaxControlToolkit:MaskedEditValidator 
                                        ID="MaskedEditValidator2" 
                                        runat="server"
                                        ControlExtender="meePorcentaje"
                                        ControlToValidate="Porcentaje"
                                        IsValidEmpty="False"
                                        EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ24RecursoKCG.ErrorMessage").ToString() %>'
                                        InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ24RecursoKCG.ErrorMessage").ToString() %>'
                                        MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ24RecursoKCG.ErrorMessage").ToString() %>'
                                        MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ24RecursoKCG.ErrorMessage").ToString() %>'
                                        MinimumValue="0.01"
                                        MaximumValue="100.00" 
                                        Display="Dynamic"
                                        EmptyValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.Text").ToString() %>'
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
                                        ID="lblCosto_Indice"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Costo_IndiceRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Costo_Indice"
                                        Style="text-align:right"
                                        TabIndex="-1" 
                                        ReadOnly="True" 
                                        runat="server" 
                                        Text='<%# Bind("Costo_Indice","{0:N4}") %>'
                                        ToolTip='<%# GetLocalResourceObject("Costo_IndiceRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:TextBox>
                                    <asp:Label ID="lblMoneda" 
                                        runat="server"
                                        Text='<%#Eval("Int_Moneda_Simbolo") %>'>
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
                        
                        <%--IDs--%>
                    
                        <asp:TextBox Style="display:none" 
                            ID="Apu_Proyecto_Equipo_Id" 
                            runat="server" 
                            Text='<%# Bind("Apu_Proyecto_Equipo_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox Style="display:none" 
                            ID="Apu_Indice_Id" 
                            runat="server" 
                            Text='<%# Bind("Apu_Indice_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox Style="display:none" 
                            ID="Apu_Proyecto_Id" 
                            runat="server" 
                            Text='<%# Bind("Apu_Proyecto_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox Style="display:none" 
                            ID="Apu_Equipo_Id" 
                            runat="server" 
                            Text='<%# Bind("Apu_Equipo_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox Style="display:none" 
                            ID="Id" 
                            runat="server" 
                            Text='<%# Bind("Id") %>'>
                        </asp:TextBox>
                        
                        <%--Ocultos--%>
                        <asp:TextBox Visible="False" 
                            ID="Apu_Proyecto_Equipo_Codigo" 
                            runat="server" 
                            Text='<%# Bind("Apu_Proyecto_Equipo_Codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox Visible="False" 
                            ID="Apu_Proyecto_Codigo" 
                            runat="server" 
                            Text='<%# Bind("Apu_Proyecto_Codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox Visible="False" 
                            ID="Apu_Proyecto_Nombre" 
                            runat="server" 
                            Text='<%# Bind("Apu_Proyecto_Nombre") %>'>
                        </asp:TextBox>
                        <asp:TextBox Visible="False" 
                            ID="Apu_Proyecto_Etapa" 
                            runat="server" 
                            Text='<%# Bind("Apu_Proyecto_Etapa") %>'>
                        </asp:TextBox>
                        <asp:TextBox Visible="False" 
                            ID="Apu_Equipo_Codigo" 
                            runat="server" 
                            Text='<%# Bind("Apu_Equipo_Codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox Visible="False" 
                            ID="Apu_Equipo_Nombre" 
                            runat="server" 
                            Text='<%# Bind("Apu_Equipo_Nombre") %>'>
                        </asp:TextBox>
                        <asp:TextBox Visible="False" 
                            ID="Apu_Indice_Codigo" 
                            runat="server" 
                            Text='<%# Bind("Apu_Indice_Codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox Visible="False" 
                            ID="Int_Moneda_Simbolo" 
                            runat="server" 
                            Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                        </asp:TextBox>
                        <asp:TextBox Visible="False" 
                            ID="Estado_Nombre" 
                            runat="server" 
                            Text='<%# Bind("Estado_Nombre") %>'>
                        </asp:TextBox>
                        <asp:TextBox Visible="False" 
                            ID="Campo_Nombre" 
                            runat="server" 
                            Text='<%# Bind("Campo_Nombre") %>'>
                        </asp:TextBox>
                        <asp:TextBox Visible="False" 
                            ID="Codigo" 
                            runat="server" 
                            Text='<%# Bind("Codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox Visible="False" 
                            ID="Nombre" 
                            runat="server" 
                            Text='<%# Bind("Nombre") %>'>
                        </asp:TextBox>
                        <asp:TextBox Visible="False" 
                            ID="Estado" 
                            runat="server" 
                            Text='<%# Bind("Estado") %>'>
                        </asp:TextBox>
                    </InsertItemTemplate>
                        
                    <ItemTemplate>
                        <table>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblApu_Indice_Nombre"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Apu_Indice_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Apu_Indice_Nombre"
                                        ReadOnly="true"
                                        TextMode="MultiLine" 
                                        CssClass ="TEXTO_LECTURA_KCG"
                                        Height="50px"
                                        Width="400px" 
                                        TabIndex="-1"
                                        runat="server" 
                                        Text='<%# Bind("Apu_Indice_Nombre") %>'
                                        ToolTip='<%# GetLocalResourceObject("Apu_Indice_NombreRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblApu_Proyecto_Equipo_Costo_Total"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Apu_Proyecto_Equipo_Costo_TotalRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Apu_Proyecto_Equipo_Costo_Total"
                                        Style="text-align:right" 
                                        TabIndex="-1"
                                        ReadOnly="true" 
                                        runat="server" 
                                        Text='<%# Bind("Apu_Proyecto_Equipo_Costo_Total","{0:N4}") %>'
                                        ToolTip='<%# GetLocalResourceObject("Apu_Proyecto_Equipo_Costo_TotalRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:TextBox>
                                    <asp:Label 
                                        ID="lblMonedaCosto" 
                                        runat="server"
                                        Text='<%#Eval("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblPorcentaje"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("PorcentajeRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Porcentaje"
                                        Style="text-align:right"  
                                        TabIndex="-1"
                                        ReadOnly="true"
                                        runat="server" 
                                        Text='<%# Bind("Porcentaje") %>'
                                        ToolTip='<%# GetLocalResourceObject("PorcentajeRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:TextBox>%
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblCosto_Indice"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Costo_IndiceRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Costo_Indice"
                                        Style="text-align:right"  
                                        TabIndex="-1"
                                        ReadOnly="true"
                                        runat="server" 
                                        Text='<%# Bind("Costo_Indice","{0:N4}") %>'
                                        ToolTip='<%# GetLocalResourceObject("Costo_IndiceRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:TextBox>
                                    <asp:Label 
                                        ID="lblMoneda" 
                                        runat="server"
                                        Text='<%#Eval("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" >
                                   <asp:Button 
                                        ID="EditButton" 
                                        runat="server"
                                        CausesValidation="False" 
                                        CommandName="Edit"
                                        Enabled='<%# HER.PermisosMovimientos.Movimiento_Apu_Proyecto_Equipo_Indice(Request.QueryString["Estado"], Request.QueryString["Apu_Presupuesto_Estado"], HER.PermisosMovimientos.ModoOperacion.Editar ) %>'
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_EditarRecursoKCG.AccesKey").ToString() %>'  
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_EditRecursoKCG.Text").ToString() %>'
                                        ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_EditRecursoKCG.ToolTip").ToString() %>'>
                                   </asp:Button>
                                   <asp:Button 
                                        ID="DeleteButton" 
                                        runat="server" 
                                        CausesValidation="False" 
                                        CommandName="Delete"
                                        Enabled='<%# HER.PermisosMovimientos.Movimiento_Apu_Proyecto_Equipo_Indice(Request.QueryString["Estado"], Request.QueryString["Apu_Presupuesto_Estado"], HER.PermisosMovimientos.ModoOperacion.Eliminar ) %>'
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_EliminarRecursoKCG.AccesKey").ToString() %>'  
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_DeleteRecursoKCG.Text").ToString() %>'
                                        ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_DeleteRecursoKCG.ToolTip").ToString() %>'>
                                   </asp:Button>
                                   <asp:Button 
                                        ID="NewButton" 
                                        runat="server" 
                                        CausesValidation="False" 
                                        CommandName="New"
                                        Enabled='<%# HER.PermisosMovimientos.Movimiento_Apu_Proyecto_Equipo_Indice(Request.QueryString["Estado"], Request.QueryString["Apu_Presupuesto_Estado"], HER.PermisosMovimientos.ModoOperacion.Nuevo ) %>'
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_NuevoRecursoKCG.AccesKey").ToString() %>'  
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_NewRecursoKCG.Text").ToString() %>'
                                        ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_NewRecursoKCG.ToolTip").ToString() %>'>
                                   </asp:Button>
                                </td>
                            </tr>           
                        </table>
                        
                        <%--IDs--%>
                    
                        <asp:TextBox Style="display:none" 
                            ID="Apu_Proyecto_Equipo_Id" 
                            runat="server" 
                            Text='<%# Bind("Apu_Proyecto_Equipo_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox Style="display:none" 
                            ID="Apu_Indice_Id" 
                            runat="server" 
                            Text='<%# Bind("Apu_Indice_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox Style="display:none" 
                            ID="Apu_Proyecto_Id" 
                            runat="server" 
                            Text='<%# Bind("Apu_Proyecto_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox Style="display:none" 
                            ID="Apu_Equipo_Id" 
                            runat="server" 
                            Text='<%# Bind("Apu_Equipo_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox Style="display:none" 
                            ID="Id" 
                            runat="server" 
                            Text='<%# Bind("Id") %>'>
                        </asp:TextBox>
                        
                        <%--Ocultos--%>
                        <asp:TextBox Visible="False" 
                            ID="Apu_Proyecto_Equipo_Codigo" 
                            runat="server" 
                            Text='<%# Bind("Apu_Proyecto_Equipo_Codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox Visible="False" 
                            ID="Apu_Proyecto_Codigo" 
                            runat="server" 
                            Text='<%# Bind("Apu_Proyecto_Codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox Visible="False" 
                            ID="Apu_Proyecto_Nombre" 
                            runat="server" 
                            Text='<%# Bind("Apu_Proyecto_Nombre") %>'>
                        </asp:TextBox>
                        <asp:TextBox Visible="False" 
                            ID="Apu_Proyecto_Etapa" 
                            runat="server" 
                            Text='<%# Bind("Apu_Proyecto_Etapa") %>'>
                        </asp:TextBox>
                        <asp:TextBox Visible="False" 
                            ID="Apu_Equipo_Codigo" 
                            runat="server" 
                            Text='<%# Bind("Apu_Equipo_Codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox Visible="False" 
                            ID="Apu_Equipo_Nombre" 
                            runat="server" 
                            Text='<%# Bind("Apu_Equipo_Nombre") %>'>
                        </asp:TextBox>
                        <asp:TextBox Visible="False" 
                            ID="Apu_Indice_Codigo" 
                            runat="server" 
                            Text='<%# Bind("Apu_Indice_Codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox Visible="False" 
                            ID="Int_Moneda_Simbolo" 
                            runat="server" 
                            Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                        </asp:TextBox>
                        <asp:TextBox Visible="False" 
                            ID="Estado_Nombre" 
                            runat="server" 
                            Text='<%# Bind("Estado_Nombre") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox Visible="False" 
                            ID="Codigo" 
                            runat="server" 
                            Text='<%# Bind("Codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox Visible="False" 
                            ID="Nombre" 
                            runat="server" 
                            Text='<%# Bind("Nombre") %>'>
                        </asp:TextBox>
                        <asp:TextBox Visible="False" 
                            ID="Estado" 
                            runat="server" 
                            Text='<%# Bind("Estado") %>'>
                        </asp:TextBox>                    
                    </ItemTemplate>
                </asp:FormView>                                   
                <asp:ObjectDataSource 
                    ID="odsFvDetalleApuProyectoEquipoIndice"
                    runat="server" 
                    DeleteMethod="Delete"
                    InsertMethod="Insert" 
                    OldValuesParameterFormatString="original{0}" 
                    SelectMethod="GetById"
                    TypeName="FEL.APU.BO_Apu_Proyecto_Equipo_Indice" 
                    UpdateMethod="Update" 
                    ConflictDetection="CompareAllValues" 
                    SortParameterName="sortExpression">
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
                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_AtrasRecursoKCG.Text").ToString() %>'
                    ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_AtrasRecursoKCG.ToolTip").ToString() %>'  
                    Visible="False" />
                <asp:Button 
                    ID="Seleccionar" 
                    runat="server" 
                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_SeleccionRecursoKCG.Text").ToString() %>'
                    ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_SeleccionRecursoKCG.ToolTip").ToString() %>' 
                    Visible="False" />                     
                <asp:Panel 
                    ID="pnl_listado_Induces" 
                    runat="server"
                    meta:resourcekey="Rec_Apu_Proyecto_Formula_Equipo_IndiceRecursoKCG">   
                    <table>
                        <tr>
                            <td>
                                <koala:KGrid 
                                    ID="gvDetalleApuProyectoEquipoIndice"  
                                    runat="server" 
                                    AutoGenerateColumns="False" 
                                    DataSourceID="odsGvDetalleApuProyectoEquipoIndice" 
                                    AllowPaging="True"
                                    AllowSorting="True"
                                    DataKeyNames="Id">
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
                                            DataField="Apu_Indice_Codigo" 
                                            meta:resourcekey="BoundApu_Equipo_CodigoRecursoKCG"
                                            SortExpression="Apu_Indice_Codigo" >
                                            <itemstyle horizontalalign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField 
                                            DataField="Apu_Indice_Nombre" 
                                            meta:resourcekey="BoundApu_Indice_NombreRecursoKCG"
                                            SortExpression="Apu_Indice_Nombre" >
                                            <itemstyle wrap="False" width="80mm"/>
                                        </asp:BoundField>
                                        <asp:BoundField 
                                            DataField="Apu_Proyecto_Equipo_Costo_Total" 
                                            meta:resourcekey="BoundApu_Proyecto_Equipo_Costo_TotalRecursoKCG"
                                            SortExpression="Apu_Proyecto_Equipo_Costo_Total" 
                                            dataformatstring="{0:N4}">
                                            <itemstyle horizontalalign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField 
                                            DataField="Porcentaje" 
                                            meta:resourcekey="BoundPorcentajeRecursoKCG"
                                            SortExpression="Porcentaje" >
                                            <itemstyle horizontalalign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField 
                                            DataField="Costo_Indice" 
                                            meta:resourcekey="BoundCosto_IndiceRecursoKCG"
                                            SortExpression="Costo_Indice" 
                                            dataformatstring="{0:N4}">
                                            <itemstyle horizontalalign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField 
                                            DataField="Nombre"  
                                            HeaderText="Estado"  
                                            SortExpression="Nombre" 
                                            Visible="False" />
                                        <asp:BoundField 
                                            DataField="Apu_Equipo_Codigo"  
                                            HeaderText="Apu_Equipo_Codigo"  
                                            SortExpression="Apu_Equipo_Codigo" 
                                            Visible="False" />
                                    </Columns>
                                </koala:KGrid>
                                <asp:ObjectDataSource 
                                    ID="odsGvDetalleApuProyectoEquipoIndice" 
                                    runat="server" 
                                    OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetByProyectoEquipo" 
                                    TypeName="FEL.APU.BO_Apu_Proyecto_Equipo_Indice">
                                    <SelectParameters>
                                        <asp:SessionParameter 
                                            Name="s" 
                                            SessionField="Scope" 
                                            Type="Object" />
                                        <asp:ControlParameter 
                                            ControlID="gvMaestroApuProyectoEquipo" 
                                            Name="Apu_Proyecto_Equipo_Id" 
                                            PropertyName="SelectedValue"
                                            Type="String" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td
                                align="right">
                                <asp:TextBox 
                                    ID="SumaPorcentajeEquipo"
                                    Style="text-align:right" 
                                    runat="server" 
                                    ReadOnly="true">
                                </asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                
                <table>
                    <tr>
                        <td>
                            <koala:KNavegacion 
                            ID="nav"
                            runat="server"
                            GridViewID="gvMaestroApuProyectoEquipo"
                            OnNavegar="nav_Siguiente" />
                        </td>
                        <td>
                            <koala:KFiltro 
                                ID="kftFiltro" 
                                runat="server" 
                                Contenedor="APU_PROYECTO_FORMULA_EQUIPO" 
                                Objeto="Apu_Proyecto_Equipo" 
                                IndiceScope ="Scope"
                                Orden="1"
                                ObjectDataSourceID="odsGvMasterApuProyectoEquipo" /> 
                        </td>
                    </tr>
                </table>
                <asp:Panel 
                    ID="pnlEquipoHerramineta" 
                    runat="server"
                    meta:resourcekey="Rec_Apu_Proyecto_Formula_EquipoRecursoKCG">        
                    <koala:KGrid 
                        ID="gvMaestroApuProyectoEquipo" 
                        runat="server" 
                        AutoGenerateColumns="False" 
                        DataKeyNames="Id, Suma_porcentaje_Equipo"
                        DataSourceID="odsGvMasterApuProyectoEquipo" 
                        AllowPaging="True" AllowSorting="True">            
                        <AlternatingRowStyle CssClass="alternatingrowstyle" />
                        <HeaderStyle CssClass="headerstyle" />
                        <PagerStyle CssClass="pagerstyle" />
                        <SelectedRowStyle CssClass="selectedrowstyle" />             
                        <Columns>
                            <asp:CommandField 
                                ShowSelectButton="True" 
                                ButtonType="Button" 
                                SelectText="..." />                                    
                            <asp:BoundField DataField="Apu_Equipo_Codigo" 
                                meta:resourcekey="BoundApu_Equipo_CodigoRecursoKCG" 
                                SortExpression="Apu_Equipo_Codigo" >
                                <itemstyle horizontalalign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Apu_Equipo_Nombre" 
                                meta:resourcekey="BoundApu_Equipo_NombreRecursoKCG" 
                                SortExpression="Apu_Equipo_Nombre" >
                                <itemstyle wrap="False" width="80mm"/>
                            </asp:BoundField>
                            <asp:BoundField DataField="Cantidad_equipo" 
                                meta:resourcekey="BoundCantidad_equipoRecursoKCG"  
                                SortExpression="Cantidad_equipo"
                                dataformatstring="{0:N4}"
                                visible="false">
                                <itemstyle horizontalalign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Costo_Hora" 
                                meta:resourcekey="BoundCosto_HoraRecursoKCG" 
                                SortExpression="Costo_Hora" 
                                dataformatstring="{0:N4}"
                                visible="false">
                                <itemstyle horizontalalign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Cantidad_equipo_X_Costo" 
                                meta:resourcekey="BoundCantidad_equipo_X_CostoRecursoKCG" 
                                SortExpression="Cantidad_equipo_X_Costo"
                                dataformatstring="{0:N4}">
                                <itemstyle horizontalalign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Suma_porcentaje_Equipo_1" 
                                meta:resourcekey="BoundSuma_porcentaje_Equipo_1RecursoKCG" 
                                SortExpression="Suma_porcentaje_Equipo_1" 
                                dataformatstring="{0:N4}">
                                <itemstyle horizontalalign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Prueba" 
                                HeaderText="Prueba"
                                SortExpression="Prueba" 
                                Visible="False">
                            </asp:BoundField>
                        </Columns>
                    </koala:KGrid>  
                    <asp:ObjectDataSource 
                        ID="odsGvMasterApuProyectoEquipo" 
                        runat="server" 
                        OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetByProyecto" 
                        TypeName="FEL.APU.BO_Apu_Proyecto_Equipo">
                        <SelectParameters>
                            <asp:SessionParameter 
                                Name="s" 
                                SessionField="Scope" 
                                Type="Object" />
                            <asp:QueryStringParameter 
                                Name="apu_proyecto_Id" 
                                QueryStringField="Apu_Proyecto_Id"
                                Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>  
                </asp:Panel>
                <div>
                    <asp:Button 
                        ID="btnFormula" 
                        runat="server" 
                        meta:resourcekey="Btn_Apu_Proyecto_Formula_Equipo_FormulaRecursoKCG"/>
                    <asp:Button 
                        ID="Btn_Apu_Proyecto_Formula_Equipo_Listado"
                        runat="server"
                        meta:resourcekey="Btn_Apu_Proyecto_Formula_Equipo_ListadoRecursoKCG" />    
                </div>   
            </ContentTemplate>
        </asp:UpdatePanel>    
    </asp:Panel>                               
</asp:Content>

