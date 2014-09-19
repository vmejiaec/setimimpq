<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="APU_PROYECTO_MANO_OBRA.aspx.cs" 
    Inherits="APU_APU_PROYECTO_MANO_OBRA" 
    Theme="EstiloKCG"
    StylesheetTheme="EstiloKCG" 
    Meta:ResourceKey="Tit_Apu_Proyecto_Mano_ObraRecursoKCG"%>
    
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
    runat="server"
    UpdateMode="Conditional">
        <ContentTemplate>
            <asp:FormView 
                ID="fvapu_proyecto_mano_obra" 
                runat="server" 
                DataSourceID="odsfvapu_proyecto_mano_obra"
                DefaultMode="Insert">
                <EditItemTemplate>
                    <asp:Panel                       
                        runat="server"
                        id="Panel1"
                        meta:resourcekey="Rec_Apu_Proyecto_Mano_Obra_ProyectoRecursoKCG">
                        <table>
                            <tr align="left">
                                <td> 
                                    <asp:Label
                                        id="lblproyecto"
                                        runat="server"
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                        AssociatedControlID="Apu_Proyecto_Codigo"
                                        Text='<%# GetLocalResourceObject("Apu_Proyecto_NombreRecursoKCG.Text").ToString() %>'> 
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Proyecto_Codigo" 
                                        runat="server"    
                                        TabIndex="-1"                                     
                                        ReadOnly="True"
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
                                        ReadOnly="True" 
                                        TabIndex="-1"
                                        width="400px"
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
                    <asp:Panel
                        runat="server"
                        id="Panel2"                        
                        meta:Resourcekey="Rec_Apu_Proyecto_Mano_ObraRecursoKCG">                        
                        <table>
                            <tr align="right">
                                <td colspan="2">
                                    <asp:Label
                                        ID="lblEstado_Nombre" 
                                        runat="server" 
                                        Text='<%# Bind("Estado_Nombre") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr align="left">
                                <td> 
                                    <asp:Label
                                        id="lblCódigo"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'> 
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Codigo" 
                                        runat="server"   
                                        TabIndex="-1"                                      
                                        ReadOnly="true" 
                                        ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Codigo") %>'>
                                    </asp:TextBox>                                        
                                </td>
                            </tr>  
                            <tr align="left">
                                <td>
                                    <asp:Label
                                        id="lblNombre"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Apu_Mano_Obra_NombreRecursoKCG.Text").ToString() %>'> 
                                    </asp:Label>                                         
                                </td>    
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Mano_Obra_Nombre" 
                                        runat="server"                                         
                                        ReadOnly="true" 
                                        Height="50px"
                                        TextMode="MultiLine" 
                                        CssClass ="TEXTO_LECTURA_KCG"
                                        Width="400px"
                                        Style="text-transform:uppercase"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Mano_Obra_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Mano_Obra_Nombre") %>'>
                                    </asp:TextBox>
                                </td>                    
                            </tr>                        
                            <tr align="left">
                                <td>
                                    <asp:Label
                                     id="lblCategoria"
                                     runat="server"
                                     Text='<%# GetLocalResourceObject("Apu_Categoria_CodigoRecursoKCG.Text").ToString() %>'>                                     
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">
                                     <asp:TextBox 
                                     ID="Apu_Categoria_Codigo" 
                                     runat="server"                                      
                                     CssClass="TEXTO_EDICION_KCG"
                                     ToolTip='<%# GetLocalResourceObject("Apu_Categoria_CodigoRecursoKCG.ToolTip").ToString() %>'
                                     Text='<%# Bind("Apu_Categoria_Codigo") %>'>
                                     </asp:TextBox>           
                                    <asp:TextBox 
                                         ID="Apu_Categoria_Nombre" 
                                         runat="server"                                      
                                         CssClass="TEXTO_COMBOPER_KCG"
                                         width="400px"
                                         ToolTip='<%# GetLocalResourceObject("Apu_Categoria_NombreRecursoKCG.ToolTip").ToString() %>'
                                         Text='<%# Bind("Apu_Categoria_Nombre") %>'>
                                    </asp:TextBox>                                                            
                                    <AjaxControlToolkit:AutoCompleteExtender
                                        runat="server" 
                                        BehaviorID="AutoCompleteEx"
                                        ID="autoComplete1" 
                                        TargetControlID="Apu_Categoria_Nombre"
                                        ServicePath="~/APU/APU_PROYECTO_MANO_OBRA.aspx" 
                                        ServiceMethod="GetManoDeObra"
                                        MinimumPrefixLength="1" 
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
                            <tr align="left">
                               <td>
                                    <asp:Label
                                    id="lblJornalDiario"
                                    runat="server"
                                    Text='<%# GetLocalResourceObject("Costo_DiarioRecursoKCG.Text").ToString() %>'> 
                                    </asp:Label>
                               </td>
                               <td style="white-space:nowrap">
                                    <asp:TextBox 
                                    ID="Costo_Diario" 
                                    runat="server"         
                                    CssClass="TEXTO_EDICION_KCG"                                                                
                                    style="text-align:right"
                                    ToolTip='<%# GetLocalResourceObject("Costo_DiarioRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Costo_Diario") %>'>
                                    </asp:TextBox>  
                                    <asp:Label 
                                        ID="Lblmoneda1" 
                                        runat="server" 
                                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                                    <AjaxControlToolkit:MaskedEditExtender   
                                    ID="meeCosto_Diario" 
                                    runat="server"
                                    TargetControlID="Costo_Diario"
                                    Mask="9,999,999,999,999.9999"
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
                                    ControlExtender="meeCosto_Diario"
                                    ControlToValidate="Costo_Diario"
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
                                    ID="ValidatorCalloutExtender1"
                                    TargetControlID="MaskedEditValidator2"/> 
                                                               
                                    <asp:TextBox 
                                        ID="Apu_Mano_Obra_Costo_Diario" 
                                        runat="server"                                        
                          
                                        style="text-align:right"
                              
                                        ToolTip='<%# GetLocalResourceObject("Apu_Mano_Obra_Costo_DiarioRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Mano_Obra_Costo_Diario") %>'>
                                    </asp:TextBox>                                    
                                    <asp:Label 
                                        ID="Label2" 
                                        runat="server"
                                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                                    <AjaxControlToolkit:MaskedEditExtender   
                                    ID="MaskedEditExtender1" 
                                    runat="server"
                                    TargetControlID="Apu_Mano_Obra_Costo_Diario"
                                    Mask="9,999,999,999,999.9999"
                                    MessageValidatorTip="false"
                                    OnFocusCssClass="MaskedEditFocus"
                                    OnInvalidCssClass="MaskedEditError"
                                    MaskType="Number"
                                    InputDirection="RightToLeft"
                                    AcceptNegative="None"
                                    DisplayMoney="None"
                                    ErrorTooltipEnabled="false"
                                    ClearMaskOnLostFocus="True"/>  
                               </td>
                            </tr>
                            <tr align="left">
                               <td>
                                    <asp:Label
                                     id="lblJornalHora"
                                     runat="server"
                                     Text='<%# GetLocalResourceObject("Costo_HoraRecursoKCG.Text").ToString() %>'> 
                                    </asp:Label>     
                               </td>
                               <td>
                                    <asp:TextBox 
                                      ID="Costo_Hora" 
                                      runat="server"                                       
                                      ReadOnly="True" 
                                      style="text-align:right"
                                      tabindex="-1"
                                      ToolTip='<%# GetLocalResourceObject("Costo_HoraRecursoKCG.ToolTip").ToString() %>'
                                      Text='<%# Bind("Costo_Hora","{0:N4}") %>'>
                                    </asp:TextBox>
                                    <asp:Label 
                                        ID="Label1" 
                                        runat="server" 
                                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
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
                                  <uc2:wucMensajeActualizar ID="WucMensajeActualizar1" runat="server" />
                                </td>
                            </tr>                      
                        </table>
                    </asp:Panel>  
                    
                    <%--ids--%>
                    <asp:TextBox 
                        ID="Apu_Indice_Id" 
                        runat="server" 
                        style="display:none"
                        visible="true"
                        Text='<%# Bind("Apu_Indice_Id") %>'>
                    </asp:TextBox> 
                    <asp:TextBox 
                        ID="Apu_Proyecto_Id" 
                        runat="server" 
                        style="display:none"
                        visible="true"
                        Text='<%# Bind("Apu_Proyecto_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Mano_Obra_Id" 
                        runat="server" 
                        style="display:none"
                        visible="true"
                        Text='<%# Bind("Apu_Mano_Obra_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Categoria_Id" 
                        runat="server" 
                        style="display:none"
                        visible="true"
                        Text='<%# Bind("Apu_Categoria_Id") %>'>                        
                    </asp:TextBox> 
                    <asp:TextBox 
                        ID="Id" 
                        runat="server"
                        style="display:none"
                        visible="true" 
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>  
                    
                    <%--Campos no visibles--%>
                        
                    <asp:TextBox 
                        ID="Apu_Indice_Nombre" 
                        runat="server" 
                        visible="false"
                        Text='<%# Bind("Apu_Indice_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Estado_Nombre" 
                        runat="server" 
                        visible="false"
                        Text='<%# Bind("Estado_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Proyecto_Etapa" 
                        runat="server" 
                        visible="false"
                        Text='<%# Bind("Apu_Proyecto_Etapa") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Mano_Obra_Codigo" 
                        runat="server" 
                        visible="false"
                        Text='<%# Bind("Apu_Mano_Obra_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Cantidad_Mano_Obra" 
                        runat="server" 
                        visible="false"
                        Text='<%# Bind("Cantidad_Mano_Obra") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Costo_Total" 
                        runat="server" 
                        visible="false"
                        Text='<%# Bind("Costo_Total") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Indice_Codigo" 
                        runat="server" 
                        visible="false"
                        Text='<%# Bind("Apu_Indice_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Cantidad_Mano_Obra_X_Costo" 
                        runat="server" 
                        visible="false"
                        Text='<%# Bind("Cantidad_Mano_Obra_X_Costo") %>'>
                    </asp:TextBox>                   
                    <asp:TextBox 
                        ID="Int_Moneda_Simbolo" 
                        runat="server" 
                        visible="false"
                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Estado" 
                        runat="server"
                        visible="false" 
                        Text='<%# Bind("Estado") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Nombre" 
                        runat="server" 
                        visible="false"
                        Text='<%# Bind("Nombre") %>'>
                    </asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:Panel
                        runat="server"
                        id="Panel1"
                        meta:Resourcekey="Rec_Apu_Proyecto_Mano_Obra_ProyectoRecursoKCG">
                        <table>
                            <tr align="left">
                                <td> 
                                    <asp:Label
                                        id="lblproyecto"
                                        runat="server"
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                        AssociatedControlID="Apu_Proyecto_Codigo"
                                        Text='<%# GetLocalResourceObject("Apu_Proyecto_NombreRecursoKCG.Text").ToString() %>'> 
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Proyecto_Codigo" 
                                        runat="server"   
                                        TabIndex="-1"                                      
                                        ReadOnly="True"
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
                                        ReadOnly="True" 
                                        TabIndex="-1" 
                                        width="400px"
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
                    <asp:Panel
                        runat="server"
                        id="PanelI2"                        
                        meta:Resourcekey="Rec_Apu_Proyecto_Mano_ObraRecursoKCG">                        
                        <table>
                            <tr align="right">
                                <td colspan="2">
                                    <asp:Label
                                        ID="lblEstado_Nombre" 
                                        runat="server" 
                                        Text='<%# Bind("Estado_Nombre") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr align="left">
                                <td> 
                                    <asp:Label
                                        id="lblCódigo"
                                        runat="server"
                                        Visible="False"
                                        Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'> 
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Codigo" 
                                        runat="server"                                         
                                        ReadOnly="true" 
                                        Visible="False"
                                        ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Codigo") %>'>
                                    </asp:TextBox>                                        
                                </td>
                            </tr>  
                            <tr align="left">
                                <td>
                                    <asp:Label
                                        id="lblNombre"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Apu_Mano_Obra_NombreRecursoKCG.Text").ToString() %>'> 
                                    </asp:Label>                                         
                                </td>    
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Mano_Obra_Nombre" 
                                        runat="server"                                         
                                        ReadOnly="true" 
                                        Height="50px"
                                        TextMode ="MultiLine" 
                                        width="400px"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Mano_Obra_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Mano_Obra_Nombre") %>'>
                                    </asp:TextBox>
                                </td>                    
                            </tr>                        
                            <tr align="left">
                                <td>
                                    <asp:Label
                                     id="lblCategoria"
                                     runat="server"
                                     Text='<%# GetLocalResourceObject("Apu_Categoria_CodigoRecursoKCG.Text").ToString() %>'>                                     
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">    
                                     <asp:TextBox 
                                     ID="Apu_Categoria_Codigo" 
                                     TabIndex="-1"
                                     runat="server"                                                                           
                                     ToolTip='<%# GetLocalResourceObject("Apu_Categoria_CodigoRecursoKCG.ToolTip").ToString() %>'
                                     Text='<%# Bind("Apu_Categoria_Codigo") %>'>
                                     </asp:TextBox> 
                                    <asp:TextBox 
                                         ID="Apu_Categoria_Nombre" 
                                         runat="server"   
                                         TabIndex="-1"                                                                            
                                         width="400px"
                                         ToolTip='<%# GetLocalResourceObject("Apu_Categoria_NombreRecursoKCG.ToolTip").ToString() %>'
                                         Text='<%# Bind("Apu_Categoria_Nombre") %>'>
                                    </asp:TextBox>                                    
                                    <AjaxControlToolkit:AutoCompleteExtender
                                        runat="server" 
                                        BehaviorID="AutoCompleteEx"
                                        ID="autoComplete1" 
                                        TargetControlID="Apu_Categoria_Nombre"
                                        ServicePath="~/APU/APU_PROYECTO_MANO_OBRA.aspx" 
                                        ServiceMethod="GetManoDeObra"
                                        MinimumPrefixLength="1" 
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
                                <script type="text/javascript">
 
                                Sys.Application.add_load(page_load);
				                Sys.Application.add_unload(page_unload);      
                                                                
                                var Costo_Diario = null;
                                var Costo_Hora = null; 
                                
                                function page_load(sender, e){
                                Costo_Diario = $get("ctl00_ContentPlaceHolder1_fvapu_proyecto_mano_obra_Costo_Diario");
                                Costo_Hora = $get("ctl00_ContentPlaceHolder1_fvapu_proyecto_mano_obra_Costo_Hora");
                                $addHandler(Costo_Diario, "change", datos_onchange);                                                                      
                                }
                                
                                function page_unload(sender, e){
                                $removeHandler(Costo_Diario, "change", datos_onchange);                                                               
                                }
                                
                                function datos_onchange(sender, e){
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

                                    var Apu_Categoria_Id = $get("ctl00_ContentPlaceHolder1_fvapu_proyecto_mano_obra_Apu_Categoria_Id");
                                    Apu_Categoria_Id.value = temp[0];
                                    
                                    var Apu_Categoria_Codigo = $get("ctl00_ContentPlaceHolder1_fvapu_proyecto_mano_obra_Apu_Categoria_Codigo");
                                    Apu_Categoria_Codigo.value = temp[1];                                      
                                        
                                    Calcular();  
                                    Costo_Diario_Habilitar();                                      
                                }                                         
                                
                                function Calcular()
                                {
                                    var costoHoraCalculado = 0.00;                                  
                                    
                                    var numCosto_Diario = Number.parseLocale(Costo_Diario.value);                                
                                    
                                    if(!isNaN(numCosto_Diario)) 
                                        
                                       costoHoraCalculado= numCosto_Diario / 8;
                                       costoHoraCalculado = Redondear(costoHoraCalculado,4);
                                       
                                    Costo_Hora.value = costoHoraCalculado.localeFormat("N4");                                
                                                                              
                                    function Redondear(x,numeroDecimales) 
                                    {
	                                   return (Math.round(x*Math.pow(10,numeroDecimales)))/Math.pow(10,numeroDecimales);                                
                                    }  
                               }
                               
                               function Costo_Diario_Habilitar()
                                { 
                                    Costo_Diario = $get("ctl00_ContentPlaceHolder1_fvapu_proyecto_mano_obra_Costo_Diario");
                                    var Apu_Categoria_Id = $get("ctl00_ContentPlaceHolder1_fvapu_proyecto_mano_obra_Apu_Categoria_Id");
                                                  
                                    if(Apu_Categoria_Id.value == "")
                                    {
                                        Costo_Diario.disabled = false;   
                                    }                
                                    else
                                    {                     
                                        Costo_Diario.disabled = true;
                                    }
                                }
                                </script>                                 
                                </td>    
                            </tr>                                                                          
                            <tr align="left">
                               <td>
                                    <asp:Label
                                    id="lblJornalDiario"
                                    runat="server"
                                    Text='<%# GetLocalResourceObject("Costo_DiarioRecursoKCG.Text").ToString() %>'> 
                                    </asp:Label>
                               </td>
                               <td style="white-space:nowrap">                               
                                    <asp:TextBox 
                                    ID="Costo_Diario" 
                                    runat="server"     
                                                     
                                    style="text-align:right"
                                    ToolTip='<%# GetLocalResourceObject("Costo_DiarioRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Costo_Diario","{0:N4}") %>'>
                                    </asp:TextBox> 
                                    <asp:Label 
                                        ID="Lblmoneda1" 
                                        runat="server" 
                                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>                                      
                                                              
                                    <asp:TextBox 
                                        ID="Apu_Mano_Obra_Costo_Diario" 
                                        runat="server"       
                                        TabIndex="-1"                                 
                                        ReadOnly="True" 
                                        style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Mano_Obra_Costo_DiarioRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Mano_Obra_Costo_Diario","{0:N4}") %>'>
                                    </asp:TextBox>
                                    <asp:Label 
                                        ID="Label2" 
                                        runat="server"
                                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                               </td>
                            </tr>
                            <tr align="left">
                               <td>
                                    <asp:Label
                                     id="lblJornalHora"
                                     runat="server"
                                     Text='<%# GetLocalResourceObject("Costo_HoraRecursoKCG.Text").ToString() %>'> 
                                    </asp:Label>     
                               </td>
                               <td>
                                    <asp:TextBox 
                                      ID="Costo_Hora" 
                                      runat="server"    
                                      ReadOnly="True" 
                                      style="text-align:right"
                                      tabindex="-1"
                                      ToolTip='<%# GetLocalResourceObject("Costo_HoraRecursoKCG.ToolTip").ToString() %>'
                                      Text='<%# Bind("Costo_Hora","{0:N4}") %>'>
                                    </asp:TextBox>
                                    <asp:Label 
                                        ID="Label1" 
                                        runat="server" 
                                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                               </td>
                            </tr>                                            
                        </table>                        
                    </asp:Panel>                    
                    
                    <%--ids--%>
                    <asp:TextBox 
                        ID="Apu_Indice_Id" 
                        runat="server" 
                        style="display:none"
                        visible="true"
                        Text='<%# Bind("Apu_Indice_Id") %>'>
                    </asp:TextBox> 
                    <asp:TextBox 
                        ID="Apu_Proyecto_Id" 
                        runat="server" 
                        style="display:none"
                        visible="true"
                        Text='<%# Bind("Apu_Proyecto_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Mano_Obra_Id" 
                        runat="server" 
                        style="display:none"
                        visible="true"
                        Text='<%# Bind("Apu_Mano_Obra_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Categoria_Id" 
                        runat="server" 
                        style="display:none"
                        visible="true"
                        Text='<%# Bind("Apu_Categoria_Id") %>'>                        
                    </asp:TextBox> 
                    <asp:TextBox 
                        ID="Id" 
                        runat="server"
                        style="display:none"
                        visible="true" 
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>                    
                    
                    <%--Campos no visibles--%>
                        
                    <asp:TextBox 
                        ID="Apu_Indice_Nombre" 
                        runat="server" 
                        visible="false"
                        Text='<%# Bind("Apu_Indice_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Estado_Nombre" 
                        runat="server" 
                        visible="false"
                        Text='<%# Bind("Estado_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Proyecto_Etapa" 
                        runat="server" 
                        visible="false"
                        Text='<%# Bind("Apu_Proyecto_Etapa") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Mano_Obra_Codigo" 
                        runat="server" 
                        visible="false"
                        Text='<%# Bind("Apu_Mano_Obra_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Cantidad_Mano_Obra" 
                        runat="server" 
                        visible="false"
                        Text='<%# Bind("Cantidad_Mano_Obra") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Costo_Total" 
                        runat="server" 
                        visible="false"
                        Text='<%# Bind("Costo_Total") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Indice_Codigo" 
                        runat="server" 
                        visible="false"
                        Text='<%# Bind("Apu_Indice_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Cantidad_Mano_Obra_X_Costo" 
                        runat="server" 
                        visible="false"
                        Text='<%# Bind("Cantidad_Mano_Obra_X_Costo") %>'>
                    </asp:TextBox>                   
                    <asp:TextBox 
                        ID="Int_Moneda_Simbolo" 
                        runat="server" 
                        visible="false"
                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Estado" 
                        runat="server"
                        visible="false" 
                        Text='<%# Bind("Estado") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Nombre" 
                        runat="server" 
                        visible="false"
                        Text='<%# Bind("Nombre") %>'>
                    </asp:TextBox>                    
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Panel
                        runat="server"
                        Id="Panel1"                        
                        meta:Resourcekey="Rec_Apu_Proyecto_Mano_Obra_ProyectoRecursoKCG">
                        <table>
                            <tr align="left">
                                <td> 
                                    <asp:Label
                                        id="lblproyecto"
                                        runat="server"
                                        AssociatedControlID="Apu_Proyecto_Codigo"
                                        Text='<%# GetLocalResourceObject("Apu_Proyecto_NombreRecursoKCG.Text").ToString() %>'> 
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Proyecto_Codigo" 
                                        runat="server" 
                                        TabIndex="-1"
                                        ReadOnly="True"
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
                                        ReadOnly="True" 
                                        width="400px"
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
                    <asp:Panel
                        runat="server"
                        id="Panel2"
                        meta:Resourcekey="Rec_Apu_Proyecto_Mano_ObraRecursoKCG">                        
                        <table>
                            <tr align="right">
                                <td colspan="2">
                                    <asp:Label
                                        ID="lblEstado_Nombre" 
                                        runat="server" 
                                        Text='<%# Bind("Estado_Nombre") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr align="left">
                                <td> 
                                    <asp:Label
                                        id="lblCódigo"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'> 
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Codigo" 
                                        runat="server" 
                                        TabIndex="-1"
                                        ReadOnly="true" 
                                        ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Codigo") %>'>
                                    </asp:TextBox>                                        
                                </td>
                            </tr>  
                            <tr align="left">
                                <td>
                                    <asp:Label
                                        id="lblNombre"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Apu_Mano_Obra_NombreRecursoKCG.Text").ToString() %>'> 
                                    </asp:Label>                                         
                                </td>    
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Mano_Obra_Nombre" 
                                        runat="server" 
                                        TabIndex="-1"
                                        ReadOnly="true" 
                                        Height="50"
                                        TextMode="MultiLine" 
                                        CssClass ="TEXTO_LECTURA_KCG"
                                        Width="400px"                                        
                                        ToolTip='<%# GetLocalResourceObject("Apu_Mano_Obra_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Mano_Obra_Nombre") %>'>
                                    </asp:TextBox>
                                </td>                    
                            </tr>                        
                            <tr align="left">
                                <td>
                                    <asp:Label
                                     id="lblCategoria"
                                     runat="server"
                                     Text='<%# GetLocalResourceObject("Apu_Categoria_CodigoRecursoKCG.Text").ToString() %>'>                                     
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Apu_Categoria_Codigo" 
                                        runat="server" 
                                        TabIndex="-1"
                                        ReadOnly="True" 
                                        ToolTip='<%# GetLocalResourceObject("Apu_Categoria_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Categoria_Codigo") %>'>
                                    </asp:TextBox>                                                   
                                    <asp:TextBox 
                                        ID="Apu_Categoria_Nombre" 
                                        runat="server" 
                                        TabIndex="-1"
                                        ReadOnly="True" 
                                        width="400px"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Categoria_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Categoria_Nombre") %>'>
                                    </asp:TextBox>                                    
                               </td>
                            </tr>
                            <tr align="left">
                               <td>
                                    <asp:Label
                                    id="lblJornalDiario"
                                    runat="server"
                                    Text='<%# GetLocalResourceObject("Costo_DiarioRecursoKCG.Text").ToString() %>'> 
                                    </asp:Label>
                               </td>
                               <td style="white-space:nowrap">
                                    <asp:TextBox 
                                    ID="Costo_Diario" 
                                    runat="server" 
                             
                                    style="text-align:right"
                                    ToolTip='<%# GetLocalResourceObject("Costo_DiarioRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Costo_Diario","{0:N4}") %>'>
                                    </asp:TextBox>  
                                    <asp:Label 
                                        ID="Lblmoneda1" 
                                        runat="server" 
                                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>                           
                                    <asp:TextBox 
                                        ID="Apu_Mano_Obra_Costo_Diario" 
                                        runat="server"
                               
                                        style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Mano_Obra_Costo_DiarioRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Mano_Obra_Costo_Diario","{0:N4}") %>'>
                                    </asp:TextBox>
                                    <asp:Label 
                                        ID="Label2" 
                                        runat="server"
                                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                               </td>
                          </tr>
                            <tr align="left">
                               <td>
                                    <asp:Label
                                     id="lblJornalHora"
                                     runat="server"
                                     Text='<%# GetLocalResourceObject("Costo_HoraRecursoKCG.Text").ToString() %>'> 
                                    </asp:Label>     
                               </td>
                               <td>
                                    <asp:TextBox 
                                      ID="Costo_Hora" 
                                      runat="server" 
                                      ReadOnly="True" 
                                      TabIndex="-1"
                                      style="text-align:right"
                                      ToolTip='<%# GetLocalResourceObject("Costo_HoraRecursoKCG.ToolTip").ToString() %>'
                                      Text='<%# Bind("Costo_Hora","{0:N4}") %>'>
                                    </asp:TextBox>
                                    <asp:Label 
                                        ID="Label1" 
                                        runat="server" 
                                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                               </td>
                          </tr>
                            <tr align="left">
                                <td colspan="3">
                                   <asp:Button 
                                        ID="EditButton" 
                                        runat="server"
                                        CausesValidation="False" 
                                        CommandName="Edit"
                                        Enabled='<%# HER.PermisosMovimientos.Movimiento_Apu_Proyecto_Mano_Obra(Request.QueryString["Estado"], HER.PermisosMovimientos.ModoOperacion.Editar ) %>'
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
                                   <%--<asp:Button 
                                        ID="NewButton" 
                                        runat="server" 
                                        CausesValidation="False" 
                                        CommandName="New"
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_NuevoRecursoKCG.AccesKey").ToString() %>'  
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_NewRecursoKCG.Text").ToString() %>'
                                        ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_NewRecursoKCG.ToolTip").ToString() %>'>
                                   </asp:Button>--%>
                                   <uc1:wucMensajeEliminar ID="WucMensajeEliminar1" runat="server" />
                                </td>
                            </tr>                      
                        </table>
                    </asp:Panel>                    
                    
                    <%--ids--%>
                    <asp:TextBox 
                        ID="Apu_Indice_Id" 
                        runat="server" 
                        style="display:none"
                        visible="true"
                        Text='<%# Bind("Apu_Indice_Id") %>'>
                    </asp:TextBox> 
                    <asp:TextBox 
                        ID="Apu_Proyecto_Id" 
                        runat="server" 
                        style="display:none"
                        visible="true"
                        Text='<%# Bind("Apu_Proyecto_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Mano_Obra_Id" 
                        runat="server" 
                        style="display:none"
                        visible="true"
                        Text='<%# Bind("Apu_Mano_Obra_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Categoria_Id" 
                        runat="server" 
                        style="display:none"
                        visible="true"
                        Text='<%# Bind("Apu_Categoria_Id") %>'>                        
                    </asp:TextBox> 
                    <asp:TextBox 
                        ID="Id" 
                        runat="server"
                        style="display:none"
                        visible="true" 
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>                    
                    
                    <%--Campos no visibles--%>
                        
                    <asp:TextBox 
                        ID="Apu_Indice_Nombre" 
                        runat="server" 
                        visible="false"
                        Text='<%# Bind("Apu_Indice_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Estado_Nombre" 
                        runat="server" 
                        visible="false"
                        Text='<%# Bind("Estado_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Proyecto_Etapa" 
                        runat="server" 
                        visible="false"
                        Text='<%# Bind("Apu_Proyecto_Etapa") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Mano_Obra_Codigo" 
                        runat="server" 
                        visible="false"
                        Text='<%# Bind("Apu_Mano_Obra_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Cantidad_Mano_Obra" 
                        runat="server" 
                        visible="false"
                        Text='<%# Bind("Cantidad_Mano_Obra") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Costo_Total" 
                        runat="server" 
                        visible="false"
                        Text='<%# Bind("Costo_Total") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Indice_Codigo" 
                        runat="server" 
                        visible="false"
                        Text='<%# Bind("Apu_Indice_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Cantidad_Mano_Obra_X_Costo" 
                        runat="server" 
                        visible="false"
                        Text='<%# Bind("Cantidad_Mano_Obra_X_Costo") %>'>
                    </asp:TextBox>                   
                    <asp:TextBox 
                        ID="Int_Moneda_Simbolo" 
                        runat="server" 
                        visible="false"
                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Estado" 
                        runat="server"
                        visible="false" 
                        Text='<%# Bind("Estado") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Nombre" 
                        runat="server" 
                        visible="false"
                        Text='<%# Bind("Nombre") %>'>
                    </asp:TextBox>
            </ItemTemplate>
            </asp:FormView>  
            <koala:KNavegacion ID="nav"
                                runat="server"
                                GridViewID="gvapu_proyecto_mano_obra"
                                FormViewID="FormView1" OnNavegar="nav_Siguiente" />
        </ContentTemplate> 
        <Triggers>
            <asp:AsyncPostBackTrigger 
                ControlID="gvapu_proyecto_mano_obra" 
                EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>          
  <asp:ObjectDataSource 
        ID="odsfvapu_proyecto_mano_obra" 
        runat="server" 
        ConflictDetection="CompareAllValues" 
        OldValuesParameterFormatString="original{0}" 
        SelectMethod="GetById"
        SortParameterName="sortExpression" 
        TypeName="FEL.APU.BO_Apu_Proyecto_Mano_Obra"
        UpdateMethod="Update"
        DeleteMethod="Delete" >
        <SelectParameters>
            <asp:SessionParameter 
            DefaultValue="" 
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
            ID="Atras" 
            runat="server" 
            Text="Atras" 
            Visible="False" />
            <asp:Button 
            ID="Seleccionar" 
            runat="server" 
            Text="Seleccionar"
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
                        Contenedor="APU_PROYECTO_MANO_OBRA" 
                        Objeto="APU_PROYECTO_MANO_OBRA" 
                        IndiceScope ="Scope"
                        Orden="1" ObjectDataSourceID="odsgvapu_proyecto_mano_obra"/>
                </td>
                <td>
                    <asp:Button 
                        ID="BtnProyecto" 
                        runat="server"                         
                        OnClick="BtnProyecto_Click"/>
                </td>
            </tr>
        </table>            
            <asp:Panel 
                runat="server"
                id="pnlDatosGrid"
                meta:resourcekey="Rec_Apu_Proyecto_Mano_Obra_ListadoRecursoKCG">                 
                <koala:KGrid  
                ID="gvapu_proyecto_mano_obra" 
                runat="server" 
                AllowPaging="True" 
                AllowSorting="True"
                AutoGenerateColumns="False"
                AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>'               
                DataKeyNames="Id" 
                DataSourceID="odsgvapu_proyecto_mano_obra">
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
                        DataField="Codigo" 
                        Meta:ResourceKey="BoundCodigoRecursoKCG" 
                        SortExpression="Codigo" >
                        <itemstyle horizontalalign="Right" />
                    </asp:BoundField>
                    <asp:BoundField 
                        DataField="Apu_Mano_Obra_Nombre" 
                        meta:resourcekey="BoundApu_Mano_Obra_NombreRecursoKCG"
                        SortExpression="Apu_Mano_Obra_Nombre">
                        <itemstyle wrap="False" width="80mm" />
                    </asp:BoundField>                    
                    <asp:BoundField 
                        DataField="Apu_Categoria_Nombre" 
                        meta:resourcekey="BoundApu_Categoria_NombreRecursoKCG"
                        SortExpression="Apu_Categoria_Nombre" >
                        <itemstyle wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField 
                        DataField="Costo_Diario" 
                        meta:resourcekey="BoundCosto_DiarioRecursoKCG" 
                        SortExpression="Costo_Diario" 
                        dataformatstring="{0:N4}">
                        <itemstyle horizontalalign="Right" />
                    </asp:BoundField>
                    <asp:BoundField 
                        DataField="Costo_Hora" 
                        meta:resourcekey="BoundCosto_HoraRecursoKCG" 
                        SortExpression="Costo_Hora" 
                        dataformatstring="{0:N4}">
                        <itemstyle horizontalalign="Right" />
                    </asp:BoundField>
                    <asp:BoundField 
                        DataField="Apu_Indice_Nombre" 
                        HeaderText="Apu_Indice_Nombre" 
                        SortExpression="Apu_Indice_Nombre"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Estado_Nombre" 
                        HeaderText="Estado_Nombre" 
                        SortExpression="Estado_Nombre"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Apu_Proyecto_Nombre" 
                        HeaderText="Apu_Proyecto_Nombre"
                        SortExpression="Apu_Proyecto_Nombre" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Apu_Mano_Obra_Costo_Diario" 
                        HeaderText="Apu_Mano_Obra_Costo_Diario"
                        SortExpression="Apu_Mano_Obra_Costo_Diario" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Apu_Proyecto_Etapa" 
                        HeaderText="Apu_Proyecto_Etapa" 
                        SortExpression="Apu_Proyecto_Etapa"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Apu_Indice_Id" 
                        HeaderText="Apu_Indice_Id" 
                        SortExpression="Apu_Indice_Id"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Apu_Proyecto_Id" 
                        HeaderText="Apu_Proyecto_Id" 
                        SortExpression="Apu_Proyecto_Id"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Apu_Mano_Obra_Id" 
                        HeaderText="Apu_Mano_Obra_Id" 
                        SortExpression="Apu_Mano_Obra_Id"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Apu_Mano_Obra_Codigo" 
                        HeaderText="Apu_Mano_Obra_Codigo"
                        SortExpression="Apu_Mano_Obra_Codigo" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Apu_Proyecto_Codigo" 
                        HeaderText="Apu_Proyecto_Codigo"
                        SortExpression="Apu_Proyecto_Codigo" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Cantidad_Mano_Obra" 
                        HeaderText="Cantidad_Mano_Obra" 
                        SortExpression="Cantidad_Mano_Obra"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Costo_Total" 
                        HeaderText="Costo_Total" 
                        SortExpression="Costo_Total"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Apu_Indice_Codigo" 
                        HeaderText="Apu_Indice_Codigo" 
                        SortExpression="Apu_Indice_Codigo"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Cantidad_Mano_Obra_X_Costo" 
                        HeaderText="Cantidad_Mano_Obra_X_Costo"
                        SortExpression="Cantidad_Mano_Obra_X_Costo" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Id" 
                        HeaderText="Id" 
                        SortExpression="Id" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Apu_Categoria_Id" 
                        HeaderText="Apu_Categoria_Id" 
                        SortExpression="Apu_Categoria_Id"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Apu_Categoria_Codigo" 
                        HeaderText="Apu_Categoria_Codigo"
                        SortExpression="Apu_Categoria_Codigo" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Int_Moneda_Simbolo" 
                        HeaderText="Int_Moneda_Simbolo" 
                        SortExpression="Int_Moneda_Simbolo"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Estado" 
                        HeaderText="Estado" 
                        SortExpression="Estado" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Nombre" 
                        HeaderText="Nombre" 
                        SortExpression="Nombre" 
                        Visible="False" />
                </Columns>
                </koala:KGrid>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
  <asp:ObjectDataSource 
            ID="odsgvapu_proyecto_mano_obra" 
            runat="server" 
            OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetByProyecto" 
            TypeName="FEL.APU.BO_Apu_Proyecto_Mano_Obra">
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
</asp:Content>

