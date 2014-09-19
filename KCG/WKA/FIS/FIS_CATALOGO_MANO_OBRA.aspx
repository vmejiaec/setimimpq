<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="FIS_CATALOGO_MANO_OBRA.aspx.cs" 
    Inherits="FIS_FIS_CATALOGO_MANO_OBRA" 
    meta:resourcekey="Tit_Fis_Catalogo_Mano_ObraRecursoKCG"
    Theme="EstiloKCG"
    StylesheetTheme="EstiloKCG" %>
    
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
    
<asp:Content 
    ID="Content1" 
    ContentPlaceHolderID="ContentPlaceHolder1" 
    Runat="Server">
    <asp:UpdatePanel 
        ID="UpdatePanel1" 
        runat="server">
        <ContentTemplate>
        
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
        
            <script type="text/javascript">
                function ItemSelected_Apu_Mano_Obra_Nombre( source, eventArgs ) 
                    {   
                        var valor = eventArgs.get_value();
                        var temp = new Array();
                        temp = valor.split('||');
                                                            
                        var Apu_Mano_Obra_Id = $get("ctl00_ContentPlaceHolder1_Fv_Fis_Catalogo_Mano_Obra_Apu_Mano_Obra_Id");
                        Apu_Mano_Obra_Id.value = temp[0];  
                        var Apu_Mano_Obra_Codigo = $get("ctl00_ContentPlaceHolder1_Fv_Fis_Catalogo_Mano_Obra_Apu_Mano_Obra_Codigo");
                        Apu_Mano_Obra_Codigo.value = temp[1]; 
                        var Apu_Mano_Obra_Nombre = $get("ctl00_ContentPlaceHolder1_Fv_Fis_Catalogo_Mano_Obra_Apu_Mano_Obra_Nombre");
                        Apu_Mano_Obra_Nombre.value = temp[2];  
                        var Apu_Categoria_Id = $get("ctl00_ContentPlaceHolder1_Fv_Fis_Catalogo_Mano_Obra_Apu_Categoria_Id");
                        Apu_Categoria_Id.value = temp[3]; 
                        var Apu_Categoria_Codigo = $get("ctl00_ContentPlaceHolder1_Fv_Fis_Catalogo_Mano_Obra_Apu_Categoria_Codigo");
                        Apu_Categoria_Codigo.value = temp[4];  
                        var Apu_Categoria_Nombre = $get("ctl00_ContentPlaceHolder1_Fv_Fis_Catalogo_Mano_Obra_Apu_Categoria_Nombre");
                        Apu_Categoria_Nombre.value = temp[5]; 
                        var Valor = $get("ctl00_ContentPlaceHolder1_Fv_Fis_Catalogo_Mano_Obra_Valor");       
                        
                        if(Apu_Categoria_Nombre.value == "")                        
                            Valor.disabled  = false;
                        else
                        {
                            Valor.disabled  = true;                              
                            if(Valor.value == "")
                                Valor.value = "0,00";    
                        }                                                                                                                                                                                              
                    }  
            </script>
            <asp:FormView 
                ID="Fv_Fis_Catalogo_Mano_Obra" 
                runat="server" 
                DataSourceID="odsFv_Fis_Catalogo_Mano_Obra"
                DefaultMode="Insert">
                <EditItemTemplate>
                    <asp:Panel
                        ID="pnl_Publicacion"
                        runat="server"
                        meta:resourcekey="Rec_Fis_Catalogo_PublicacionRecursoKCG">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lbl_Codigo_Publicacion"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Fis_Catalogo_CodigoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Fis_Catalogo_Codigo" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1" 
                                        ToolTip='<%# GetLocalResourceObject("Fis_Catalogo_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Fis_Catalogo_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:Label
                                        ID="lbl_Fecha_Publicacion"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Fis_Catalogo_Fecha_PublicacionRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                    <asp:TextBox 
                                        ID="Fis_Catalogo_Fecha_Publicacion" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1" 
                                        ToolTip='<%# GetLocalResourceObject("Fis_Catalogo_Fecha_PublicacionRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Fis_Catalogo_Fecha_Publicacion","{0:dd/MM/yyyy}") %>'>
                                    </asp:TextBox>
                                    <asp:Label
                                        ID="lbl_Fecha_Registro"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Fis_Catalogo_Fecha_CreacionRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                    <asp:TextBox 
                                        ID="Fis_Catalogo_Fecha_Creacion" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1" 
                                        ToolTip='<%# GetLocalResourceObject("Fis_Catalogo_Fecha_CreacionRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Fis_Catalogo_Fecha_Creacion","{0:dd/MM/yyyy}") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lbl_Fuente"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Fis_Catalogo_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>    
                                    <asp:TextBox 
                                        ID="Fis_Catalogo_Nombre" 
                                        runat="server" 
                                        Width="400px"                                     
                                        ReadOnly="true"
                                        TabIndex="-1" 
                                        ToolTip='<%# GetLocalResourceObject("Fis_Catalogo_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Fis_Catalogo_Nombre") %>'>
                                    </asp:TextBox>                                
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <asp:Panel
                        ID="pnl_Precio_Mano_Obra"
                        runat="server"
                        meta:resourcekey="Rec_Fis_Catalogo_PrecioRecursoKCG">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lbl_Codigo_Mano_Obra"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Apu_Mano_Obra_CodigoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Apu_Mano_Obra_Codigo" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1" 
                                        ToolTip='<%# GetLocalResourceObject("Apu_Mano_Obra_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Mano_Obra_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:Label
                                        ID="lbl_Mano_Obra"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Apu_Mano_Obra_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                    <asp:TextBox 
                                        ID="Apu_Mano_Obra_Nombre" 
                                        runat="server" 
                                        Width="400px"                                     
                                        CssClass="TEXTO_COMBOPER_KCG"   
                                        ToolTip='<%# GetLocalResourceObject("Apu_Mano_Obra_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Mano_Obra_Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        ID="rfv_Apu_Mano_Obra_Nombre"
                                        runat="server" 
                                        ControlToValidate="Apu_Mano_Obra_Nombre"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="vce_Apu_Mano_Obra_Nombre"
                                        TargetControlID="rfv_Apu_Mano_Obra_Nombre"/>
                                     <AjaxControlToolkit:AutoCompleteExtender
                                        runat="server" 
                                        BehaviorID="AutoCompleteEx_Mano_Obra"
                                        ID="AutoCo_Mano_Obra" 
                                        TargetControlID="Apu_Mano_Obra_Nombre"
                                        ServicePath="~/FIS/FIS_CATALOGO_MANO_OBRA.aspx" 
                                        ServiceMethod="Get_Apu_Mano_Obra_Nombre"
                                        MinimumPrefixLength="0" 
                                        CompletionInterval="500"
                                        EnableCaching="true"
                                        CompletionSetCount="500"
                                        CompletionListCssClass="autocomplete_completionListElement" 
                                        CompletionListItemCssClass="autocomplete_listItem" 
                                        CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                        OnClientItemSelected="ItemSelected_Apu_Mano_Obra_Nombre" >    
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
                                                        var behavior = $find('AutoCompleteEx_Mano_Obra');
                                                        if (!behavior._height) {
                                                            var target = behavior.get_completionList();
                                                            behavior._height = target.offsetHeight - 2;
                                                            target.style.height = '0px';
                                                        }" />                                                    
                                                    <%-- Expand from 0px to the appropriate size while fading in --%>
                                                    <Parallel Duration=".4">
                                                        <FadeIn />
                                                        <Length PropertyKey="height" StartValue="0" EndValueScript="$find('AutoCompleteEx_Mano_Obra')._height" />
                                                    </Parallel>
                                                </Sequence>
                                            </OnShow>
                                            <OnHide>
                                                <%-- Collapse down to 0px and fade out --%>
                                                <Parallel Duration=".4">
                                                    <FadeOut />
                                                    <Length PropertyKey="height" StartValueScript="$find('AutoCompleteEx_Mano_Obra')._height" EndValue="0" />
                                                </Parallel>
                                            </OnHide>
                                        </Animations>
                                    </AjaxControlToolkit:AutoCompleteExtender> 
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lbl_Codigo_Categoria"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Apu_Categoria_CodigoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Apu_Categoria_Codigo" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1" 
                                        ToolTip='<%# GetLocalResourceObject("Apu_Categoria_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Categoria_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:Label
                                        ID="lbl_Categoria"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Apu_Categoria_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                    <asp:TextBox 
                                        ID="Apu_Categoria_Nombre" 
                                        runat="server" 
                                        Width="400px"                                     
                                        ReadOnly="true"
                                        TabIndex="-1" 
                                        ToolTip='<%# GetLocalResourceObject("Apu_Categoria_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Categoria_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lbl_Salario_Real"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("ValorRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td> 
                                    <asp:TextBox 
                                        ID="Valor" 
                                        runat="server" 
                                        style="text-align:right"
                                        CssClass="TEXTO_EDICION_KCG"  
                                        ToolTip='<%# GetLocalResourceObject("ValorRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Valor") %>'>
                                    </asp:TextBox>   
                                    <AjaxControlToolkit:MaskedEditExtender 
                                        ID="fValor" 
                                        runat="server"
                                        TargetControlID="Valor"
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
                                        ID="mev_Valor" 
                                        runat="server"
                                        ControlExtender="fValor"
                                        ControlToValidate="Valor"
                                        IsValidEmpty="False"
                                        EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.ErrorMessage").ToString() %>'
                                        InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.ErrorMessage").ToString() %>'
                                        MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.ErrorMessage").ToString() %>'
                                        MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.ErrorMessage").ToString() %>'
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
                                        ID="vce_Valor"
                                        TargetControlID="mev_Valor"/>                                 
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lbl_Observaciones"
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
                                        CssClass="TEXTO_EDICION_KCG"  
                                        TextMode="MultiLine"
                                        ToolTip='<%# GetLocalResourceObject("DescripcionRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Descripcion") %>'>
                                    </asp:TextBox>
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
                        ID="Fis_Catalogo_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Fis_Catalogo_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Categoria_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Apu_Categoria_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Mano_Obra_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Apu_Mano_Obra_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    
                        <%--CAMPOS OCULTOS--%>
                    
                    <asp:TextBox 
                        ID="Fis_Catalogo_Categoria_Valor" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Fis_Catalogo_Categoria_Valor") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Fis_Catalogo_CMO_Valor" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Fis_Catalogo_CMO_Valor") %>'>
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
                        ID="pnl_Publicacion"
                        runat="server"
                        meta:resourcekey="Rec_Fis_Catalogo_PublicacionRecursoKCG">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lbl_Codigo_Publicacion"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Fis_Catalogo_CodigoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Fis_Catalogo_Codigo" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1" 
                                        ToolTip='<%# GetLocalResourceObject("Fis_Catalogo_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Fis_Catalogo_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:Label
                                        ID="lbl_Fecha_Publicacion"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Fis_Catalogo_Fecha_PublicacionRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                    <asp:TextBox 
                                        ID="Fis_Catalogo_Fecha_Publicacion" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1" 
                                        ToolTip='<%# GetLocalResourceObject("Fis_Catalogo_Fecha_PublicacionRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Fis_Catalogo_Fecha_Publicacion") %>'>
                                    </asp:TextBox>
                                    <asp:Label
                                        ID="lbl_Fecha_Registro"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Fis_Catalogo_Fecha_CreacionRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                    <asp:TextBox 
                                        ID="Fis_Catalogo_Fecha_Creacion" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1" 
                                        ToolTip='<%# GetLocalResourceObject("Fis_Catalogo_Fecha_CreacionRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Fis_Catalogo_Fecha_Creacion") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lbl_Fuente"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Fis_Catalogo_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>    
                                    <asp:TextBox 
                                        ID="Fis_Catalogo_Nombre" 
                                        runat="server" 
                                        Width="400px"                                     
                                        ReadOnly="true"
                                        TabIndex="-1" 
                                        ToolTip='<%# GetLocalResourceObject("Fis_Catalogo_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Fis_Catalogo_Nombre") %>'>
                                    </asp:TextBox>                                
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <asp:Panel
                        ID="pnl_Precio_Mano_Obra"
                        runat="server"
                        meta:resourcekey="Rec_Fis_Catalogo_PrecioRecursoKCG">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lbl_Codigo_Mano_Obra"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Apu_Mano_Obra_CodigoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Apu_Mano_Obra_Codigo" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1" 
                                        ToolTip='<%# GetLocalResourceObject("Apu_Mano_Obra_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Mano_Obra_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:Label
                                        ID="lbl_Mano_Obra"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Apu_Mano_Obra_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                    <asp:TextBox 
                                        ID="Apu_Mano_Obra_Nombre" 
                                        runat="server" 
                                        Width="400px"                                     
                                        CssClass="TEXTO_COMBOPER_KCG"   
                                        ToolTip='<%# GetLocalResourceObject("Apu_Mano_Obra_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Mano_Obra_Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        ID="rfv_Apu_Mano_Obra_Nombre"
                                        runat="server" 
                                        ControlToValidate="Apu_Mano_Obra_Nombre"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="vce_Apu_Mano_Obra_Nombre"
                                        TargetControlID="rfv_Apu_Mano_Obra_Nombre"/>
                                     <AjaxControlToolkit:AutoCompleteExtender
                                        runat="server" 
                                        BehaviorID="AutoCompleteEx_Mano_Obra"
                                        ID="AutoCo_Mano_Obra" 
                                        TargetControlID="Apu_Mano_Obra_Nombre"
                                        ServicePath="~/FIS/FIS_CATALOGO_MANO_OBRA.aspx" 
                                        ServiceMethod="Get_Apu_Mano_Obra_Nombre"
                                        MinimumPrefixLength="0" 
                                        CompletionInterval="500"
                                        EnableCaching="true"
                                        CompletionSetCount="500"
                                        CompletionListCssClass="autocomplete_completionListElement" 
                                        CompletionListItemCssClass="autocomplete_listItem" 
                                        CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                        OnClientItemSelected="ItemSelected_Apu_Mano_Obra_Nombre" >    
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
                                                        var behavior = $find('AutoCompleteEx_Mano_Obra');
                                                        if (!behavior._height) {
                                                            var target = behavior.get_completionList();
                                                            behavior._height = target.offsetHeight - 2;
                                                            target.style.height = '0px';
                                                        }" />                                                    
                                                    <%-- Expand from 0px to the appropriate size while fading in --%>
                                                    <Parallel Duration=".4">
                                                        <FadeIn />
                                                        <Length PropertyKey="height" StartValue="0" EndValueScript="$find('AutoCompleteEx_Mano_Obra')._height" />
                                                    </Parallel>
                                                </Sequence>
                                            </OnShow>
                                            <OnHide>
                                                <%-- Collapse down to 0px and fade out --%>
                                                <Parallel Duration=".4">
                                                    <FadeOut />
                                                    <Length PropertyKey="height" StartValueScript="$find('AutoCompleteEx_Mano_Obra')._height" EndValue="0" />
                                                </Parallel>
                                            </OnHide>
                                        </Animations>
                                    </AjaxControlToolkit:AutoCompleteExtender> 
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lbl_Codigo_Categoria"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Apu_Categoria_CodigoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Apu_Categoria_Codigo" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1" 
                                        ToolTip='<%# GetLocalResourceObject("Apu_Categoria_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Categoria_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:Label
                                        ID="lbl_Categoria"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Apu_Categoria_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                    <asp:TextBox 
                                        ID="Apu_Categoria_Nombre" 
                                        runat="server" 
                                        Width="400px"                                     
                                        ReadOnly="true"
                                        TabIndex="-1" 
                                        ToolTip='<%# GetLocalResourceObject("Apu_Categoria_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Categoria_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lbl_Salario_Real"
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
                                        ID="fValor" 
                                        runat="server"
                                        TargetControlID="Valor"
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
                                        ID="mev_Valor" 
                                        runat="server"
                                        ControlExtender="fValor"
                                        ControlToValidate="Valor"
                                        IsValidEmpty="False"
                                        EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.ErrorMessage").ToString() %>'
                                        InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.ErrorMessage").ToString() %>'
                                        MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.ErrorMessage").ToString() %>'
                                        MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.ErrorMessage").ToString() %>'
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
                                        ID="vce_Valor"
                                        TargetControlID="mev_Valor"/>                                 
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lbl_Observaciones"
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
                                        CssClass="TEXTO_EDICION_KCG"  
                                        TextMode="MultiLine"
                                        ToolTip='<%# GetLocalResourceObject("DescripcionRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Descripcion") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
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
                                  </td>   
                                  <td>
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
                        ID="Fis_Catalogo_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Fis_Catalogo_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Categoria_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Apu_Categoria_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Mano_Obra_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Apu_Mano_Obra_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    
                        <%--CAMPOS OCULTOS--%>
                    
                    <asp:TextBox 
                        ID="Fis_Catalogo_Categoria_Valor" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Fis_Catalogo_Categoria_Valor") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Fis_Catalogo_CMO_Valor" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Fis_Catalogo_CMO_Valor") %>'>
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
                        ID="pnl_Publicacion"
                        runat="server"
                        meta:resourcekey="Rec_Fis_Catalogo_PublicacionRecursoKCG">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lbl_Codigo_Publicacion"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Fis_Catalogo_CodigoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Fis_Catalogo_Codigo" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1" 
                                        ToolTip='<%# GetLocalResourceObject("Fis_Catalogo_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Fis_Catalogo_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:Label
                                        ID="lbl_Fecha_Publicacion"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Fis_Catalogo_Fecha_PublicacionRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                    <asp:TextBox 
                                        ID="Fis_Catalogo_Fecha_Publicacion" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1" 
                                        ToolTip='<%# GetLocalResourceObject("Fis_Catalogo_Fecha_PublicacionRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Fis_Catalogo_Fecha_Publicacion","{0:dd/MM/yyyy}") %>'>
                                    </asp:TextBox>
                                    <asp:Label
                                        ID="lbl_Fecha_Registro"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Fis_Catalogo_Fecha_CreacionRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                    <asp:TextBox 
                                        ID="Fis_Catalogo_Fecha_Creacion" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1" 
                                        ToolTip='<%# GetLocalResourceObject("Fis_Catalogo_Fecha_CreacionRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Fis_Catalogo_Fecha_Creacion","{0:dd/MM/yyyy}") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lbl_Fuente"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Fis_Catalogo_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>    
                                    <asp:TextBox 
                                        ID="Fis_Catalogo_Nombre" 
                                        runat="server" 
                                        Width="400px"                                     
                                        ReadOnly="true"
                                        TabIndex="-1" 
                                        ToolTip='<%# GetLocalResourceObject("Fis_Catalogo_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Fis_Catalogo_Nombre") %>'>
                                    </asp:TextBox>                                
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <asp:Panel
                        ID="pnl_Precio_Mano_Obra"
                        runat="server"
                        meta:resourcekey="Rec_Fis_Catalogo_PrecioRecursoKCG">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lbl_Codigo_Mano_Obra"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Apu_Mano_Obra_CodigoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Apu_Mano_Obra_Codigo" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1" 
                                        ToolTip='<%# GetLocalResourceObject("Apu_Mano_Obra_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Mano_Obra_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:Label
                                        ID="lbl_Mano_Obra"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Apu_Mano_Obra_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                    <asp:TextBox 
                                        ID="Apu_Mano_Obra_Nombre" 
                                        runat="server" 
                                        Width="400px"                                     
                                        ReadOnly="true"
                                        TabIndex="-1" 
                                        ToolTip='<%# GetLocalResourceObject("Apu_Mano_Obra_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Mano_Obra_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lbl_Codigo_Categoria"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Apu_Categoria_CodigoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Apu_Categoria_Codigo" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1" 
                                        ToolTip='<%# GetLocalResourceObject("Apu_Categoria_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Categoria_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:Label
                                        ID="lbl_Categoria"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Apu_Categoria_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                    <asp:TextBox 
                                        ID="Apu_Categoria_Nombre" 
                                        runat="server" 
                                        Width="400px"                                     
                                        ReadOnly="true"
                                        TabIndex="-1" 
                                        ToolTip='<%# GetLocalResourceObject("Apu_Categoria_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Categoria_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lbl_Salario_Real"
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
                                        Text='<%# Bind("Valor","{0:N2}") %>'>
                                    </asp:TextBox>                                   
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lbl_Observaciones"
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
                                        ReadOnly="true"
                                        TabIndex="-1" 
                                        CssClass="TEXTO_LECTURA_KCG"
                                        TextMode="MultiLine"
                                        ToolTip='<%# GetLocalResourceObject("DescripcionRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Descripcion") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr align="left">
                                <td colspan="2">
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
                        ID="Fis_Catalogo_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Fis_Catalogo_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Categoria_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Apu_Categoria_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Mano_Obra_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Apu_Mano_Obra_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    
                        <%--CAMPOS OCULTOS--%>
                    
                    <asp:TextBox 
                        ID="Fis_Catalogo_Categoria_Valor" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Fis_Catalogo_Categoria_Valor") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Fis_Catalogo_CMO_Valor" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Fis_Catalogo_CMO_Valor") %>'>
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
                ID="odsFv_Fis_Catalogo_Mano_Obra" 
                runat="server" 
                ConflictDetection="CompareAllValues"
                DeleteMethod="Delete" 
                InsertMethod="Insert" 
                OldValuesParameterFormatString="original{0}"
                SelectMethod="GetById" 
                SortParameterName="sortExpression" 
                TypeName="FEL.FIS.BO_Fis_Catalogo_Mano_Obra"
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
                            GridViewID="Gv_Fis_Catalogo_Mano_Obra"
                            OnNavegar="nav_Siguiente" />
                    </td>
                    <td>
                        <koala:KFiltro 
                            ID="KFiltro" 
                            runat="server" 
                            Contenedor="FIS_CATALOGO_MANO_OBRA" 
                            Objeto="Fis_Catalogo_Mano_Obra" 
                            IndiceScope ="Scope"
                            Orden="1"
                            ObjectDataSourceID="odsGv_Fis_Catalogo_Mano_Obra" />
                    </td>  
                    
                    <td>
                        <asp:Button 
                            ID="Btn_Fis_Catalogo" 
                            runat="server" 
                            meta:resourcekey="Btn_Fis_CatalogoRecursoKCG"
                            OnClick="Btn_Fis_Catalogo_Click"/>
                    </td>  
                </tr>
            </table>
            <asp:Panel
                ID="pnl_Listado"
                runat="server"
                meta:resourcekey="Rec_Fis_Catalogo_ListadoRecursoKCG">
                <Koala:KGridBase
                    ID="Gv_Fis_Catalogo_Mano_Obra" 
                    runat="server" 
                    AllowPaging="True" 
                    AllowSorting="True"
                    AutoGenerateColumns="False" 
                    DataKeyNames="Id" 
                    DataSourceID="odsGv_Fis_Catalogo_Mano_Obra"
                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>' MostrarPaginacionSiempre="True" >                    
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
                            SortExpression="Apu_Mano_Obra_Codigo">
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Apu_Mano_Obra_Nombre" 
                            meta:resourcekey="BoundApu_Mano_Obra_NombreRecursoKCG"
                            SortExpression="Apu_Mano_Obra_Nombre">
                            <ItemStyle HorizontalAlign="Left" Width="80mm" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Apu_Categoria_Nombre" 
                            meta:resourcekey="BoundApu_Categoria_NombreRecursoKCG"
                            SortExpression="Apu_Categoria_Nombre">
                            <ItemStyle HorizontalAlign="Left" Width="40mm" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Fis_Catalogo_CMO_Valor" 
                            meta:resourcekey="BoundFis_Catalogo_CMO_ValorRecursoKCG"
                            SortExpression="Fis_Catalogo_CMO_Valor" 
                            dataformatstring="{0:N2}" >
                            <itemstyle wrap="False" horizontalalign="Right" />
                        </asp:BoundField>  
                        <asp:BoundField 
                            DataField="Descripcion" 
                            meta:resourcekey="BoundDescripcionRecursoKCG"
                            SortExpression="Descripcion">
                            <ItemStyle HorizontalAlign="Left" Width="80mm" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Fis_Catalogo_Id" 
                            HeaderText="Fis_Catalogo_Id" 
                            SortExpression="Fis_Catalogo_Id"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Categoria_Id" 
                            HeaderText="Apu_Categoria_Id" 
                            SortExpression="Apu_Categoria_Id"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Mano_Obra_Id" 
                            HeaderText="Apu_Mano_Obra_Id" 
                            SortExpression="Apu_Mano_Obra_Id"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Valor" 
                            HeaderText="Valor" 
                            SortExpression="Valor" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Fis_Catalogo_Codigo" 
                            HeaderText="Fis_Catalogo_Codigo"
                            SortExpression="Fis_Catalogo_Codigo" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Fis_Catalogo_Nombre" 
                            HeaderText="Fis_Catalogo_Nombre"
                            SortExpression="Fis_Catalogo_Nombre" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Fis_Catalogo_Fecha_Publicacion" 
                            HeaderText="Fis_Catalogo_Fecha_Publicacion"
                            SortExpression="Fis_Catalogo_Fecha_Publicacion" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Fis_Catalogo_Fecha_Creacion" 
                            HeaderText="Fis_Catalogo_Fecha_Creacion"
                            SortExpression="Fis_Catalogo_Fecha_Creacion" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Categoria_Codigo" 
                            HeaderText="Apu_Categoria_Codigo"
                            SortExpression="Apu_Categoria_Codigo" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Fis_Catalogo_Categoria_Valor" 
                            HeaderText="Fis_Catalogo_Categoria_Valor"
                            SortExpression="Fis_Catalogo_Categoria_Valor" 
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
                    ID="odsGv_Fis_Catalogo_Mano_Obra" 
                    runat="server" 
                    OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetByCatalogo" 
                    TypeName="FEL.FIS.BO_Fis_Catalogo_Mano_Obra" 
                    ConflictDetection="CompareAllValues">
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
                            Name="Apu_Categoria_Codigo_Desde" 
                            Type="String" />
                        <asp:Parameter 
                            Name="Apu_Categoria_Codigo_Hasta" 
                            Type="String" />
                        <asp:Parameter 
                            Name="Apu_Categoria_Nombre" 
                            Type="String" />
                        <asp:Parameter 
                            Name="Apu_Mano_Obra_Codigo_Desde" 
                            Type="String" />
                        <asp:Parameter 
                            Name="Apu_Mano_Obra_Codigo_Hasta" 
                            Type="String" />
                        <asp:Parameter 
                            Name="Apu_Mano_Obra_Nombre" 
                            Type="String" />
                        <asp:Parameter 
                            Name="Fis_Catalogo_CMO_Valor_Desde" 
                            Type="Decimal" />
                        <asp:Parameter 
                            Name="Fis_Catalogo_CMO_Valor_Hasta" 
                            Type="Decimal" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

