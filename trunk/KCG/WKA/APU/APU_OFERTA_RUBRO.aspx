<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="APU_OFERTA_RUBRO.aspx.cs" 
    Inherits="APU_APU_OFERTA_RUBRO" 
    Theme="EstiloKCG"
    StylesheetTheme="EstiloKCG"
    meta:resourcekey="Tit_Apu_Oferta_RubroRecursoKCG" %>
    
<%@ Register tagprefix="koala" 
    assembly="KoalaWebControls" 
    namespace="Koala.KoalaWebControls" %>

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


<asp:Content 
ID="Content1" 
ContentPlaceHolderID="ContentPlaceHolder1" 
Runat="Server">
    <asp:UpdatePanel 
    ID="UpdatePanel1" 
    runat="server">
        <ContentTemplate>
            <script type="text/javascript">
                                        
                Sys.Application.add_load(page_load);
                Sys.Application.add_unload(page_unload);                                
                
                var Costo_Unitario = null;
                var Cantidad = null;                                            
                var RubroNombre = null;     
                var ExisteRegistroDesdeLista = false;

                function page_load(sender, e){
                    Cantidad = $get("ctl00_ContentPlaceHolder1_fvapu_oferta_rubro_Cantidad");
                    Costo_Unitario = $get("ctl00_ContentPlaceHolder1_fvapu_oferta_rubro_Costo_Unitario"); 
                    RubroNombre = $get("ctl00_ContentPlaceHolder1_fvapu_oferta_rubro_Apu_Rubro_Nombre");
                    $addHandler(RubroNombre, "change", RubroNombre_onchange);
                    $addHandler(Cantidad, "change", Cantidad_onchange);                                    
                }                                
               
                function page_unload(sender, e){
                    $removeHandler(Cantidad, "change", Cantidad_onchange);                                    
                    $removeHandler(RubroNombre, "change", RubroNombre_onchange);                                    
                }
                
                function Cantidad_onchange(sender, e){
                    Calcular();
                }
                
                function RubroNombre_onchange(sender, e){
                    ExisteRegistroDesdeLista = false;
                }
                
                function ventana()
                {                                    
                    var Apu_Rubro_Id = $get("ctl00_ContentPlaceHolder1_fvapu_oferta_rubro_Apu_Rubro_Id");
                    if(!ExisteRegistroDesdeLista)
                    {
                        Apu_Rubro_Id.value = '';
                    }                                                                         
                    if(Apu_Rubro_Id.value == '')
                        return confirm('¿Desea ingresar el nuevo Rubro?');
                    else
                        return true;                                    
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
                                                        
                    var Apu_Rubro_Id = $get("ctl00_ContentPlaceHolder1_fvapu_oferta_rubro_Apu_Rubro_Id");
                    Apu_Rubro_Id.value = temp[0];
                    
                    var Apu_Rubro_Codigo = $get("ctl00_ContentPlaceHolder1_fvapu_oferta_rubro_Apu_Rubro_Codigo");
                    Apu_Rubro_Codigo.value = temp[1];
                    
                    var Apu_Rubro_Unidad = $get("ctl00_ContentPlaceHolder1_fvapu_oferta_rubro_Apu_Rubro_Unidad");
                    Apu_Rubro_Unidad.value = temp[2];
                    
                    //Costo_Unitario.value = temp[3];                                                           
                    ExisteRegistroDesdeLista = true;
                }    
       
                function Calcular()
                {
                    var resultado = 0.00;
                    var Costo_Total = $get("ctl00_ContentPlaceHolder1_fvapu_oferta_rubro_Costo_Total");
                                    
                    var numCosto_unitario = Number.parseLocale(Costo_Unitario.value);
                    if(isNaN(numCosto_unitario))
                        numCosto_unitario = 0.0; 
                    
                    var numCantidad = Number.parseLocale(Cantidad.value);
                    if(isNaN(numCantidad))
                        numCantidad = 0.0;                                        
                    
                    resultado = numCosto_unitario *  numCantidad;
                    Costo_Total.value = resultado.localeFormat("N2");                                                                       
                }              
            </script>
            <asp:FormView 
                ID="fvapu_oferta_rubro" 
                runat="server" 
                DataSourceID="odsfvapu_oferta_rubro"                
                DefaultMode="Insert">
                    <EditItemTemplate>                        
                    <asp:panel
                        id="panel1"
                        runat="server"
                        meta:resourcekey="Rec_Apu_Oferta_Rubro_OfertaRecursoKCG">
                        <table>
                            <tr align="left">
                                <td>
                                    <asp:Label
                                        id="lbloferta"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Apu_Oferta_CodigoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Oferta_Codigo" 
                                        runat="server" 
                                        TabIndex="-1"
                                        readonly="true"
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
                                        Width="400"
                                        Height="50px"
                                        readonly="true"
                                        TextMode="MultiLine"
                                        CssClass="TEXTO_LECTURA_KCG"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Oferta_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Oferta_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </asp:panel>                    
                    <asp:Panel
                        id="panel2"
                        runat="server"
                         meta:resourcekey="Rec_Apu_Oferta_RubroRecursoKCG">
                         <table>
                            <tr align="right">
                                <td colspan="2">
                                    <asp:label
                                        id="lblestado"
                                        runat="server"                                        
                                        Text='<%# Bind("Estado_Nombre") %>'>
                                    </asp:label>                                  
                                </td>
                            </tr>
                            <tr align="left">
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
                                        TabIndex="-1"
                                        runat="server" 
                                        ReadOnly="true"                                        
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Rubro_Codigo") %>'>
                                    </asp:TextBox>
                                </td>                                
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label
                                        id="lblrubro"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Apu_Rubro_Nombre" 
                                        runat="server" 
                                        TextMode="multiline"                                        
                                        Height="50px"
                                        Width="400px"
                                        Style="text-transform:uppercase" 
                                        CssClass="TEXTO_COMBOPER_KCG"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Rubro_Nombre") %>'>
                                    </asp:TextBox>  
                                    <AjaxControlToolkit:AutoCompleteExtender
                                        runat="server" 
                                        BehaviorID="AutoCompleteEx"
                                        ID="autoComplete1" 
                                        TargetControlID="Apu_Rubro_Nombre"
                                        ServicePath="~/APU/APU_OFERTA_RUBRO.aspx" 
                                        ServiceMethod="GetMaterial"
                                        MinimumPrefixLength="3" 
                                        CompletionInterval="500"
                                        EnableCaching="true"
                                        CompletionSetCount="100"
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
                                    <asp:Label 
                                        ID="lblMensaje" 
                                        runat="server" 
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ37RecursoKCG.Text").ToString() %>' 
                                        Font-Bold="True" 
                                        Font-Size="X-Small"
                                        ForeColor="OrangeRed"></asp:Label>                                 
                                </td>              
                            </tr>                                
                            <tr align="left">
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
                                        Style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Rubro_Unidad") %>'>
                                    </asp:TextBox>    
                                </td>
                            </tr>
                            <tr align="left">
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
                                        Style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("CantidadRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Cantidad","{0:N2}") %>'>
                                    </asp:TextBox>
                                    <AjaxControlToolkit:MaskedEditExtender 
                                        ID="meeCantidad" 
                                        runat="server"
                                        TargetControlID="Cantidad"
                                        Mask="9,999,999,999,999.99"
                                        MessageValidatorTip="false"
                                        OnFocusCssClass="MaskedEditFocus"
                                        OnInvalidCssClass="MaskedEditError"
                                        MaskType="Number"
                                        InputDirection="RightToLeft"
                                        AcceptNegative="None"
                                        DisplayMoney="None"
                                        ErrorTooltipEnabled="False"
                                        ClearMaskOnLostFocus="True" />
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
                                        TargetControlID="MaskedEditValidator2"/>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label
                                        id="lblpreciounitario"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Costo_UnitarioRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>        
                                </td>
                                <td style="white-space:nowrap">                            
                                    <asp:TextBox 
                                        ID="Costo_Unitario" 
                                        runat="server" 
                                        ReadOnly="true"                                      
                                        Style="text-align:right"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Costo_UnitarioRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Costo_Unitario","{0:N2}") %>'>
                                    </asp:TextBox>                                    
                                    <asp:Label
                                        id="lbla"
                                        runat="server"
                                        Text='<%# Bind("int_moneda_simbolo") %>'>
                                    </asp:Label>                                
                                    <asp:Label
                                        id="lblpreciototal"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>                               
                                    <asp:TextBox 
                                        ID="Costo_Total" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Costo_Total","{0:N2}") %>'>
                                    </asp:TextBox>                                    
                                    <asp:Label
                                        id="ldlb"
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
                    
                    
                        <%--id's--%>                 
                        
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
                        <%--campos no visibles--%>
                                                
                        <asp:TextBox 
                            ID="Estado_Nombre" 
                            runat="server" 
                            visible="false"
                            Text='<%# Bind("Estado_Nombre") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Apu_Oferta_Etapa" 
                            runat="server" 
                            visible="false"
                            Text='<%# Bind("Apu_Oferta_Etapa") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Apu_rubro_Costo_Total" 
                            runat="server" 
                            visible="false"
                            Text='<%# Bind("Apu_rubro_Costo_Total") %>'>
                        </asp:TextBox>                    
                        <asp:TextBox 
                            ID="int_moneda_simbolo" 
                            runat="server" 
                            visible="false"
                            Text='<%# Bind("int_moneda_simbolo") %>'>
                        </asp:TextBox>                      
                        <asp:TextBox 
                            ID="Codigo" 
                            runat="server" 
                            visible="false"
                            Text='<%# Bind("Codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Nombre" 
                            runat="server" 
                            visible="false"
                            Text='<%# Bind("Nombre") %>'>
                        </asp:TextBox>                 
                        <asp:TextBox 
                            ID="Estado" 
                            runat="server" 
                            visible="false"
                            Text='<%# Bind("Estado") %>'>
                        </asp:TextBox>         
                    </EditItemTemplate>
                    <InsertItemTemplate>
                    <asp:panel
                        id="panel1"
                        runat="server"
                        meta:resourcekey="Rec_Apu_Oferta_Rubro_OfertaRecursoKCG">
                        <table>
                            <tr align="left">
                                <td>
                                    <asp:Label
                                        id="lbloferta"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Apu_Oferta_CodigoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Oferta_Codigo" 
                                        runat="server" 
                                        TabIndex="-1"
                                        readonly="true"
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
                                        Width="400"
                                        Height="50px"
                                        readonly="true"
                                        TextMode="MultiLine"
                                        CssClass="TEXTO_LECTURA_KCG"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Oferta_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Oferta_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </asp:panel>                    
                    <asp:Panel
                        id="panel2"
                        runat="server"
                         meta:resourcekey="Rec_Apu_Oferta_RubroRecursoKCG">
                         <table>
                            <tr align="right">
                                <td colspan="2">
                                    <asp:label
                                        id="lblestado"
                                        runat="server"                                        
                                        Text='<%# Bind("Estado_Nombre") %>'>
                                    </asp:label>                                  
                                </td>
                            </tr>
                            <tr align="left">
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
                            <tr align="left">
                                <td>
                                    <asp:Label
                                        id="lblrubro"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Apu_Rubro_Nombre" 
                                        runat="server" 
                                        Width="400px"
                                        CssClass="TEXTO_COMBOPER_KCG"
                                        TextMode="multiline" 
                                        Style="text-transform:uppercase"                                       
                                        Height="50px"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Rubro_Nombre") %>'>
                                    </asp:TextBox>
                                    <AjaxControlToolkit:AutoCompleteExtender
                                        runat="server" 
                                        BehaviorID="AutoCompleteEx"
                                        ID="autoComplete1" 
                                        TargetControlID="Apu_Rubro_Nombre"
                                        ServicePath="~/APU/APU_OFERTA_RUBRO.aspx" 
                                        ServiceMethod="GetMaterial"
                                        MinimumPrefixLength="3" 
                                        CompletionInterval="500"
                                        EnableCaching="true"
                                        CompletionSetCount="100"
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
                                    <asp:Label 
                                        ID="lblMensaje" 
                                        runat="server" 
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ37RecursoKCG.Text").ToString() %>' 
                                        Font-Bold="True" 
                                        Font-Size="X-Small"
                                        ForeColor="OrangeRed"></asp:Label>   
                                </td>                      
                            </tr>
                            <%--<tr align="left">   --%>                         
                                
                                <input type="submit" style="display:none;" value="Submit Query" />
                 
                            <tr align="left">
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
                                        Style="text-transform:uppercase; text-align:right;"                                                                                                            
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Rubro_Unidad") %>'>
                                    </asp:TextBox>    
                                </td>
                            </tr>
                            <tr align="left">
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
                                        Style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("CantidadRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Cantidad","{0:N2}") %>'>
                                    </asp:TextBox>
                                    <AjaxControlToolkit:MaskedEditExtender 
                                        ID="meeCantidad" 
                                        runat="server"
                                        TargetControlID="Cantidad"
                                        Mask="9,999,999,999,999.99"
                                        MessageValidatorTip="false"
                                        OnFocusCssClass="MaskedEditFocus"
                                        OnInvalidCssClass="MaskedEditError"
                                        MaskType="Number"
                                        InputDirection="RightToLeft"
                                        AcceptNegative="None"
                                        DisplayMoney="None"
                                        ErrorTooltipEnabled="False"
                                        ClearMaskOnLostFocus="True" />
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
                                        TargetControlID="MaskedEditValidator2"/>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label
                                        id="lblpreciounitario"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Costo_UnitarioRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>        
                                </td>
                                <td style="white-space:nowrap">                            
                                    <asp:TextBox 
                                        ID="Costo_Unitario" 
                                        runat="server" 
                                        ReadOnly="true"                                      
                                        Style="text-align:right"
                                        TabIndex="-1"    
                                        ToolTip='<%# GetLocalResourceObject("Costo_UnitarioRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Costo_Unitario","{0:N2}") %>'>
                                    </asp:TextBox>                                    
                                    <asp:Label
                                        id="lbla"
                                        runat="server"
                                        Text='<%# Bind("int_moneda_simbolo") %>'>
                                    </asp:Label>                                
                                    <asp:Label
                                        id="lblpreciototal"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>                               
                                    <asp:TextBox 
                                        ID="Costo_Total" 
                                        runat="server" 
                                        ReadOnly="true"
                                        Style="text-align:right"
                                        TabIndex="-1"    
                                        ToolTip='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Costo_Total","{0:N2}") %>'>
                                    </asp:TextBox>                                    
                                    <asp:Label
                                        id="ldlb"
                                        runat="server"
                                        Text='<%# Bind("int_moneda_simbolo") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Button 
                                        ID="InsertButton" 
                                        runat="server" 
                                        CausesValidation="True" 
                                        CommandName="Insert"
                                        ValidationGroup="I"
                                        AccessKey="I"
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_InsertRecursoKCG.Text").ToString() %>'
                                        ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_InsertRecursoKCG.ToolTip").ToString() %>'
                                        OnClientClick="return ventana();">
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
                    
                    <%--id's--%>                 
                    
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
                    <%--campos no visibles--%>
                                            
                    <asp:TextBox 
                        ID="Estado_Nombre" 
                        runat="server" 
                        visible="false"
                        Text='<%# Bind("Estado_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Oferta_Etapa" 
                        runat="server" 
                        visible="false"
                        Text='<%# Bind("Apu_Oferta_Etapa") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_rubro_Costo_Total" 
                        runat="server" 
                        visible="false"
                        Text='<%# Bind("Apu_rubro_Costo_Total") %>'>
                    </asp:TextBox>                    
                    <asp:TextBox 
                        ID="int_moneda_simbolo" 
                        runat="server" 
                        visible="false"
                        Text='<%# Bind("int_moneda_simbolo") %>'>
                    </asp:TextBox>                        
                    <asp:TextBox 
                        ID="Codigo" 
                        runat="server" 
                        visible="false"
                        Text='<%# Bind("Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Nombre" 
                        runat="server" 
                        visible="false"
                        Text='<%# Bind("Nombre") %>'>
                    </asp:TextBox>                 
                    <asp:TextBox 
                        ID="Estado" 
                        runat="server" 
                        visible="false"
                        Text='<%# Bind("Estado") %>'>
                    </asp:TextBox>                        
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:panel
                        id="panel1"
                        runat="server"
                        meta:resourcekey="Rec_Apu_Oferta_Rubro_OfertaRecursoKCG">
                        <table>
                            <tr align="left">
                                <td>
                                    <asp:Label
                                        id="lbloferta"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Apu_Oferta_CodigoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Oferta_Codigo" 
                                        runat="server" 
                                        TabIndex="-1"
                                        readonly="true"
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
                                        Width="400"
                                        Height="50px"
                                        readonly="true"
                                        TextMode="MultiLine"
                                        CssClass="TEXTO_LECTURA_KCG"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Oferta_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Oferta_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </asp:panel>                    
                    <asp:Panel
                        id="panel2"
                        runat="server"
                         meta:resourcekey="Rec_Apu_Oferta_RubroRecursoKCG">
                         <table>
                            <tr align="right">
                                <td colspan="2">
                                    <asp:label
                                        id="lblestado"
                                        runat="server"                                        
                                        Text='<%# Bind("Estado_Nombre") %>'>
                                    </asp:label>                                  
                                </td>
                            </tr>
                            <tr align="left">
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
                            <tr align="left">
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
                                        CssClass ="TEXTO_LECTURA_KCG"
                                        Width="400px"
                                        TextMode="multiline"
                                        Height="50px"
                                        ReadOnly="true"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Rubro_Nombre") %>'>
                                    </asp:TextBox>                                    
                                </td>                                
                            </tr>                                             
                            <tr align="left">
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
                                        Style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Rubro_Unidad") %>'>
                                    </asp:TextBox>    
                                </td>
                            </tr>
                            <tr align="left">
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
                                        Style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("CantidadRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Cantidad","{0:N2}") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label
                                        id="lblpreciounitario"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Costo_UnitarioRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>        
                                </td>
                                <td style="white-space:nowrap">                            
                                    <asp:TextBox 
                                        ID="Costo_Unitario" 
                                        runat="server" 
                                        TabIndex="-1"
                                        ReadOnly="true"                                      
                                        Style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("Costo_UnitarioRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Costo_Unitario","{0:N2}") %>'>
                                    </asp:TextBox>                                    
                                    <asp:Label
                                        id="lbla"
                                        runat="server"
                                        Text='<%# Bind("int_moneda_simbolo") %>'>
                                    </asp:Label>                                
                                    <asp:Label
                                        id="lblpreciototal"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>                               
                                    <asp:TextBox 
                                        ID="Costo_Total" 
                                        runat="server" 
                                        TabIndex="-1"
                                        ReadOnly="true"
                                        Style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Costo_Total","{0:N2}") %>'>
                                    </asp:TextBox>                                    
                                    <asp:Label
                                        id="ldlb"
                                        runat="server"
                                        Text='<%# Bind("int_moneda_simbolo") %>'>
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
                                            Enabled='<%# HER.PermisosMovimientos.Movimiento_Apu_Oferta_Rubro(ApuOferta_Actual.Estado, ApuOferta_Actual.Apu_Presupuesto_Estado, HER.PermisosMovimientos.ModoOperacion.Editar ) %>'
                                            AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_EditarRecursoKCG.AccesKey").ToString() %>'  
                                            Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_EditRecursoKCG.Text").ToString() %>'
                                            ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_EditRecursoKCG.ToolTip").ToString() %>'>
                                       </asp:Button>
                                       <asp:Button 
                                            ID="DeleteButton" 
                                            runat="server" 
                                            CausesValidation="False" 
                                            CommandName="Delete"
                                            Enabled='<%# HER.PermisosMovimientos.Movimiento_Apu_Oferta_Rubro(ApuOferta_Actual.Estado, ApuOferta_Actual.Apu_Presupuesto_Estado, HER.PermisosMovimientos.ModoOperacion.Eliminar ) %>'
                                            AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_EliminarRecursoKCG.AccesKey").ToString() %>'  
                                            Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_DeleteRecursoKCG.Text").ToString() %>'
                                            ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_DeleteRecursoKCG.ToolTip").ToString() %>'>
                                       </asp:Button>
                                       <asp:Button 
                                            ID="NewButton" 
                                            runat="server" 
                                            CausesValidation="False" 
                                            CommandName="New"
                                            Enabled='<%# HER.PermisosMovimientos.Movimiento_Apu_Oferta_Rubro(ApuOferta_Actual.Estado, ApuOferta_Actual.Apu_Presupuesto_Estado, HER.PermisosMovimientos.ModoOperacion.Nuevo ) %>'
                                            AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_NuevoRecursoKCG.AccesKey").ToString() %>'  
                                            Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_NewRecursoKCG.Text").ToString() %>'
                                            ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_NewRecursoKCG.ToolTip").ToString() %>'>
                                       </asp:Button>
                                       <uc1:wucMensajeEliminar ID="WucMensajeEliminar1" runat="server" />
                                </td>
                        </tr>   
                         </table>
                    </asp:Panel>                                                            
                    
                    <%--id's--%>                 
                    
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
                    <%--campos no visibles--%>
                                            
                    <asp:TextBox 
                        ID="Estado_Nombre" 
                        runat="server" 
                        visible="false"
                        Text='<%# Bind("Estado_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Oferta_Etapa" 
                        runat="server" 
                        visible="false"
                        Text='<%# Bind("Apu_Oferta_Etapa") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_rubro_Costo_Total" 
                        runat="server" 
                        visible="false"
                        Text='<%# Bind("Apu_rubro_Costo_Total") %>'>
                    </asp:TextBox>                    
                    <asp:TextBox 
                        ID="int_moneda_simbolo" 
                        runat="server" 
                        visible="false"
                        Text='<%# Bind("int_moneda_simbolo") %>'>
                    </asp:TextBox>                        
                    <asp:TextBox 
                        ID="Codigo" 
                        runat="server" 
                        visible="false"
                        Text='<%# Bind("Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Nombre" 
                        runat="server" 
                        visible="false"
                        Text='<%# Bind("Nombre") %>'>
                    </asp:TextBox>                 
                    <asp:TextBox 
                        ID="Estado" 
                        runat="server" 
                        visible="false"
                        Text='<%# Bind("Estado") %>'>
                    </asp:TextBox>         
                </ItemTemplate>
            </asp:FormView>     
            <koala:KNavegacion 
                ID="nav"
                runat="server"
                GridViewID="gvapu_oferta_rubro"
                FormViewID="FormView1" 
                OnNavegar="nav_Siguiente" />       
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger 
                ControlID="gvapu_oferta_rubro" 
                EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:ObjectDataSource 
        ID="odsfvapu_oferta_rubro" 
        runat="server" 
        ConflictDetection="CompareAllValues"
        DeleteMethod="Delete" 
        InsertMethod="Insert" 
        OldValuesParameterFormatString="original{0}"
        SelectMethod="GetById" 
        SortParameterName="sortExpression" 
        TypeName="FEL.APU.BO_Apu_Oferta_Rubro"
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
                            Contenedor="APU_OFERTA_RUBRO" 
                            Objeto="APU_OFERTA_RUBRO" 
                            IndiceScope ="Scope"
                            Orden="1"
                            ObjectDataSourceID="odsgvapu_oferta_rubro" />
                    </td>
                    <td>
                        <asp:Button 
                            ID="OfertaButton" 
                            runat="server"  
                            Text='<%# GetLocalResourceObject("Btn_Apu_Oferta_Rubro_OfertaRecursoKCG.Text").ToString() %>'
                            OnClick="OfertaButton_Click"/>
                    </td>
                </tr>
                
            </table>
            
            <asp:Panel 
                runat="server"
                id="pnlDatosGrid"
                meta:resourcekey="Rec_Apu_Oferta_Rubro_ListadoRecursoKCG">                 
                <koala:KGrid  
                ID="gvapu_oferta_rubro" 
                runat="server" 
                AllowPaging="True" 
                AllowSorting="True"
                PageSize="20"
                AutoGenerateColumns="False"
                AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>'
                DataKeyNames="Id,Equipo_costo_total,Equipo_ultima_fecha_update,Mano_obra_costo_total,Mano_obra_ultima_fecha_update,Material_costo_total,Material_ultima_fecha_update,Transporte_costo_total,Transporte_ultima_fecha_update" 
                DataSourceID="odsgvapu_oferta_rubro">
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
                        SortExpression="Apu_Rubro_Nombre" >
                        <itemstyle wrap="False" width="80mm" />
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
                        dataformatstring="{0:N2}">
                        <itemstyle horizontalalign="Right" />
                    </asp:BoundField>
                    <asp:BoundField 
                        DataField="Costo_Unitario" 
                        meta:resourcekey="BoundCosto_UnitarioRecursoKCG" 
                        SortExpression="Costo_Unitario" 
                        dataformatstring="{0:N2}">
                        <headerstyle wrap="true" />
                        <itemstyle horizontalalign="Right" />
                    </asp:BoundField>
                    <asp:BoundField 
                        DataField="Costo_Total" 
                        meta:resourcekey="BoundCosto_TotalRecursoKCG" 
                        SortExpression="Costo_Total" 
                        dataformatstring="{0:N2}">
                        <headerstyle wrap="true" />
                        <itemstyle horizontalalign="Right" />
                    </asp:BoundField>
                    <asp:BoundField 
                        DataField="Apu_Oferta_Id" 
                        HeaderText="Apu_Oferta_Id" 
                        SortExpression="Apu_Oferta_Id"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Apu_Rubro_Id" 
                        HeaderText="Apu_Rubro_Id" 
                        SortExpression="Apu_Rubro_Id"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Apu_Oferta_Codigo" 
                        HeaderText="Apu_Oferta_Codigo" 
                        SortExpression="Apu_Oferta_Codigo"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Apu_Oferta_Nombre" 
                        HeaderText="Apu_Oferta_Nombre" 
                        SortExpression="Apu_Oferta_Nombre"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Estado_Nombre" 
                        HeaderText="Estado_Nombre" 
                        SortExpression="Estado_Nombre"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Material_costo_total" 
                        HeaderText="Material_costo_total"
                        SortExpression="Material_costo_total" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Transporte_costo_total" 
                        HeaderText="Transporte_costo_total"
                        SortExpression="Transporte_costo_total" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Mano_obra_costo_total" 
                        HeaderText="Mano_obra_costo_total"
                        SortExpression="Mano_obra_costo_total" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Equipo_costo_total" 
                        HeaderText="Equipo_costo_total" 
                        SortExpression="Equipo_costo_total"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Apu_Oferta_Etapa" 
                        HeaderText="Apu_Oferta_Etapa" 
                        SortExpression="Apu_Oferta_Etapa"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Apu_rubro_Costo_Total" 
                        HeaderText="Apu_rubro_Costo_Total"
                        SortExpression="Apu_rubro_Costo_Total" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Material_ultima_fecha_update" 
                        HeaderText="Material_ultima_fecha_update"
                        SortExpression="Material_ultima_fecha_update" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Transporte_ultima_fecha_update" 
                        HeaderText="Transporte_ultima_fecha_update"
                        SortExpression="Transporte_ultima_fecha_update" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Mano_obra_ultima_fecha_update" 
                        HeaderText="Mano_obra_ultima_fecha_update"
                        SortExpression="Mano_obra_ultima_fecha_update" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Equipo_ultima_fecha_update" 
                        HeaderText="Equipo_ultima_fecha_update"
                        SortExpression="Equipo_ultima_fecha_update" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="int_moneda_simbolo" 
                        HeaderText="int_moneda_simbolo" 
                        SortExpression="int_moneda_simbolo"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Int_Sucursal_Id" 
                        HeaderText="Int_Sucursal_Id" 
                        SortExpression="Int_Sucursal_Id"
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
            
            <asp:Panel
                id="panel_3"
                runat="server"
                meta:resourcekey="Rec_Apu_Oferta_Rubro_IndicesRecursoKCG">
                <table style="text-align:right">
                <tr>
                    <td align="left">
                        <asp:Button 
                            id="btnequipos"
                            runat="server"
                            Text='<%# GetLocalResourceObject("Btn_Apu_Oferta_Rubro_EquipoRecursoKCG.Text").ToString() %>'                                           
                            OnClick="btnequipos_Click" />
                    </td>
                    <td align="left">
                        <asp:Button
                            id="btnmanodeobra"
                            runat="server"   
                            Text='<%# GetLocalResourceObject("Btn_Apu_Oferta_Rubro_Mano_ObraRecursoKCG.Text").ToString() %>'                                           
                            OnClick="btnmanodeobra_Click"/>
                    </td>
                    <td align="left">
                            <asp:Button
                                id="btnmateriales"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Btn_Apu_Oferta_Rubro_MaterialRecursoKCG.Text").ToString() %>'                      
                                OnClick="btnmateriales_Click"/>
                    </td>
                    <td align="left">
                            <asp:Button
                                id="btntransporte"
                                runat="server"             
                                Text='<%# GetLocalResourceObject("Btn_Apu_Oferta_Rubro_TransporteRecursoKCG.Text").ToString() %>'           
                                OnClick="btntransporte_Click"/>
                    </td>
                </tr>
                    <tr>    
                        <td>
                        </td>                        
                        <td align="center">
                            <asp:Label
                                id="lblcostototal"
                                runat="server"                                
                                Text='<%# GetLocalResourceObject("Lab_Costo_TotalRecursoKCG.Text").ToString() %>'
                                Visible ="false">
                            </asp:Label>
                        </td>           
                        <td align="center">
                            <asp:Label
                                id="lblfecha"
                                runat="server"                               
                                Text='<%# GetLocalResourceObject("Lab_FechaRecursoKCG.Text").ToString() %>'
                                Visible ="false">
                            </asp:Label>
                        </td>                 
                    </tr>         
                    <tr>
                        
                        <td>
                            <asp:TextBox ID="EquipoCostoTotal"
                                Style="text-align:right" 
                                TabIndex="-1"
                                runat="server" 
                                ReadOnly="true"
                                Visible ="false">
                            </asp:TextBox>  
                            <asp:Label
                                id="lblc"
                                runat="server"
                                Text='<%# Bind("int_moneda_simbolo") %>'
                                Visible ="false">
                            </asp:Label>  
                        </td>
                        <td>
                            <asp:TextBox
                                id="EquipoUltimaFechaUpdate"
                                TabIndex="-1"
                                Style="text-align:right" 
                                runat="server"
                                ReadOnly="true"
                                Visible ="false">
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr>

                        <td>
                            <asp:TextBox
                                id="ManoObraCostoTotal"
                                TabIndex="-1"
                                Style="text-align:right" 
                                runat="server"
                                ReadOnly="true"
                                Visible ="false">
                            </asp:TextBox>
                            <asp:Label
                                id="lbld"
                                runat="server"
                                Text='<%# Bind("int_moneda_simbolo") %>'
                                Visible ="false"
                                >
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox
                                id="ManoObraUltimaFechaUpdate"
                                Style="text-align:right" 
                                TabIndex="-1"
                                runat="server"
                                ReadOnly="true"
                                Visible ="false">
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        
                        <td>
                            <asp:TextBox
                                id="MaterialCostoTotal"
                                TabIndex="-1"
                                Style="text-align:right" 
                                runat="server"
                                ReadOnly="true"
                                Visible ="false">
                            </asp:TextBox>
                            <asp:Label
                                id="lble"
                                runat="server"
                                Text='<%# Bind("int_moneda_simbolo") %>'
                                Visible ="false">
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox
                                id="MaterialUltimaFechaUpdate"
                                Style="text-align:right" 
                                TabIndex="-1"
                                runat="server"
                                ReadOnly="true"
                                Visible ="false">
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        
                        <td>
                            <asp:TextBox
                                id="TransporteCostoTotal"
                                Style="text-align:right" 
                                TabIndex="-1"
                                runat="server"
                                ReadOnly="true"
                                Visible ="false">
                            </asp:TextBox>
                            <asp:Label
                                id="lblf"
                                runat="server"
                                Text='<%# Bind("int_moneda_simbolo") %>'
                                Visible ="false">
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox
                                id="TransporteUltimaFechaUpdate"
                                Style="text-align:right" 
                                TabIndex="-1"
                                runat="server"
                                ReadOnly="true"
                                Visible ="false">
                            </asp:TextBox>
                        </td>
                    </tr>    
                </table>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>                   
    
    <asp:ObjectDataSource 
        ID="odsgvapu_oferta_rubro" 
        runat="server" 
        OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetByOferta" 
                TypeName="FEL.APU.BO_Apu_Oferta_Rubro">
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

