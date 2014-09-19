<%@ Page 
Language="C#" 
MasterPageFile="~/KOALA.master" 
AutoEventWireup="true" 
CodeFile="APU_PROYECTO_RUBRO_COORDINADOR.aspx.cs" 
Inherits="APU_APU_PROYECTO_RUBRO_COORDINADOR" 
Theme="EstiloKCG"
StylesheetTheme="EstiloKCG"
meta:resourcekey="Tit_Apu_Proyecto_Rubro_CoordinadorRecursoKCG" %>

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
    <asp:UpdatePanel 
        ID="UpdatePanel1" 
        runat="server"
        UpdateMode="Conditional"> 
        <ContentTemplate>        
            <asp:FormView 
                ID="fvapu_proyecto_rubro_coordinador" 
                runat="server" 
                DataSourceID="odsapu_proyecto_rubro"
                DefaultMode="Insert">
                <EditItemTemplate>
                <asp:Panel
                    id="PanelProyecto"
                    runat="server"
                    meta:resourcekey="Rec_Apu_Proyecto_Rubro_Coordinador_ProyectoRecursoKCG">
                    <table>
                        <tr>
                            <td>
                                <asp:Label 
                                    id="labelproyecto"
                                    runat="server" 
                                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                    AssociatedControlID="Apu_Proyecto_Codigo"
                                    Text='<%# GetLocalResourceObject("Apu_Proyecto_NombreRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td style="white-space:nowrap">
                                <asp:TextBox 
                                    ID="Apu_Proyecto_Codigo" 
                                    runat="server" 
                                    TabIndex="-1"
                                    ReadOnly="true" 
                                    ToolTip='<%# GetLocalResourceObject("Apu_Proyecto_CodigoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Proyecto_Codigo") %>'>
                                </asp:TextBox>                   
                                <asp:TextBox 
                                    ID="Apu_Proyecto_Nombre" 
                                    runat="server" 
                                    TabIndex="-1"
                                    ReadOnly="true" 
                                    ToolTip='<%# GetLocalResourceObject("Apu_Proyecto_NombreRecursoKCG.ToolTip").ToString() %>'
                                    width="300px"
                                    Text='<%# Bind("Apu_Proyecto_Nombre") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel
                    id="PanelRubroE"
                    runat="server"
                    meta:resourcekey="Rec_Apu_Proyecto_Rubro_Coordinador_RubroRecursoKCG">                    
                    <table>
                        <tr>
                            <td>
                                <asp:Label 
                                    id="lblcodigo"
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Apu_Rubro_CodigoRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Apu_Rubro_Codigo" 
                                    runat="server" 
                                    TabIndex="-1"
                                    ReadOnly="true" 
                                    ToolTip='<%# GetLocalResourceObject("Apu_Rubro_CodigoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Rubro_Codigo") %>'>
                                </asp:TextBox>    
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label 
                                    id="lblrubro"
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Apu_Rubro_Nombre" 
                                    runat="server" 
                                    style="text-transform:uppercase"
                                    TabIndex="-1"
                                    Height="50px"
                                    TextMode ="MultiLine"
                                    width="400px"
                                    CssClass ="TEXTO_LECTURA_KCG"
                                    ReadOnly="true"  
                                    ToolTip='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.ToolTip").ToString() %>'                                  
                                    Text='<%# Bind("Apu_Rubro_Nombre") %>'>
                                </asp:TextBox>
                                
                            </td>                                
                        </tr>
                        <tr>
                            <td>
                                <asp:Label 
                                    id="Label1"
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Apu_Rubro_Unidad" 
                                    runat="server" 
                                    TabIndex="-1"
                                    ToolTip='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.ToolTip").ToString() %>'
                                    ReadOnly="true" 
                                    Text='<%# Bind("Apu_Rubro_Unidad") %>'>
                                </asp:TextBox>    
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label 
                                    id="lblvolumen"
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("CantidadRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox
                                    ID="Cantidad" 
                                    runat="server" 
                                    ToolTip='<%# GetLocalResourceObject("CantidadRecursoKCG.ToolTip").ToString() %>'
                                    CssClass="TEXTO_EDICION_KCG"
                                    style="text-align:right"
                                    Text='<%# Bind("Cantidad") %>'>
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
                                    ClearMaskOnLostFocus="True"/>
                                <AjaxControlToolkit:MaskedEditValidator 
                                    ID="MaskedEditValidator2" 
                                    runat="server"
                                    ControlExtender="meeCantidad"
                                    ControlToValidate="Cantidad"
                                    IsValidEmpty="False"
                                    EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                    InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                    MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                    MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                    MinimumValue="0.0000"
                                    MaximumValue="9999999999999.9999" 
                                    Display="Dynamic"
                                    EmptyValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>'
                                    InvalidValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>'
                                    MaximumValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>' 
                                    MinimumValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>'
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
                    ID="Apu_Proyecto_Id" 
                    runat="server" 
                    style="display:none"
                    Text='<%# Bind("Apu_Proyecto_Id") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Apu_Rubro_Id" 
                    runat="server" 
                    style="display:none"
                    Text='<%# Bind("Apu_Rubro_Id") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Apu_Subtitulo_id" 
                    runat="server" 
                    style="display:none"
                    Text='<%# Bind("Apu_Subtitulo_id") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Apu_Titulo_id" 
                    runat="server" 
                    style="display:none"
                    Text='<%# Bind("Apu_Titulo_id") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Int_Sucursal_Id" 
                    runat="server" 
                    style="display:none"
                    Text='<%# Bind("Int_Sucursal_Id") %>'>
                </asp:TextBox>                
                <asp:TextBox 
                    ID="Id" 
                    runat="server" 
                    style="display:none"
                    Text='<%# Bind("Id") %>'>
                </asp:TextBox>
                
                <%--CAMPOS NO VISIBLES--%>
                
                <asp:TextBox 
                    ID="Rendimiento_Mano_Obra" 
                    runat="server" 
                    Visible="false" 
                    Text='<%# Bind("Rendimiento_Mano_Obra") %>'>
                </asp:TextBox>                
                <asp:TextBox 
                    ID="Rendimiento_Equipo" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Rendimiento_Equipo") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Apu_Subtitulo_Codigo" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Apu_Subtitulo_Codigo") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Apu_Subtitulo_Nombre" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Apu_Subtitulo_Nombre") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Apu_Titulo_Codigo" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Apu_Titulo_Codigo") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Apu_Titulo_Nombre" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Apu_Titulo_Nombre") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Estado_Nombre" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Estado_Nombre") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Rendimiento_Mano_Obra_Hora" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Rendimiento_Mano_Obra_Hora") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Rendimiento_Equipo_Hora" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Rendimiento_Equipo_Hora") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Material_costo_total" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Material_costo_total") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Transporte_costo_total" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Transporte_costo_total") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Mano_obra_costo_total" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Mano_obra_costo_total") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Equipo_costo_total" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Equipo_costo_total") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Costo_Unitario" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Costo_Unitario") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Costo_Total" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Costo_Total") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Apu_Proyecto_Etapa" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Apu_Proyecto_Etapa") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Apu_rubro_Costo_Total" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Apu_rubro_Costo_Total") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Material_ultima_fecha_update" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Material_ultima_fecha_update") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Transporte_ultima_fecha_update" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Transporte_ultima_fecha_update") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Mano_obra_ultima_fecha_update" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Mano_obra_ultima_fecha_update") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Equipo_ultima_fecha_update" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Equipo_ultima_fecha_update") %>'>
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
                </EditItemTemplate>
                <InsertItemTemplate>
                <asp:Panel
                    id="PanelProyecto"
                    runat="server"
                    meta:resourcekey="Rec_Apu_Proyecto_Rubro_Coordinador_ProyectoRecursoKCG">
                    <table>
                        <tr>
                            <td>
                                <asp:Label 
                                    id="labelproyecto"
                                    runat="server" 
                                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                    AssociatedControlID="Apu_Proyecto_Codigo"
                                    Text='<%# GetLocalResourceObject("Apu_Proyecto_NombreRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td style="white-space:nowrap">
                                <asp:TextBox 
                                    ID="Apu_Proyecto_Codigo" 
                                    runat="server" 
                                    TabIndex="-1"
                                    ReadOnly="true" 
                                    ToolTip='<%# GetLocalResourceObject("Apu_Proyecto_CodigoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Proyecto_Codigo") %>'>
                                </asp:TextBox>                   
                                <asp:TextBox 
                                    ID="Apu_Proyecto_Nombre" 
                                    runat="server" 
                                    TabIndex="-1"
                                    ReadOnly="true" 
                                    width="300px"
                                    ToolTip='<%# GetLocalResourceObject("Apu_Proyecto_NombreRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Proyecto_Nombre") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel
                    id="PanelRubroI"
                    runat="server"
                    meta:resourcekey="Rec_Apu_Proyecto_Rubro_Coordinador_RubroRecursoKCG">                    
                    <table>
                        <tr>
                            <td>
                                <asp:Label 
                                    id="lblcodigo"
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Apu_Rubro_CodigoRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Apu_Rubro_Codigo" 
                                    runat="server" 
                                    CssClass="TEXTO_COMBOPER_KCG"
                                    style="text-align:right"                              
                                    ToolTip='<%# GetLocalResourceObject("Apu_Rubro_CodigoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Rubro_Codigo") %>'>
                                </asp:TextBox>                                
                                <asp:RequiredFieldValidator 
                                    runat="server" 
                                    ID="rfvApu_Rubro_Codigo"
                                    ControlToValidate="Apu_Rubro_Codigo"
                                    ValidationGroup="I"
                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ3RecursoKCG.ErrorMessage").ToString() %>'
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ3RecursoKCG.Text").ToString() %>'/> 
                                <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server" 
                                    ID="vceApu_Rubro_Codigo"
                                    TargetControlID="rfvApu_Rubro_Codigo" />
                                <%--Combo dinamico--%>
                                <AjaxControlToolkit:AutoCompleteExtender
                                    runat="server" 
                                    BehaviorID="AutoCompleteEx"
                                    ID="autoComplete1" 
                                    TargetControlID="Apu_Rubro_Codigo"
                                    ServicePath="~/APU/APU_PROYECTO_RUBRO_COORDINADOR.aspx" 
                                    ServiceMethod="GetProyectoRubroByCodigo"
                                    MinimumPrefixLength="1" 
                                    CompletionInterval="500"
                                    EnableCaching="true"
                                    CompletionSetCount="500"
                                    CompletionListCssClass="autocomplete_completionListElement" 
                                    CompletionListItemCssClass="autocomplete_listItem" 
                                    CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                    OnClientItemSelected="ItemSelected" 
                                    FirstRowSelected="true">
                                    <Animations>
                                        <OnShow>
                                            <Sequence>
                                                <OpacityAction Opacity="0" />
                                                <HideAction Visible="true" />
                                                <ScriptAction Script="
                                                    // Cache the size and setup the initial size
                                                    var behavior = $find('AutoCompleteEx');
                                                    if (!behavior._height) {
                                                        var target = behavior.get_completionList();
                                                        behavior._height = target.offsetHeight - 2;
                                                        target.style.height = '0px';
                                                    }" />
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
                                
                                    function ItemSelected( source, eventArgs ) 
                                    {
                                        var valor = eventArgs.get_value();
                                        var temp = new Array();
                                        temp = valor.split('||');                             
                                    
                                        var Apu_Rubro_Id = $get("ctl00_ContentPlaceHolder1_fvapu_proyecto_rubro_coordinador_Apu_Rubro_Id");
                                        Apu_Rubro_Id.value = temp[0]; 
                                        
                                        var Apu_Rubro_Nombre = $get("ctl00_ContentPlaceHolder1_fvapu_proyecto_rubro_coordinador_Apu_Rubro_Nombre");
                                        Apu_Rubro_Nombre.value = temp[1];                 
                                                                   
                                        var Apu_Rubro_Unidad = $get("ctl00_ContentPlaceHolder1_fvapu_proyecto_rubro_coordinador_Apu_Rubro_Unidad");
                                        Apu_Rubro_Unidad.value = temp[2];
                                        
                                        var Costo_Unitario = $get("ctl00_ContentPlaceHolder1_fvapu_proyecto_rubro_coordinador_Costo_Unitario");
                                        Costo_Unitario.value = temp[3];
                                    
                                        var Rendimiento_Mano_Obra = $get("ctl00_ContentPlaceHolder1_fvapu_proyecto_rubro_coordinador_Rendimiento_Mano_Obra");
                                        Rendimiento_Mano_Obra.value = temp[4];
                                    
                                        var Rendimiento_Equipo = $get("ctl00_ContentPlaceHolder1_fvapu_proyecto_rubro_coordinador_Rendimiento_Equipo");              
                                        Rendimiento_Equipo.value = temp[5];
                                    
                                        var Apu_Subtitulo_id = $get("ctl00_ContentPlaceHolder1_fvapu_proyecto_rubro_coordinador_Apu_Subtitulo_id");
                                        Apu_Subtitulo_id.value = temp[6];                                                               
                                    }              
                                                  
                                </script>
                                <%-- Prevent enter in textbox from causing the collapsible panel from operating --%>
                                <input 
                                    type="submit" 
                                    style="display:none;" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label 
                                    id="lblrubro"
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Apu_Rubro_Nombre" 
                                    runat="server" 
                                    style="text-transform:uppercase"
                                    TabIndex="-1"
                                    Height="50px"
                                    TextMode ="MultiLine" 
                                    CssClass ="TEXTO_LECTURA_KCG"
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
                                    id="Label1"
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
                        <tr>
                            <td>
                                <asp:Label 
                                    id="lblvolumen"
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("CantidadRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox
                                    ID="Cantidad" 
                                    runat="server" 
                                    CssClass="TEXTO_EDICION_KCG"
                                    style="text-align:right"
                                    ToolTip='<%# GetLocalResourceObject("CantidadRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Cantidad") %>'>
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
                                    ClearMaskOnLostFocus="True"/>
                                <AjaxControlToolkit:MaskedEditValidator 
                                    ID="MaskedEditValidator2" 
                                    runat="server"
                                    ControlExtender="meeCantidad"
                                    ControlToValidate="Cantidad"
                                    IsValidEmpty="False"
                                    EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                    InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                    MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                    MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                    MinimumValue="0.0000"
                                    MaximumValue="9999999999999.9999" 
                                    Display="Dynamic"
                                    EmptyValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>'
                                    InvalidValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>'
                                    MaximumValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>' 
                                    MinimumValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>'
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
                
                <%--Id's--%>                
                                              
                <asp:TextBox 
                    ID="Apu_Proyecto_Id" 
                    runat="server" 
                    style="display:none"
                    Text='<%# Bind("Apu_Proyecto_Id") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Apu_Rubro_Id" 
                    runat="server" 
                    style="display:none"
                    Text='<%# Bind("Apu_Rubro_Id") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Apu_Subtitulo_id" 
                    runat="server" 
                    style="display:none"
                    Text='<%# Bind("Apu_Subtitulo_id") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Apu_Titulo_id" 
                    runat="server" 
                    style="display:none"
                    Text='<%# Bind("Apu_Titulo_id") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Int_Sucursal_Id" 
                    runat="server" 
                    style="display:none"
                    Text='<%# Bind("Int_Sucursal_Id") %>'>
                </asp:TextBox>                
                <asp:TextBox 
                    ID="Id" 
                    runat="server" 
                    style="display:none"
                    Text='<%# Bind("Id") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Costo_Unitario" 
                    runat="server" 
                    style="display:none"
                    Text='<%# Bind("Costo_Unitario") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Rendimiento_Mano_Obra" 
                    runat="server" 
                    style="display:none"
                    Text='<%# Bind("Rendimiento_Mano_Obra") %>'>
                </asp:TextBox>                
                <asp:TextBox 
                    ID="Rendimiento_Equipo" 
                    runat="server" 
                    style="display:none"
                    Text='<%# Bind("Rendimiento_Equipo") %>'>
                </asp:TextBox>
                
                <%--CAMPOS NO VISIBLES--%>
                
                
                <asp:TextBox 
                    ID="Apu_Subtitulo_Codigo" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Apu_Subtitulo_Codigo") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Apu_Subtitulo_Nombre" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Apu_Subtitulo_Nombre") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Apu_Titulo_Codigo" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Apu_Titulo_Codigo") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Apu_Titulo_Nombre" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Apu_Titulo_Nombre") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Estado_Nombre" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Estado_Nombre") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Rendimiento_Mano_Obra_Hora" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Rendimiento_Mano_Obra_Hora") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Rendimiento_Equipo_Hora" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Rendimiento_Equipo_Hora") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Material_costo_total" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Material_costo_total") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Transporte_costo_total" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Transporte_costo_total") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Mano_obra_costo_total" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Mano_obra_costo_total") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Equipo_costo_total" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Equipo_costo_total") %>'>
                </asp:TextBox>                
                <asp:TextBox 
                    ID="Costo_Total" 
                    runat="server"   
                    visible="false"                  
                    Text='<%# Bind("Costo_Total") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Apu_Proyecto_Etapa" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Apu_Proyecto_Etapa") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Apu_rubro_Costo_Total" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Apu_rubro_Costo_Total") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Material_ultima_fecha_update" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Material_ultima_fecha_update") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Transporte_ultima_fecha_update" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Transporte_ultima_fecha_update") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Mano_obra_ultima_fecha_update" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Mano_obra_ultima_fecha_update") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Equipo_ultima_fecha_update" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Equipo_ultima_fecha_update") %>'>
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
                    id="PanelProyecto"
                    runat="server"
                    meta:resourcekey="Rec_Apu_Proyecto_Rubro_Coordinador_ProyectoRecursoKCG">
                    <table>
                        <tr>
                            <td>
                                <asp:Label 
                                    id="labelproyecto"
                                    runat="server" 
                                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                    AssociatedControlID="Apu_Proyecto_Codigo"
                                    Text='<%# GetLocalResourceObject("Apu_Proyecto_NombreRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td style="white-space:nowrap">
                                <asp:TextBox 
                                    ID="Apu_Proyecto_Codigo" 
                                    runat="server" 
                                    TabIndex="-1"
                                    ReadOnly="true" 
                                    ToolTip='<%# GetLocalResourceObject("Apu_Proyecto_CodigoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Proyecto_Codigo") %>'>
                                </asp:TextBox>                   
                                <asp:TextBox 
                                    ID="Apu_Proyecto_Nombre" 
                                    runat="server" 
                                    TabIndex="-1"
                                    ReadOnly="true" 
                                    width="300px"
                                    ToolTip='<%# GetLocalResourceObject("Apu_Proyecto_NombreRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Proyecto_Nombre") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel
                    id="PanelRubro"
                    runat="server"
                    meta:resourcekey="Rec_Apu_Proyecto_Rubro_Coordinador_RubroRecursoKCG">                    
                    <table>
                        <tr>
                            <td>
                                <asp:Label 
                                    id="lblcodigo"
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Apu_Rubro_CodigoRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Apu_Rubro_Codigo" 
                                    runat="server" 
                                    TabIndex="-1"
                                    ReadOnly="true" 
                                    ToolTip='<%# GetLocalResourceObject("Apu_Rubro_CodigoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Rubro_Codigo") %>'>
                                </asp:TextBox>    
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label 
                                    id="lblrubro"
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Apu_Rubro_Nombre" 
                                    runat="server" 
                                    TabIndex="-1"
                                    style="text-transform:uppercase"
                                    Height="50px"
                                    TextMode="MultiLine"
                                    CssClass ="TEXTO_LECTURA_KCG"
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
                                    id="Label1"
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
                        <tr>
                            <td>
                                <asp:Label 
                                    id="lblvolumen"
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("CantidadRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox
                                    ID="Cantidad" 
                                    runat="server" 
                                    TabIndex="-1"
                                    ReadOnly="true" 
                                    style="text-align:right"
                                    ToolTip='<%# GetLocalResourceObject("CantidadRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Cantidad") %>'>
                                </asp:TextBox>                                       
                            </td>
                        </tr>
                        <tr align="left">
                                <td colspan="3">                                    
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
                    ID="Apu_Proyecto_Id" 
                    runat="server" 
                    style="display:none"
                    Text='<%# Bind("Apu_Proyecto_Id") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Apu_Rubro_Id" 
                    runat="server" 
                    style="display:none"
                    Text='<%# Bind("Apu_Rubro_Id") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Apu_Subtitulo_id" 
                    runat="server" 
                    style="display:none"
                    Text='<%# Bind("Apu_Subtitulo_id") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Apu_Titulo_id" 
                    runat="server" 
                    style="display:none"
                    Text='<%# Bind("Apu_Titulo_id") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Int_Sucursal_Id" 
                    runat="server" 
                    style="display:none"
                    Text='<%# Bind("Int_Sucursal_Id") %>'>
                </asp:TextBox>                
                <asp:TextBox 
                    ID="Id" 
                    runat="server" 
                    style="display:none"
                    Text='<%# Bind("Id") %>'>
                </asp:TextBox>
                
                <%--CAMPOS NO VISIBLES--%>
                
                <asp:TextBox 
                    ID="Rendimiento_Mano_Obra" 
                    runat="server" 
                    Visible="false" 
                    Text='<%# Bind("Rendimiento_Mano_Obra") %>'>
                </asp:TextBox>                
                <asp:TextBox 
                    ID="Rendimiento_Equipo" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Rendimiento_Equipo") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Apu_Subtitulo_Codigo" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Apu_Subtitulo_Codigo") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Apu_Subtitulo_Nombre" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Apu_Subtitulo_Nombre") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Apu_Titulo_Codigo" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Apu_Titulo_Codigo") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Apu_Titulo_Nombre" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Apu_Titulo_Nombre") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Estado_Nombre" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Estado_Nombre") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Rendimiento_Mano_Obra_Hora" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Rendimiento_Mano_Obra_Hora") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Rendimiento_Equipo_Hora" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Rendimiento_Equipo_Hora") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Material_costo_total" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Material_costo_total") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Transporte_costo_total" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Transporte_costo_total") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Mano_obra_costo_total" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Mano_obra_costo_total") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Equipo_costo_total" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Equipo_costo_total") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Costo_Unitario" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Costo_Unitario") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Costo_Total" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Costo_Total") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Apu_Proyecto_Etapa" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Apu_Proyecto_Etapa") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Apu_rubro_Costo_Total" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Apu_rubro_Costo_Total") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Material_ultima_fecha_update" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Material_ultima_fecha_update") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Transporte_ultima_fecha_update" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Transporte_ultima_fecha_update") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Mano_obra_ultima_fecha_update" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Mano_obra_ultima_fecha_update") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Equipo_ultima_fecha_update" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Equipo_ultima_fecha_update") %>'>
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
                </ItemTemplate>
            </asp:FormView>
            <koala:KNavegacion 
                ID="nav"
                runat="server"
                GridViewID="gvapu_proyecto_rubro_coordinador"
                FormViewID="FormView1" 
                OnNavegar="nav_Siguiente" />          
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger 
                ControlID="gvapu_proyecto_rubro_coordinador" 
                EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>        
    <asp:ObjectDataSource 
        ID="odsapu_proyecto_rubro" 
        runat="server" 
        ConflictDetection="CompareAllValues"
        DeleteMethod="Delete" 
        InsertMethod="Insert" 
        OldValuesParameterFormatString="original{0}"
        SelectMethod="GetById" SortParameterName="sortExpression" 
        TypeName="FEL.APU.BO_Apu_Proyecto_Rubro"
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
                        Contenedor="APU_PROYECTO_RUBRO_COORDINADOR" 
                        Objeto="APU_PROYECTO_RUBRO" 
                        IndiceScope ="Scope"
                        Orden="1"
                        ObjectDataSourceID="odsgvapu_proyecto_rubro_coordinador" />
                </td>
                <td>
                    <asp:Button 
                        ID="BtnRubro" 
                        runat="server"                           
                        OnClick="BtnRubro_Click"/>
                </td>
                <td>
                    <asp:Button 
                        ID="BtnMaterial" 
                        runat="server"                                  
                        OnClick="BtnMaterial_Click"/>
                </td>
            </tr>            
        </table>            
            <asp:Panel 
                runat="server"
                id="pnlDatosGrid"                
                meta:resourcekey="Rec_Apu_Proyecto_Rubro_Coordinador_ListadoRecursoKCG">                
                <koala:KGrid  
                ID="gvapu_proyecto_rubro_coordinador" 
                runat="server" 
                AllowPaging="True" 
                AllowSorting="True"
                AutoGenerateColumns="False"
                AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>'                
                DataKeyNames="Id" 
                DataSourceID="odsgvapu_proyecto_rubro_coordinador">
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
                        DataField="Apu_Rubro_Codigo" 
                        meta:resourcekey="BoundApu_Rubro_CodigoRecursoKCG"
                        SortExpression="Apu_Rubro_Codigo" >
                        <itemstyle horizontalalign="Right" />
                    </asp:BoundField>
                    <asp:BoundField 
                        DataField="Apu_Rubro_Nombre" 
                        meta:resourcekey="BoundApu_Rubro_NombreRecursoKCG"
                        SortExpression="Apu_Rubro_Nombre">
                        <itemstyle wrap="true" width="80mm" />
                    </asp:BoundField>
                    <asp:BoundField 
                        DataField="Apu_Rubro_Unidad" 
                        meta:resourcekey="BoundApu_Rubro_UnidadRecursoKCG" 
                        SortExpression="Apu_Rubro_Unidad" >
                        <itemstyle horizontalalign="Center" />
                    </asp:BoundField>
                    <asp:BoundField 
                        DataField="Cantidad" 
                        meta:resourcekey="BoundCantidadRecursoKCG"
                        SortExpression="Cantidad" 
                        dataformatstring="{0:N4}" >
                        <itemstyle horizontalalign="Right" />
                    </asp:BoundField>
                    
                    <asp:BoundField DataField="Apu_Proyecto_Id" HeaderText="Apu_Proyecto_Id" SortExpression="Apu_Proyecto_Id"
                        Visible="False" />
                    <asp:BoundField DataField="Apu_Rubro_Id" HeaderText="Apu_Rubro_Id" SortExpression="Apu_Rubro_Id"
                        Visible="False" />
                    <asp:BoundField DataField="Rendimiento_Mano_Obra" HeaderText="Rendimiento_Mano_Obra"
                        SortExpression="Rendimiento_Mano_Obra" Visible="False" />
                    <asp:BoundField DataField="Rendimiento_Equipo" HeaderText="Rendimiento_Equipo" SortExpression="Rendimiento_Equipo"
                        Visible="False" />
                    <asp:BoundField DataField="Apu_Subtitulo_id" HeaderText="Apu_Subtitulo_id" SortExpression="Apu_Subtitulo_id"
                        Visible="False" />
                    <asp:BoundField DataField="Apu_Proyecto_Codigo" HeaderText="Apu_Proyecto_Codigo"
                        SortExpression="Apu_Proyecto_Codigo" Visible="False" />
                    <asp:BoundField DataField="Apu_Proyecto_Nombre" HeaderText="Apu_Proyecto_Nombre"
                        SortExpression="Apu_Proyecto_Nombre" Visible="False" />
                    <asp:BoundField DataField="Apu_Subtitulo_Codigo" HeaderText="Apu_Subtitulo_Codigo"
                        SortExpression="Apu_Subtitulo_Codigo" Visible="False" />
                    <asp:BoundField DataField="Apu_Subtitulo_Nombre" HeaderText="Apu_Subtitulo_Nombre"
                        SortExpression="Apu_Subtitulo_Nombre" Visible="False" />
                    <asp:BoundField DataField="Apu_Titulo_id" HeaderText="Apu_Titulo_id" SortExpression="Apu_Titulo_id"
                        Visible="False" />
                    <asp:BoundField DataField="Apu_Titulo_Codigo" HeaderText="Apu_Titulo_Codigo" SortExpression="Apu_Titulo_Codigo"
                        Visible="False" />
                    <asp:BoundField DataField="Apu_Titulo_Nombre" HeaderText="Apu_Titulo_Nombre" SortExpression="Apu_Titulo_Nombre"
                        Visible="False" />
                    <asp:BoundField DataField="Estado_Nombre" HeaderText="Estado_Nombre" SortExpression="Estado_Nombre"
                        Visible="False" />
                    <asp:BoundField DataField="Rendimiento_Mano_Obra_Hora" HeaderText="Rendimiento_Mano_Obra_Hora"
                        SortExpression="Rendimiento_Mano_Obra_Hora" Visible="False" />
                    <asp:BoundField DataField="Rendimiento_Equipo_Hora" HeaderText="Rendimiento_Equipo_Hora"
                        SortExpression="Rendimiento_Equipo_Hora" Visible="False" />
                    <asp:BoundField DataField="Material_costo_total" HeaderText="Material_costo_total"
                        SortExpression="Material_costo_total" Visible="False" />
                    <asp:BoundField DataField="Transporte_costo_total" HeaderText="Transporte_costo_total"
                        SortExpression="Transporte_costo_total" Visible="False" />
                    <asp:BoundField DataField="Mano_obra_costo_total" HeaderText="Mano_obra_costo_total"
                        SortExpression="Mano_obra_costo_total" Visible="False" />
                    <asp:BoundField DataField="Equipo_costo_total" HeaderText="Equipo_costo_total" SortExpression="Equipo_costo_total"
                        Visible="False" />
                    <asp:BoundField DataField="Costo_Unitario" HeaderText="Costo_Unitario" SortExpression="Costo_Unitario"
                        Visible="False" />
                    <asp:BoundField DataField="Costo_Total" HeaderText="Costo_Total" SortExpression="Costo_Total"
                        Visible="False" />
                    <asp:BoundField DataField="Apu_Proyecto_Etapa" HeaderText="Apu_Proyecto_Etapa" SortExpression="Apu_Proyecto_Etapa"
                        Visible="False" />
                    <asp:BoundField DataField="Apu_rubro_Costo_Total" HeaderText="Apu_rubro_Costo_Total"
                        SortExpression="Apu_rubro_Costo_Total" Visible="False" />
                    <asp:BoundField DataField="Material_ultima_fecha_update" HeaderText="Material_ultima_fecha_update"
                        SortExpression="Material_ultima_fecha_update" Visible="False" />
                    <asp:BoundField DataField="Transporte_ultima_fecha_update" HeaderText="Transporte_ultima_fecha_update"
                        SortExpression="Transporte_ultima_fecha_update" Visible="False" />
                    <asp:BoundField DataField="Mano_obra_ultima_fecha_update" HeaderText="Mano_obra_ultima_fecha_update"
                        SortExpression="Mano_obra_ultima_fecha_update" Visible="False" />
                    <asp:BoundField DataField="Equipo_ultima_fecha_update" HeaderText="Equipo_ultima_fecha_update"
                        SortExpression="Equipo_ultima_fecha_update" Visible="False" />
                    <asp:BoundField DataField="int_moneda_simbolo" HeaderText="int_moneda_simbolo" SortExpression="int_moneda_simbolo"
                        Visible="False" />
                    <asp:BoundField DataField="Int_Sucursal_Id" HeaderText="Int_Sucursal_Id" SortExpression="Int_Sucursal_Id"
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
        ID="odsgvapu_proyecto_rubro_coordinador" 
        runat="server" 
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetByProyecto" 
        TypeName="FEL.APU.BO_Apu_Proyecto_Rubro">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
            <asp:QueryStringParameter Name="Apu_Proyecto_Id" QueryStringField="Apu_Proyecto_Id"
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

