<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="APU_OFERTA_EQUIPO.aspx.cs" 
    StylesheetTheme="EstiloKCG"
    Theme="EstiloKCG"
    Inherits="APU_APU_OFERTA_EQUIPO" 
    meta:resourcekey="Tit_Apu_Oferta_EquipoRecursoKCG" %>

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
    
<script type="text/javascript">
                                    // Work around browser behavior of "auto-submitting" simple forms
                                    Sys.Application.add_load(page_load);
                                    Sys.Application.add_unload(page_unload);
                                    
                                    
                                    var Porcentaje = null;

                                    function page_load(sender, e){
                                        Porcentaje = $get("ctl00_ContentPlaceHolder1_fvDetalleApuOfertaEquipo_Porcentaje");
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

                                        var Apu_Indice_Id = $get("ctl00_ContentPlaceHolder1_fvDetalleApuOfertaEquipo_Apu_Indice_Id");
                                        Apu_Indice_Id.value = temp[0];
                                        var Porcentaje = $get("ctl00_ContentPlaceHolder1_fvDetalleApuOfertaEquipo_Porcentaje");
                                        Porcentaje.value = temp[2];
                                        
                                        Calcular();
                                    }
                                    
                                    function Calcular()
                                    {
                                        var numApu_Oferta_Equipo_Costo_Total = 0.00;
                                        var Apu_Oferta_Equipo_Costo_Total = $get("ctl00_ContentPlaceHolder1_fvDetalleApuOfertaEquipo_Apu_Oferta_Equipo_Costo_Total");                
                                        var numApu_Oferta_Equipo_Costo_Total = Number.parseLocale(Apu_Oferta_Equipo_Costo_Total.value);
                                        if(isNaN(numApu_Oferta_Equipo_Costo_Total))
                                            numApu_Oferta_Equipo_Costo_Total = 0.0; 
                                        
                                        var numPorcentaje = Number.parseLocale(Porcentaje.value);
                                        if(isNaN(numPorcentaje))
                                            numPorcentaje = 0.0;
                                        
                                        numCosto_Indice = numPorcentaje * numApu_Oferta_Equipo_Costo_Total / 100;
                                        numCosto_Indice = Redondear(numCosto_Indice, 4);
                                        Costo_Indice = $get("ctl00_ContentPlaceHolder1_fvDetalleApuOfertaEquipo_Costo_Indice");
                                        Costo_Indice.value = numCosto_Indice.localeFormat("N4");

                                    }
                                    
                                    function Redondear(x,numeroDecimales) {
                                        return (Math.round(x*Math.pow(10,numeroDecimales)))/Math.pow(10,numeroDecimales);
                                    }
</script>

    <asp:UpdatePanel ID="uppFvMaestro"
        runat="server"
        UpdateMode="Conditional">
        <ContentTemplate>
        
    
    <asp:FormView ID="fvMaestroApuOferta" runat="server" DataSourceID="odsFvMaestroApuOferta">
       
        <EditItemTemplate> 
        </EditItemTemplate>
        
        <InsertItemTemplate>
        </InsertItemTemplate>
            
        <ItemTemplate>
            <asp:Panel ID="Rec_Apu_Oferta_Equipo_Oferta"
                runat="server"
                meta:resourcekey="Rec_Apu_Oferta_Equipo_OfertaRecursoKCG">
                
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
                            <asp:Label ID="lblNombre" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("Apu_Oferta_NombreRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                            
                        </td>
                        <td>
                            <asp:TextBox ID="Codigo"
                                ReadOnly="true" 
                                Width="100px" 
                                TabIndex="-1"
                                runat="server" 
                                Text='<%# Bind("Codigo") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Oferta_CodigoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="Nombre"
                                ReadOnly="true" 
                                TabIndex="-1"
                                Width="900px" 
                                runat="server" 
                                CssClass="TEXTO_LECTURA_KCG"
                                Text='<%# Bind("Nombre") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Oferta_NombreRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </ItemTemplate>
    </asp:FormView>
        
    </ContentTemplate>
    </asp:UpdatePanel>
    
    <asp:ObjectDataSource ID="odsFvMaestroApuOferta" 
        runat="server" 
        SelectMethod="GetById" 
        TypeName="FEL.APU.BO_Apu_Oferta"
        SortParameterName="sortExpression">
        <SelectParameters>
            <asp:SessionParameter Name="s" 
                SessionField="Scope" 
                Type="Object" />
            <asp:QueryStringParameter Name="Apu_Oferta_Id" 
                QueryStringField="Apu_Oferta_Id" 
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>        
   
    <asp:Panel
        runat="server"
        ID="Rec_Apu_Oferta_Equipo_Indice"
        meta:resourcekey="Rec_Apu_Oferta_Equipo_IndiceRecursoKCG">
        
        <asp:UpdatePanel 
            ID="uppFvDetalle" 
            runat="server" 
            UpdateMode="Conditional">
            <ContentTemplate>
                <asp:FormView 
                    ID="fvDetalleApuOfertaEquipo" 
                    runat="server" 
                    DataSourceID="odsfvDetalleApuOfertaEquipo"
                    DefaultMode="Insert">
                    
                    <EditItemTemplate>
                        <table style="white-space:nowrap">
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("Apu_Indice_NombreRecursoKCG.Text").ToString() %>'
                                        ID="lblIndice"                                   
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Indice_Nombre" 
                                        CssClass="TEXTO_COMBOPER_KCG"
                                        runat="server" 
                                        Width="400px"
                                        Tooltip='<%# GetLocalResourceObject("Apu_Indice_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Indice_Nombre") %>'>
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
                                    ServicePath="~/APU/APU_OFERTA_EQUIPO.aspx" 
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
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("CostoRecursoKCG.Text").ToString() %>'
                                        ID="lblCostoTotal"                                   
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td
                                    style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Apu_Oferta_Equipo_Costo_Total"
                                        Style="text-align:right" 
                                        TabIndex="-1"
                                        Width = "100px"
                                        ReadOnly="true"
                                        runat="server" 
                                        Tooltip='<%# GetLocalResourceObject("CostoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Oferta_Equipo_Costo_Total","{0:N2}") %>'>
                                    </asp:TextBox>
                                    <asp:Label
                                        ID="Int_Moneda_Simbolo1" 
                                        runat="server" 
                                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>                                    
                                </td>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("PorcentajeRecursoKCG.Text").ToString() %>'
                                        ID="lblPorcentaje"                                   
                                        runat="server">
                                    </asp:Label>
                                </td>     
                                <td 
                                    style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Porcentaje"
                                        Style="text-align:right" 
                                        CssClass="TEXTO_EDICION_KCG" 
                                        Width = "100px"
                                        runat="server" 
                                        Tooltip='<%# GetLocalResourceObject("PorcentajeRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Porcentaje") %>'>
                                    </asp:TextBox>
                                    <asp:Label 
                                        ID="Int_Porcentaje_Simbolo" 
                                        runat="server" 
                                        Text="%">
                                    </asp:Label>
                                    
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
                                        MinimumValue="0.00"
                                        MaximumValue="100.00" 
                                        Display="Dynamic"
                                        EmptyValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ24RecursoKCG.Text").ToString() %>'
                                        InvalidValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ24RecursoKCG.Text").ToString() %>'
                                        MaximumValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ24RecursoKCG.Text").ToString() %>' 
                                        MinimumValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ24RecursoKCG.Text").ToString() %>'
                                        ValidationGroup="I" />  
                                      
                                      <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="ValidatorCalloutExtender1"
                                        TargetControlID="MaskedEditValidator2"/>
                                </td>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("Costo_IndiceRecursoKCG.Text").ToString() %>'
                                        ID="lblCostoIndice"                                   
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td 
                                    style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Costo_Indice"
                                        Style="text-align:right" 
                                        ReadOnly="true" 
                                        Width = "100px"
                                        TabIndex="-1"
                                        runat="server" 
                                        Tooltip='<%# GetLocalResourceObject("Costo_IndiceRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Costo_Indice","{0:N2}") %>'>
                                    </asp:TextBox>
                                    <asp:Label
                                        ID="Int_Moneda_Simbolo2" 
                                        runat="server" 
                                        Text='<%# Eval("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td
                                    colspan="2"
                                    align="left">
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
                        
                        <%--Ids--%>
                       
                        <asp:TextBox 
                            ID="Apu_Oferta_Equipo_Id" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Apu_Oferta_Equipo_Id") %>'>
                        </asp:TextBox>
                       
                        <asp:TextBox 
                            ID="Apu_Indice_Id" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Apu_Indice_Id") %>'>
                        </asp:TextBox>    
                      
                        <asp:TextBox 
                            ID="Apu_Oferta_Id" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Apu_Oferta_Id") %>'>
                        </asp:TextBox>
                       
                        <asp:TextBox 
                            ID="Apu_Equipo_Id" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Apu_Equipo_Id") %>'>
                        </asp:TextBox>
                    
                        <asp:TextBox 
                            ID="Id" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Id") %>'>
                        </asp:TextBox>        
                        
                        <%--Ocultos--%>          
                     
                        <asp:TextBox 
                            ID="Apu_Oferta_Equipo_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Apu_Oferta_Equipo_Codigo") %>'>
                        </asp:TextBox>                       
                    
                        <asp:TextBox 
                            ID="Apu_Oferta_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Apu_Oferta_Codigo") %>'>
                        </asp:TextBox>
                      
                        <asp:TextBox 
                            ID="Apu_Oferta_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Apu_Oferta_Nombre") %>'>
                        </asp:TextBox>
                      
                        <asp:TextBox 
                            ID="Apu_Oferta_Etapa" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Apu_Oferta_Etapa") %>'>
                        </asp:TextBox>                    
                      
                        <asp:TextBox 
                            ID="Apu_Equipo_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Apu_Equipo_Codigo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Apu_Equipo_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Apu_Equipo_Nombre") %>'>
                        </asp:TextBox>
                       
                        <asp:TextBox 
                            ID="Apu_Indice_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Apu_Indice_Codigo") %>'>
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
                        <table>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("Apu_Indice_NombreRecursoKCG.Text").ToString() %>'
                                        ID="lblIndice"                                   
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Indice_Nombre" 
                                        CssClass="TEXTO_COMBOPER_KCG"
                                        runat="server" 
                                        Width="400px"
                                        Tooltip='<%# GetLocalResourceObject("Apu_Indice_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Indice_Nombre") %>'>
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
                                    ServicePath="~/APU/APU_OFERTA_EQUIPO.aspx" 
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
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("CostoRecursoKCG.Text").ToString() %>'
                                        ID="lblCostoTotal"                                   
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td
                                    style="white-space:nowrap">
                                    <asp:TextBox 
                                        ReadOnly="true"
                                        ID="Apu_Oferta_Equipo_Costo_Total" 
                                        Style="text-align:right" 
                                        Width = "100px"
                                        TabIndex="-1"
                                        runat="server" 
                                        Tooltip='<%# GetLocalResourceObject("CostoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Oferta_Equipo_Costo_Total") %>'>
                                    </asp:TextBox>
                                    <asp:Label
                                        ID="Int_Moneda_Simbolo1" 
                                        runat="server" 
                                        Text='<%# Eval("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>                                    
                                </td>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("PorcentajeRecursoKCG.Text").ToString() %>'
                                        ID="lblPorcentaje"                                   
                                        runat="server">
                                    </asp:Label>
                                </td>     
                                <td 
                                    style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Porcentaje" 
                                        Style="text-align:right" 
                                        CssClass="TEXTO_EDICION_KCG"
                                        Width = "100px"
                                        runat="server" 
                                        Tooltip='<%# GetLocalResourceObject("PorcentajeRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Porcentaje") %>'>
                                    </asp:TextBox>
                                    <asp:Label 
                                        ID="Int_Porcentaje_Simbolo" 
                                        runat="server" 
                                        Text="%">
                                    </asp:Label>
                                    
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
                                        MinimumValue="0.00"
                                        MaximumValue="100.00" 
                                        Display="Dynamic"
                                        EmptyValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ24RecursoKCG.Text").ToString() %>'
                                        InvalidValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ24RecursoKCG.Text").ToString() %>'
                                        MaximumValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ24RecursoKCG.Text").ToString() %>' 
                                        MinimumValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ24RecursoKCG.Text").ToString() %>'
                                        ValidationGroup="I" />  
                                      
                                      <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="ValidatorCalloutExtender1"
                                        TargetControlID="MaskedEditValidator2"/>
                                    
                                </td>  
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("Costo_IndiceRecursoKCG.Text").ToString() %>'
                                        ID="lblCostoIndice"                                   
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td 
                                    style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Costo_Indice"
                                        Style="text-align:right" 
                                        TabIndex="-1"
                                        Width = "100px"
                                        ReadOnly="true" 
                                        runat="server" 
                                        Tooltip='<%# GetLocalResourceObject("Costo_IndiceRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Costo_Indice") %>'>
                                    </asp:TextBox>
                                    <asp:Label
                                        ID="Int_Moneda_Simbolo2" 
                                        runat="server" 
                                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
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
                        
                        <%--Ids--%>
                       
                        <asp:TextBox 
                            ID="Apu_Oferta_Equipo_Id" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Apu_Oferta_Equipo_Id") %>'>
                        </asp:TextBox>
                       
                        <asp:TextBox 
                            ID="Apu_Indice_Id" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Apu_Indice_Id") %>'>
                        </asp:TextBox>    
                      
                        <asp:TextBox 
                            ID="Apu_Oferta_Id" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Apu_Oferta_Id") %>'>
                        </asp:TextBox>
                       
                        <asp:TextBox 
                            ID="Apu_Equipo_Id" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Apu_Equipo_Id") %>'>
                        </asp:TextBox>
                    
                        <asp:TextBox 
                            ID="Id" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Id") %>'>
                        </asp:TextBox>        
                        
                        <%--Ocultos--%>          
                     
                        <asp:TextBox 
                            ID="Apu_Oferta_Equipo_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Apu_Oferta_Equipo_Codigo") %>'>
                        </asp:TextBox>                       
                    
                        <asp:TextBox 
                            ID="Apu_Oferta_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Apu_Oferta_Codigo") %>'>
                        </asp:TextBox>
                      
                        <asp:TextBox 
                            ID="Apu_Oferta_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Apu_Oferta_Nombre") %>'>
                        </asp:TextBox>
                      
                        <asp:TextBox 
                            ID="Apu_Oferta_Etapa" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Apu_Oferta_Etapa") %>'>
                        </asp:TextBox>                    
                      
                        <asp:TextBox 
                            ID="Apu_Equipo_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Apu_Equipo_Codigo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Apu_Equipo_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Apu_Equipo_Nombre") %>'>
                        </asp:TextBox>
                       
                        <asp:TextBox 
                            ID="Apu_Indice_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Apu_Indice_Codigo") %>'>
                        </asp:TextBox>                                        
                       
                        <asp:TextBox 
                            ID="Estado_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Estado_Nombre") %>'>
                        </asp:TextBox>
                      
                        <asp:TextBox 
                            ID="Campo_Nombre" 
                            runat="server" 
                            Visible="false" 
                            Text='<%# Bind("Campo_Nombre") %>'>
                        </asp:TextBox>                
                   
                        <asp:TextBox 
                            ID="TextBox15" 
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
                        <table>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("Apu_Indice_NombreRecursoKCG.Text").ToString() %>'
                                        ID="lblIndice"                                   
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Indice_Nombre"
                                        ReadOnly="true" 
                                        TabIndex="-1"
                                        CssClass ="TEXTO_LECTURA_KCG"
                                        runat="server" 
                                        Width="400px"
                                        Tooltip='<%# GetLocalResourceObject("Apu_Indice_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Indice_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("CostoRecursoKCG.Text").ToString() %>'
                                        ID="lblCostoTotal"                                   
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td
                                    style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Apu_Oferta_Equipo_Costo_Total"
                                        Style="text-align:right" 
                                        TabIndex="-1"
                                        Width = "100px"
                                        ReadOnly="true"  
                                        runat="server" 
                                        Tooltip='<%# GetLocalResourceObject("CostoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Oferta_Equipo_Costo_Total","{0:N2}") %>'>
                                    </asp:TextBox>
                                    <asp:Label
                                        ID="Int_Moneda_Simbolo1" 
                                        runat="server" 
                                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>                                    
                                </td>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("PorcentajeRecursoKCG.Text").ToString() %>'
                                        ID="lblPorcentaje"                                   
                                        runat="server">
                                    </asp:Label>
                                </td>     
                                <td 
                                    style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Porcentaje"
                                        TabIndex="-1"
                                        Width = "100px"
                                        Style="text-align:right" 
                                        ReadOnly="true"  
                                        runat="server" 
                                        Tooltip='<%# GetLocalResourceObject("PorcentajeRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Porcentaje") %>'>
                                    </asp:TextBox>
                                    <asp:Label 
                                        ID="Int_Porcentaje_Simbolo" 
                                        runat="server" 
                                        Text="%">
                                    </asp:Label>
                                </td>  
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("Costo_IndiceRecursoKCG.Text").ToString() %>'
                                        ID="lblCostoIndice"                                   
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td 
                                    style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Costo_Indice" 
                                        Style="text-align:right" 
                                        TabIndex="-1"
                                        Width = "100px"
                                        ReadOnly="true" 
                                        runat="server" 
                                        Tooltip='<%# GetLocalResourceObject("Costo_IndiceRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Costo_Indice","{0:N2}") %>'>
                                    </asp:TextBox>
                                    <asp:Label
                                        ID="Int_Moneda_Simbolo2" 
                                        runat="server" 
                                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td
                                    colspan="2"
                                    align="left">
                                    <asp:Button 
                                        ID="EditButton" 
                                        runat="server"
                                        CausesValidation="False" 
                                        CommandName="Edit"
                                        Enabled='<%# HER.PermisosMovimientos.Movimiento_Apu_Oferta_Equipo_Indice(Request.QueryString["Estado"], Request.QueryString["Apu_Presupuesto_Estado"], HER.PermisosMovimientos.ModoOperacion.Editar ) %>'
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_EditarRecursoKCG.AccesKey").ToString() %>'  
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_EditRecursoKCG.Text").ToString() %>'
                                        ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_EditRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:Button>
                                    <asp:Button 
                                        ID="DeleteButton" 
                                        runat="server" 
                                        CausesValidation="False" 
                                        CommandName="Delete"
                                        Enabled='<%# HER.PermisosMovimientos.Movimiento_Apu_Oferta_Equipo_Indice(Request.QueryString["Estado"], Request.QueryString["Apu_Presupuesto_Estado"], HER.PermisosMovimientos.ModoOperacion.Eliminar ) %>'
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_EliminarRecursoKCG.AccesKey").ToString() %>'  
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_DeleteRecursoKCG.Text").ToString() %>'
                                        ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_DeleteRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:Button>
                                    <asp:Button 
                                        ID="NewButton" 
                                        runat="server" 
                                        CausesValidation="False" 
                                        CommandName="New"
                                        Enabled='<%# HER.PermisosMovimientos.Movimiento_Apu_Oferta_Equipo_Indice(Request.QueryString["Estado"], Request.QueryString["Apu_Presupuesto_Estado"], HER.PermisosMovimientos.ModoOperacion.Nuevo ) %>'
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
                        
                        <%--Ids--%>
                       
                        <asp:TextBox 
                            ID="Apu_Oferta_Equipo_Id" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Apu_Oferta_Equipo_Id") %>'>
                        </asp:TextBox>
                       
                        <asp:TextBox 
                            ID="Apu_Indice_Id" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Apu_Indice_Id") %>'>
                        </asp:TextBox>    
                      
                        <asp:TextBox 
                            ID="Apu_Oferta_Id" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Apu_Oferta_Id") %>'>
                        </asp:TextBox>
                       
                        <asp:TextBox 
                            ID="Apu_Equipo_Id" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Apu_Equipo_Id") %>'>
                        </asp:TextBox>
                    
                        <asp:TextBox 
                            ID="Id" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Id") %>'>
                        </asp:TextBox>        
                        
                        <%--Ocultos--%>          
                     
                        <asp:TextBox 
                            ID="Apu_Oferta_Equipo_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Apu_Oferta_Equipo_Codigo") %>'>
                        </asp:TextBox>                       
                    
                        <asp:TextBox 
                            ID="Apu_Oferta_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Apu_Oferta_Codigo") %>'>
                        </asp:TextBox>
                      
                        <asp:TextBox 
                            ID="Apu_Oferta_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Apu_Oferta_Nombre") %>'>
                        </asp:TextBox>
                      
                        <asp:TextBox 
                            ID="Apu_Oferta_Etapa" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Apu_Oferta_Etapa") %>'>
                        </asp:TextBox>                    
                      
                        <asp:TextBox 
                            ID="Apu_Equipo_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Apu_Equipo_Codigo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Apu_Equipo_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Apu_Equipo_Nombre") %>'>
                        </asp:TextBox>
                       
                        <asp:TextBox 
                            ID="Apu_Indice_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Apu_Indice_Codigo") %>'>
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
                <koala:KNavegacion 
                    ID="nav"
                    runat="server"
                    GridViewID="gvDetalleApuOfertaEquipo"
                    OnNavegar="nav_Siguiente"/>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger 
                    ControlID="gvDetalleApuOfertaEquipo" 
                    EventName="SelectedIndexChanged" />
                <asp:AsyncPostBackTrigger 
                    ControlID="gvMaestroApuOfertaEquipo" 
                    EventName="SelectedIndexChanged" />
            </Triggers>
        </asp:UpdatePanel>
        <asp:ObjectDataSource 
            ID="odsfvDetalleApuOfertaEquipo" 
            runat="server" 
            ConflictDetection="CompareAllValues"
            DeleteMethod="Delete" 
            InsertMethod="Insert" 
            OldValuesParameterFormatString="original{0}"
            SelectMethod="GetById" 
            SortParameterName="sortExpression" 
            TypeName="FEL.APU.BO_Apu_Oferta_Equipo_Indice"
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
            ID="uppBotones" 
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
            ID="uppGvDetalle" 
            runat="server">
            <ContentTemplate>
                <koala:KFiltro 
                    ID="kftFiltro" 
                    runat="server" 
                    Contenedor="APU_OFERTA_EQUIPO" 
                    Objeto="APU_OFERTA_EQUIPO_INDICE" 
                    IndiceScope ="Scope"
                    Orden="1"
                    ObjectDataSourceID="odsgvDetalleApuOfertaEquipo"/>
                    
                <table>
                    <tr>
                        <td>
                            <koala:KGrid 
                                ID="gvDetalleApuOfertaEquipo" 
                                runat="server"                 
                                AllowPaging="True" 
                                AllowSorting="True"
                                AutoGenerateColumns="False"
                                DataKeyNames="Id" 
                                DataSourceID="odsgvDetalleApuOfertaEquipo"
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
                                        DataField="Apu_Indice_Codigo" 
                                        meta:resourcekey="BoundApu_Indice_CodigoRecursoKCG"
                                        SortExpression="Apu_Indice_Codigo" >
                                        <itemstyle horizontalalign="Right" />
                                    </asp:BoundField>
                                    <asp:BoundField 
                                        DataField="Apu_Indice_Nombre" 
                                        meta:resourcekey="BoundApu_Indice_NombreRecursoKCG"
                                        SortExpression="Apu_Indice_Nombre" >
                                        <itemstyle wrap="false" width="700px"/>
                                    </asp:BoundField>
                                    <asp:BoundField 
                                        DataField="Apu_Oferta_Equipo_Costo_Total" 
                                        meta:resourcekey="BoundApu_Oferta_Equipo_Costo_TotalRecursoKCG"
                                        SortExpression="Apu_Oferta_Equipo_Costo_Total" 
                                        dataformatstring="{0:N2}">
                                        <itemstyle horizontalalign ="right" />
                                    </asp:BoundField>
                                    <asp:BoundField 
                                        DataField="Porcentaje" 
                                        meta:resourcekey="BoundPorcentajeRecursoKCG"
                                        SortExpression="Porcentaje" >
                                        <itemstyle horizontalalign ="right" />
                                    </asp:BoundField>
                                    <asp:BoundField 
                                        DataField="Costo_Indice" 
                                        meta:resourcekey="BoundCosto_IndiceRecursoKCG"
                                        SortExpression="Costo_Indice" 
                                        dataformatstring="{0:N2}">
                                        <itemstyle horizontalalign ="right" />
                                    </asp:BoundField>
                                    <asp:BoundField 
                                        DataField="Apu_Oferta_Equipo_Id" 
                                        HeaderText="Apu_Oferta_Equipo_Id"
                                        SortExpression="Apu_Oferta_Equipo_Id"
                                        Visible="false" />
                                    <asp:BoundField 
                                        DataField="Apu_Indice_Id" 
                                        HeaderText="Apu_Indice_Id" 
                                        SortExpression="Apu_Indice_Id"
                                        Visible="false" />                        
                                    <asp:BoundField 
                                        DataField="Apu_Oferta_Equipo_Codigo" 
                                        HeaderText="Apu_Oferta_Equipo_Codigo"
                                        SortExpression="Apu_Oferta_Equipo_Codigo"
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
                                        DataField="Apu_Equipo_Id" 
                                        HeaderText="Apu_Equipo_Id" 
                                        SortExpression="Apu_Equipo_Id"
                                        Visible="false" />
                                    <asp:BoundField 
                                        DataField="Apu_Equipo_Codigo" 
                                        HeaderText="Apu_Equipo_Codigo" 
                                        SortExpression="Apu_Equipo_Codigo"
                                        Visible="false" />
                                    <asp:BoundField 
                                        DataField="Apu_Equipo_Nombre" 
                                        HeaderText="Apu_Equipo_Nombre" 
                                        SortExpression="Apu_Equipo_Nombre"
                                        Visible="false" />                                                
                                    <asp:BoundField 
                                        DataField="Int_Moneda_Simbolo" 
                                        HeaderText="Int_Moneda_Simbolo" 
                                        SortExpression="Int_Moneda_Simbolo"
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
                            </koala:KGrid>
                        </td>
                    </tr>
                    <tr>
                        <td 
                            align="right">
                            <asp:TextBox ID="Suma_porcentaje_Equipo_Indice"
                                runat="server"
                                ReadOnly="true"
                                Style="text-align:right">
                            </asp:TextBox>                        
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:ObjectDataSource 
            ID="odsgvDetalleApuOfertaEquipo" 
            runat="server" 
            SelectMethod="GetByOfertaEquipo" 
            TypeName="FEL.APU.BO_Apu_Oferta_Equipo_Indice">
            <SelectParameters>
                <asp:SessionParameter 
                    Name="s" 
                    SessionField="Scope" 
                    Type="Object" />                
                <asp:ControlParameter
                    Name="Apu_Oferta_Equipo_Id"
                    Type="String"
                    ControlID="gvMaestroApuOfertaEquipo" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </asp:Panel>
    
    <asp:UpdatePanel 
        ID="uppGvMaestro" UpdateMode="always" 
        runat="server">
        <ContentTemplate>
            <asp:Panel 
                runat="server"
                ID="Rec_Apu_Oferta_Equipo_Equipo"
                meta:resourcekey="Rec_Apu_Oferta_Equipo_EquipoRecursoKCG">
                
                <Koala:KGrid 
                    ID="gvMaestroApuOfertaEquipo" 
                    runat="server" 
                    AllowPaging="True" 
                    AllowSorting="True"
                    AutoGenerateColumns="False"
                    DataKeyNames="Id, Suma_porcentaje_Equipo_Indice" 
                    DataSourceID="odsgvMaestroApuOfertaEquipo">
                        
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
                            SortExpression="Apu_Equipo_Codigo" >
                            <itemstyle horizontalalign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Apu_Equipo_Nombre" 
                            meta:resourcekey="BoundApu_Equipo_NombreRecursoKCG"
                            SortExpression="Apu_Equipo_Nombre">
                            <headerstyle wrap="False" />
                            <itemstyle wrap="False" Width="80mm"/>
                        </asp:BoundField>
                        <asp:BoundField                         
                            DataField="Costo" 
                            meta:resourcekey="BoundCostoRecursoKCG"
                            SortExpression="Costo" 
                            dataformatstring="{0:N2}">
                            <headerstyle wrap="False" horizontalalign="right" />
                            <itemstyle wrap="False" horizontalalign="right"/>
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Suma_porcentaje_Equipo_Indice_1" 
                            meta:resourcekey="BoundSuma_porcentaje_Equipo_Indice_1RecursoKCG"
                            SortExpression="Suma_porcentaje_Equipo_Indice_1" >
                            <headerstyle wrap="False" horizontalalign="right" />
                            <itemstyle wrap="False" horizontalalign="right"/>
                        </asp:BoundField>                                                      
                        
                        <%--Ocultos--%>
                        
                        <asp:BoundField 
                            DataField="Apu_Oferta_Id" 
                            HeaderText="Apu_Oferta_Id" 
                            SortExpression="Apu_Oferta_Id" 
                            Visible="false" />
                        <asp:BoundField 
                            DataField="Apu_Equipo_Id" 
                            HeaderText="Apu_Equipo_Id" 
                            SortExpression="Apu_Equipo_Id"
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
                            DataField="Suma_porcentaje_Equipo_Indice" 
                            HeaderText="Suma_porcentaje_Equipo_Indice"
                            SortExpression="Suma_porcentaje_Equipo_Indice"
                            Visible="false" />                        
                        <asp:BoundField 
                            DataField="Int_Moneda_Simbolo" 
                            HeaderText="Int_Moneda_Simbolo" 
                            SortExpression="Int_Moneda_Simbolo"
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
                </Koala:KGrid>            
            </asp:Panel>
            <asp:Button 
                ID="Btn_Apu_Oferta_Equipo_Formula" 
                runat="server"
                meta:resourcekey="Btn_Apu_Oferta_Equipo_FormulaRecursoKCG" />                
            <asp:Button 
                ID="Btn_Apu_Listado_Oferta" 
                runat="server" 
                Text="Listado" 
                OnClick="Btn_Apu_Listado_Oferta_Click" />
        </ContentTemplate>
    </asp:UpdatePanel>
    
    <asp:ObjectDataSource 
        ID="odsgvMaestroApuOfertaEquipo" 
        runat="server" 
        SelectMethod="GetByOferta" 
        TypeName="FEL.APU.BO_Apu_Oferta_Equipo">
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

