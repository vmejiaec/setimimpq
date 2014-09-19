<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="FIS_CATALOGO_INDICE.aspx.cs" 
    Inherits="FIS_FIS_CATALOGO_INDICE" 
    StylesheetTheme="EstiloKCG"
    Theme="EstiloKCG"
    meta:resourcekey="Tit_Fis_Catalogo_IndiceRecursoKCG" %>
    
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
    <asp:UpdatePanel 
        ID="UpdatePanel1" 
        runat="server">
        <ContentTemplate>
        <script type="text/javascript">
            function ItemSelected_ApuIndNom( source, eventArgs ) 
            {   
                var valor = eventArgs.get_value();
                var temp = new Array();
                temp = valor.split('||');
                
                var Apu_Indice_Id = $get("ctl00_ContentPlaceHolder1_Fv_Fis_Catalogo_Indice_Apu_Indice_Id");
                Apu_Indice_Id.value = temp[0];                                    
                var Apu_Indice_Codigo = $get("ctl00_ContentPlaceHolder1_Fv_Fis_Catalogo_Indice_Apu_Indice_Codigo");
                Apu_Indice_Codigo.value = temp[1];                                        
            }      
        </script>  
        
        <asp:TextBox 
            ID="NumRegistros"
            runat="server" 
            style="display:none">
        </asp:TextBox>
        <asp:TextBox 
            ID="Pagina" 
            runat="server"
            style="display:none">
        </asp:TextBox>
        
            <asp:Panel 
                ID="Pnl_Publicidad" 
                runat="server" 
                meta:resourcekey="Rec_Fis_Catalogo_Indice_PublicacionRecursoKCG" >
                <table>
                    <tr>
                        <td>
                            <asp:Label                                        
                                ID="lbl_Codigo_P"                                                                           
                                runat="server"
                                Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td style="white-space:nowrap">  
                            <asp:TextBox 
                                ID="Filtro_Fis_Catalogo_Codigo"
                                onfocus="this.blur()" 
                                TabIndex="-1" 
                                ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'
                                runat="server">
                            </asp:TextBox>                                  
                            <asp:Label                                        
                                ID="lbl_Fecha_P"                                                                           
                                runat="server"
                                Text='<%# GetLocalResourceObject("Fecha_PublicacionRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                            <asp:TextBox 
                                ID="Filtro_Fis_Catalogo_Fecha_Publicacion"
                                onfocus="this.blur()" 
                                TabIndex="-1" 
                                ToolTip='<%# GetLocalResourceObject("Fecha_PublicacionRecursoKCG.ToolTip").ToString() %>'
                                runat="server">
                            </asp:TextBox>     
                            <asp:Label                                        
                                ID="lbl_Fecha_R"                                                                           
                                runat="server"
                                Text='<%# GetLocalResourceObject("Fecha_CreacionRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                            <asp:TextBox 
                                ID="Filtro_Fis_Catalogo_Fecha_Creacion"
                                onfocus="this.blur()" 
                                TabIndex="-1" 
                                ToolTip='<%# GetLocalResourceObject("Fecha_CreacionRecursoKCG.ToolTip").ToString() %>'
                                runat="server">
                            </asp:TextBox>     
                        </td>
                        <tr>
                            <td>
                                <asp:Label                                        
                                    ID="lbl_Fuente"                                                                           
                                    runat="server"
                                    Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'>
                                </asp:Label>   
                            </td>
                            <td>                         
                                <asp:TextBox 
                                    ID="Filtro_Fis_Catalogo_Nombre"
                                    onfocus="this.blur()" 
                                    TabIndex="-1" 
                                    Width="600px"
                                    ToolTip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>'
                                    runat="server">
                                </asp:TextBox>     
                            </td>
                        </tr>
                    </tr>
                </table>                        
            </asp:Panel>
            <asp:FormView 
                ID="Fv_Fis_Catalogo_Indice" 
                runat="server" 
                DataSourceID="odsFv_Fis_Catalogo_Indice"
                DefaultMode="Insert">
                <EditItemTemplate>
                    <asp:Panel 
                        ID="pnl_Precios_Indices" 
                        runat="server" 
                        meta:resourcekey="Rec_Fis_Catalogo_IndiceRecursoKCG" >
                        <table>
                            <tr>
                                <td>
                                    <asp:Label                                        
                                        ID="lbl_Codigo_Indice"                                                                           
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Apu_Indice_CodigoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">                                                                         
                                    <asp:TextBox 
                                        ID="Apu_Indice_Codigo" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Indice_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Indice_Codigo") %>'>
                                    </asp:TextBox>                                   
                                    <asp:Label                                        
                                        ID="lbl_Descripcion_Indice"                                                                           
                                        runat="server"                                        
                                        Text='<%# GetLocalResourceObject("Apu_Indice_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                    <asp:TextBox 
                                        ID="Apu_Indice_Nombre" 
                                        runat="server" 
                                        Width="400px"
                                        CssClass="TEXTO_COMBOPER_KCG"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Indice_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Indice_Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        ID="rfv_Apu_Indice_Nombre"
                                        runat="server" 
                                        ControlToValidate="Apu_Indice_Nombre"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="vce_Apu_Indice_Nombre"
                                        TargetControlID="rfv_Apu_Indice_Nombre" />
                                    <AjaxControlToolkit:AutoCompleteExtender
                                        runat="server" 
                                        BehaviorID="AutoCom_ApuIndNom"
                                        ID="ace_ApuIndNom" 
                                        TargetControlID="Apu_Indice_Nombre"
                                        ServicePath="~/FIS/FIS_CATALOGO_INDICE.aspx" 
                                        ServiceMethod="Get_ApuIndNom"
                                        MinimumPrefixLength="0" 
                                        CompletionInterval="500"
                                        EnableCaching="true"
                                        CompletionSetCount="500"
                                        CompletionListCssClass="autocomplete_completionListElement" 
                                        CompletionListItemCssClass="autocomplete_listItem" 
                                        CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                        OnClientItemSelected="ItemSelected_ApuIndNom" >
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
                                                        var behavior = $find('AutoCom_ApuIndNom');
                                                        if (!behavior._height) {
                                                            var target = behavior.get_completionList();
                                                            behavior._height = target.offsetHeight - 2;
                                                            target.style.height = '0px';
                                                        }" />                                                    
                                                    <%-- Expand from 0px to the appropriate size while fading in --%>
                                                    <Parallel Duration=".4">
                                                        <FadeIn />
                                                        <Length PropertyKey="height" StartValue="0" EndValueScript="$find('AutoCom_ApuIndNom')._height" />
                                                    </Parallel>
                                                </Sequence>
                                            </OnShow>
                                            <OnHide>
                                                <%-- Collapse down to 0px and fade out --%>
                                                <Parallel Duration=".4">
                                                    <FadeOut />
                                                    <Length PropertyKey="height" StartValueScript="$find('AutoCom_ApuIndNom')._height" EndValue="0" />
                                                </Parallel>
                                            </OnHide>
                                        </Animations>
                                    </AjaxControlToolkit:AutoCompleteExtender> 
                                </td>
                                <td align="right" colspan="2">
                                    <asp:Label 
                                        ID="lbl_Estado_Nombre" 
                                        runat="server" 
                                        ForeColor="Red"
                                        Text='<%# Bind("Estado_Nombre") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label                                        
                                        ID="lbl_Valor_Indice"                                                                           
                                        runat="server"                                        
                                        Text='<%# GetLocalResourceObject("ValorRecursoKCG.Text").ToString() %>'>
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
                                        Mask="9,999,999,999,999.999"
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
                                        ID="mev_Valor" 
                                        runat="server"
                                        ControlExtender="mee_Valor"
                                        ControlToValidate="Valor"
                                        IsValidEmpty="False"
                                        EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        MinimumValue="0.000"
                                        MaximumValue="9999999999999.999" 
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
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label                                        
                                        ID="lbl_Observacion"                                                                           
                                        runat="server"                                        
                                        Text='<%# GetLocalResourceObject("DescripcionRecursoKCG.Text").ToString() %>'>
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
                            <tr align="left" >
                                <td colspan="4">
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
                    
                    <%--Id's--%>     
                                   
                    <asp:TextBox 
                        ID="Fis_Catalogo_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Fis_Catalogo_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Apu_Indice_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Apu_Indice_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    
                    <%--campos no visibles--%>
                    
                    <asp:TextBox 
                        ID="Fis_Catalogo_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Fis_Catalogo_Nombre") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Fis_Catalogo_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Fis_Catalogo_Codigo") %>'>
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
                        ID="pnl_Precios_Indices" 
                        runat="server" 
                        meta:resourcekey="Rec_Fis_Catalogo_IndiceRecursoKCG" >
                        <table>
                            <tr>
                                <td>
                                    <asp:Label                                        
                                        ID="lbl_Codigo_Indice"                                                                           
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Apu_Indice_CodigoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">                                                                         
                                    <asp:TextBox 
                                        ID="Apu_Indice_Codigo" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Indice_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Indice_Codigo") %>'>
                                    </asp:TextBox>                                   
                                    <asp:Label                                        
                                        ID="lbl_Descripcion_Indice"                                                                           
                                        runat="server"                                        
                                        Text='<%# GetLocalResourceObject("Apu_Indice_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                    <asp:TextBox 
                                        ID="Apu_Indice_Nombre" 
                                        runat="server" 
                                        Width="400px"
                                        CssClass="TEXTO_COMBOPER_KCG"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Indice_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Indice_Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        ID="rfv_Apu_Indice_Nombre"
                                        runat="server" 
                                        ControlToValidate="Apu_Indice_Nombre"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="vce_Apu_Indice_Nombre"
                                        TargetControlID="rfv_Apu_Indice_Nombre" />
                                    <AjaxControlToolkit:AutoCompleteExtender
                                        runat="server" 
                                        BehaviorID="AutoCom_ApuIndNom"
                                        ID="ace_ApuIndNom" 
                                        TargetControlID="Apu_Indice_Nombre"
                                        ServicePath="~/FIS/FIS_CATALOGO_INDICE.aspx" 
                                        ServiceMethod="Get_ApuIndNom"
                                        MinimumPrefixLength="0" 
                                        CompletionInterval="500"
                                        EnableCaching="true"
                                        CompletionSetCount="500"
                                        CompletionListCssClass="autocomplete_completionListElement" 
                                        CompletionListItemCssClass="autocomplete_listItem" 
                                        CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                        OnClientItemSelected="ItemSelected_ApuIndNom" >
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
                                                        var behavior = $find('AutoCom_ApuIndNom');
                                                        if (!behavior._height) {
                                                            var target = behavior.get_completionList();
                                                            behavior._height = target.offsetHeight - 2;
                                                            target.style.height = '0px';
                                                        }" />                                                    
                                                    <%-- Expand from 0px to the appropriate size while fading in --%>
                                                    <Parallel Duration=".4">
                                                        <FadeIn />
                                                        <Length PropertyKey="height" StartValue="0" EndValueScript="$find('AutoCom_ApuIndNom')._height" />
                                                    </Parallel>
                                                </Sequence>
                                            </OnShow>
                                            <OnHide>
                                                <%-- Collapse down to 0px and fade out --%>
                                                <Parallel Duration=".4">
                                                    <FadeOut />
                                                    <Length PropertyKey="height" StartValueScript="$find('AutoCom_ApuIndNom')._height" EndValue="0" />
                                                </Parallel>
                                            </OnHide>
                                        </Animations>
                                    </AjaxControlToolkit:AutoCompleteExtender> 
                                </td>
                                <td align="right" colspan="2">
                                    <asp:Label 
                                        ID="lbl_Estado_Nombre" 
                                        runat="server" 
                                        ForeColor="Red"
                                        Text='<%# Bind("Estado_Nombre") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label                                        
                                        ID="lbl_Valor_Indice"                                                                           
                                        runat="server"                                        
                                        Text='<%# GetLocalResourceObject("ValorRecursoKCG.Text").ToString() %>'>
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
                                        Mask="9,999,999,999,999.999"
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
                                        ID="mev_Valor" 
                                        runat="server"
                                        ControlExtender="mee_Valor"
                                        ControlToValidate="Valor"
                                        IsValidEmpty="False"
                                        EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        MinimumValue="0.000"
                                        MaximumValue="9999999999999.999" 
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
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label                                        
                                        ID="lbl_Observacion"                                                                           
                                        runat="server"                                        
                                        Text='<%# GetLocalResourceObject("DescripcionRecursoKCG.Text").ToString() %>'>
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
                            <tr align="left" >
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
                    
                    <%--Id's--%>     
                                   
                    <asp:TextBox 
                        ID="Fis_Catalogo_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Fis_Catalogo_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Apu_Indice_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Apu_Indice_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    
                    <%--campos no visibles--%>
                    
                    <asp:TextBox 
                        ID="Fis_Catalogo_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Fis_Catalogo_Nombre") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Fis_Catalogo_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Fis_Catalogo_Codigo") %>'>
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
                        ID="pnl_Precios_Indices" 
                        runat="server" 
                        meta:resourcekey="Rec_Fis_Catalogo_IndiceRecursoKCG" >
                        <table>
                            <tr>
                                <td>
                                    <asp:Label                                        
                                        ID="lbl_Codigo_Indice"                                                                           
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Apu_Indice_CodigoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">                                                                         
                                    <asp:TextBox 
                                        ID="Apu_Indice_Codigo" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Indice_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Indice_Codigo") %>'>
                                    </asp:TextBox>                                   
                                    <asp:Label                                        
                                        ID="lbl_Descripcion_Indice"                                                                           
                                        runat="server"                                        
                                        Text='<%# GetLocalResourceObject("Apu_Indice_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                    <asp:TextBox 
                                        ID="Apu_Indice_Nombre" 
                                        runat="server" 
                                        Width="400px"
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Indice_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Indice_Nombre") %>'>
                                    </asp:TextBox>                                    
                                </td>
                                <td align="right" colspan="2">
                                    <asp:Label 
                                        ID="lbl_Estado_Nombre" 
                                        runat="server" 
                                        ForeColor="Red"
                                        Text='<%# Bind("Estado_Nombre") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label                                        
                                        ID="lbl_Valor_Indice"                                                                           
                                        runat="server"                                        
                                        Text='<%# GetLocalResourceObject("ValorRecursoKCG.Text").ToString() %>'>
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
                                        Text='<%# Bind("Valor","{0:N3}") %>'>
                                    </asp:TextBox>                                    
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label                                        
                                        ID="lbl_Observacion"                                                                           
                                        runat="server"                                        
                                        Text='<%# GetLocalResourceObject("DescripcionRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>                                    
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Descripcion" 
                                        runat="server" 
                                        Width="400px"
                                        Height="50px"
                                        TextMode="MultiLine"
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        CssClass="TEXTO_LECTURA_KCG"
                                        ToolTip='<%# GetLocalResourceObject("DescripcionRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Descripcion") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr align="left" >
                                <td colspan="4">
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
                                    <uc2:wucMensajeEliminar ID="WucMensajeEliminar1" runat="server" /> 
                                </td>                             
                            </tr>
                        </table>                        
                    </asp:Panel>
                    
                    <%--Id's--%>     
                                   
                    <asp:TextBox 
                        ID="Fis_Catalogo_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Fis_Catalogo_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Apu_Indice_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Apu_Indice_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    
                    <%--campos no visibles--%>
                    
                    <asp:TextBox 
                        ID="Fis_Catalogo_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Fis_Catalogo_Nombre") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Fis_Catalogo_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Fis_Catalogo_Codigo") %>'>
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
                ID="odsFv_Fis_Catalogo_Indice" 
                runat="server" 
                ConflictDetection="CompareAllValues"
                DeleteMethod="Delete" 
                InsertMethod="Insert" 
                OldValuesParameterFormatString="original{0}"
                SelectMethod="GetById" 
                SortParameterName="sortExpression" 
                TypeName="FEL.FIS.BO_Fis_Catalogo_Indice"
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
                            GridViewID="Gv_Fis_Catalogo_Indice"
                            OnNavegar="nav_Siguiente" />
                    </td>
                    <td>
                        <koala:KFiltro 
                            ID="KFiltro" 
                            runat="server" 
                            Contenedor="FIS_CATALOGO_INDICE" 
                            Objeto="Fis_Catalogo_Indice" 
                            IndiceScope ="Scope"
                            Orden="1"
                            ObjectDataSourceID="odsGv_Fis_Catalogo_Indice" 
                            PaginacionFina="true"/>
                    </td>   
                    <td>
                        <asp:Button 
                            ID="Btn_Fis_Catalogo_Indice_Publicacion" 
                            runat="server" 
                            meta:resourcekey="Btn_Fis_Catalogo_Indice_PublicacionRecursoKCG"
                            OnClick="Btn_Fis_Catalogo_Indice_Publicacion_Click"/>
                    </td>     
                    <td>
                        <asp:Button 
                            ID="Btn_Fis_Catalogo_Indice_Categoria" 
                            runat="server" 
                            meta:resourcekey="Btn_Fis_Catalogo_Indice_CategoriaRecursoKCG"
                            OnClick="Btn_Fis_Catalogo_Indice_Categoria_Click"/>
                    </td>  
                    <td>
                        <asp:Button 
                            ID="Btn_FIs_Catalogo_Indice_ManoObra" 
                            runat="server" 
                            meta:resourcekey="Btn_FIs_Catalogo_Indice_ManoObraRecursoKCG"
                            OnClick="Btn_FIs_Catalogo_Indice_ManoObra_Click"/>
                    </td>                                                                       
                </tr>
            </table> 
            <asp:Panel 
                ID="pnl_listado" 
                runat="server"
                meta:resourcekey="Rec_Fis_Catalogo_Indice_ListadoRecursoKCG" >
                <koala:KGridBase  
                    ID="Gv_Fis_Catalogo_Indice" 
                    runat="server" 
                    AllowPaging="True" 
                    AllowSorting="True"
                    AutoGenerateColumns="False" 
                    DataKeyNames="Id" 
                    DataSourceID="odsGv_Fis_Catalogo_Indice"
                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>'
                    MostrarPaginacionSiempre="true">
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
                            SortExpression="Apu_Indice_Codigo">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Apu_Indice_Nombre" 
                            meta:resourcekey="BoundApu_Indice_NombreRecursoKCG" 
                            SortExpression="Apu_Indice_Nombre">
                            <ItemStyle Width="80mm" Wrap="true" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Valor" 
                            meta:resourcekey="BoundValorRecursoKCG" 
                            SortExpression="Valor"
                            DataFormatString="{0:N3}">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Descripcion" 
                            meta:resourcekey="BoundDescripcionRecursoKCG" 
                            SortExpression="Descripcion">
                            <ItemStyle Width="80mm" Wrap="true" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Fis_Catalogo_Id" 
                            HeaderText="Fis_Catalogo_Id" 
                            SortExpression="Fis_Catalogo_Id"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Indice_Id" 
                            HeaderText="Apu_Indice_Id" 
                            SortExpression="Apu_Indice_Id"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Fis_Catalogo_Nombre" 
                            HeaderText="Fis_Catalogo_Nombre"
                            SortExpression="Fis_Catalogo_Nombre" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Fis_Catalogo_Codigo" 
                            HeaderText="Fis_Catalogo_Codigo"
                            SortExpression="Fis_Catalogo_Codigo" 
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
                </Koala:KGridBase>
                <asp:ObjectDataSource 
                    ID="odsGv_Fis_Catalogo_Indice" 
                    runat="server" 
                    ConflictDetection="CompareAllValues"
                    OldValuesParameterFormatString="original_{0}" 
                    SelectMethod="GetByCatalogo" 
                    TypeName="FEL.FIS.BO_Fis_Catalogo_Indice">
                    <SelectParameters>
                        <asp:SessionParameter 
                            Name="s" 
                            SessionField="Scope" 
                            Type="Object" />
                        <asp:QueryStringParameter 
                            Name="Fis_Catalogo_Id" 
                            QueryStringField="Fis_Catalogo_Id"
                            Type="String" />
                        <asp:Parameter 
                            Name="Apu_Indice_Codigo_Desde" 
                            Type="String" />
                        <asp:Parameter 
                            Name="Apu_Indice_Codigo_Hasta" 
                            Type="String" />
                        <asp:Parameter 
                            Name="Apu_Indice_Nombre" 
                            Type="String" />
                        <asp:Parameter 
                            Name="Valor_Desde" 
                            Type="Decimal" />
                        <asp:Parameter 
                            Name="Valor_Hasta" 
                            Type="Decimal" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

