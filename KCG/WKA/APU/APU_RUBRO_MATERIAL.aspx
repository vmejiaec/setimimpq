<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="APU_RUBRO_MATERIAL.aspx.cs" 
    Inherits="APU_APU_RUBRO_MATERIAL" 
    Theme="EstiloKCG"
    StylesheetTheme="EstiloKCG" 
    Meta:resourcekey="Tit_Apu_Rubro_MaterialRecursoKCG" %>
    
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
    runat="server"
    UpdateMode="Conditional">
        <ContentTemplate>
            <asp:FormView 
                ID="fvapu_rubro_material" 
                runat="server" 
                DataSourceID="odsfvapu_rubro_material"
                DefaultMode="Insert" >
                <EditItemTemplate> 
                    <asp:panel
                    id="pnldatos1" 
                    runat="server"
                    Meta:resourcekey="Rec_Apu_Rubro_Material_RubroRecursoKCG"> 
                    <table>
                        <tr align="left">
                            <td>
                                <asp:label 
                                    ID="lblRubrocodigo" 
                                    runat="server"
                                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                    AssociatedControlID="Apu_Rubro_Codigo" 
                                    Text='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.Text").ToString() %>'> 
                                </asp:label>
                            </td>
                            <td>
                                  <asp:TextBox 
                                    ID="Apu_Rubro_Codigo" 
                                    runat="server"                                     
                                    ReadOnly="true"
                                    TabIndex="-1"
                                    ToolTip='<%# GetLocalResourceObject("Apu_Rubro_CodigoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Rubro_Codigo") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Apu_Rubro_Nombre" 
                                    runat="server"                                     
                                    ReadOnly="true"
                                    Width="300px"
                                    TabIndex="-1"
                                    ToolTip='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Rubro_Nombre") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr align="left">
                             <td>
                                <asp:Label 
                                    ID="lblunidad" 
                                    runat="server"
                                    Text='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.Text").ToString() %>'> 
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                ID="Apu_Rubro_Unidad" 
                                runat="server"                                
                                ReadOnly="true"
                                TabIndex="-1"
                                ToolTip='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.ToolTip").ToString() %>'
                                Text='<%# Bind("Apu_Rubro_Unidad") %>'> 
                                </asp:TextBox>                                
                            </td>
                        </tr>
                    </table>                   
                   </asp:panel>
                   <asp:Panel
                    id="pnldatos2" 
                    runat="server"
                    Meta:resourcekey="Rec_Apu_Rubro_MaterialRecursoKCG">
                    <table>
                        <tr align="left">
                            <td>
                                <asp:label 
                                    ID="Lblmaterial" 
                                    runat="server" 
                                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                    AssociatedControlID="Apu_Material_Nombre"
                                    Text='<%# GetLocalResourceObject("Apu_Material_NombreRecursoKCG.Text").ToString() %>'> 
                                </asp:label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Apu_Material_Nombre" 
                                    runat="server"
                                    Style="text-transform:uppercase"
                                    CssClass = "TEXTO_COMBOPER_KCG" 
                                    Width="400px"   
                                    Height="50px"    
                                    TextMode="MultiLine"                             
                                    ToolTip='<%# GetLocalResourceObject("Apu_Material_NombreRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Material_Nombre") %>'>
                                </asp:TextBox> 
                                <asp:Button 
                                    ID="btnZoomMaterial" 
                                    runat="server" 
                                    CommandArgument="RutaDestino: ~/APU/APU_MATERIAL.aspx; Filtro: Apu_Material_Nombre; Obtener: costo_unitario|Costo_Total"
                                    CommandName="Zoom" 
                                    Text="..." />                                
                                <asp:RequiredFieldValidator 
                                    ID="rvapumaterial"
                                    runat="server" 
                                    ControlToValidate="Apu_Material_Nombre"
                                    ValidationGroup="I"
                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server" 
                                    ID="ValidatorCalloutExtender3"
                                    TargetControlID="rvapumaterial"/>
                                <AjaxControlToolkit:AutoCompleteExtender
                                        runat="server" 
                                        BehaviorID="AutoCompleteEx"
                                        ID="autoComplete1"                                         
                                        TargetControlID="Apu_Material_Nombre"
                                        ServicePath="~/APU/APU_RUBRO_MATERIAL.aspx" 
                                        ServiceMethod="GetMaterial"
                                        MinimumPrefixLength="1" 
                                        CompletionInterval="500"
                                        EnableCaching="true"
                                        CompletionSetCount="500"
                                        CompletionListCssClass="autocomplete_completionListElement" 
                                        CompletionListItemCssClass="autocomplete_listItem" 
                                        CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                        DelimiterCharacters=""
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
                                
                                var costo_unitario = null;
                                var Cantidad = null;
                                

                                function page_load(sender, e){
                                    Cantidad = $get("ctl00_ContentPlaceHolder1_fvapu_rubro_material_Cantidad");
                                    costo_unitario = $get("ctl00_ContentPlaceHolder1_fvapu_rubro_material_costo_unitario");                                
                                    $addHandler(Cantidad, "change", Cantidad_onchange);
                                    Calcular();
                                }
                                
                               
                                function page_unload(sender, e){
                                    $removeHandler(Cantidad, "change", Cantidad_onchange);
                                }
                                
                                function Cantidad_onchange(sender, e){
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
                                    
                                    
                                    var Apu_Material_Id = $get("ctl00_ContentPlaceHolder1_fvapu_rubro_material_Apu_Material_Id");
                                    Apu_Material_Id.value = temp[0];
                                    
                                    var Apu_Material_Unidad = $get("ctl00_ContentPlaceHolder1_fvapu_rubro_material_Apu_Material_Unidad");
                                    Apu_Material_Unidad.value = temp[1];
                                    
                                    var costo_unitario = $get("ctl00_ContentPlaceHolder1_fvapu_rubro_material_costo_unitario");
                                    costo_unitario.value = temp[2];                                    
                                    Calcular();
                                }    
                       
                                function Calcular()
                                {
                                    var resultado = 0.00;
                                    var costo_total = $get("ctl00_ContentPlaceHolder1_fvapu_rubro_material_costo_total");
                                                    
                                    var numCosto_unitario = Number.parseLocale(costo_unitario.value);
                                    if(isNaN(numCosto_unitario))
                                        numCosto_unitario = 0.0; 
                                    
                                    var numCantidad = Number.parseLocale(Cantidad.value);
                                    if(isNaN(numCantidad))
                                        numCantidad = 0.0;
                                    
                                    resultado = numCosto_unitario *  numCantidad;
                                    costo_total.value = resultado.localeFormat("N4");
                                } 
                            </script>
                            <input type="submit" style="display:none;" />
                           </td>
                                    
                            </td>
                            <td>
                                <asp:Label 
                                    ID="lblEstado" 
                                    runat="server"
                                    Text='<%# Bind("Estado_Nombre") %>'>
                                </asp:Label>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:label 
                                    ID="Lblmaterial_unidad" 
                                    runat="server"
                                    Text='<%# GetLocalResourceObject("Apu_Material_UnidadRecursoKCG.Text").ToString() %>'> 
                                </asp:label>
                            </td>
                            <td>
                                <asp:TextBox 
                                ID="Apu_Material_Unidad" 
                                runat="server"                                 
                                ReadOnly="true"
                                TabIndex="-1"
                                ToolTip='<%# GetLocalResourceObject("Apu_Material_UnidadRecursoKCG.ToolTip").ToString() %>'
                                Text='<%# Bind("Apu_Material_Unidad") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:label 
                                    ID="Lblcantidad" 
                                    runat="server"
                                    Text='<%# GetLocalResourceObject("CantidadRecursoKCG.Text").ToString() %>'> 
                                </asp:label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Cantidad" 
                                    runat="server"
                                    CssClass = "TEXTO_EDICION_KCG"
                                    Style="text-align:right"
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
                                    ClearMaskOnLostFocus="True" />

                                <AjaxControlToolkit:MaskedEditValidator ID="MaskedEditValidator2" runat="server"
                                    ControlExtender="meeCantidad"
                                    ControlToValidate="Cantidad"
                                    IsValidEmpty="False"
                                    EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.ErrorMessage").ToString() %>'
                                    InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.ErrorMessage").ToString() %>'
                                    MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.ErrorMessage").ToString() %>'
                                    MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.ErrorMessage").ToString() %>'
                                    MinimumValue="0.0001"
                                    MaximumValue="9999999999999.9999" 
                                    Display="Dynamic"
                                    EmptyValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'
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
                                <asp:label 
                                    ID="Lblcosto_unitario" 
                                    runat="server"
                                    Text='<%# GetLocalResourceObject("costo_unitarioRecursoKCG.Text").ToString() %>'> 
                                </asp:label>
                            </td>
                            <td>
                                 <asp:TextBox 
                                 ID="costo_unitario" 
                                 runat="server"
                                 Style="text-align:right"                                 
                                 ReadOnly = "true"  
                                 TabIndex="-1"
                                 ToolTip='<%# GetLocalResourceObject("costo_totalRecursoKCG.ToolTip").ToString() %>'
                                 Text='<%# Bind("costo_unitario","{0:N4}") %>'>
                                 </asp:TextBox>
                                 <asp:Label 
                                    ID="lblmoneda1" 
                                    runat="server"                                    
                                    Text='<%# Bind("int_moneda_simbolo") %>'>
                                </asp:Label>                                 
                                 
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:label 
                                    ID="Lblcosto_total" 
                                    runat="server"
                                    Text='<%# GetLocalResourceObject("costo_totalRecursoKCG.Text").ToString() %>'> 
                                 </asp:label>
                            </td>
                            <td>
                                <%--campo calculado--%>
                                <asp:TextBox 
                                ID="costo_total" 
                                runat="server"
                                Style="text-align:right"                                 
                                ReadOnly="true" 
                                TabIndex = "-1"
                                ToolTip='<%# GetLocalResourceObject("costo_totalRecursoKCG.ToolTip").ToString() %>'
                                Text='<%# Bind("costo_total","{0:N4}") %>' >
                                </asp:TextBox>                                
                                <asp:Label 
                                    ID="Label1" 
                                    runat="server"                                    
                                    Text='<%# Bind("int_moneda_simbolo") %>'>
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
                  
                  <%--ID'S--%> 
                  
                    <asp:TextBox 
                        ID="Apu_Rubro_Id" 
                        runat="server"                        
                        Visible="true"
                        style="display:none"
                        Text='<%# Bind("Apu_Rubro_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Material_Id" 
                        runat="server"
                        Visible="true" 
                        style="display:none"
                        Text='<%# Bind("Apu_Material_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Update_Per_Personal_Id" 
                        runat="server"
                        Visible="true" 
                        style="display:none"
                        Text='<%# Bind("Update_Per_Personal_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Creacion_Per_Personal_Id" 
                        runat="server"
                        Visible="true" 
                        style="display:none"
                        Text='<%# Bind("Creacion_Per_Personal_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="UpdateTransporte_Per_Personal_Id" 
                        runat="server"
                        Visible="true" 
                        style="display:none"
                        Text='<%# Bind("UpdateTransporte_Per_Personal_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Id" 
                        runat="server"
                        Visible="true" 
                        style="display:none"
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    
                  <%-- CAMPOS NO VISIBLES--%>
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
                        ID="Fecha_Update" 
                        runat="server"
                        Visible="false" 
                        Text='<%# Bind("Fecha_Update") %>'>
                    </asp:TextBox>
                     <asp:TextBox 
                        ID="Fecha_Creacion" 
                        runat="server"
                        Visible="false"
                        Text='<%# Bind("Fecha_Creacion") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Fecha_UpdateTransporte" 
                        runat="server"
                        Visible="false"
                        Text='<%# Bind("Fecha_UpdateTransporte") %>'>
                    </asp:TextBox>                    
                    <asp:TextBox 
                        ID="Apu_Material_Codigo" 
                        runat="server"
                        Visible="false"
                        Text='<%# Bind("Apu_Material_Codigo") %>'>
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
                        ID="costo_unitario_transporte" 
                        runat="server"
                        Visible="false"
                        Text='<%# Bind("costo_unitario_transporte") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="costo_total_transporte" 
                        runat="server"
                        Visible="false"
                        Text='<%# Bind("costo_total_transporte") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="int_moneda_simbolo" 
                        runat="server"
                        Visible="false"
                        Text='<%# Bind("int_moneda_simbolo") %>'>
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
                   <asp:panel
                    id="pnldatos1" 
                    runat="server"
                    Meta:resourcekey="Rec_Apu_Rubro_Material_RubroRecursoKCG"> 
                    <table>
                        <tr align="left">
                            <td>
                                <asp:label 
                                    ID="lblRubrocodigo" 
                                    runat="server"
                                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                    AssociatedControlID="Apu_Rubro_Codigo"
                                    Text='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.Text").ToString() %>'> 
                                </asp:label>
                            </td>
                            <td>
                                  <asp:TextBox 
                                    ID="Apu_Rubro_Codigo" 
                                    runat="server"                                     
                                    ReadOnly="true"
                                    TabIndex="-1"
                                    ToolTip='<%# GetLocalResourceObject("Apu_Rubro_CodigoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Rubro_Codigo") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Apu_Rubro_Nombre" 
                                    runat="server"                                     
                                    ReadOnly="true"
                                    Width="300px"
                                    TabIndex="-1"
                                    ToolTip='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Rubro_Nombre") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr align="left">
                             <td>
                                <asp:Label 
                                    ID="lblunidad" 
                                    runat="server"
                                    Text='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.Text").ToString() %>'> 
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                ID="Apu_Rubro_Unidad" 
                                runat="server"                                
                                ReadOnly="true"
                                TabIndex="-1"
                                ToolTip='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.ToolTip").ToString() %>'
                                Text='<%# Bind("Apu_Rubro_Unidad") %>'> 
                                </asp:TextBox>                                
                            </td>
                        </tr>
                    </table>                   
                   </asp:panel>
                   <asp:Panel
                    id="pnldatos2" 
                    runat="server"
                    Meta:resourcekey="Rec_Apu_Rubro_MaterialRecursoKCG">
                    <table>
                        <tr align="left">
                            <td>
                                <asp:label 
                                    ID="Lblmaterial" 
                                    runat="server" 
                                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                    AssociatedControlID="Apu_Material_Nombre"
                                    Text='<%# GetLocalResourceObject("Apu_Material_NombreRecursoKCG.Text").ToString() %>'> 
                                </asp:label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Apu_Material_Nombre" 
                                    runat="server"
                                    Style="text-transform:uppercase"
                                    CssClass = "TEXTO_COMBOPER_KCG"  
                                    Width="400px"   
                                    Height="50px"    
                                    TextMode="MultiLine"                                   
                                    ToolTip='<%# GetLocalResourceObject("Apu_Material_NombreRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Material_Nombre") %>'>
                                </asp:TextBox> 
                                <asp:Button 
                                    ID="btnZoomMaterial" 
                                    runat="server" 
                                    CommandArgument="RutaDestino: ~/APU/APU_MATERIAL.aspx; Filtro: Apu_Material_Nombre; Obtener: costo_unitario|Costo_Total"
                                    CommandName="Zoom" 
                                    Text="..." />
                                <asp:RequiredFieldValidator 
                                    ID="rvapumaterial"
                                    runat="server" 
                                    ControlToValidate="Apu_Material_Nombre"
                                    ValidationGroup="I"
                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server" 
                                    ID="ValidatorCalloutExtender3"
                                    TargetControlID="rvapumaterial"/>
                                <AjaxControlToolkit:AutoCompleteExtender
                                        runat="server" 
                                        BehaviorID="AutoCompleteEx"
                                        ID="autoComplete1" 
                                        TargetControlID="Apu_Material_Nombre"
                                        ServicePath="~/APU/APU_RUBRO_MATERIAL.aspx" 
                                        ServiceMethod="GetMaterial"
                                        MinimumPrefixLength="1" 
                                        CompletionInterval="500"
                                        EnableCaching="true"
                                        CompletionSetCount="500"
                                        CompletionListCssClass="autocomplete_completionListElement" 
                                        CompletionListItemCssClass="autocomplete_listItem" 
                                        CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                        DelimiterCharacters=""
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
                            <td>
                                <asp:Label 
                                    ID="lblestado" 
                                    runat="server"
                                    Text='<%# Bind("Estado_Nombre") %>'>
                                </asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <script type="text/javascript">
                                        
                                Sys.Application.add_load(page_load);
                                Sys.Application.add_unload(page_unload);
                                
                                var costo_unitario = null;
                                var Cantidad = null;
                                

                                function page_load(sender, e){
                                    Cantidad = $get("ctl00_ContentPlaceHolder1_fvapu_rubro_material_Cantidad");
                                    costo_unitario = $get("ctl00_ContentPlaceHolder1_fvapu_rubro_material_costo_unitario");                                
                                    $addHandler(Cantidad, "change", Cantidad_onchange);
                                    Calcular();
                                }
                                
                               
                                function page_unload(sender, e){
                                    $removeHandler(Cantidad, "change", Cantidad_onchange);
                                }
                                
                                function Cantidad_onchange(sender, e){
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
                                    
                                    
                                    var Apu_Material_Id = $get("ctl00_ContentPlaceHolder1_fvapu_rubro_material_Apu_Material_Id");
                                    Apu_Material_Id.value = temp[0];
                                    
                                    var Apu_Material_Unidad = $get("ctl00_ContentPlaceHolder1_fvapu_rubro_material_Apu_Material_Unidad");
                                    Apu_Material_Unidad.value = temp[1];
                                    
                                    var costo_unitario = $get("ctl00_ContentPlaceHolder1_fvapu_rubro_material_costo_unitario");
                                    costo_unitario.value = temp[2];                                    
                                    Calcular();
                                }    
                       
                                function Calcular()
                                {
                                    var resultado = 0.00;
                                    var costo_total = $get("ctl00_ContentPlaceHolder1_fvapu_rubro_material_costo_total");
                                                    
                                    var numCosto_unitario = Number.parseLocale(costo_unitario.value);
                                    if(isNaN(numCosto_unitario))
                                        numCosto_unitario = 0.0; 
                                    
                                    var numCantidad = Number.parseLocale(Cantidad.value);
                                    if(isNaN(numCantidad))
                                        numCantidad = 0.0;
                                    
                                    resultado = numCosto_unitario *  numCantidad;
                                    costo_total.value = resultado.localeFormat("N4");
                                } 
                            </script>
                            <input type="submit" style="display:none;" />
                           </td>
                       </tr>
                       <tr>
                            <td>
                               <asp:label 
                                    ID="Lblmaterial_unidad" 
                                    runat="server"
                                    Text='<%# GetLocalResourceObject("Apu_Material_UnidadRecursoKCG.Text").ToString() %>'> 
                                </asp:label>
                            </td>
                            <td>
                                <asp:TextBox 
                                ID="Apu_Material_Unidad" 
                                runat="server"                                 
                                ReadOnly="true"
                                TabIndex="-1"
                                ToolTip='<%# GetLocalResourceObject("Apu_Material_UnidadRecursoKCG.ToolTip").ToString() %>'
                                Text='<%# Bind("Apu_Material_Unidad") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:label 
                                    ID="Lblcantidad" 
                                    runat="server"
                                    Text='<%# GetLocalResourceObject("CantidadRecursoKCG.Text").ToString() %>'> 
                                </asp:label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Cantidad" 
                                    runat="server"
                                    Style="text-align:right"
                                    CssClass = "TEXTO_EDICION_KCG"
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
                                    ClearMaskOnLostFocus="True"  />

                                <AjaxControlToolkit:MaskedEditValidator ID="MaskedEditValidator2" runat="server"
                                    ControlExtender="meeCantidad"
                                    ControlToValidate="Cantidad"
                                    IsValidEmpty="False"
                                    EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.ErrorMessage").ToString() %>'
                                    InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.ErrorMessage").ToString() %>'
                                    MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.ErrorMessage").ToString() %>'
                                    MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.ErrorMessage").ToString() %>'
                                    MinimumValue="0.0001"
                                    MaximumValue="9999999999999.9999" 
                                    Display="Dynamic"
                                    EmptyValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'
                                    InvalidValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'
                                    MaximumValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>' 
                                    MinimumValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'
                                    ValidationGroup="I" />  
                                  
                                  <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server" 
                                    ID="ValidatorCalloutExtender1"
                                    TargetControlID="MaskedEditValidator2"/> 
                               
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:label 
                                    ID="Lblcosto_unitario" 
                                    runat="server"
                                    Text='<%# GetLocalResourceObject("costo_unitarioRecursoKCG.Text").ToString() %>'> 
                                </asp:label>
                            </td>
                            <td>
                                 <asp:TextBox 
                                 ID="costo_unitario" 
                                 runat="server"
                                 Style="text-align:right"                                 
                                 ReadOnly = "true"  
                                 TabIndex = "-1"
                                 ToolTip='<%# GetLocalResourceObject("costo_unitarioRecursoKCG.ToolTip").ToString() %>'
                                 Text='<%# Bind("costo_unitario","{0:N4}") %>'>
                                 </asp:TextBox>
                                 <asp:Label 
                                    ID="lblmoneda1" 
                                    runat="server"                                    
                                    Text='<%# Bind("int_moneda_simbolo") %>'>
                                </asp:Label>
                                 
                                 
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:label 
                                    ID="Lblcosto_total" 
                                    runat="server"
                                    Text='<%# GetLocalResourceObject("costo_totalRecursoKCG.Text").ToString() %>'> 
                                 </asp:label>
                            </td>
                            <td>
                                <%--campo calculado--%>
                                <asp:TextBox 
                                ID="costo_total" 
                                runat="server"
                                Style="text-align:right"                                
                                ReadOnly="true" 
                                TabIndex="-1"
                                ToolTip='<%# GetLocalResourceObject("costo_totalRecursoKCG.ToolTip").ToString() %>'
                                Text='<%# Bind("costo_total","{0:N4}") %>' >
                                </asp:TextBox>
                                <asp:Label 
                                    ID="Label1" 
                                    runat="server"                                    
                                    Text='<%# Bind("int_moneda_simbolo") %>'>
                                </asp:Label>                                                         
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
                  
                  <%--ID'S--%> 
                  
                    <asp:TextBox 
                        ID="Apu_Rubro_Id" 
                        runat="server"                        
                        Visible="true"
                        style="display:none"
                        Text='<%# Bind("Apu_Rubro_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Material_Id" 
                        runat="server"
                        Visible="true" 
                        style="display:none"
                        Text='<%# Bind("Apu_Material_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Update_Per_Personal_Id" 
                        runat="server"
                        Visible="true" 
                        style="display:none"
                        Text='<%# Bind("Update_Per_Personal_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Creacion_Per_Personal_Id" 
                        runat="server"
                        Visible="true" 
                        style="display:none"
                        Text='<%# Bind("Creacion_Per_Personal_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="UpdateTransporte_Per_Personal_Id" 
                        runat="server"
                        style="display:none"                       
                        Text='<%# Bind("UpdateTransporte_Per_Personal_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Id" 
                        runat="server"
                        Visible="true" 
                        style="display:none"
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    
                  <%-- CAMPOS NO VISIBLES--%>
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
                        ID="Fecha_Update" 
                        runat="server"
                        Visible="false" 
                        Text='<%# Bind("Fecha_Update") %>'>
                    </asp:TextBox>
                     <asp:TextBox 
                        ID="Fecha_Creacion" 
                        runat="server"
                        Visible="false"
                        Text='<%# Bind("Fecha_Creacion") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Fecha_UpdateTransporte" 
                        runat="server"
                        Visible="false"
                        Text='<%# Bind("Fecha_UpdateTransporte") %>'>
                    </asp:TextBox>                    
                    <asp:TextBox 
                        ID="Apu_Material_Codigo" 
                        runat="server"
                        Visible="false"
                        Text='<%# Bind("Apu_Material_Codigo") %>'>
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
                        ID="costo_unitario_transporte" 
                        runat="server"
                        Visible="false"
                        Text='<%# Bind("costo_unitario_transporte") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="costo_total_transporte" 
                        runat="server"
                        Visible="false"
                        Text='<%# Bind("costo_total_transporte") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="int_moneda_simbolo" 
                        runat="server"
                        Visible="false"
                        Text='<%# Bind("int_moneda_simbolo") %>'>
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
                    <asp:panel
                    id="pnldatos1" 
                    runat="server"
                    Meta:resourcekey="Rec_Apu_Rubro_Material_RubroRecursoKCG"> 
                    <table>
                        <tr align="left">
                            <td>
                                <asp:label 
                                    ID="lblRubrocodigo" 
                                    runat="server"
                                    Text='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.Text").ToString() %>'> 
                                </asp:label>
                            </td>
                            <td>
                                  <asp:TextBox 
                                    ID="Apu_Rubro_Codigo" 
                                    runat="server"                                     
                                    ReadOnly="true"
                                    TabIndex="-1"
                                    ToolTip='<%# GetLocalResourceObject("Apu_Rubro_CodigoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Rubro_Codigo") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Apu_Rubro_Nombre" 
                                    runat="server"                                     
                                    ReadOnly="true"
                                    Width="300px"
                                    TabIndex="-1"
                                    ToolTip='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Rubro_Nombre") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr align="left">
                             <td>
                                <asp:Label 
                                    ID="lblunidad" 
                                    runat="server"
                                    Text='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.Text").ToString() %>'> 
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                ID="Apu_Rubro_Unidad" 
                                runat="server"                                
                                ReadOnly="true"
                                TabIndex="-1"
                                ToolTip='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.ToolTip").ToString() %>'
                                Text='<%# Bind("Apu_Rubro_Unidad") %>'> 
                                </asp:TextBox>                                
                            </td>
                        </tr>
                    </table>                   
                   </asp:panel>
                   <asp:Panel
                    id="pnldatos2" 
                    runat="server"
                    Meta:resourcekey="Rec_Apu_Rubro_MaterialRecursoKCG">
                    <table>
                        <tr align="left">
                            <td>
                                <asp:label 
                                    ID="Lblmaterial" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Apu_Material_NombreRecursoKCG.Text").ToString() %>'> 
                                </asp:label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Apu_Material_Nombre" 
                                    TabIndex="-1"
                                    runat="server"     
                                    ReadOnly="true" 
                                    CssClass ="TEXTO_LECTURA_KCG" 
                                    Width="400px"   
                                    Height="50px"    
                                    TextMode="MultiLine"                              
                                    ToolTip='<%# GetLocalResourceObject("Apu_Material_NombreRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Material_Nombre") %>'>
                                </asp:TextBox>                                 
                            </td>
                            <td>
                                <asp:Label 
                                    ID="lblEstado" 
                                    runat="server"
                                    Text='<%# Bind("Estado_Nombre") %>'>
                                </asp:Label>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:label 
                                    ID="Lblmaterial_unidad" 
                                    runat="server"
                                    Text='<%# GetLocalResourceObject("Apu_Material_UnidadRecursoKCG.Text").ToString() %>'> 
                                </asp:label>
                            </td>
                            <td>
                                <asp:TextBox 
                                ID="Apu_Material_Unidad" 
                                runat="server"                                 
                                ReadOnly="true"
                                TabIndex="-1"
                                ToolTip='<%# GetLocalResourceObject("Apu_Material_UnidadRecursoKCG.ToolTip").ToString() %>'
                                Text='<%# Bind("Apu_Material_Unidad") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:label 
                                    ID="Lblcantidad" 
                                    runat="server"
                                    Text='<%# GetLocalResourceObject("CantidadRecursoKCG.Text").ToString() %>'> 
                                </asp:label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Cantidad" 
                                    runat="server"
                                    Style="text-align:right"
                                    ReadOnly="true" 
                                    TabIndex="-1"
                                    ToolTip='<%# GetLocalResourceObject("CantidadRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Cantidad","{0:N4}") %>'>
                                </asp:TextBox>                               
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:label 
                                    ID="Lblcosto_unitario" 
                                    runat="server"
                                    Text='<%# GetLocalResourceObject("costo_unitarioRecursoKCG.Text").ToString() %>'> 
                                </asp:label>
                            </td>
                            <td>
                                 <asp:TextBox 
                                 ID="costo_unitario" 
                                 runat="server"     
                                 Style="text-align:right"                            
                                 ReadOnly = "true"
                                 TabIndex="-1"  
                                 ToolTip='<%# GetLocalResourceObject("costo_totalRecursoKCG.ToolTip").ToString() %>'
                                 Text='<%# Bind("costo_unitario","{0:N4}") %>'>
                                 </asp:TextBox>
                                 <asp:Label 
                                    ID="lblmoneda1" 
                                    runat="server"                                    
                                    Text='<%# Bind("int_moneda_simbolo") %>'>
                                </asp:Label>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:label 
                                    ID="Lblcosto_total" 
                                    runat="server"
                                    Text='<%# GetLocalResourceObject("costo_totalRecursoKCG.Text").ToString() %>'> 
                                 </asp:label>
                            </td>
                            <td>
                                <%--campo calculado--%>
                                <asp:TextBox 
                                ID="costo_total" 
                                runat="server"   
                                Style="text-align:right"                             
                                ReadOnly="true"
                                TabIndex="-1" 
                                ToolTip='<%# GetLocalResourceObject("costo_totalRecursoKCG.ToolTip").ToString() %>'
                                Text='<%# Bind("costo_total","{0:N4}") %>' >
                                </asp:TextBox>
                                <asp:Label 
                                    ID="Label1" 
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
                  
                  <%--ID'S--%> 
                  
                    <asp:TextBox 
                        ID="Apu_Rubro_Id" 
                        runat="server"                        
                        Visible="true"
                        style="display:none"
                        
                        Text='<%# Bind("Apu_Rubro_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Material_Id" 
                        runat="server"
                        Visible="true" 
                        style="display:none"
                        Text='<%# Bind("Apu_Material_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Update_Per_Personal_Id" 
                        runat="server"
                        Visible="true" 
                        style="display:none"
                        Text='<%# Bind("Update_Per_Personal_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Creacion_Per_Personal_Id" 
                        runat="server"
                        Visible="true" 
                        style="display:none"
                        Text='<%# Bind("Creacion_Per_Personal_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="UpdateTransporte_Per_Personal_Id" 
                        runat="server"
                        Visible="true" 
                        style="display:none"
                        Text='<%# Bind("UpdateTransporte_Per_Personal_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Id" 
                        runat="server"
                        Visible="true" 
                        style="display:none"
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    
                  <%-- CAMPOS NO VISIBLES--%>
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
                        ID="Fecha_Update" 
                        runat="server"
                        Visible="false" 
                        Text='<%# Bind("Fecha_Update") %>'>
                    </asp:TextBox>
                     <asp:TextBox 
                        ID="Fecha_Creacion" 
                        runat="server"
                        Visible="false"
                        Text='<%# Bind("Fecha_Creacion") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Fecha_UpdateTransporte" 
                        runat="server"
                        Visible="false"
                        Text='<%# Bind("Fecha_UpdateTransporte") %>'>
                    </asp:TextBox>                    
                    <asp:TextBox 
                        ID="Apu_Material_Codigo" 
                        runat="server"
                        Visible="false"
                        Text='<%# Bind("Apu_Material_Codigo") %>'>
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
                        ID="costo_unitario_transporte" 
                        runat="server"
                        Visible="false"
                        Text='<%# Bind("costo_unitario_transporte") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="costo_total_transporte" 
                        runat="server"
                        Visible="false"
                        Text='<%# Bind("costo_total_transporte") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="int_moneda_simbolo" 
                        runat="server"
                        Visible="false"
                        Text='<%# Bind("int_moneda_simbolo") %>'>
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
                GridViewID="gvapu_rubro_material"
                FormViewID="FormView1" 
                OnNavegar="nav_Siguiente" />          
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger 
                ControlID="gvapu_rubro_material" 
                EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:ObjectDataSource 
        ID="odsfvapu_rubro_material" 
        runat="server" 
        ConflictDetection="CompareAllValues" 
        OldValuesParameterFormatString="original{0}"
        SelectMethod="GetById" 
        SortParameterName="sortExpression" 
        TypeName="FEL.APU.BO_Apu_Rubro_Material" 
        DeleteMethod="Delete" 
        InsertMethod="Insert" 
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
            Contenedor="APU_RUBRO_MATERIAL" 
            Objeto="APU_RUBRO_MATERIAL" 
            IndiceScope ="Scope"
            Orden="1"
            ObjectDataSourceID="odsgvapu_rubro_material" />
        </td>
        <td>    
            <asp:Button 
                ID="BtnRubro" 
                runat="server"                
                OnClick="BtnRubro_Click"/>
        </td>
        </tr>
        </table>        
            <asp:Panel 
                runat="server"
                id="pnlDatosGrid"
                meta:resourcekey="Rec_Listado_Apu_Rubro_MaterialRecursoKCG">                 
                <koala:KGrid 
                    ID="gvapu_rubro_material" 
                    runat="server" 
                    AllowPaging="True" 
                    AllowSorting="True"
                    AutoGenerateColumns="False"
                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>'                
                    DataKeyNames="Id" 
                    DataSourceID="odsgvapu_rubro_material">
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
                            DataField="Apu_Material_Codigo" 
                            meta:resourcekey="BoundApu_Material_CodigoRecursoKCG"
                            SortExpression="Apu_Material_Codigo" >
                            <itemstyle horizontalalign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Apu_Material_Nombre" 
                            meta:resourcekey="BoundApu_Material_NombreRecursoKCG"
                            SortExpression="Apu_Material_Nombre" >
                            <itemstyle wrap="True" width="80mm"  />                      
                         </asp:BoundField>             
                        <asp:BoundField 
                            DataField="Apu_Material_Unidad" 
                            meta:resourcekey="BoundApu_Material_UnidadRecursoKCG"
                            SortExpression="Apu_Material_Unidad" >
                            <itemstyle horizontalalign="Center" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Cantidad" 
                            meta:resourcekey="BoundCantidadRecursoKCG"
                            dataformatstring="{0:N4}"
                            SortExpression="Cantidad" >
                            <itemstyle horizontalalign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="costo_unitario" 
                            meta:resourcekey="Boundcosto_unitarioRecursoKCG"
                            dataformatstring="{0:N4}"
                            SortExpression="costo_unitario" >
                            <itemstyle horizontalalign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="costo_total" 
                            meta:resourcekey="Boundcosto_totalRecursoKCG"
                            SortExpression="costo_total"
                            dataformatstring="{0:N4}">
                            <itemstyle horizontalalign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Fecha_Update" 
                            meta:resourcekey="BoundFecha_UpdateRecursoKCG" 
                            SortExpression="Fecha_Update" />
                        <asp:BoundField 
                            DataField="Apu_Rubro_Id" 
                            HeaderText="Apu_Rubro_Id" 
                            SortExpression="Apu_Rubro_Id"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Material_Id" 
                            HeaderText="Apu_Material_Id" 
                            SortExpression="Apu_Material_Id"
                            Visible="False" />                        
                        <asp:BoundField 
                            DataField="Update_Per_Personal_Id" 
                            HeaderText="Update_Per_Personal_Id"
                            SortExpression="Update_Per_Personal_Id" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Fecha_Creacion" 
                            HeaderText="Fecha_Creacion" 
                            SortExpression="Fecha_Creacion"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Creacion_Per_Personal_Id" 
                            HeaderText="Creacion_Per_Personal_Id"
                            SortExpression="Creacion_Per_Personal_Id" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="UpdateTransporte_Per_Personal_Id" 
                            HeaderText="UpdateTransporte_Per_Personal_Id"
                            SortExpression="UpdateTransporte_Per_Personal_Id" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Fecha_UpdateTransporte" 
                            HeaderText="Fecha_UpdateTransporte"
                            SortExpression="Fecha_UpdateTransporte" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Rubro_Codigo" 
                            HeaderText="Apu_Rubro_Codigo" 
                            SortExpression="Apu_Rubro_Codigo"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Rubro_Nombre" 
                            HeaderText="Apu_Rubro_Nombre" 
                            SortExpression="Apu_Rubro_Nombre"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Rubro_Unidad" 
                            HeaderText="Apu_Rubro_Unidad" 
                            SortExpression="Apu_Rubro_Unidad"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Creacion_Per_Personal_Codigo" 
                            HeaderText="Creacion_Per_Personal_Codigo"
                            SortExpression="Creacion_Per_Personal_Codigo" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Creacion_Per_Personal_Nombre" 
                            HeaderText="Creacion_Per_Personal_Nombre"
                            SortExpression="Creacion_Per_Personal_Nombre" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Update_Per_Personal_Codigo" 
                            HeaderText="Update_Per_Personal_Codigo"
                            SortExpression="Update_Per_Personal_Codigo" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Update_Per_Personal_Nombre" 
                            HeaderText="Update_Per_Personal_Nombre"
                            SortExpression="Update_Per_Personal_Nombre" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="UpdateTransporte_Per_Personal_Codigo" 
                            HeaderText="UpdateTransporte_Per_Personal_Codigo"
                            SortExpression="UpdateTransporte_Per_Personal_Codigo" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="UpdateTransporte_Per_Personal_Nombre" 
                            HeaderText="UpdateTransporte_Per_Personal_Nombre"
                            SortExpression="UpdateTransporte_Per_Personal_Nombre" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="costo_unitario_transporte" 
                            HeaderText="costo_unitario_transporte"
                            SortExpression="costo_unitario_transporte" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="costo_total_transporte" 
                            HeaderText="costo_total_transporte"
                            SortExpression="costo_total_transporte" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="int_moneda_simbolo" 
                            HeaderText="int_moneda_simbolo" 
                            SortExpression="int_moneda_simbolo"
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
                </koala:KGrid>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:ObjectDataSource 
        ID="odsgvapu_rubro_material" 
        runat="server" 
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetByRubro" 
        TypeName="FEL.APU.BO_Apu_Rubro_Material">
        <SelectParameters>
             <asp:SessionParameter 
                Name="s" 
                SessionField="Scope" 
                Type="Object" />
            <asp:QueryStringParameter 
                DefaultValue="" 
                Name="Apu_Rubro_Id" 
                QueryStringField="Apu_Rubro_Id"
                Type="String" />
        </SelectParameters>
     </asp:ObjectDataSource>     
</asp:Content>

