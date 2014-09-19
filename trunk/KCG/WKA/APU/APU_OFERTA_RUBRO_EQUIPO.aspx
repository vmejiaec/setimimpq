<%@ Page Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="APU_OFERTA_RUBRO_EQUIPO.aspx.cs" 
    Inherits="APU_APU_OFERTA_RUBRO_EQUIPO" 
    StylesheetTheme="EstiloKCG"
    Theme="EstiloKCG"
    meta:resourcekey="Tit_Apu_Oferta_Rubro_EquipoRecursoKCG"%>
     
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
    <script type="text/javascript">
        // Work around browser behavior of "auto-submitting" simple forms

        var frm = document.getElementById("aspnetForm");
        if (frm) {
            frm.onsubmit = function() { return false; };
        }                            

        function ItemSelected( source, eventArgs ) 
        {
            var valor = eventArgs.get_value();
            var temp = new Array();
            temp = valor.split('||');
            
            var Apu_Equipo_Codigo = null;
            var Apu_Equipo_Id = $get("ctl00_ContentPlaceHolder1_fvApuOfertaRubroEquipo_Apu_Equipo_Id");

            Apu_Equipo_Id.value = temp[0];
        }                            
    </script>
    <asp:UpdatePanel ID="uppFv"
        runat="server"
        UpdateMode="Conditional">
        <ContentTemplate>
    <asp:FormView ID="fvApuOfertaRubroEquipo" 
        runat="server" 
        DataSourceID="odsFvApuOfertaRubroEquipo"
        DefaultMode="Insert" DataKeyNames="Apu_Oferta_Id,Apu_Oferta_Codigo,Apu_Oferta_Nombre">
        <EditItemTemplate>
            <asp:Panel ID="Rec_Oferta_Rubro_Equipo_Oferta" 
                runat="server"
                meta:resourcekey="Rec_Oferta_Rubro_Equipo_OfertaRecursoKCG">
                <table style="white-space:nowrap">
                    <tr align="left">
                        <td>
                            <asp:Label ID="lblApu_Oferta_Nombre"
                                runat="server"
                                Text='<%# GetLocalResourceObject("Apu_Oferta_NombreRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Apu_Oferta_Codigo"
                                ReadOnly="true" 
                                runat="server" 
                                TabIndex="-1"
                                Text='<%# Bind("Apu_Oferta_Codigo") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Oferta_CodigoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                            <asp:TextBox ID="Apu_Oferta_Nombre"
                                ReadOnly="true" 
                                Width="400px" 
                                Height="50px"
                                TabIndex="-1"
                                runat="server" 
                                TextMode="MultiLine"
                                CssClass="TEXTO_LECTURA_KCG"
                                Text='<%# Bind("Apu_Oferta_Nombre") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Oferta_NombreRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:Panel ID="Rec_Apu_Oferta_Rubro_Equipo_Rubro"
                runat="server"
                meta:resourcekey="Rec_Apu_Oferta_Rubro_Equipo_RubroRecursoKCG">
                <table style="white-space:nowrap">
                    <tr align="left">
                        <td>
                            <asp:Label ID="lblApu_Rubro_Nombre"
                                runat="server"
                                Text='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Apu_Rubro_Codigo"
                                ReadOnly="true" 
                                TabIndex="-1"
                                runat="server" 
                                Text='<%# Bind("Apu_Rubro_Codigo") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Rubro_CodigoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:TextBox ID="Apu_Rubro_Nombre"
                                ReadOnly="true"
                                TabIndex="-1" 
                                Width="400px" 
                                runat="server" 
                                Text='<%# Bind("Apu_Rubro_Nombre") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            <asp:Label ID="lblApu_Rubro_Unidad"
                                runat="server"
                                Text='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Apu_Rubro_Unidad"
                                ReadOnly="true" 
                                TabIndex="-1" 
                                runat="server" 
                                Text='<%# Bind("Apu_Rubro_Unidad") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>    
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:Panel ID="Rec_Apu_Oferta_Rubro_Equipo"
                runat="server"
                meta:resourcekey="Rec_Apu_Oferta_Rubro_EquipoRecursoKCG">
                <table style="white-space:nowrap">
                    <tr align="right">
                        <td>
                            <asp:Label ID="Estado_Nombre" 
                                runat="server" 
                                ForeColor="Blue"
                                Text='<%# Bind("Estado_Nombre") %>'>
                            </asp:Label>
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            <asp:Label ID="lblApu_Equipo_Nombre"
                                AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                AssociatedControlID="Apu_Equipo_Nombre"
                                runat="server"
                                Text='<%# GetLocalResourceObject("Apu_Equipo_NombreRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        
                        </td>
                        <td>
                            <asp:TextBox ID="Apu_Equipo_Nombre"
                                CssClass="TEXTO_COMBOPER_KCG"
                                Style="text-transform:uppercase"
                                TextMode ="MultiLine" 
                                Height ="50px"
                                Width="400px" 
                                runat="server" 
                                Text='<%# Bind("Apu_Equipo_Nombre") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Equipo_NombreRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            
                            <asp:RequiredFieldValidator 
                            ID="rfvApu_Equipo_Nombre" 
                            runat="server"                                                
                            ValidationGroup="I"
                            ControlToValidate="Apu_Equipo_Nombre" 
                            ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                            Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                            
                            <AjaxControlToolkit:ValidatorCalloutExtender 
                            runat="Server" 
                            ID="vceApu_Equipo_Nombre"
                            TargetControlID="rfvApu_Equipo_Nombre"/>
                            
                            <AjaxControlToolkit:AutoCompleteExtender
                            runat="server" 
                            BehaviorID="AutoCompleteEx"
                            ID="autoComplete1" 
                            TargetControlID="Apu_Equipo_Nombre"
                            ServicePath="~/APU/APU_OFERTA_RUBRO_EQUIPO.aspx" 
                            ServiceMethod="GetEquipo"
                            MinimumPrefixLength="0" 
                            CompletionInterval="500"
                            EnableCaching="true"
                            CompletionSetCount="500"
                            CompletionListCssClass="autocomplete_completionListElement" 
                            CompletionListItemCssClass="autocomplete_listItem" 
                            CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
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
                        <input type="submit" style="display:none;" />
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            <asp:Label ID="lblCosto"
                                runat="server"
                                Text='<%# GetLocalResourceObject("CostoRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Costo"
                                CssClass="TEXTO_EDICION_KCG"
                                Style="text-align:right" 
                                runat="server" 
                                Text='<%# Bind("Costo","{0:N2}") %>'
                                ToolTip='<%# GetLocalResourceObject("CostoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:Label ID="lblMoneda" 
                                runat="server" 
                                Text='<%# Eval("int_moneda_simbolo") %>'>
                            </asp:Label>
                            
                            <AjaxControlToolkit:MaskedEditExtender 
                                ID="meeCosto" 
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
                                ErrorTooltipEnabled="False"
                                ClearMaskOnLostFocus="True"
                                />

                            <AjaxControlToolkit:MaskedEditValidator ID="MaskedEditValidator2"  
                                runat="server"
                                ControlExtender="meeCosto"
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
                                ID="ValidatorCalloutExtender1"
                                TargetControlID="MaskedEditValidator2"/> 
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
            </asp:Panel>
            
            <%--IDs--%>

            <asp:TextBox ID="Apu_Oferta_Rubro_Id" 
                Style="display:none"
                runat="server" 
                Text='<%# Bind("Apu_Oferta_Rubro_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Equipo_Id" 
                Style="display:none" 
                runat="server" 
                Text='<%# Bind("Apu_Equipo_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Update_Per_Personal_Id"  
                Style="display:none"
                runat="server" 
                Text='<%# Bind("Update_Per_Personal_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Oferta_Id"  
                Style="display:none"
                runat="server" 
                Text='<%# Bind("Apu_Oferta_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Creacion_Per_Personal_Id"  
                Style="display:none"
                runat="server" 
                Text='<%# Bind("Creacion_Per_Personal_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Rubro_Id"  
                Style="display:none"
                runat="server" 
                Text='<%# Bind("Apu_Rubro_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Id"  
                Style="display:none"
                runat="server" 
                Text='<%# Bind("Id") %>'>
            </asp:TextBox>
            
            <%--Ocultos--%>

            <asp:TextBox ID="Fecha_Creacion"
                Visible="False" 
                runat="server" 
                Text='<%# Bind("Fecha_Creacion") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Fecha_Update" 
                Visible="False"
                runat="server" 
                Text='<%# Bind("Fecha_Update") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Oferta_Rubro_Codigo" 
                Visible="False"
                runat="server" 
                Text='<%# Bind("Apu_Oferta_Rubro_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Oferta_Etapa" 
                Visible="False"
                runat="server" 
                Text='<%# Bind("Apu_Oferta_Etapa") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Equipo_Codigo" 
                Visible="False"
                runat="server" 
                Text='<%# Bind("Apu_Equipo_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Creacion_Per_Personal_Codigo" 
                Visible="False"
                runat="server" 
                Text='<%# Bind("Creacion_Per_Personal_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Creacion_Per_Personal_Nombre" 
                Visible="False"
                runat="server" 
                Text='<%# Bind("Creacion_Per_Personal_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Update_Per_Personal_Codigo"
                Visible="False" 
                runat="server" 
                Text='<%# Bind("Update_Per_Personal_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Update_Per_Personal_Nombre" 
                Visible="False"
                runat="server" 
                Text='<%# Bind("Update_Per_Personal_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="int_moneda_simbolo" 
                Visible="False"
                runat="server" 
                Text='<%# Bind("int_moneda_simbolo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Codigo" 
                Visible="False"
                runat="server" 
                Text='<%# Bind("Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Nombre" 
                Visible="False"
                runat="server" 
                Text='<%# Bind("Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Estado" 
                Visible="False"
                runat="server" 
                Text='<%# Bind("Estado") %>'>
            </asp:TextBox>
        </EditItemTemplate>
        <InsertItemTemplate>
            <asp:Panel ID="Rec_Oferta_Rubro_Equipo_Oferta" 
                runat="server"
                meta:resourcekey="Rec_Oferta_Rubro_Equipo_OfertaRecursoKCG">
                <table style="white-space:nowrap">
                    <tr align="left">
                        <td>
                            <asp:Label ID="lblApu_Oferta_Nombre"
                                runat="server"
                                Text='<%# GetLocalResourceObject("Apu_Oferta_NombreRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Apu_Oferta_Codigo"
                                ReadOnly="true" 
                                TabIndex="-1"
                                runat="server" 
                                Text='<%# Bind("Apu_Oferta_Codigo") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Oferta_CodigoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr>    
                        <td>
                        </td>
                        <td>
                            <asp:TextBox ID="Apu_Oferta_Nombre"
                                ReadOnly="true" 
                                TabIndex="-1"
                                Width="400px" 
                                Height="50px"
                                TextMode="MultiLine"
                                CssClass="TEXTO_LECTURA_KCG"
                                runat="server" 
                                Text='<%# Bind("Apu_Oferta_Nombre") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Oferta_NombreRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:Panel ID="Rec_Apu_Oferta_Rubro_Equipo_Rubro"
                runat="server"
                meta:resourcekey="Rec_Apu_Oferta_Rubro_Equipo_RubroRecursoKCG">
                <table style="white-space:nowrap">
                    <tr align="left">
                        <td>
                            <asp:Label ID="lblApu_Rubro_Nombre"
                                runat="server"
                                Text='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Apu_Rubro_Codigo"
                                ReadOnly="true" 
                                TabIndex="-1"
                                runat="server" 
                                Text='<%# Bind("Apu_Rubro_Codigo") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Rubro_CodigoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:TextBox ID="Apu_Rubro_Nombre"
                                ReadOnly="true"
                                TabIndex="-1" 
                                Width="400px" 
                                runat="server" 
                                Text='<%# Bind("Apu_Rubro_Nombre") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            <asp:Label ID="lblApu_Rubro_Unidad"
                                runat="server"
                                Text='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Apu_Rubro_Unidad"
                                ReadOnly="true" 
                                TabIndex="-1" 
                                runat="server" 
                                Text='<%# Bind("Apu_Rubro_Unidad") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>    
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:Panel ID="Rec_Apu_Oferta_Rubro_Equipo"
                runat="server"
                meta:resourcekey="Rec_Apu_Oferta_Rubro_EquipoRecursoKCG">
                <table style="white-space:nowrap">
                    <tr align="right">
                        <td>
                            <asp:Label ID="Estado_Nombre" 
                                runat="server" 
                                ForeColor="Blue"
                                Text='<%# Bind("Estado_Nombre") %>'>
                            </asp:Label>
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            <asp:Label ID="lblApu_Equipo_Nombre"
                                AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                AssociatedControlID="Apu_Equipo_Nombre"
                                runat="server"
                                Text='<%# GetLocalResourceObject("Apu_Equipo_NombreRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        
                        </td>
                        <td>
                            <asp:TextBox ID="Apu_Equipo_Nombre"
                                CssClass="TEXTO_COMBOPER_KCG"
                                Style="text-transform:uppercase"
                                TextMode ="MultiLine" 
                                Height ="50px"
                                Width="400px" 
                                runat="server" 
                                Text='<%# Bind("Apu_Equipo_Nombre") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Equipo_NombreRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            
                            <asp:RequiredFieldValidator 
                            ID="rfvApu_Equipo_Nombre" 
                            runat="server"                                                
                            ValidationGroup="I"
                            ControlToValidate="Apu_Equipo_Nombre" 
                            ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                            Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                            
                            <AjaxControlToolkit:ValidatorCalloutExtender 
                            runat="Server" 
                            ID="vceApu_Equipo_Nombre"
                            TargetControlID="rfvApu_Equipo_Nombre"/>
                            
                            <AjaxControlToolkit:AutoCompleteExtender
                            runat="server" 
                            BehaviorID="AutoCompleteEx"
                            ID="autoComplete1" 
                            TargetControlID="Apu_Equipo_Nombre"
                            ServicePath="~/APU/APU_OFERTA_RUBRO_EQUIPO.aspx" 
                            ServiceMethod="GetEquipo"
                            MinimumPrefixLength="0" 
                            CompletionInterval="500"
                            EnableCaching="true"
                            CompletionSetCount="500"
                            CompletionListCssClass="autocomplete_completionListElement" 
                            CompletionListItemCssClass="autocomplete_listItem" 
                            CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
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
                        <input type="submit" style="display:none;" />
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            <asp:Label ID="lblCosto"
                                runat="server"
                                Text='<%# GetLocalResourceObject("CostoRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Costo"
                                CssClass="TEXTO_EDICION_KCG"
                                Style="text-align:right" 
                                runat="server" 
                                Text='<%# Bind("Costo","{0:N2}") %>'
                                ToolTip='<%# GetLocalResourceObject("CostoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:Label ID="lblMoneda" 
                                runat="server" 
                                Text='<%# Eval("int_moneda_simbolo") %>'>
                            </asp:Label>
                            
                            <AjaxControlToolkit:MaskedEditExtender 
                                ID="meeCosto" 
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
                                ErrorTooltipEnabled="False"
                                ClearMaskOnLostFocus="True"
                                />

                            <AjaxControlToolkit:MaskedEditValidator ID="MaskedEditValidator2"  
                                runat="server"
                                ControlExtender="meeCosto"
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
                                ID="ValidatorCalloutExtender1"
                                TargetControlID="MaskedEditValidator2"/> 
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
            
            <%--IDs--%>

            <asp:TextBox ID="Apu_Oferta_Rubro_Id" 
                Style="display:none"
                runat="server" 
                Text='<%# Bind("Apu_Oferta_Rubro_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Equipo_Id" 
                Style="display:none" 
                runat="server" 
                Text='<%# Bind("Apu_Equipo_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Update_Per_Personal_Id"  
                Style="display:none"
                runat="server" 
                Text='<%# Bind("Update_Per_Personal_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Oferta_Id"  
                Style="display:none"
                runat="server" 
                Text='<%# Bind("Apu_Oferta_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Creacion_Per_Personal_Id"  
                Style="display:none"
                runat="server" 
                Text='<%# Bind("Creacion_Per_Personal_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Rubro_Id"  
                Style="display:none"
                runat="server" 
                Text='<%# Bind("Apu_Rubro_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Id"  
                Style="display:none"
                runat="server" 
                Text='<%# Bind("Id") %>'>
            </asp:TextBox>
            
            <%--Ocultos--%>

            <asp:TextBox ID="Fecha_Creacion"
                Visible="False" 
                runat="server" 
                Text='<%# Bind("Fecha_Creacion") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Fecha_Update" 
                Visible="False"
                runat="server" 
                Text='<%# Bind("Fecha_Update") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Oferta_Rubro_Codigo" 
                Visible="False"
                runat="server" 
                Text='<%# Bind("Apu_Oferta_Rubro_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Oferta_Etapa" 
                Visible="False"
                runat="server" 
                Text='<%# Bind("Apu_Oferta_Etapa") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Equipo_Codigo" 
                Visible="False"
                runat="server" 
                Text='<%# Bind("Apu_Equipo_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Creacion_Per_Personal_Codigo" 
                Visible="False"
                runat="server" 
                Text='<%# Bind("Creacion_Per_Personal_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Creacion_Per_Personal_Nombre" 
                Visible="False"
                runat="server" 
                Text='<%# Bind("Creacion_Per_Personal_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Update_Per_Personal_Codigo"
                Visible="False" 
                runat="server" 
                Text='<%# Bind("Update_Per_Personal_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Update_Per_Personal_Nombre" 
                Visible="False"
                runat="server" 
                Text='<%# Bind("Update_Per_Personal_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="int_moneda_simbolo" 
                Visible="False"
                runat="server" 
                Text='<%# Bind("int_moneda_simbolo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Codigo" 
                Visible="False"
                runat="server" 
                Text='<%# Bind("Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Nombre" 
                Visible="False"
                runat="server" 
                Text='<%# Bind("Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Estado" 
                Visible="False"
                runat="server" 
                Text='<%# Bind("Estado") %>'>
            </asp:TextBox>
        </InsertItemTemplate>
        <ItemTemplate>
            <asp:Panel ID="Rec_Oferta_Rubro_Equipo_Oferta" 
                runat="server"
                meta:resourcekey="Rec_Oferta_Rubro_Equipo_OfertaRecursoKCG">
                <table style="white-space:nowrap">
                    <tr align="left">
                        <td>
                            <asp:Label ID="lblApu_Oferta_Nombre"
                                runat="server"
                                Text='<%# GetLocalResourceObject("Apu_Oferta_NombreRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td style="white-space:nowrap">
                            <asp:TextBox ID="Apu_Oferta_Codigo"
                                ReadOnly="true" 
                                TabIndex="-1"
                                runat="server" 
                                Text='<%# Bind("Apu_Oferta_Codigo") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Oferta_CodigoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr>  
                        <td>
                        </td>  
                        <td>
                            <asp:TextBox ID="Apu_Oferta_Nombre"
                                ReadOnly="true" 
                                TabIndex="-1"
                                Width="400px" 
                                Height="50px"
                                runat="server"
                                TextMode="MultiLine"
                                CssClass="TEXTO_LECTURA_KCG" 
                                Text='<%# Bind("Apu_Oferta_Nombre") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Oferta_NombreRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:Panel ID="Rec_Apu_Oferta_Rubro_Equipo_Rubro"
                runat="server"
                meta:resourcekey="Rec_Apu_Oferta_Rubro_Equipo_RubroRecursoKCG">
                <table style="white-space:nowrap">
                    <tr align="left">
                        <td>
                            <asp:Label ID="lblApu_Rubro_Nombre"
                                runat="server"
                                Text='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Apu_Rubro_Codigo"
                                ReadOnly="true" 
                                TabIndex="-1"
                                runat="server" 
                                Text='<%# Bind("Apu_Rubro_Codigo") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Rubro_CodigoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:TextBox ID="Apu_Rubro_Nombre"
                                ReadOnly="true" 
                                TabIndex="-1"
                                Width="400px" 
                                runat="server" 
                                Text='<%# Bind("Apu_Rubro_Nombre") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            <asp:Label ID="lblApu_Rubro_Unidad"
                                runat="server"
                                Text='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Apu_Rubro_Unidad"
                                ReadOnly="true"  
                                TabIndex="-1"
                                runat="server" 
                                Text='<%# Bind("Apu_Rubro_Unidad") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>    
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:Panel ID="Rec_Apu_Oferta_Rubro_Equipo"
                runat="server"
                meta:resourcekey="Rec_Apu_Oferta_Rubro_EquipoRecursoKCG">
                <table style="white-space:nowrap">
                    <tr align="right">
                        <td>
                            <asp:Label ID="Estado_Nombre" 
                                runat="server" 
                                ForeColor="Blue"
                                Text='<%# Bind("Estado_Nombre") %>'>
                            </asp:Label>
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            <asp:Label ID="lblApu_Equipo_Nombre"
                                runat="server"
                                Text='<%# GetLocalResourceObject("Apu_Equipo_NombreRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        
                        </td>
                        <td>
                            <asp:TextBox ID="Apu_Equipo_Nombre"
                                ReadOnly="true"
                                TabIndex="-1"
                                Style="text-transform:uppercase"
                                TextMode ="MultiLine" 
                                CssClass ="TEXTO_LECTURA_KCG"
                                Height ="50px"
                                Width="400px" 
                                runat="server" 
                                Text='<%# Bind("Apu_Equipo_Nombre") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Equipo_NombreRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            <asp:Label ID="lblCosto"
                                runat="server"
                                Text='<%# GetLocalResourceObject("CostoRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Costo"
                                ReadOnly="true"
                                TabIndex="-1"
                                Style="text-align:right" 
                                runat="server" 
                                Text='<%# Bind("Costo","{0:N2}") %>'
                                ToolTip='<%# GetLocalResourceObject("CostoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:Label ID="lblMoneda" 
                                runat="server" 
                                Text='<%# Eval("int_moneda_simbolo") %>'>
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
                                Enabled='<%# HER.PermisosMovimientos.Movimiento_Apu_Oferta_Rubro_Equipo(ApuOferta_Actual.Estado, ApuOferta_Actual.Apu_Presupuesto_Estado, HER.PermisosMovimientos.ModoOperacion.Editar ) %>'
                                AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_EditarRecursoKCG.AccesKey").ToString() %>'  
                                Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_EditRecursoKCG.Text").ToString() %>'
                                ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_EditRecursoKCG.ToolTip").ToString() %>'>
                           </asp:Button>
                           <asp:Button 
                                ID="DeleteButton" 
                                runat="server" 
                                CausesValidation="False" 
                                CommandName="Delete"
                                Enabled='<%# HER.PermisosMovimientos.Movimiento_Apu_Oferta_Rubro_Equipo(ApuOferta_Actual.Estado, ApuOferta_Actual.Apu_Presupuesto_Estado, HER.PermisosMovimientos.ModoOperacion.Eliminar ) %>'
                                AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_EliminarRecursoKCG.AccesKey").ToString() %>'  
                                Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_DeleteRecursoKCG.Text").ToString() %>'
                                ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_DeleteRecursoKCG.ToolTip").ToString() %>'>
                           </asp:Button>
                           <asp:Button 
                                ID="NewButton" 
                                runat="server" 
                                CausesValidation="False" 
                                CommandName="New"
                                Enabled='<%# HER.PermisosMovimientos.Movimiento_Apu_Oferta_Rubro_Equipo(ApuOferta_Actual.Estado, ApuOferta_Actual.Apu_Presupuesto_Estado, HER.PermisosMovimientos.ModoOperacion.Nuevo ) %>'
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
            </asp:Panel>
            
            <%--IDs--%>

            <asp:TextBox ID="Apu_Oferta_Rubro_Id" 
                Style="display:none"
                runat="server" 
                Text='<%# Bind("Apu_Oferta_Rubro_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Equipo_Id" 
                Style="display:none" 
                runat="server" 
                Text='<%# Bind("Apu_Equipo_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Update_Per_Personal_Id"  
                Style="display:none"
                runat="server" 
                Text='<%# Bind("Update_Per_Personal_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Oferta_Id"  
                Style="display:none"
                runat="server" 
                Text='<%# Bind("Apu_Oferta_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Creacion_Per_Personal_Id"  
                Style="display:none"
                runat="server" 
                Text='<%# Bind("Creacion_Per_Personal_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Rubro_Id"  
                Style="display:none"
                runat="server" 
                Text='<%# Bind("Apu_Rubro_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Id"  
                Style="display:none"
                runat="server" 
                Text='<%# Bind("Id") %>'>
            </asp:TextBox>
            
            <%--Ocultos--%>

            <asp:TextBox ID="Fecha_Creacion"
                Visible="False" 
                runat="server" 
                Text='<%# Bind("Fecha_Creacion") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Fecha_Update" 
                Visible="False"
                runat="server" 
                Text='<%# Bind("Fecha_Update") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Oferta_Rubro_Codigo" 
                Visible="False"
                runat="server" 
                Text='<%# Bind("Apu_Oferta_Rubro_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Oferta_Etapa" 
                Visible="False"
                runat="server" 
                Text='<%# Bind("Apu_Oferta_Etapa") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Equipo_Codigo" 
                Visible="False"
                runat="server" 
                Text='<%# Bind("Apu_Equipo_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Creacion_Per_Personal_Codigo" 
                Visible="False"
                runat="server" 
                Text='<%# Bind("Creacion_Per_Personal_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Creacion_Per_Personal_Nombre" 
                Visible="False"
                runat="server" 
                Text='<%# Bind("Creacion_Per_Personal_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Update_Per_Personal_Codigo"
                Visible="False" 
                runat="server" 
                Text='<%# Bind("Update_Per_Personal_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Update_Per_Personal_Nombre" 
                Visible="False"
                runat="server" 
                Text='<%# Bind("Update_Per_Personal_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="int_moneda_simbolo" 
                Visible="False"
                runat="server" 
                Text='<%# Bind("int_moneda_simbolo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Codigo" 
                Visible="False"
                runat="server" 
                Text='<%# Bind("Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Nombre" 
                Visible="False"
                runat="server" 
                Text='<%# Bind("Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Estado" 
                Visible="False"
                runat="server" 
                Text='<%# Bind("Estado") %>'>
            </asp:TextBox>
            
        </ItemTemplate>
    </asp:FormView>
    <koala:KNavegacion 
        ID="nav"
        runat="server"                         
        GridViewID="gvApuOfertaRubroEquipo"
        FormViewID="FormViewEquipos" 
        OnNavegar="nav_Siguiente" />

    </ContentTemplate>
        <Triggers> 
            <asp:AsyncPostBackTrigger ControlID="gvApuOfertaRubroEquipo" 
                EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
    
    <asp:ObjectDataSource ID="odsFvApuOfertaRubroEquipo" 
        runat="server" 
        DeleteMethod="Delete"
        InsertMethod="Insert" 
        OldValuesParameterFormatString="original{0}"
        ConflictDetection="CompareAllValues" 
        SelectMethod="GetById"
        TypeName="FEL.APU.BO_Apu_Oferta_Rubro_Equipo" 
        UpdateMethod="Update" 
        SortParameterName="sortExpression">
        <SelectParameters>
            <asp:SessionParameter Name="s" 
                SessionField="Scope" Type="Object" />
            <asp:Parameter Name="Id" Type="String" />
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
    
    
    
    <asp:UpdatePanel ID="uppGv"
        runat="server">
        <ContentTemplate>
        
        <koala:KFiltro 
            ID="kftFiltro" 
            runat="server" 
            Contenedor="APU_OFERTA_RUBRO_EQUIPO" 
            Objeto="APU_OFERTA_RUBRO_EQUIPO" 
            IndiceScope ="Scope"
            Orden="1" 
            ObjectDataSourceID="odsGvApuOfertaRubroEquipo"/>
         <asp:Button ID="Btn_Apu_Oferta_Rubro_Equipo_Oferta_Rubro"
            runat="server"
            meta:resourcekey="Btn_Apu_Oferta_Rubro_Equipo_Oferta_RubroRecursoKCG" />
       
    
    <asp:Panel ID="Rec_Listado_Apu_Oferta_Rubro_EquipoRecursoKCG"
        runat="server"
        meta:resourcekey="Rec_Listado_Apu_Oferta_Rubro_EquipoRecursoKCG" 
        >
        
    <koala:KGrid ID="gvApuOfertaRubroEquipo" 
        runat="server"
        DataKeyNames="Id" 
        AllowPaging="True"
        AllowSorting="True" 
        AutoGenerateColumns="False" 
        DataSourceID="odsGvApuOfertaRubroEquipo"
        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>'>
        <AlternatingRowStyle CssClass="alternatingrowstyle" />
        <HeaderStyle CssClass="headerstyle" />
        <PagerStyle CssClass="pagerstyle" />
        <SelectedRowStyle CssClass="selectedrowstyle" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" 
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
                <itemstyle wrap="False" width="80mm" />
            </asp:BoundField>
            <asp:BoundField DataField="Costo" 
                meta:resourcekey="BoundCostoRecursoKCG" 
                SortExpression="Costo" 
                dataformatstring="{0:N2}">
                <itemstyle horizontalalign="Right" />
                <headerstyle horizontalalign="Right" wrap="False"/>
            </asp:BoundField>
            
            <asp:BoundField DataField="Nombre"
                SortExpression="Nombre" 
                visible="False"/>
            
        </Columns>
    </koala:KGrid>
    </asp:Panel>
        </ContentTemplate>    
    </asp:UpdatePanel>
    
    <asp:ObjectDataSource ID="odsGvApuOfertaRubroEquipo" 
        runat="server" 
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetByOfertaRubro" 
        TypeName="FEL.APU.BO_Apu_Oferta_Rubro_Equipo">
        <SelectParameters>
            <asp:SessionParameter Name="s" 
                SessionField="Scope" Type="Object" />
            <asp:QueryStringParameter Name="Apu_Oferta_Rubro_Id" 
                QueryStringField="Apu_Oferta_Rubro_Id"
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

