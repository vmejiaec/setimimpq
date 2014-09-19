<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="APU_OFERTA_RUBRO_MATERIAL.aspx.cs" 
    Inherits="APU_APU_OFERTA_RUBRO_MATERIAL" 
    Theme="EstiloKCG"
    StylesheetTheme="EstiloKCG"
    meta:resourcekey="Men_Apu_Oferta_Rubro_MaterialRecursoKCG" %>
    
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

<%@ Register 
        tagprefix="koala" 
        assembly="KoalaWebControls" 
        namespace="Koala.KoalaWebControls" %>
    
<asp:Content 
    ID="Content1" 
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
            
            var Apu_Material_Id = $get("ctl00_ContentPlaceHolder1_fvApuOfertaRubroMaterial_Apu_Material_Id");
            Apu_Material_Id.value = temp[0];                                           
        }
        </script>
    <asp:UpdatePanel 
        ID="UpdatePanel1" 
        runat="server" 
        UpdateMode="Conditional">
        <ContentTemplate>
            <asp:FormView 
                ID="fvApuOfertaRubroMaterial" 
                runat="server" 
                DataSourceID="odsfvApuOfertaRubroMaterial"
                DefaultMode="Insert">
                
                <EditItemTemplate>
                    <asp:Panel
                        runat="server"
                        ID="Rec_Apu_Oferta_Rubro_Material_Rubro"
                        meta:resourcekey="Rec_Oferta_Rubro_Material_OfertaRecursoKCG">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("Apu_Oferta_CodigoRecursoKCG.Text").ToString() %>'
                                        ID="lblOfertaCodigo"                                                                           
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Oferta_Codigo" 
                                        runat="server" 
                                        TabIndex="-1"
                                        ReadOnly="true"
                                        Tooltip='<%# GetLocalResourceObject("Apu_Oferta_CodigoRecursoKCG.ToolTip").ToString() %>'
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
                                        Width="400px"
                                        Height="50px"
                                        ReadOnly="true"
                                        TextMode="MultiLine"
                                        CssClass="TEXTO_LECTURA_KCG"
                                        Tooltip='<%# GetLocalResourceObject("Apu_Oferta_NombreRecursoKCG.ToolTip").ToString() %>'
                                        style="text-transform:uppercase"
                                        Text='<%# Bind("Apu_Oferta_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                        </table>             
                    </asp:Panel>
                    <asp:Panel
                        runat="server"
                        ID="Rec_Apu_Oferta_Rubro_Material"
                        meta:resourcekey="Rec_Apu_Oferta_Rubro_Material_RubroRecursoKCG">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("Apu_Rubro_CodigoRecursoKCG.Text").ToString() %>'
                                        ID="lblRubroCodigo"                                                                           
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td
                                    style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Apu_Rubro_Codigo" 
                                        TabIndex="-1"
                                        runat="server" 
                                        ReadOnly="true"
                                        Tooltip='<%# GetLocalResourceObject("Apu_Rubro_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Rubro_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Apu_Rubro_Nombre" 
                                        runat="server" 
                                        TabIndex="-1"
                                        ReadOnly="true"
                                        Tooltip='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Width="400px"
                                        Text='<%# Bind("Apu_Rubro_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.Text").ToString() %>'
                                        ID="lblUnidad"                                                                           
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Rubro_Unidad"   
                                        runat="server" 
                                        TabIndex="-1"
                                        ReadOnly="true"                                        
                                        Tooltip='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Rubro_Unidad") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>                            
                        </table>                    
                    </asp:Panel>
                    <asp:Panel
                        runat="server"
                        ID="Rec_Apu_Oferta_Rubro_MaterialRecursoKCG"
                        meta:resourcekey="Rec_Apu_Oferta_Rubro_MaterialRecursoKCG">
                        <table>
                            <tr>
                                <td
                                    colspan="2"
                                    align="right">
                                    <asp:Label 
                                        ID="Estado_Nombre" 
                                        runat="server" 
                                        ForeColor="Blue"
                                        Text='<%# Bind("Estado_Nombre") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("Apu_Material_NombreRecursoKCG.Text").ToString() %>'
                                        ID="lblMaterial"                                                                           
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Material_Nombre" 
                                        runat="server" 
                                        TextMode="MultiLine" 
                                        Height="50px"
                                        Width="400px"
                                        CssClass="TEXTO_COMBOPER_KCG"
                                        Style="text-transform:uppercase"
                                        Tooltip='<%# GetLocalResourceObject("Apu_Material_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Material_Nombre") %>'>
                                    </asp:TextBox>                                    
                                    <asp:RequiredFieldValidator 
                                        runat="server" 
                                        ID="rfvApu_Material_Nombre"
                                        ControlToValidate="Apu_Material_Nombre"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="vceApu_Material_Nombre"
                                        TargetControlID="rfvApu_Material_Nombre" />                            
                                    <AjaxControlToolkit:AutoCompleteExtender
                                        runat="server" 
                                        BehaviorID="AutoCompleteEx"
                                        ID="autoComplete1" 
                                        TargetControlID="Apu_Material_Nombre"
                                        ServicePath="~/APU/APU_PROYECTO_RUBRO_MATERIAL.aspx" 
                                        ServiceMethod="GetMaterial"
                                        MinimumPrefixLength="3" 
                                        CompletionInterval="500"
                                        EnableCaching="true"
                                        CompletionSetCount="500"
                                        CompletionListCssClass="autocomplete_completionListElement" 
                                        CompletionListItemCssClass="autocomplete_listItem" 
                                        CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                        DelimiterCharacters=";,:"
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
                                                    <Parallel 
                                                        Duration=".4">
                                                        <FadeIn />
                                                        <Length 
                                                            PropertyKey="height" 
                                                            StartValue="0" 
                                                            EndValueScript="$find('AutoCompleteEx')._height" />
                                                    </Parallel>
                                                </Sequence>
                                            </OnShow>
                                            <OnHide>
                                                <%-- Collapse down to 0px and fade out --%>
                                                <Parallel 
                                                    Duration=".4">
                                                    <FadeOut />
                                                    <Length 
                                                        PropertyKey="height" 
                                                        StartValueScript="$find('AutoCompleteEx')._height" 
                                                        EndValue="0" />
                                                </Parallel>
                                            </OnHide>
                                        </Animations>
                                    </AjaxControlToolkit:AutoCompleteExtender>
                                     <asp:Label 
                                        ID="lbl_Msj_3D" 
                                        runat="server" 
                                        ForeColor="Red"   
                                        Font-Bold="True" 
                                        Font-Size="X-Small"
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ37RecursoKCG.Text").ToString() %>'>
                                    </asp:Label>                            
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("CostoRecursoKCG.Text").ToString() %>'
                                        ID="lblCosto"                                                                           
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Costo" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG"
                                        Tooltip='<%# GetLocalResourceObject("CostoRecursoKCG.ToolTip").ToString() %>'
                                        style="text-align:right"
                                        Text='<%# Bind("Costo","{0:N2}") %>'>
                                    </asp:TextBox>
                                     <asp:Label 
                                        ID="int_moneda_simbolo" 
                                        runat="server" 
                                        Text='<%# Bind("int_moneda_simbolo") %>'>
                                    </asp:Label>
                                    <AjaxControlToolkit:MaskedEditExtender 
                                        ID="fCosto" 
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
                                        ID="MaskedEditValidator1" 
                                        runat="server"
                                        ControlExtender="fCosto"
                                        ControlToValidate="Costo"
                                        IsValidEmpty="False"
                                        EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                        InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                        MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                        MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                        MinimumValue="0.00"
                                        MaximumValue="9999999999999.99" 
                                        Display="Dynamic"
                                        EmptyValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>'
                                        InvalidValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>'
                                        MaximumValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>' 
                                        MinimumValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>'
                                        ValidationGroup="I" />                                        
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="ValidatorCalloutExtender1"
                                        TargetControlID="MaskedEditValidator1"/>
                                </td>
                            </tr>  
                            <tr>
                                <td 
                                    colspan="2">
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
                                    <uc1:wucMensajeActualizar 
                                        ID="WucMensajeActualizar1" 
                                        runat="server" />  
                                </td>
                            </tr>                                                      
                        </table>                    
                    </asp:Panel>
                    
                    <%--Ids--%>
                    
                    <asp:TextBox 
                        ID="Apu_Oferta_Rubro_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Apu_Oferta_Rubro_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Apu_Material_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Apu_Material_Id") %>'>
                    </asp:TextBox>
                    
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
                        ID="UpdateTransporte_Per_Personal_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("UpdateTransporte_Per_Personal_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Costo_Transporte" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Costo_Transporte") %>'>
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
                    
                    <%--Ocultos--%>                     
                                        
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
                        ID="Fecha_UpdateTransporte" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Fecha_UpdateTransporte") %>'>
                    </asp:TextBox>          
                    
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
                        ID="Apu_Material_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Apu_Material_Codigo") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Apu_Material_Unidad" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Apu_Material_Unidad") %>'>
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
                        ID="UpdateTransporte_Per_Personal_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("UpdateTransporte_Per_Personal_Codigo") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="UpdateTransporte_Per_Personal_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("UpdateTransporte_Per_Personal_Nombre") %>'>
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
                        runat="server"
                        ID="Rec_Apu_Oferta_Rubro_Material_Rubro"
                        meta:resourcekey="Rec_Oferta_Rubro_Material_OfertaRecursoKCG">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("Apu_Oferta_CodigoRecursoKCG.Text").ToString() %>'
                                        ID="lblOfertaCodigo"                                                                           
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Oferta_Codigo" 
                                        runat="server" 
                                        TabIndex="-1"
                                        ReadOnly="true"
                                        Tooltip='<%# GetLocalResourceObject("Apu_Oferta_CodigoRecursoKCG.ToolTip").ToString() %>'
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
                                        Width="400px"
                                        Height="50px"
                                        ReadOnly="true"
                                        TextMode="MultiLine"
                                        CssClass="TEXTO_LECTURA_KCG" 
                                        Tooltip='<%# GetLocalResourceObject("Apu_Oferta_NombreRecursoKCG.ToolTip").ToString() %>'
                                        style="text-transform:uppercase"
                                        Text='<%# Bind("Apu_Oferta_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                        </table>             
                    </asp:Panel>
                    <asp:Panel
                        runat="server"
                        ID="Rec_Apu_Oferta_Rubro_Material"
                        meta:resourcekey="Rec_Apu_Oferta_Rubro_Material_RubroRecursoKCG">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("Apu_Rubro_CodigoRecursoKCG.Text").ToString() %>'
                                        ID="lblRubroCodigo"                                                                           
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td
                                    style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Apu_Rubro_Codigo" 
                                        runat="server" 
                                        TabIndex="-1"
                                        ReadOnly="true"
                                        Tooltip='<%# GetLocalResourceObject("Apu_Rubro_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Rubro_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Apu_Rubro_Nombre" 
                                        runat="server" 
                                        TabIndex="-1"
                                        ReadOnly="true"
                                        Tooltip='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Width="400px"
                                        Text='<%# Bind("Apu_Rubro_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.Text").ToString() %>'
                                        ID="lblUnidad"                                                                           
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Rubro_Unidad"   
                                        runat="server" 
                                        TabIndex="-1"
                                        ReadOnly="true"
                                        Tooltip='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Rubro_Unidad") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>                            
                        </table>                    
                    </asp:Panel>
                    <asp:Panel
                        runat="server"
                        ID="Rec_Apu_Oferta_Rubro_MaterialRecursoKCG"
                        meta:resourcekey="Rec_Apu_Oferta_Rubro_MaterialRecursoKCG">
                        <table>
                            <tr>
                                <td
                                    colspan="2"
                                    align="right">
                                    <asp:Label 
                                        ID="Estado_Nombre" 
                                        runat="server" 
                                        ForeColor="Blue"
                                        Text='<%# Bind("Estado_Nombre") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("Apu_Material_NombreRecursoKCG.Text").ToString() %>'
                                        ID="lblMaterial"                                                                           
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Material_Nombre" 
                                        runat="server" 
                                        TextMode="MultiLine" 
                                        Height="50px"
                                        Width="400px" 
                                        CssClass="TEXTO_COMBOPER_KCG"
                                        Style="text-transform:uppercase"
                                        Tooltip='<%# GetLocalResourceObject("Apu_Material_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Material_Nombre") %>'>
                                    </asp:TextBox>                                    
                                    <asp:RequiredFieldValidator 
                                        runat="server" 
                                        ID="rfvApu_Material_Nombre"
                                        ControlToValidate="Apu_Material_Nombre"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="vceApu_Material_Nombre"
                                        TargetControlID="rfvApu_Material_Nombre" />                            
                                    <AjaxControlToolkit:AutoCompleteExtender
                                        runat="server" 
                                        BehaviorID="AutoCompleteEx"
                                        ID="autoComplete1" 
                                        TargetControlID="Apu_Material_Nombre"
                                        ServicePath="~/APU/APU_PROYECTO_RUBRO_MATERIAL.aspx" 
                                        ServiceMethod="GetMaterial"
                                        MinimumPrefixLength="3" 
                                        CompletionInterval="500"
                                        EnableCaching="true"
                                        CompletionSetCount="500"
                                        CompletionListCssClass="autocomplete_completionListElement" 
                                        CompletionListItemCssClass="autocomplete_listItem" 
                                        CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                        DelimiterCharacters=";,:"
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
                                                    <Parallel 
                                                        Duration=".4">
                                                        <FadeIn />
                                                        <Length 
                                                            PropertyKey="height" 
                                                            StartValue="0" 
                                                            EndValueScript="$find('AutoCompleteEx')._height" />
                                                    </Parallel>
                                                </Sequence>
                                            </OnShow>
                                            <OnHide>
                                                <%-- Collapse down to 0px and fade out --%>
                                                <Parallel 
                                                    Duration=".4">
                                                    <FadeOut />
                                                    <Length 
                                                        PropertyKey="height" 
                                                        StartValueScript="$find('AutoCompleteEx')._height" 
                                                        EndValue="0" />
                                                </Parallel>
                                            </OnHide>
                                        </Animations>
                                    </AjaxControlToolkit:AutoCompleteExtender>
                                    <asp:Label 
                                        ID="lbl_Msj_3D" 
                                        runat="server" 
                                        ForeColor="Red"   
                                        Font-Bold="True" 
                                        Font-Size="X-Small"
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ37RecursoKCG.Text").ToString() %>'>
                                    </asp:Label>        
                        

                                    <%-- Prevent enter in textbox from causing the collapsible panel from operating --%>
                                    <input 
                                        type="submit" 
                                        style="display:none;" value="Submit Query" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("CostoRecursoKCG.Text").ToString() %>'
                                        ID="lblCosto"                                                                           
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Costo" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG"
                                        Tooltip='<%# GetLocalResourceObject("CostoRecursoKCG.ToolTip").ToString() %>'
                                        style="text-align:right"
                                        Text='<%# Bind("Costo","{0:N2}") %>'>
                                    </asp:TextBox>
                                    <AjaxControlToolkit:MaskedEditExtender 
                                        ID="fCosto" 
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
                                        ID="MaskedEditValidator1" 
                                        runat="server"
                                        ControlExtender="fCosto"
                                        ControlToValidate="Costo"
                                        IsValidEmpty="False"
                                        EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                        InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                        MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                        MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                        MinimumValue="0.00"
                                        MaximumValue="9999999999999.99" 
                                        Display="Dynamic"
                                        EmptyValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>'
                                        InvalidValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>'
                                        MaximumValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>' 
                                        MinimumValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>'
                                        ValidationGroup="I" />                                        
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="ValidatorCalloutExtender1"
                                        TargetControlID="MaskedEditValidator1"/>
                                </td>
                            </tr>  
                            <tr>
                                <td 
                                    colspan="2">
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
                    
                    <%--Ids--%>
                    
                    <asp:TextBox 
                        ID="Apu_Oferta_Rubro_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Apu_Oferta_Rubro_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Apu_Material_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Apu_Material_Id") %>'>
                    </asp:TextBox>
                    
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
                        ID="UpdateTransporte_Per_Personal_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("UpdateTransporte_Per_Personal_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Costo_Transporte" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Costo_Transporte") %>'>
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
                    
                    <%--Ocultos--%>                     
                                        
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
                        ID="Fecha_UpdateTransporte" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Fecha_UpdateTransporte") %>'>
                    </asp:TextBox>          
                    
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
                        ID="Apu_Material_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Apu_Material_Codigo") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Apu_Material_Unidad" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Apu_Material_Unidad") %>'>
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
                        ID="UpdateTransporte_Per_Personal_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("UpdateTransporte_Per_Personal_Codigo") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="UpdateTransporte_Per_Personal_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("UpdateTransporte_Per_Personal_Nombre") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="int_moneda_simbolo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("int_moneda_simbolo") %>'>
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
                        runat="server"
                        ID="Rec_Apu_Oferta_Rubro_Material_Rubro"
                        meta:resourcekey="Rec_Oferta_Rubro_Material_OfertaRecursoKCG">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("Apu_Oferta_CodigoRecursoKCG.Text").ToString() %>'
                                        ID="lblOfertaCodigo"                                                                           
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Oferta_Codigo" 
                                        runat="server" 
                                        TabIndex="-1"
                                        ReadOnly="true"
                                        Tooltip='<%# GetLocalResourceObject("Apu_Oferta_CodigoRecursoKCG.ToolTip").ToString() %>'
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
                                        Width="400px"
                                        ReadOnly="true"
                                        Height="50px"
                                        TextMode="MultiLine"
                                        CssClass="TEXTO_LECTURA_KCG" 
                                        Tooltip='<%# GetLocalResourceObject("Apu_Oferta_NombreRecursoKCG.ToolTip").ToString() %>'
                                        style="text-transform:uppercase"
                                        Text='<%# Bind("Apu_Oferta_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                        </table>             
                    </asp:Panel>
                    <asp:Panel
                        runat="server"
                        ID="Rec_Apu_Oferta_Rubro_Material"
                        meta:resourcekey="Rec_Apu_Oferta_Rubro_Material_RubroRecursoKCG">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("Apu_Rubro_CodigoRecursoKCG.Text").ToString() %>'
                                        ID="lblRubroCodigo"                                                                           
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td
                                    style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Apu_Rubro_Codigo" 
                                        runat="server" 
                                        TabIndex="-1"
                                        ReadOnly="true"
                                        Tooltip='<%# GetLocalResourceObject("Apu_Rubro_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Rubro_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Apu_Rubro_Nombre" 
                                        runat="server" 
                                        TabIndex="-1"
                                        ReadOnly="true"
                                        Tooltip='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Width="400px"
                                        Text='<%# Bind("Apu_Rubro_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.Text").ToString() %>'
                                        ID="lblUnidad"                                                                           
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Rubro_Unidad"   
                                        runat="server" 
                                        TabIndex="-1"
                                        ReadOnly="true"
                                        Tooltip='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Rubro_Unidad") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>                            
                        </table>                    
                    </asp:Panel>
                    <asp:Panel
                        runat="server"
                        ID="Rec_Apu_Oferta_Rubro_MaterialRecursoKCG"
                        meta:resourcekey="Rec_Apu_Oferta_Rubro_MaterialRecursoKCG">
                        <table>
                            <tr>
                                <td
                                    colspan="2"
                                    align="right">
                                    <asp:Label 
                                        ID="Estado_Nombre" 
                                        runat="server" 
                                        ForeColor="Blue"
                                        Text='<%# Bind("Estado_Nombre") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("Apu_Material_NombreRecursoKCG.Text").ToString() %>'
                                        ID="lblMaterial"                                                                           
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Material_Nombre" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        CssClass="TEXTO_LECTURA_KCG"
                                        TextMode="MultiLine" 
                                        Height="50px"
                                        Width="400px"
                                        Tooltip='<%# GetLocalResourceObject("Apu_Material_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Material_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("CostoRecursoKCG.Text").ToString() %>'
                                        ID="lblCosto"                                                                           
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td
                                    style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Costo" 
                                        runat="server" 
                                        TabIndex="-1"
                                        ReadOnly="true"
                                        style="text-align:right"
                                        Tooltip='<%# GetLocalResourceObject("CostoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Costo","{0:N2}") %>'>
                                    </asp:TextBox>
                                    <asp:Label 
                                        ID="int_moneda_simbolo" 
                                        runat="server" 
                                        Text='<%# Bind("int_moneda_simbolo") %>'>
                                    </asp:Label>
                                </td>
                            </tr>  
                            <tr>
                                <td 
                                    colspan="2">
                                    <asp:Button 
                                        ID="EditButton" 
                                        runat="server"
                                        CausesValidation="False" 
                                        CommandName="Edit"
                                        Enabled='<%# HER.PermisosMovimientos.Movimiento_Apu_Oferta_Rubro_Material(ApuOferta_Actual.Estado, ApuOferta_Actual.Apu_Presupuesto_Estado, HER.PermisosMovimientos.ModoOperacion.Editar ) %>'
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_EditarRecursoKCG.AccesKey").ToString() %>'  
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_EditRecursoKCG.Text").ToString() %>'
                                        ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_EditRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:Button>
                                    <asp:Button 
                                        ID="DeleteButton" 
                                        runat="server" 
                                        CausesValidation="False" 
                                        CommandName="Delete"
                                        Enabled='<%# HER.PermisosMovimientos.Movimiento_Apu_Oferta_Rubro_Material(ApuOferta_Actual.Estado, ApuOferta_Actual.Apu_Presupuesto_Estado, HER.PermisosMovimientos.ModoOperacion.Eliminar ) %>'
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_EliminarRecursoKCG.AccesKey").ToString() %>'  
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_DeleteRecursoKCG.Text").ToString() %>'
                                        ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_DeleteRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:Button>
                                    <asp:Button 
                                        ID="NewButton" 
                                        runat="server" 
                                        CausesValidation="False" 
                                        CommandName="New"
                                        Enabled='<%# HER.PermisosMovimientos.Movimiento_Apu_Oferta_Rubro_Material(ApuOferta_Actual.Estado, ApuOferta_Actual.Apu_Presupuesto_Estado, HER.PermisosMovimientos.ModoOperacion.Nuevo ) %>'
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_NuevoRecursoKCG.AccesKey").ToString() %>'  
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_NewRecursoKCG.Text").ToString() %>'
                                        ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_NewRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:Button>
                                    <uc2:wucMensajeEliminar 
                                        ID="WucMensajeEliminar1" 
                                        runat="server" /> 
                                </td>
                            </tr>                                                      
                        </table>                    
                    </asp:Panel>
                    
                    <%--Ids--%>
                    
                    <asp:TextBox 
                        ID="Apu_Oferta_Rubro_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Apu_Oferta_Rubro_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Apu_Material_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Apu_Material_Id") %>'>
                    </asp:TextBox>
                    
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
                        ID="UpdateTransporte_Per_Personal_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("UpdateTransporte_Per_Personal_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Costo_Transporte" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Costo_Transporte") %>'>
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
                    
                    <%--Ocultos--%>                     
                                        
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
                        ID="Fecha_UpdateTransporte" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Fecha_UpdateTransporte") %>'>
                    </asp:TextBox>          
                    
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
                        ID="Apu_Material_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Apu_Material_Codigo") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Apu_Material_Unidad" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Apu_Material_Unidad") %>'>
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
                        ID="UpdateTransporte_Per_Personal_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("UpdateTransporte_Per_Personal_Codigo") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="UpdateTransporte_Per_Personal_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("UpdateTransporte_Per_Personal_Nombre") %>'>
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
            <table>
                <tr>
                    <td>
                        <koala:KNavegacion 
                            ID="nav"
                            runat="server"
                            GridViewID="gvApuOfertaRubroMaterial"
                            FormViewID="FormView1" 
                            OnNavegar="nav_Siguiente" />
                    </td>
                </tr>
            </table>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger 
                ControlID="gvApuOfertaRubroMaterial" 
                EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:ObjectDataSource 
        ID="odsfvApuOfertaRubroMaterial" 
        runat="server" 
        ConflictDetection="CompareAllValues"
        DeleteMethod="Delete" 
        InsertMethod="Insert" 
        OldValuesParameterFormatString="original{0}"
        SelectMethod="GetById" 
        SortParameterName="sortExpression" 
        TypeName="FEL.APU.BO_Apu_Oferta_Rubro_Material"
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
                ID="Seleccionar" 
                runat="server" 
                Visible="False" />
            <asp:Button 
                ID="Atras" 
                runat="server" 
                Visible="False" />
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel 
        ID="UpdatePanel3" 
        runat="server">
        <ContentTemplate>
            <koala:KFiltro 
                ID="kftFiltro" 
                runat="server" 
                Contenedor="APU_OFERTA_MANO_OBRA" 
                Objeto="APU_OFERTA_MANO_OBRA" 
                IndiceScope ="Scope"
                Orden="1"
                ObjectDataSourceID="odsgvApuOfertaRubroMaterial"/>
            <asp:Button 
                ID="Btn_Rubro" 
                runat="server" 
                Text="Button" 
                OnClick="Btn_Rubro_Click" />
            

            <asp:Panel                
                runat="server"
                ID="Rec_Listado_Apu_Oferta_Rubro_Material"
                meta:resourcekey="Rec_Listado_Apu_Oferta_Rubro_MaterialRecursoKCG">
                
                <Koala:KGrid 
                    ID="gvApuOfertaRubroMaterial" 
                    runat="server" 
                    AllowPaging="True" 
                    AllowSorting="True"
                    AutoGenerateColumns="False"
                    DataKeyNames="Id" 
                    DataSourceID="odsgvApuOfertaRubroMaterial"
                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>'>
                            <AlternatingRowStyle CssClass="alternatingrowstyle" />
                            <HeaderStyle CssClass="headerstyle" />
                            <PagerStyle CssClass="pagerstyle" />
                            <SelectedRowStyle CssClass="selectedrowstyle" />
                    
                    <Columns>
                        <asp:CommandField 
                            ShowSelectButton="True" 
                            ButtonType="Button" 
                            SelectText="..." />
                        <asp:BoundField 
                            DataField="Apu_Material_Codigo" 
                            meta:resourcekey="BoundApu_Material_CodigoRecursoKCG"
                            SortExpression="Apu_Material_Codigo" >
                            <itemstyle horizontalalign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Apu_Material_Nombre" 
                            meta:resourcekey="BoundApu_Material_NombreRecursoKCG"
                            SortExpression="Apu_Material_Nombre" >
                            <itemstyle wrap="True" width="80mm" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Costo" 
                            meta:resourcekey="BoundCostoRecursoKCG"
                            SortExpression="Costo" 
                            dataformatstring="{0:N2}">     
                            <itemstyle horizontalalign="Right" />
                        </asp:BoundField>                     
                        <asp:BoundField 
                            DataField="Apu_Oferta_Rubro_Id" 
                            HeaderText="Apu_Oferta_Rubro_Id"
                            SortExpression="Apu_Oferta_Rubro_Id"
                            Visible="false" />
                        <asp:BoundField 
                            DataField="Apu_Material_Id" 
                            HeaderText="Apu_Material_Id" 
                            SortExpression="Apu_Material_Id"
                            Visible="false" />                        
                        <asp:BoundField 
                            DataField="Costo_Transporte" 
                            HeaderText="Costo_Transporte" 
                            SortExpression="Costo_Transporte"                            
                            Visible="false" />
                        <asp:BoundField 
                            DataField="Fecha_Creacion" 
                            HeaderText="Fecha_Creacion" 
                            SortExpression="Fecha_Creacion"
                            Visible="false" />
                        <asp:BoundField 
                            DataField="Creacion_Per_Personal_Id" 
                            HeaderText="Creacion_Per_Personal_Id"
                            SortExpression="Creacion_Per_Personal_Id"
                            Visible="false" />
                        <asp:BoundField 
                            DataField="Fecha_Update" 
                            HeaderText="Fecha_Update" 
                            SortExpression="Fecha_Update"
                            Visible="false" />
                        <asp:BoundField 
                            DataField="Update_Per_Personal_Id" 
                            HeaderText="Update_Per_Personal_Id"
                            SortExpression="Update_Per_Personal_Id"
                            Visible="false" />
                        <asp:BoundField 
                            DataField="Fecha_UpdateTransporte" 
                            HeaderText="Fecha_UpdateTransporte"
                            SortExpression="Fecha_UpdateTransporte"
                            Visible="false" />
                        <asp:BoundField 
                            DataField="UpdateTransporte_Per_Personal_Id" 
                            HeaderText="UpdateTransporte_Per_Personal_Id"
                            SortExpression="UpdateTransporte_Per_Personal_Id"
                            Visible="false" />
                        <asp:BoundField 
                            DataField="Apu_Oferta_Rubro_Codigo" 
                            HeaderText="Apu_Oferta_Rubro_Codigo"
                            SortExpression="Apu_Oferta_Rubro_Codigo"
                            Visible="false" />
                        <asp:BoundField 
                            DataField="Apu_Oferta_Id" 
                            HeaderText="Apu_Oferta_Id" 
                            SortExpression="Apu_Oferta_Id"
                            Visible="false" />
                        <asp:BoundField 
                            DataField="Apu_Oferta_Codigo" 
                            HeaderText="Apu_Oferta_Codigo" 
                            SortExpression="Apu_Oferta_Codigo"
                            Visible="false" />
                        <asp:BoundField 
                            DataField="Apu_Oferta_Nombre" 
                            HeaderText="Apu_Oferta_Nombre" 
                            SortExpression="Apu_Oferta_Nombre"
                            Visible="false" />
                        <asp:BoundField 
                            DataField="Apu_Oferta_Etapa" 
                            HeaderText="Apu_Oferta_Etapa" 
                            SortExpression="Apu_Oferta_Etapa"
                            Visible="false" />
                        <asp:BoundField 
                            DataField="Apu_Rubro_Id" 
                            HeaderText="Apu_Rubro_Id" 
                            SortExpression="Apu_Rubro_Id"
                            Visible="false" />
                        <asp:BoundField 
                            DataField="Apu_Rubro_Codigo" 
                            HeaderText="Apu_Rubro_Codigo" 
                            SortExpression="Apu_Rubro_Codigo"
                            Visible="false" />
                        <asp:BoundField 
                            DataField="Apu_Rubro_Nombre" 
                            HeaderText="Apu_Rubro_Nombre" 
                            SortExpression="Apu_Rubro_Nombre"
                            Visible="false" />
                        <asp:BoundField 
                            DataField="Apu_Rubro_Unidad" 
                            HeaderText="Apu_Rubro_Unidad" 
                            SortExpression="Apu_Rubro_Unidad"
                            Visible="false" />                    
                        <asp:BoundField 
                            DataField="Apu_Material_Unidad" 
                            HeaderText="Apu_Material_Unidad"
                            SortExpression="Apu_Material_Unidad"
                            Visible="false" />
                        <asp:BoundField 
                            DataField="Creacion_Per_Personal_Codigo" 
                            HeaderText="Creacion_Per_Personal_Codigo"
                            SortExpression="Creacion_Per_Personal_Codigo"
                            Visible="false" />
                        <asp:BoundField 
                            DataField="Creacion_Per_Personal_Nombre" 
                            HeaderText="Creacion_Per_Personal_Nombre"
                            SortExpression="Creacion_Per_Personal_Nombre"
                            Visible="false" />
                        <asp:BoundField 
                            DataField="Update_Per_Personal_Codigo" 
                            HeaderText="Update_Per_Personal_Codigo"
                            SortExpression="Update_Per_Personal_Codigo"
                            Visible="false" />
                        <asp:BoundField 
                            DataField="Update_Per_Personal_Nombre" 
                            HeaderText="Update_Per_Personal_Nombre"
                            SortExpression="Update_Per_Personal_Nombre"
                            Visible="false" />
                        <asp:BoundField 
                            DataField="UpdateTransporte_Per_Personal_Codigo" 
                            HeaderText="UpdateTransporte_Per_Personal_Codigo"
                            SortExpression="UpdateTransporte_Per_Personal_Codigo"
                            Visible="false" />
                        <asp:BoundField 
                            DataField="UpdateTransporte_Per_Personal_Nombre" 
                            HeaderText="UpdateTransporte_Per_Personal_Nombre"
                            SortExpression="UpdateTransporte_Per_Personal_Nombre"
                            Visible="false" />
                        <asp:BoundField 
                            DataField="int_moneda_simbolo" 
                            HeaderText="int_moneda_simbolo" 
                            SortExpression="int_moneda_simbolo"
                            Visible="false" />
                        <asp:BoundField 
                            DataField="Estado_Nombre" 
                            HeaderText="Estado_Nombre" 
                            SortExpression="Estado_Nombre"
                            Visible="false" />
                        <asp:BoundField 
                            DataField="Id" 
                            HeaderText="Id" 
                            SortExpression="Id"
                            Visible="false" />
                        <asp:BoundField 
                            DataField="Codigo" 
                            HeaderText="Codigo" 
                            SortExpression="Codigo_int"
                            Visible="false" />
                        <asp:BoundField 
                            DataField="Nombre" 
                            HeaderText="Nombre" 
                            SortExpression="Nombre"
                            Visible="false" />
                        <asp:BoundField 
                            DataField="Estado" 
                            HeaderText="Estado" 
                            SortExpression="Estado"
                            Visible="false" />
                    </Columns>
                </Koala:KGrid >
            </asp:Panel>                
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:ObjectDataSource 
        ID="odsgvApuOfertaRubroMaterial" 
        runat="server" 
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetByOfertaRubro" 
        TypeName="FEL.APU.BO_Apu_Oferta_Rubro_Material">
        <SelectParameters>
            <asp:SessionParameter 
                Name="s" 
                SessionField="Scope" 
                Type="Object" />
            <asp:QueryStringParameter 
                Name="Apu_Oferta_Rubro_Id" 
                QueryStringField="Apu_Oferta_Rubro_Id"
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>    
</asp:Content>