<%@ Page 
Language="C#" 
MasterPageFile="~/KOALA.master" 
AutoEventWireup="true" 
CodeFile="APU_OFERTA_RUBRO_MANO_OBRA.aspx.cs" 
Inherits="APU_APU_OFERTA_RUBRO_MANO_OBRA" 
Theme="EstiloKCG"
StylesheetTheme="EstiloKCG" 
Meta:resourcekey="Tit_Apu_Oferta_Rubro_Mano_ObraRecursoKCG" %>
    
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
    <script type="text/javascript">
        // Work around browser behavior of "auto-submitting" simple forms
        Sys.Application.add_load(page_load);
        Sys.Application.add_unload(page_unload);
        
        
        function page_load(sender, e){                                    
        }
        
        function page_unload(sender, e){                                    
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
            
            var Apu_Mano_Obra_Id = $get("ctl00_ContentPlaceHolder1_fvapu_oferta_rubro_mano_obra_Apu_Mano_Obra_Id");
            Apu_Mano_Obra_Id.value = temp[0];
        }
    </script>
    <asp:UpdatePanel 
        ID="UpdatePanel1" 
        runat="server"
        UpdateMode="Conditional">
        <ContentTemplate>
            <asp:FormView 
                ID="fvapu_oferta_rubro_mano_obra" 
                runat="server" 
                DataSourceID="odsapu_oferta_rubro_mano_obra"
                DefaultMode="Insert">
                <EditItemTemplate>
                    <asp:Panel
                        id="PanelOfertaE"
                        runat="server" 
                        meta:resourcekey="Rec_Oferta_Rubro_Mano_Obra_OfertaRecursoKCG">
                        <table >
                            <tr align="left">
                                <td>
                                    <asp:Label  
                                        id="lbloferta"
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Apu_Oferta_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>    
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Oferta_Codigo" 
                                        runat="server" 
                                        TabIndex="-1"
                                        ReadOnly="true"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Oferta_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Oferta_Codigo") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Oferta_Nombre" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        width="400px"
                                        Height="50px"
                                        TextMode="MultiLine"
                                        CssClass="TEXTO_LECTURA_KCG" 
                                        ToolTip='<%# GetLocalResourceObject("Apu_Oferta_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Oferta_Nombre") %>'>
                                    </asp:TextBox>    
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <asp:Panel 
                        id="PanelRubroE"
                        runat="server" 
                        meta:resourcekey="Rec_Apu_Oferta_Rubro_Mano_Obra_RubroRecursoKCG">
                        <table  style="white-space:nowrap">
                            <tr>
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
                                        ReadOnly="true"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Rubro_Codigo") %>'>
                                    </asp:TextBox>            
                                    <asp:TextBox 
                                        ID="Apu_Rubro_Nombre" 
                                        runat="server" 
                                        TabIndex="-1"
                                        width="400px"
                                        ReadOnly="true"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Rubro_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
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
                                        ReadOnly="true" 
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Rubro_Unidad") %>'>
                                    </asp:TextBox>    
                                </td>
                            </tr>
                        </table>                
                    </asp:Panel>
                    <asp:Panel 
                        id="PanelManoObraE"
                        runat="server" 
                        meta:resourcekey="Rec_Apu_Oferta_Rubro_Mano_ObraRecursoKCG">
                        <table style="white-space:nowrap">
                            <tr align="right">
                                <td colspan="2">
                                    <asp:Label
                                        id="lblestado"
                                        runat="server"
                                        Text='<%# Bind("Estado_Nombre") %>'>                            
                                    </asp:Label>    
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label  
                                        id="lblmanoobra"
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Apu_Mano_Obra_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>    
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Mano_Obra_Nombre" 
                                        runat="server" 
                                        CssClass="TEXTO_COMBOPER_KCG"
                                        TextMode ="MultiLine" 
                                        Height ="50px"                                
                                        width="400px"
                                        Style="text-transform:uppercase"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Mano_Obra_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Mano_Obra_Nombre") %>'>
                                    </asp:TextBox>   
                                    <asp:RequiredFieldValidator 
                                        runat="server" 
                                        ID="rfvApu_Mano_Obra_Nombre"
                                        ControlToValidate="Apu_Mano_Obra_Nombre"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="vceApu_Mano_obra_Nombre"
                                        TargetControlID="rfvApu_Mano_Obra_Nombre" />
                                    <AjaxControlToolkit:AutoCompleteExtender
                                        runat="server" 
                                        BehaviorID="AutoCompleteEx"
                                        ID="autoComplete1" 
                                        TargetControlID="Apu_Mano_Obra_Nombre"
                                        ServicePath="~/APU/APU_OFERTA_RUBRO_MANO_OBRA.aspx" 
                                        ServiceMethod="GetManoDeObra"
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
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label  
                                        id="lblcostototal"
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("CostoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>   
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Costo" 
                                        runat="server"
                                        CssClass="TEXTO_EDICION_KCG" 
                                        style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("CostoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Costo","{0:N2}") %>'>
                                    </asp:TextBox>
                                    <asp:Label 
                                        id="lblmoneda"
                                        runat="server"
                                        Text='<%# Bind("int_moneda_simbolo") %>'>
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
                                    ErrorTooltipEnabled="false"
                                    ClearMaskOnLostFocus="True"/>                                       
                                  
                                    <AjaxControlToolkit:MaskedEditValidator ID="MaskedEditValidator2" runat="server"
                                    ControlExtender="meeCosto"
                                    ControlToValidate="Costo"
                                    IsValidEmpty="False"
                                    EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                    InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                    MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                    MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                    MinimumValue="0.00"
                                    MaximumValue="9999999999999.99" 
                                    Display="Dynamic"
                                    EmptyValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>'
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
                                    <uc2:wucMensajeActualizar ID="WucMensajeActualizar1" runat="server" />
                                </td>
                            </tr>                       
                        </table>
                    </asp:Panel>
                
                    <%--Id's--%>
                    <asp:TextBox 
                        ID="Creacion_Per_Personal_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Creacion_Per_Personal_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox  
                        ID="Update_Per_Personal_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Update_Per_Personal_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Oferta_Rubro_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Apu_Oferta_Rubro_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Mano_Obra_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Apu_Mano_Obra_Id") %>'>
                    </asp:TextBox>            
                    <asp:TextBox 
                        ID="Apu_Oferta_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Apu_Oferta_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Rubro_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Apu_Rubro_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Id" 
                        runat="server" 
                        style="display:none"
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
                    </asp:TextBox >
                    <asp:TextBox 
                        ID="Apu_Oferta_Rubro_Codigo" 
                        runat="server" 
                        Visible="false" 
                        Text='<%# Bind("Apu_Oferta_Rubro_Codigo") %>'>
                    </asp:TextBox>      
                    <asp:TextBox 
                        ID="Apu_Oferta_Etapa" 
                        runat="server" 
                        Visible="false" 
                        Text='<%# Bind("Apu_Oferta_Etapa") %>'>
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
                        id="PanelOfertaI"
                        runat="server" 
                        meta:resourcekey="Rec_Oferta_Rubro_Mano_Obra_OfertaRecursoKCG">
                        <table style="white-space:nowrap">
                            <tr align="left">
                                <td>
                                    <asp:Label  
                                        id="lbloferta"
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Apu_Oferta_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>    
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Oferta_Codigo" 
                                        runat="server" 
                                        TabIndex="-1"
                                        ReadOnly="true"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Oferta_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Oferta_Codigo") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Oferta_Nombre" 
                                        runat="server"
                                        TabIndex="-1" 
                                        width="400px"
                                        ReadOnly="true"
                                        Height="50px"
                                        TextMode="MultiLine"
                                        CssClass="TEXTO_LECTURA_KCG" 
                                        ToolTip='<%# GetLocalResourceObject("Apu_Oferta_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Oferta_Nombre") %>'>
                                    </asp:TextBox>    
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <asp:Panel 
                        id="PanelRubroI"
                        runat="server" 
                        meta:resourcekey="Rec_Apu_Oferta_Rubro_Mano_Obra_RubroRecursoKCG">
                        <table style="white-space:nowrap">
                            <tr>
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
                                        ReadOnly="true"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Rubro_Codigo") %>'>
                                    </asp:TextBox>            
                                    <asp:TextBox 
                                        ID="Apu_Rubro_Nombre" 
                                        runat="server" 
                                        TabIndex="-1"
                                        width="400px"
                                        ReadOnly="true"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Rubro_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
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
                                        ReadOnly="true" 
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Rubro_Unidad") %>'>
                                    </asp:TextBox>    
                                </td>
                            </tr>
                        </table>                
                    </asp:Panel>
                    <asp:Panel 
                        id="PanelManoObraI"
                        runat="server" 
                        meta:resourcekey="Rec_Apu_Oferta_Rubro_Mano_ObraRecursoKCG">
                        <table style="white-space:nowrap">
                            <tr align="right">
                                <td colspan="2">
                                    <asp:Label
                                        id="lblestado"
                                        runat="server"
                                        Text='<%# Bind("Estado_Nombre") %>'>                            
                                    </asp:Label>    
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label  
                                        id="lblmanoobra"
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Apu_Mano_Obra_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>    
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Mano_Obra_Nombre" 
                                        runat="server" 
                                        CssClass="TEXTO_COMBOPER_KCG"
                                        TextMode ="MultiLine" 
                                        Height ="50px"                                
                                        width="400px"
                                        Style="text-transform:uppercase"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Mano_Obra_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Mano_Obra_Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        runat="server" 
                                        ID="rfvApu_Mano_Obra_Nombre"
                                        ControlToValidate="Apu_Mano_Obra_Nombre"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="vceApu_Mano_obra_Nombre"
                                        TargetControlID="rfvApu_Mano_Obra_Nombre" />
                                    <AjaxControlToolkit:AutoCompleteExtender
                                        runat="server" 
                                        BehaviorID="AutoCompleteEx"
                                        ID="autoComplete1" 
                                        TargetControlID="Apu_Mano_Obra_Nombre"
                                        ServicePath="~/APU/APU_OFERTA_RUBRO_MANO_OBRA.aspx" 
                                        ServiceMethod="GetManoDeObra"
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
                                </td>
                            </tr>

                                <%-- Prevent enter in textbox from causing the collapsible panel from operating --%>
                                <input type="submit" style="display:none;" value="Submit Query" />
                            <tr>
                                <td>
                                    <asp:Label  
                                        id="lblcostototal"
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("CostoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>   
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Costo" 
                                        runat="server"
                                        CssClass="TEXTO_EDICION_KCG" 
                                        style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("CostoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Costo","{0:N2}") %>'>
                                    </asp:TextBox>
                                    <asp:Label 
                                        id="lblmoneda"
                                        runat="server"
                                        Text='<%# Bind("int_moneda_simbolo") %>'>
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
                                    ErrorTooltipEnabled="false"
                                    ClearMaskOnLostFocus="True"/>                                       
                                  
                                    <AjaxControlToolkit:MaskedEditValidator ID="MaskedEditValidator2" runat="server"
                                    ControlExtender="meeCosto"
                                    ControlToValidate="Costo"
                                    IsValidEmpty="False"
                                    EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                    InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                    MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                    MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                    MinimumValue="0.00"
                                    MaximumValue="9999999999999.99" 
                                    Display="Dynamic"
                                    EmptyValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>'
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
                        ID="Creacion_Per_Personal_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Creacion_Per_Personal_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox  
                        ID="Update_Per_Personal_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Update_Per_Personal_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Oferta_Rubro_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Apu_Oferta_Rubro_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Mano_Obra_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Apu_Mano_Obra_Id") %>'>
                    </asp:TextBox>            
                    <asp:TextBox 
                        ID="Apu_Oferta_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Apu_Oferta_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Rubro_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Apu_Rubro_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Id" 
                        runat="server" 
                        style="display:none"
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
                    </asp:TextBox >
                    <asp:TextBox 
                        ID="Apu_Oferta_Rubro_Codigo" 
                        runat="server" 
                        Visible="false" 
                        Text='<%# Bind("Apu_Oferta_Rubro_Codigo") %>'>
                    </asp:TextBox>      
                    <asp:TextBox 
                        ID="Apu_Oferta_Etapa" 
                        runat="server" 
                        Visible="false" 
                        Text='<%# Bind("Apu_Oferta_Etapa") %>'>
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
                        id="PanelOferta"
                        runat="server" 
                        meta:resourcekey="Rec_Oferta_Rubro_Mano_Obra_OfertaRecursoKCG">
                        <table style="white-space:nowrap">
                            <tr align="left">
                                <td >
                                    <asp:Label  
                                        id="lbloferta"
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Apu_Oferta_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>    
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Oferta_Codigo" 
                                        runat="server" 
                                        TabIndex="-1"
                                        ReadOnly="true"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Oferta_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Oferta_Codigo") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Oferta_Nombre" 
                                        runat="server" 
                                        TabIndex="-1"
                                        ReadOnly="true"
                                        width="400px"
                                        Height="50px"
                                        TextMode="MultiLine"
                                        CssClass="TEXTO_LECTURA_KCG" 
                                        ToolTip='<%# GetLocalResourceObject("Apu_Oferta_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Oferta_Nombre") %>'>
                                    </asp:TextBox>    
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <asp:Panel 
                        id="PanelRubro"
                        runat="server" 
                        meta:resourcekey="Rec_Apu_Oferta_Rubro_Mano_Obra_RubroRecursoKCG">
                        <table style="white-space:nowrap">
                            <tr>
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
                                        ReadOnly="true"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Rubro_Codigo") %>'>
                                    </asp:TextBox>            
                                    <asp:TextBox 
                                        ID="Apu_Rubro_Nombre" 
                                        runat="server" 
                                        TabIndex="-1"
                                        width="400px"
                                        ReadOnly="true"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Rubro_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
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
                                        ReadOnly="true" 
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Rubro_Unidad") %>'>
                                    </asp:TextBox>    
                                </td>
                            </tr>
                        </table>                
                    </asp:Panel>
                    <asp:Panel 
                        id="PanelManoObra"
                        runat="server" 
                        meta:resourcekey="Rec_Apu_Oferta_Rubro_Mano_ObraRecursoKCG">
                        <table style="white-space:nowrap">
                            <tr align="right">
                                <td colspan="2">
                                    <asp:Label
                                        id="lblestado"
                                        runat="server"
                                        Text='<%# Bind("Estado_Nombre") %>'>                            
                                    </asp:Label>    
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label  
                                        id="lblmanoobra"
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Apu_Mano_Obra_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>    
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Mano_Obra_Nombre" 
                                        runat="server"   
                                        TabIndex="-1"  
                                        CssClass ="TEXTO_LECTURA_KCG"
                                        TextMode ="MultiLine" 
                                        Height ="50px"                                
                                        width="400px"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Mano_Obra_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Mano_Obra_Nombre") %>'>
                                    </asp:TextBox>    
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label  
                                        id="lblcostototal"
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("CostoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>   
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Costo" 
                                        runat="server"   
                                        TabIndex="-1"                                 
                                        style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("CostoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Costo","{0:N2}") %>'>
                                    </asp:TextBox>
                                    <asp:Label 
                                        id="lblmoneda"
                                        runat="server"
                                        Text='<%# Bind("int_moneda_simbolo") %>'>
                                    </asp:Label>                            
                                </td>
                            </tr>
                            <tr align="left">
                                <td colspan="3" >
                                    <asp:Button 
                                            ID="EditButton" 
                                            runat="server"
                                            CausesValidation="False" 
                                            CommandName="Edit"
                                            Enabled='<%# HER.PermisosMovimientos.Movimiento_Apu_Oferta_Rubro_Mano_Obra(ApuOferta_Actual.Estado, ApuOferta_Actual.Apu_Presupuesto_Estado, HER.PermisosMovimientos.ModoOperacion.Editar ) %>'
                                            AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_EditarRecursoKCG.AccesKey").ToString() %>'  
                                            Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_EditRecursoKCG.Text").ToString() %>'
                                            ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_EditRecursoKCG.ToolTip").ToString() %>'>
                                       </asp:Button>
                                       <asp:Button 
                                            ID="DeleteButton" 
                                            runat="server" 
                                            CausesValidation="False" 
                                            CommandName="Delete"
                                            Enabled='<%# HER.PermisosMovimientos.Movimiento_Apu_Oferta_Rubro_Mano_Obra(ApuOferta_Actual.Estado, ApuOferta_Actual.Apu_Presupuesto_Estado, HER.PermisosMovimientos.ModoOperacion.Eliminar ) %>'
                                            AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_EliminarRecursoKCG.AccesKey").ToString() %>'  
                                            Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_DeleteRecursoKCG.Text").ToString() %>'
                                            ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_DeleteRecursoKCG.ToolTip").ToString() %>'>
                                       </asp:Button>
                                       <asp:Button 
                                            ID="NewButton" 
                                            runat="server" 
                                            CausesValidation="False" 
                                            CommandName="New"
                                            Enabled='<%# HER.PermisosMovimientos.Movimiento_Apu_Oferta_Rubro_Mano_Obra(ApuOferta_Actual.Estado, ApuOferta_Actual.Apu_Presupuesto_Estado, HER.PermisosMovimientos.ModoOperacion.Nuevo ) %>'
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
                        ID="Creacion_Per_Personal_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Creacion_Per_Personal_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox  
                        ID="Update_Per_Personal_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Update_Per_Personal_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Oferta_Rubro_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Apu_Oferta_Rubro_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Mano_Obra_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Apu_Mano_Obra_Id") %>'>
                    </asp:TextBox>            
                    <asp:TextBox 
                        ID="Apu_Oferta_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Apu_Oferta_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Rubro_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Apu_Rubro_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Id" 
                        runat="server" 
                        style="display:none"
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
                    </asp:TextBox >
                    <asp:TextBox 
                        ID="Apu_Oferta_Rubro_Codigo" 
                        runat="server" 
                        Visible="false" 
                        Text='<%# Bind("Apu_Oferta_Rubro_Codigo") %>'>
                    </asp:TextBox>      
                    <asp:TextBox 
                        ID="Apu_Oferta_Etapa" 
                        runat="server" 
                        Visible="false" 
                        Text='<%# Bind("Apu_Oferta_Etapa") %>'>
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
                    GridViewID="gvapu_oferta_rubro_mano_obra"
                    FormViewID="FormView1" OnNavegar="nav_Siguiente" />          
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger 
                ControlID="gvapu_oferta_rubro_mano_obra" 
                EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:ObjectDataSource 
    ID="odsapu_oferta_rubro_mano_obra" 
    runat="server" 
    ConflictDetection="CompareAllValues"
    DeleteMethod="Delete" 
    InsertMethod="Insert" 
    OldValuesParameterFormatString="original{0}"
    SelectMethod="GetById" 
    SortParameterName="sortExpression" 
    TypeName="FEL.APU.BO_Apu_Oferta_Rubro_Mano_Obra"
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
                        <koala:KFiltro 
                            ID="kftFiltro" 
                            runat="server" 
                            Contenedor="APU_OFERTA_RUBRO_MANO_OBRA" 
                            Objeto="APU_OFERTA_RUBRO_MANO_OBRA" 
                            IndiceScope ="Scope"
                            Orden="1"
                            ObjectDataSourceID="odsgvapu_oferta_rubro_mano_obra" />
                    </td>
                    <td>
                        <asp:Button 
                            ID="BtnOferta" 
                            runat="server"                             
                            OnClick="BtnOferta_Click"/>
                    </td>
                </tr>
            </table>        
            <asp:Panel 
                runat="server"
                id="pnlDatosGrid"
                meta:resourcekey="Rec_Listado_Apu_Oferta_Rubro_Mano_ObraRecursoKCG">                 
                <koala:KGrid  
                    ID="gvapu_oferta_rubro_mano_obra" 
                    runat="server" 
                    AllowPaging="True" 
                    AllowSorting="True"
                    AutoGenerateColumns="False"
                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>'                
                    DataKeyNames="Id" 
                    DataSourceID="odsgvapu_oferta_rubro_mano_obra">
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
                            <itemstyle wrap="False" width ="80mm"/>
                        </asp:BoundField>                          
                        <asp:BoundField 
                            DataField="Costo" 
                            meta:resourcekey="BoundCostoRecursoKCG" 
                            SortExpression="Costo" 
                            dataformatstring="{0:N2}">   
                            <itemstyle horizontalalign="Right" />
                        </asp:BoundField>                     
                        <asp:BoundField DataField="Fecha_Creacion" HeaderText="Fecha_Creacion" SortExpression="Fecha_Creacion"
                            Visible="False" />
                        <asp:BoundField DataField="Creacion_Per_Personal_Id" HeaderText="Creacion_Per_Personal_Id"
                            SortExpression="Creacion_Per_Personal_Id" Visible="False" />
                        <asp:BoundField DataField="Fecha_Update" HeaderText="Fecha_Update" SortExpression="Fecha_Update"
                            Visible="False" />
                        <asp:BoundField DataField="Update_Per_Personal_Id" HeaderText="Update_Per_Personal_Id"
                            SortExpression="Update_Per_Personal_Id" Visible="False" />
                        <asp:BoundField DataField="Apu_Oferta_Rubro_Id" HeaderText="Apu_Oferta_Rubro_Id"
                            SortExpression="Apu_Oferta_Rubro_Id" Visible="False" />
                        <asp:BoundField DataField="Apu_Mano_Obra_Id" HeaderText="Apu_Mano_Obra_Id" SortExpression="Apu_Mano_Obra_Id"
                            Visible="False" />
                        <asp:BoundField DataField="Apu_Oferta_Rubro_Codigo" HeaderText="Apu_Oferta_Rubro_Codigo"
                            SortExpression="Apu_Oferta_Rubro_Codigo" Visible="False" />
                        <asp:BoundField DataField="Apu_Oferta_Id" HeaderText="Apu_Oferta_Id" SortExpression="Apu_Oferta_Id"
                            Visible="False" />
                        <asp:BoundField DataField="Apu_Oferta_Codigo" HeaderText="Apu_Oferta_Codigo" SortExpression="Apu_Oferta_Codigo"
                            Visible="False" />
                        <asp:BoundField DataField="Apu_Oferta_Nombre" HeaderText="Apu_Oferta_Nombre" SortExpression="Apu_Oferta_Nombre"
                            Visible="False" />
                        <asp:BoundField DataField="Apu_Oferta_Etapa" HeaderText="Apu_Oferta_Etapa" SortExpression="Apu_Oferta_Etapa"
                            Visible="False" />
                        <asp:BoundField DataField="Apu_Rubro_Id" HeaderText="Apu_Rubro_Id" SortExpression="Apu_Rubro_Id"
                            Visible="False" />
                        <asp:BoundField DataField="Apu_Rubro_Codigo" HeaderText="Apu_Rubro_Codigo" SortExpression="Apu_Rubro_Codigo"
                            Visible="False" />
                        <asp:BoundField DataField="Apu_Rubro_Nombre" HeaderText="Apu_Rubro_Nombre" SortExpression="Apu_Rubro_Nombre"
                            Visible="False" />
                        <asp:BoundField DataField="Apu_Rubro_Unidad" HeaderText="Apu_Rubro_Unidad" SortExpression="Apu_Rubro_Unidad"
                            Visible="False" />
                        <asp:BoundField DataField="Creacion_Per_Personal_Codigo" HeaderText="Creacion_Per_Personal_Codigo"
                            SortExpression="Creacion_Per_Personal_Codigo" Visible="False" />
                        <asp:BoundField DataField="Creacion_Per_Personal_Nombre" HeaderText="Creacion_Per_Personal_Nombre"
                            SortExpression="Creacion_Per_Personal_Nombre" Visible="False" />
                        <asp:BoundField DataField="Update_Per_Personal_Codigo" HeaderText="Update_Per_Personal_Codigo"
                            SortExpression="Update_Per_Personal_Codigo" Visible="False" />
                        <asp:BoundField DataField="Update_Per_Personal_Nombre" HeaderText="Update_Per_Personal_Nombre"
                            SortExpression="Update_Per_Personal_Nombre" Visible="False" />
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
        ID="odsgvapu_oferta_rubro_mano_obra" 
        runat="server" 
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetByOfertaRubro" 
        TypeName="FEL.APU.BO_Apu_Oferta_Rubro_Mano_Obra">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
            <asp:QueryStringParameter Name="Apu_Oferta_Rubro_Id" QueryStringField="Apu_Oferta_Rubro_Id"
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

