<%@ Page Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="APU_OFERTA_TRANSPORTE.aspx.cs" 
    Inherits="APU_APU_OFERTA_TRANSPORTE" 
    StylesheetTheme="EstiloKCG"
    Theme="EstiloKCG"
    meta:resourcekey="Tit_Apu_Oferta_TransporteRecursoKCG"%>
     
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

<asp:Content ID="Content1" 
    ContentPlaceHolderID="ContentPlaceHolder1" 
    Runat="Server">
    <asp:UpdatePanel ID="uppGvMaestro"
        runat="server" 
        UpdateMode="Conditional">
        <ContentTemplate>
    <asp:FormView ID="fvMaestroApuOferta" 
        runat="server"  
        DataSourceID="odsFvMaestroApuOferta" 
        DataKeyNames="Suma_Porcentaje_Indice_Transporte,Costo_Transporte"
        DefaultMode="ReadOnly">
        
        <EditItemTemplate> 
        </EditItemTemplate>
        
        <InsertItemTemplate>
        </InsertItemTemplate>
        
        <ItemTemplate>
            <asp:Panel ID="pnlTransporte"
                runat="server"  
                meta:resourcekey="Rec_Apu_Oferta_TransporteRecursoKCG">
                <table style="white-space:nowrap">
                    <tr>
                        <td align="right" colspan="2">
                            <asp:Label ID="Estado_Nombre" 
                                runat="server" 
                                ForeColor="Blue"
                                Text='<%# Bind("Estado_Nombre") %>'>
                            </asp:Label>
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            <asp:Label ID="lblNombre"
                                runat="server"
                                Text='<%#GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Codigo"
                                ReadOnly="true" 
                                TabIndex="-1"
                                runat="server" 
                                Text='<%# Bind("Codigo") %>'
                                ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                            <asp:TextBox ID="Nombre"
                                ReadOnly="true"
                                TabIndex="-1"
                                Width="400px" 
                                runat="server" 
                                Height="50px"
                                TextMode="MultiLine" 
                                CssClass="TEXTO_LECTURA_KCG"
                                Text='<%# Bind("Nombre") %>'
                                ToolTip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            <asp:Label ID="lblCosto_Transporte"
                                runat="server"
                                Text='<%#GetLocalResourceObject("Costo_TransporteRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Costo_Transporte"
                                ReadOnly="true"
                                TabIndex="-1"
                                Style="text-align:right"
                                runat="server" 
                                Text='<%# Bind("Costo_Transporte","{0:N4}") %>'
                                ToolTip='<%# GetLocalResourceObject("Costo_TransporteRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:Label ID="lblInt_Moneda_Simbolo" 
                                runat="server" 
                                Text='<%# Eval("Int_Moneda_Simbolo") %>'>
                            </asp:Label>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </ItemTemplate>
    </asp:FormView>
  
        <asp:Button ID="Btn_Apu_Oferta_Transporte_Formula"
            meta:resourcekey="Btn_Apu_Oferta_Transporte_FormulaRecursoKCG"
            runat="server" />
        <asp:Button ID="Btn_Apu_Oferta_Transporte_Oferta_Listado"
            runat="server"
            meta:resourcekey="Btn_Apu_Oferta_Transporte_Oferta_ListadoRecursoKCG" />   
            </ContentTemplate>
            
    </asp:UpdatePanel>
    
    <asp:ObjectDataSource ID="odsFvMaestroApuOferta" 
        runat="server" 
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetByIdResumido" 
        SortParameterName="sortExpression" 
        TypeName="FEL.APU.BO_Apu_Oferta">
        <SelectParameters>
            <asp:SessionParameter Name="s" 
                SessionField="Scope" Type="Object" />
            <asp:QueryStringParameter Name="Apu_Oferta_Id" 
                QueryStringField="Apu_Oferta_Id" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    
    <asp:Panel ID="Rec_Apu_Oferta_Transporte_Indice"
        runat="server"
        meta:resourcekey="Rec_Apu_Oferta_Transporte_IndiceRecursoKCG">
    
    <asp:UpdatePanel ID="uupFvDetalle" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
    <asp:FormView ID="fvDetalleApuOfertaTransporteIndice" 
        runat="server" 
        DataSourceID="odsFvDetalleApuOfertaTransporteIndice" 
        DefaultMode="Insert">
        <EditItemTemplate>
            <table style="white-space:nowrap">
                <tr align="left">
                    <td>
                        <asp:Label ID="lblApu_Indice_Nombre"
                            AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                            AssociatedControlID="Apu_Indice_Nombre"
                            runat="server"
                            Text='<%#GetLocalResourceObject("Apu_Indice_NombreRecursoKCG.Text").ToString() %>'>
                        </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Apu_Indice_Nombre"
                            Style="text-transform:uppercase"
                            CssClass="TEXTO_COMBOPER_KCG"
                            Height="50px"
                            TextMode ="MultiLine" 
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
                            ServicePath="~/APU/APU_OFERTA_TRANSPORTE.aspx" 
                            ServiceMethod="GetIndiceEquipo"
                            MinimumPrefixLength="0" 
                            CompletionInterval="500"
                            EnableCaching="true"
                            CompletionSetCount="500"
                            CompletionListCssClass="autocomplete_completionListElement" 
                            CompletionListItemCssClass="autocomplete_listItem" 
                            CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
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
                        <asp:Label ID="lblCosto_Total"
                            runat="server"
                            Text='<%#GetLocalResourceObject("Costo_TotalRecursoKCG.Text").ToString() %>'>
                        </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Costo_Total"
                            ReadOnly="true"
                            TabIndex="-1"
                            Style="text-align:right"  
                            runat="server" 
                            Text='<%# Bind("Costo_Total","{0:N4}") %>'
                            ToolTip='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.ToolTip").ToString() %>'>
                        </asp:TextBox>
                        <asp:Label ID="lblMoneda" 
                            runat="server" 
                            Text='<%# Eval("Int_Moneda_Simbolo") %>'>
                        </asp:Label>
                    </td>
                </tr>
                <tr align="left">
                    <td>
                        <asp:Label ID="lblPorcentaje"
                            runat="server"
                            Text='<%#GetLocalResourceObject("PorcentajeRecursoKCG.Text").ToString() %>'>
                        </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Porcentaje"
                            CssClass="TEXTO_EDICION_KCG"
                            Style="text-align:right"  
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
                            ClearMaskOnLostFocus="True"
                            />

                        <AjaxControlToolkit:MaskedEditValidator ID="MaskedEditValidator2" runat="server"
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
                        <asp:Label ID="lblCosto_Indice"
                            runat="server"
                            Text='<%#GetLocalResourceObject("Costo_IndiceRecursoKCG.Text").ToString() %>'>
                        </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Costo_Indice"
                            ReadOnly="true"
                            TabIndex="-1"
                            Style="text-align:right" 
                            runat="server" 
                            Text='<%# Bind("Costo_Indice","{0:N4}") %>'
                            ToolTip='<%# GetLocalResourceObject("Costo_IndiceRecursoKCG.ToolTip").ToString() %>'>
                        </asp:TextBox>
                        <asp:Label ID="Label1" 
                            runat="server" 
                            Text='<%# Eval("Int_Moneda_Simbolo") %>'>
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
            <asp:TextBox ID="Apu_Oferta_Id"
                Style="display:none" 
                runat="server" 
                Text='<%# Bind("Apu_Oferta_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Indice_Id" 
                Style="display:none"
                runat="server" 
                Text='<%# Bind("Apu_Indice_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Id" 
                Style="display:none"
                runat="server" 
                Text='<%# Bind("Id") %>'>
            </asp:TextBox>
            
            <%--Ocultos--%>
            <asp:TextBox ID="Apu_Oferta_Codigo" 
                Visible="false"
                runat="server" 
                Text='<%# Bind("Apu_Oferta_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Oferta_Nombre" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Apu_Oferta_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Oferta_Etapa" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Apu_Oferta_Etapa") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Indice_Codigo" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Apu_Indice_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Int_Moneda_Simbolo" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Int_Moneda_Simbolo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Estado_Nombre" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Estado_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Codigo"  
                Visible="false"
                runat="server" 
                Text='<%# Bind("Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Nombre"  
                Visible="false"
                runat="server" 
                Text='<%# Bind("Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="EstadoTextBox"  
                Visible="false"
                runat="server" 
                Text='<%# Bind("Estado") %>'>
            </asp:TextBox>
        </EditItemTemplate>
        <InsertItemTemplate>
            <table style="white-space:nowrap">
                <tr align="left">
                    <td>
                        <asp:Label ID="lblApu_Indice_Nombre"
                            AssociatedControlID="Apu_Indice_Nombre"
                            runat="server"
                            Text='<%#GetLocalResourceObject("Apu_Indice_NombreRecursoKCG.Text").ToString() %>'>
                        </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Apu_Indice_Nombre"
                            Style="text-transform:uppercase"
                            CssClass="TEXTO_COMBOPER_KCG"
                            Height="50px"
                            TextMode ="MultiLine" 
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
                            ServicePath="~/APU/APU_OFERTA_TRANSPORTE.aspx" 
                            ServiceMethod="GetIndiceEquipo"
                            MinimumPrefixLength="0" 
                            CompletionInterval="500"
                            EnableCaching="true"
                            CompletionSetCount="500"
                            CompletionListCssClass="autocomplete_completionListElement" 
                            CompletionListItemCssClass="autocomplete_listItem" 
                            CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
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
                                Porcentaje = $get("ctl00_ContentPlaceHolder1_fvDetalleApuOfertaTransporteIndice_Porcentaje");
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

                                var Apu_Indice_Id = $get("ctl00_ContentPlaceHolder1_fvDetalleApuOfertaTransporteIndice_Apu_Indice_Id");
                                Apu_Indice_Id.value = temp[0];
                                var Porcentaje = $get("ctl00_ContentPlaceHolder1_fvDetalleApuOfertaTransporteIndice_Porcentaje");
                                Porcentaje.value = temp[2];
                                
                                Calcular();
                            }
                            
                            function Calcular()
                            {
                                var Costo_Total = $get("ctl00_ContentPlaceHolder1_fvDetalleApuOfertaTransporteIndice_Costo_Total");
                                                
                                var numCosto_Total = Number.parseLocale(Costo_Total.value);
                                if(isNaN(numCosto_Total))
                                    numCosto_Total = 0.0; 
                                
                                var numPorcentaje = Number.parseLocale(Porcentaje.value);
                                if(isNaN(numPorcentaje))
                                    numPorcentaje = 0.0;
                                
                                numCosto_Indice = numPorcentaje * numCosto_Total / 100;
                                numCosto_Indice = Redondear(numCosto_Indice, 4);
                                Costo_Indice = $get("ctl00_ContentPlaceHolder1_fvDetalleApuOfertaTransporteIndice_Costo_Indice");
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
                        <asp:Label ID="lblCosto_Total"
                            runat="server"
                            Text='<%#GetLocalResourceObject("Costo_TotalRecursoKCG.Text").ToString() %>'>
                        </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Costo_Total"
                            ReadOnly="true"
                            TabIndex="-1"
                            Style="text-align:right"  
                            runat="server" 
                            Text='<%# Bind("Costo_Total") %>'
                            ToolTip='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.ToolTip").ToString() %>'>
                        </asp:TextBox>
                        <asp:Label ID="lblMoneda" 
                            runat="server" 
                            Text='<%# Eval("Int_Moneda_Simbolo") %>'>
                        </asp:Label>
                    </td>
                </tr>
                <tr align="left">
                    <td>
                        <asp:Label ID="lblPorcentaje"
                            runat="server"
                            Text='<%#GetLocalResourceObject("PorcentajeRecursoKCG.Text").ToString() %>'>
                        </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Porcentaje"
                            CssClass="TEXTO_EDICION_KCG"
                            Style="text-align:right"  
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
                            ClearMaskOnLostFocus="True"
                            />

                        <AjaxControlToolkit:MaskedEditValidator ID="MaskedEditValidator2" runat="server"
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
                        <asp:Label ID="lblCosto_Indice"
                            runat="server"
                            Text='<%#GetLocalResourceObject("Costo_IndiceRecursoKCG.Text").ToString() %>'>
                        </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Costo_Indice"
                            ReadOnly="true"
                            Style="text-align:right" 
                            TabIndex="-1"
                            runat="server" 
                            Text='<%# Bind("Costo_Indice") %>'
                            ToolTip='<%# GetLocalResourceObject("Costo_IndiceRecursoKCG.ToolTip").ToString() %>'>
                        </asp:TextBox>
                        <asp:Label ID="Label1" 
                            runat="server" 
                            Text='<%# Eval("Int_Moneda_Simbolo") %>'>
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
            <asp:TextBox ID="Apu_Oferta_Id"
                Style="display:none" 
                runat="server" 
                Text='<%# Bind("Apu_Oferta_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Indice_Id" 
                Style="display:none"
                runat="server" 
                Text='<%# Bind("Apu_Indice_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Id" 
                Style="display:none"
                runat="server" 
                Text='<%# Bind("Id") %>'>
            </asp:TextBox>
            
            <%--Ocultos--%>
            <asp:TextBox ID="Apu_Oferta_Codigo" 
                Visible="false"
                runat="server" 
                Text='<%# Bind("Apu_Oferta_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Oferta_Nombre" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Apu_Oferta_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Oferta_Etapa" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Apu_Oferta_Etapa") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Indice_Codigo" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Apu_Indice_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Int_Moneda_Simbolo" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Int_Moneda_Simbolo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Estado_Nombre" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Estado_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Codigo"  
                Visible="false"
                runat="server" 
                Text='<%# Bind("Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Nombre"  
                Visible="false"
                runat="server" 
                Text='<%# Bind("Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="EstadoTextBox"  
                Visible="false"
                runat="server" 
                Text='<%# Bind("Estado") %>'>
            </asp:TextBox>
        </InsertItemTemplate>
        <ItemTemplate>
            <table style="white-space:nowrap">
                <tr align="left">
                    <td>
                        <asp:Label ID="lblApu_Indice_Nombre"
                            runat="server"
                            Text='<%#GetLocalResourceObject("Apu_Indice_NombreRecursoKCG.Text").ToString() %>'>
                        </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Apu_Indice_Nombre"
                            Style="text-transform:uppercase"
                            TabIndex="-1"
                            ReadOnly="true"
                            CssClass="TEXTO_LECTURA_KCG"
                            Height="50px"
                            TextMode="MultiLine" 
                            Width="400px" 
                            runat="server" 
                            Text='<%# Bind("Apu_Indice_Nombre") %>'
                            ToolTip='<%# GetLocalResourceObject("Apu_Indice_NombreRecursoKCG.ToolTip").ToString() %>'>
                        </asp:TextBox>
                    </td>
                </tr>
                <tr align="left">
                    <td>
                        <asp:Label ID="lblCosto_Total"
                            runat="server"
                            Text='<%#GetLocalResourceObject("Costo_TotalRecursoKCG.Text").ToString() %>'>
                        </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Costo_Total"
                            ReadOnly="true"
                            TabIndex="-1"
                            Style="text-align:right"  
                            runat="server" 
                            Text='<%# Bind("Costo_Total","{0:N4}") %>'
                            ToolTip='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.ToolTip").ToString() %>'>
                        </asp:TextBox>
                        <asp:Label ID="lblMoneda" 
                            runat="server" 
                            Text='<%# Eval("Int_Moneda_Simbolo") %>'>
                        </asp:Label>
                    </td>
                </tr>
                <tr align="left">
                    <td>
                        <asp:Label ID="lblPorcentaje"
                            runat="server"
                            Text='<%#GetLocalResourceObject("PorcentajeRecursoKCG.Text").ToString() %>'>
                        </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Porcentaje"
                            ReadOnly="true"
                            TabIndex="-1"
                            Style="text-align:right"  
                            runat="server" 
                            Text='<%# Bind("Porcentaje") %>'
                            ToolTip='<%# GetLocalResourceObject("PorcentajeRecursoKCG.ToolTip").ToString() %>'>
                        </asp:TextBox>%
                    </td>
                </tr>
                <tr align="left">
                    <td>
                        <asp:Label ID="lblCosto_Indice"
                            runat="server"
                            Text='<%#GetLocalResourceObject("Costo_IndiceRecursoKCG.Text").ToString() %>'>
                        </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Costo_Indice"
                            ReadOnly="true"
                            TabIndex="-1"
                            Style="text-align:right" 
                            runat="server" 
                            Text='<%# Bind("Costo_Indice","{0:N4}") %>'
                            ToolTip='<%# GetLocalResourceObject("Costo_IndiceRecursoKCG.ToolTip").ToString() %>'>
                        </asp:TextBox>
                        <asp:Label ID="Label1" 
                            runat="server" 
                            Text='<%# Eval("Int_Moneda_Simbolo") %>'>
                        </asp:Label>
                    </td>
                </tr>
                <tr align="left">
                    <td colspan="2" >
                       <asp:Button 
                            ID="EditButton" 
                            runat="server"
                            CausesValidation="False" 
                            CommandName="Edit"
                            Enabled='<%# HER.PermisosMovimientos.Movimiento_Apu_Oferta_Transporte_Indice(Request.QueryString["Estado"], Request.QueryString["Apu_Presupuesto_Estado"], HER.PermisosMovimientos.ModoOperacion.Editar ) %>'
                            AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_EditarRecursoKCG.AccesKey").ToString() %>'  
                            Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_EditRecursoKCG.Text").ToString() %>'
                            ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_EditRecursoKCG.ToolTip").ToString() %>'>
                       </asp:Button>
                       <asp:Button 
                            ID="DeleteButton" 
                            runat="server" 
                            CausesValidation="False" 
                            CommandName="Delete"
                            Enabled='<%# HER.PermisosMovimientos.Movimiento_Apu_Oferta_Transporte_Indice(Request.QueryString["Estado"], Request.QueryString["Apu_Presupuesto_Estado"], HER.PermisosMovimientos.ModoOperacion.Eliminar ) %>'
                            AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_EliminarRecursoKCG.AccesKey").ToString() %>'  
                            Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_DeleteRecursoKCG.Text").ToString() %>'
                            ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_DeleteRecursoKCG.ToolTip").ToString() %>'>
                       </asp:Button>
                       <asp:Button 
                            ID="NewButton" 
                            runat="server" 
                            CausesValidation="False" 
                            CommandName="New"
                            Enabled='<%# HER.PermisosMovimientos.Movimiento_Apu_Oferta_Transporte_Indice(Request.QueryString["Estado"], Request.QueryString["Apu_Presupuesto_Estado"], HER.PermisosMovimientos.ModoOperacion.Nuevo ) %>'
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
            
            
            <%--IDs--%>
            <asp:TextBox ID="Apu_Oferta_Id"
                Style="display:none" 
                runat="server" 
                Text='<%# Bind("Apu_Oferta_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Indice_Id" 
                Style="display:none"
                runat="server" 
                Text='<%# Bind("Apu_Indice_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Id" 
                Style="display:none"
                runat="server" 
                Text='<%# Bind("Id") %>'>
            </asp:TextBox>
            
            <%--Ocultos--%>
            <asp:TextBox ID="Apu_Oferta_Codigo" 
                Visible="false"
                runat="server" 
                Text='<%# Bind("Apu_Oferta_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Oferta_Nombre" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Apu_Oferta_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Oferta_Etapa" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Apu_Oferta_Etapa") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Indice_Codigo" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Apu_Indice_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Int_Moneda_Simbolo" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Int_Moneda_Simbolo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Estado_Nombre" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Estado_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Codigo"  
                Visible="false"
                runat="server" 
                Text='<%# Bind("Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Nombre"  
                Visible="false"
                runat="server" 
                Text='<%# Bind("Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="EstadoTextBox"  
                Visible="false"
                runat="server" 
                Text='<%# Bind("Estado") %>'>
            </asp:TextBox>
        </ItemTemplate>
    </asp:FormView>
    
    <koala:KNavegacion 
        ID="nav"
        runat="server"                         
        GridViewID="gvDetalleApuOfertaTransporteIndice"
        FormViewID="FormViewEquipos" 
        OnNavegar="nav_Siguiente" />
    
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="gvDetalleApuOfertaTransporteIndice" EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>

    
    <asp:ObjectDataSource 
        ID="odsFvDetalleApuOfertaTransporteIndice" 
        runat="server" 
        ConflictDetection="CompareAllValues"
        OldValuesParameterFormatString="original{0}" 
        SelectMethod="GetById"
        InsertMethod="Insert"
        DeleteMethod="Delete"
        UpdateMethod="Update" 
        SortParameterName="sortExpression"
        TypeName="FEL.APU.BO_Apu_Oferta_Transporte_Indice">
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
        ID="uppBotones" 
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
        ID="uppGvDetalle" 
        runat="server">
        <ContentTemplate>
            <koala:KFiltro 
                ID="kftFiltro" 
                runat="server" 
                Contenedor="APU_OFERTA_TRANSPORTE" 
                Objeto="APU_OFERTA_TRANSPORTE_INDICE" 
                IndiceScope ="Scope"
                Orden="1" 
                ObjectDataSourceID="odsGvDetalleApuOfertaTransporteIndice"/>
            <table>
                <tr>
                    <td>
                        <koala:KGrid 
                            ID="gvDetalleApuOfertaTransporteIndice" 
                            runat="server" 
                            AllowPaging="True" 
                            AllowSorting="true"
                            AutoGenerateColumns="False" 
                            DataSourceID="odsGvDetalleApuOfertaTransporteIndice"
                            DataKeyNames="Id"
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
                                    DataField="Apu_Indice_Codigo" 
                                    meta:resourcekey="BoundCodigoRecursoKCG"
                                    SortExpression="Apu_Indice_Codigo" >
                                    <itemstyle horizontalalign="Right" />
                                </asp:BoundField>
                                <asp:BoundField 
                                    DataField="Apu_Indice_Nombre" 
                                    meta:resourcekey="BoundApu_Indice_NombreRecursoKCG"
                                    SortExpression="Apu_Indice_Nombre">
                                    <itemstyle wrap="False"  width="80mm"/>
                                    <headerstyle wrap="false" />
                                </asp:BoundField>
                                <asp:BoundField 
                                    DataField="Costo_Total" 
                                    meta:resourcekey="BoundCosto_TotalRecursoKCG"
                                    SortExpression="Costo_Total"
                                    dataformatstring="{0:N4}">
                                    <headerstyle wrap="false" horizontalalign="Right"/>
                                    <itemstyle horizontalalign="Right" />
                                </asp:BoundField>
                                <asp:BoundField 
                                    DataField="Porcentaje" 
                                    meta:resourcekey="BoundPorcentajeRecursoKCG"
                                    SortExpression="Porcentaje" >
                                    <headerstyle wrap="false" horizontalalign="Right"/>
                                    <itemstyle horizontalalign="Right" />
                                </asp:BoundField>
                                <asp:BoundField 
                                    DataField="Costo_Indice" 
                                    meta:resourcekey="BoundCosto_IndiceRecursoKCG"
                                    SortExpression="Costo_Indice" 
                                    dataformatstring="{0:N4}">
                                    <headerstyle wrap="false" horizontalalign="Right"/>
                                    <itemstyle horizontalalign="Right" />
                                 </asp:BoundField>
                               
                                <asp:BoundField 
                                    DataField="Apu_Oferta_Id" 
                                    HeaderText="Apu_Oferta_Id" 
                                    SortExpression="Apu_Oferta_Id" 
                                    Visible="false" />
                                <%--<asp:BoundField DataField="Apu_Indice_Id" HeaderText="Apu_Indice_Id" SortExpression="Apu_Indice_Id" />
                                <asp:BoundField DataField="Apu_Oferta_Codigo" HeaderText="Apu_Oferta_Codigo" SortExpression="Apu_Oferta_Codigo" />
                                <asp:BoundField DataField="Apu_Oferta_Nombre" HeaderText="Apu_Oferta_Nombre" SortExpression="Apu_Oferta_Nombre" />
                                <asp:BoundField DataField="Apu_Oferta_Etapa" HeaderText="Apu_Oferta_Etapa" SortExpression="Apu_Oferta_Etapa" />
                                <asp:BoundField DataField="Int_Moneda_Simbolo" HeaderText="Int_Moneda_Simbolo" SortExpression="Int_Moneda_Simbolo" />
                                <asp:BoundField DataField="Estado_Nombre" HeaderText="Estado_Nombre" SortExpression="Estado_Nombre" />            
                                <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" />
                                <asp:BoundField DataField="Codigo" HeaderText="Codigo" SortExpression="Codigo_int" />
                                <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                                <asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado" />--%>
                            </Columns>
                        </koala:KGrid>
                    </td>
                </tr>
                <tr>
                    <td
                        align="right">
                        <asp:TextBox 
                            ID="SumaPorcentajeIndiceTransporte"
                            Style="text-align:right"
                            ReadOnly="true"
                            runat="server" >
                        </asp:TextBox>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    </asp:Panel>
    
    <asp:ObjectDataSource 
        ID="odsGvDetalleApuOfertaTransporteIndice" 
        runat="server" 
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetByOferta" 
        TypeName="FEL.APU.BO_Apu_Oferta_Transporte_Indice">
        <SelectParameters>
            <asp:SessionParameter 
                Name="s" 
                SessionField="Scope" 
                Type="Object" />
            <asp:QueryStringParameter 
                Name="Apu_Oferta_Id" 
                QueryStringField="Apu_Oferta_Id" 
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

