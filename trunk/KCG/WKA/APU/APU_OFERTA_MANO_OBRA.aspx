<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="APU_OFERTA_MANO_OBRA.aspx.cs" 
    Inherits="APU_APU_OFERTA_MANO_OBRA" 
    StylesheetTheme="EstiloKCG"
    Theme="EstiloKCG"
    meta:resourcekey="Tit_Apu_Oferta_Mano_ObraRecursoKCG" %>

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
        runat="server" 
        UpdateMode="Conditional">
        <ContentTemplate>
        <script type="text/javascript">
            Sys.Application.add_load(page_load);
			Sys.Application.add_unload(page_unload);  
            
            var Costo_Diario = null;
            var Costo_Hora = null;
            var Apu_Categoria_Nombre = null;
            
            function page_load(sender, e){
                Costo_Diario = $get("ctl00_ContentPlaceHolder1_fvApuOfertaManoObra_Costo_Diario");
                Costo_Hora = $get("ctl00_ContentPlaceHolder1_fvApuOfertaManoObra_Costo_Hora");
                $addHandler(Costo_Diario, "change", datos_onchange);                            
            }
            
            function page_unload(sender, e)
            {
                $removeHandler(Costo_Diario, "change", datos_onchange);                                                             
            }                                 
            
            function datos_onchange(sender, e){
                Calcular();
            }
            
            function Calcular()
            {
                var costoHoraCalculado = 0.00;                                  
                
                var numCosto_Diario = Number.parseLocale(Costo_Diario.value);                                                
                if(!isNaN(numCosto_Diario))                     
                   costoHoraCalculado= numCosto_Diario / 8;
                costoHoraCalculado = Redondear(costoHoraCalculado,4);                   
                Costo_Hora.value = costoHoraCalculado.localeFormat("N4");                                                                                                                                       
            }
            
            function Redondear(x,numeroDecimales) 
            {
               return (Math.round(x*Math.pow(10,numeroDecimales)))/Math.pow(10,numeroDecimales);                                
            }  
                                
            function ItemSelected( source, eventArgs ) 
            {
                var valor = eventArgs.get_value();
                var temp = new Array();
                temp = valor.split('||');

                var Apu_Categoria_Id = $get("ctl00_ContentPlaceHolder1_fvApuOfertaManoObra_Apu_Categoria_Id");
                Apu_Categoria_Id.value = temp[0];    
                
                Costo_Diario_Habilitar();                                                                                 
            }
            
            function Costo_Diario_Habilitar()
            { 
                Costo_Diario = $get("ctl00_ContentPlaceHolder1_fvApuOfertaManoObra_Costo_Diario");
                var Apu_Categoria_Id = $get("ctl00_ContentPlaceHolder1_fvApuOfertaManoObra_Apu_Categoria_Id"); 
                              
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
            <asp:FormView 
                ID="fvApuOfertaManoObra" 
                runat="server" 
                DataSourceID="odsfvApuOfertaManoObra"
                DefaultMode="Insert">
                
                <EditItemTemplate>
                    <asp:Panel
                        runat="server"
                        ID="Rec_Apu_Oferta"
                        meta:resourcekey="Rec_Apu_Oferta_Mano_ObraRecursoKCG">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label                                        
                                        ID="lblOferta"                                                                           
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Apu_Oferta_CodigoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Oferta_Codigo" 
                                        runat="server"                                         
                                        ReadOnly="true"
                                        TabIndex="-1"
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
                                        Width="400px"
                                        Height="50px"
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        TextMode="MultiLine"
                                        CssClass="TEXTO_LECTURA_KCG"
                                        Tooltip='<%# GetLocalResourceObject("Apu_Oferta_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Oferta_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <asp:Panel
                        runat="server"
                        ID="Rec_Apu_Oferta_Mano_Obra"
                        meta:resourcekey="Rec_Apu_Oferta_Mano_Obra_Mano_ObraRecursoKCG">
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
                                        ID="lblCodigoManoObra"                                                                           
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Apu_Mano_Obra_CodigoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Codigo" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Tooltip='<%# GetLocalResourceObject("Apu_Mano_Obra_CodigoRecursoKCG.ToolTip").ToString() %>'                                        
                                        Text='<%# Bind("Codigo") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label                                        
                                        ID="lblNombreManoObra"                                                                           
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Apu_Mano_Obra_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>                                    
                                    <asp:TextBox 
                                        ID="Nombre" 
                                        runat="server"                                         
                                        Width="400px"
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Tooltip='<%# GetLocalResourceObject("Apu_Mano_Obra_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label                                        
                                        ID="lblCategoria"                                                                           
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Apu_Categoria_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Categoria_Nombre"                                         
                                        runat="server"                  
                                        CssClass="TEXTO_COMBOPER_KCG"
                                        Width="400px"                                                       
                                        Style="text-transform:uppercase"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Categoria_NombreRecursoKCG.ToolTip").ToString() %>'         
                                        Text='<%# Bind("Apu_Categoria_Nombre") %>'>
                                    </asp:TextBox>                                                                                                          
                                    <AjaxControlToolkit:AutoCompleteExtender
                                        runat="server" 
                                        BehaviorID="AutoCompleteEx"
                                        ID="autoComplete1" 
                                        TargetControlID="Apu_Categoria_Nombre"
                                        ServicePath="~/APU/APU_OFERTA_MANO_OBRA.aspx" 
                                        ServiceMethod="GetCategoria"
                                        MinimumPrefixLength="0" 
                                        CompletionInterval="500"
                                        EnableCaching="true"
                                        CompletionSetCount="500"
                                        CompletionListCssClass="autocomplete_completionListElement" 
                                        CompletionListItemCssClass="autocomplete_listItem" 
                                        CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                        DelimiterCharacters=";,:"
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
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label                                        
                                        ID="lbl_Costo_Diario"                                                                           
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Costo_DiarioRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">                                    
                                    <asp:TextBox 
                                        ID="Costo_Diario" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG"
                                        Style="text-align:right"
                                        Tooltip='<%# GetLocalResourceObject("Costo_DiarioRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Costo_Diario","{0:N4}") %>'>
                                    </asp:TextBox>
                                    <AjaxControlToolkit:MaskedEditExtender 
                                        ID="mee_Costo_Diario" 
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
                                        ClearMaskOnLostFocus="True" />      
                                    <AjaxControlToolkit:MaskedEditValidator 
                                        ID="mev_Costo_Diario" 
                                        runat="server"
                                        ControlExtender="mee_Costo_Diario"
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
                                        ID="vce_Costo_Diario"
                                        TargetControlID="mev_Costo_Diario"/> 
                                    <asp:Label
                                        id="lbla"
                                        runat="server"
                                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                                    <asp:TextBox 
                                        ID="Apu_Mano_Obra_Costo_Diario" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Style="text-align:right"                                        
                                        Text='<%# Bind("Apu_Mano_Obra_Costo_Diario","{0:N4}") %>'>
                                    </asp:TextBox> 
                                    <asp:Label
                                        id="lbl_Simbol3"
                                        runat="server"
                                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label                                        
                                        ID="lblCostoTotal"                                                                           
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("CostoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Costo_Hora" 
                                        Style="text-align:right"
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Tooltip='<%# GetLocalResourceObject("CostoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Costo_Hora","{0:N4}") %>'>
                                    </asp:TextBox>
                                    <asp:Label
                                        id="lbl_Simbol2"
                                        runat="server"
                                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label                                        
                                        ID="lblIndice"                                                                           
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Apu_Indice_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Indice_Nombre" 
                                        runat="server" 
                                        Width="400px"
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Tooltip='<%# GetLocalResourceObject("Apu_Indice_NombreRecursoKCG.ToolTip").ToString() %>'                                        
                                        Text='<%# Bind("Apu_Indice_Nombre") %>'>
                                    </asp:TextBox>
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
                                     <uc1:wucMensajeActualizar 
                                        ID="WucMensajeActualizar1"                                         
                                        runat="server" />                   
                                </td>                        
                            </tr>
                        </table>                    
                    </asp:Panel>
                    
                    <%--Ids--%>
                    
                    <asp:TextBox 
                        ID="Apu_Oferta_Id" 
                        runat="server" 
                        Style="display:none"
                        Text='<%# Bind("Apu_Oferta_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Apu_Mano_Obra_Id" 
                        runat="server" 
                        Style="display:none"
                        Text='<%# Bind("Apu_Mano_Obra_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Apu_Categoria_Id" 
                        runat="server" 
                        Style="display:none"
                        Text='<%# Bind("Apu_Categoria_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Apu_Indice_Id" 
                        runat="server" 
                        Style="display:none"
                        Text='<%# Bind("Apu_Indice_Id") %>'>
                    </asp:TextBox>         
                    
                    <asp:TextBox 
                        ID="Id" 
                        runat="server" 
                        Style="display:none"
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    
                    <%--Ocultos--%>
                    
                    <asp:TextBox 
                        ID="Apu_Oferta_Etapa" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Apu_Oferta_Etapa") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Costo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Costo") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Apu_Mano_Obra_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Apu_Mano_Obra_Codigo") %>'>
                    </asp:TextBox>
                     
                    <asp:TextBox 
                        ID="Apu_Mano_Obra_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Apu_Mano_Obra_Nombre") %>'>
                    </asp:TextBox>                                 
                    
                    <asp:TextBox 
                        ID="Apu_Categoria_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Apu_Categoria_Codigo") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Apu_Indice_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Apu_Indice_Codigo") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Int_Moneda_Simbolo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                    </asp:TextBox>
                    
                    <%--<asp:TextBox 
                        ID="Campo_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Campo_Nombre") %>'>
                    </asp:TextBox>--%>
                    
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
                        ID="Rec_Apu_Oferta"
                        meta:resourcekey="Rec_Apu_Oferta_Mano_ObraRecursoKCG">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label                                       
                                        ID="lblOferta"                                                                           
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Apu_Oferta_CodigoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Oferta_Codigo" 
                                        runat="server" 
                                        Tooltip='<%# GetLocalResourceObject("Apu_Oferta_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        TabIndex="-1"
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
                                        Tooltip='<%# GetLocalResourceObject("Apu_Oferta_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Width="400px"
                                        Height="50px"
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        TextMode="MultiLine"
                                        CssClass="TEXTO_LECTURA_KCG"
                                        Text='<%# Bind("Apu_Oferta_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <asp:Panel
                        runat="server"
                        ID="Rec_Apu_Oferta_Mano_Obra"
                        meta:resourcekey="Rec_Apu_Oferta_Mano_Obra_Mano_ObraRecursoKCG">
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
                                        Text='<%# GetLocalResourceObject("Apu_Mano_Obra_CodigoRecursoKCG.Text").ToString() %>'
                                        ID="lblCodigoManoObra"                                                                           
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Codigo" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Tooltip='<%# GetLocalResourceObject("Apu_Mano_Obra_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Codigo") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("Apu_Mano_Obra_NombreRecursoKCG.Text").ToString() %>'
                                        ID="lblNombreManoObra"                                                                           
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td>                                    
                                    <asp:TextBox 
                                        ID="Nombre" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Tooltip='<%# GetLocalResourceObject("Apu_Mano_Obra_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Width="400px"
                                        Text='<%# Bind("Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("Apu_Categoria_NombreRecursoKCG.Text").ToString() %>'
                                        ID="lblCategoria"                                                                           
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Categoria_Nombre"                                         
                                        runat="server"                  
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Width="400px"               
                                        ToolTip='<%# GetLocalResourceObject("Apu_Categoria_NombreRecursoKCG.ToolTip").ToString() %>'         
                                        Style="text-transform:uppercase"
                                        Text='<%# Bind("Apu_Categoria_Nombre") %>'>
                                    </asp:TextBox>                                                                                                         
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label                                        
                                        ID="lbl_Costo_Diario"                                                                           
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Costo_DiarioRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">                                    
                                    <asp:TextBox 
                                        ID="Costo_Diario" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Style="text-align:right"
                                        Tooltip='<%# GetLocalResourceObject("Costo_DiarioRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Costo_Diario") %>'>
                                    </asp:TextBox>   
                                    <asp:Label
                                        id="lbla"
                                        runat="server"
                                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>      
                                    <asp:TextBox 
                                        ID="Apu_Mano_Obra_Costo_Diario" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Style="text-align:right"                                        
                                        Text='<%# Bind("Apu_Mano_Obra_Costo_Diario","{0:N4}") %>'>
                                    </asp:TextBox> 
                                    <asp:Label
                                        id="lbl_Simbol3"
                                        runat="server"
                                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>                           
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("CostoRecursoKCG.Text").ToString() %>'
                                        ID="lblCostoTotal"                                                                           
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Costo_Hora" 
                                        runat="server" 
                                        Style="text-align:right"
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Tooltip='<%# GetLocalResourceObject("CostoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Costo_Hora") %>'>
                                    </asp:TextBox>
                                    <asp:Label
                                        id="lbl_Simbol2"
                                        runat="server"
                                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
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
                                        runat="server"                                         
                                        Width="400px"
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Tooltip='<%# GetLocalResourceObject("Apu_Indice_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Indice_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <%--<tr>
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
                            </tr>--%>
                        </table>                    
                    </asp:Panel>
                    
                    <%--Ids--%>
                    
                    <asp:TextBox 
                        ID="Apu_Oferta_Id" 
                        runat="server" 
                        Style="display:none"
                        Text='<%# Bind("Apu_Oferta_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Apu_Mano_Obra_Id" 
                        runat="server" 
                        Style="display:none"
                        Text='<%# Bind("Apu_Mano_Obra_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Apu_Categoria_Id" 
                        runat="server" 
                        Style="display:none"
                        Text='<%# Bind("Apu_Categoria_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Apu_Indice_Id" 
                        runat="server" 
                        Style="display:none"
                        Text='<%# Bind("Apu_Indice_Id") %>'>
                    </asp:TextBox>         
                    
                    <asp:TextBox 
                        ID="Id" 
                        runat="server" 
                        Style="display:none"
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    
                    <%--Ocultos--%>
                    
                    <asp:TextBox 
                        ID="Apu_Oferta_Etapa" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Apu_Oferta_Etapa") %>'>
                    </asp:TextBox>
                    
                     <asp:TextBox 
                        ID="Costo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Costo") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Apu_Mano_Obra_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Apu_Mano_Obra_Codigo") %>'>
                    </asp:TextBox>
                     
                    <asp:TextBox 
                        ID="Apu_Mano_Obra_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Apu_Mano_Obra_Nombre") %>'>
                    </asp:TextBox>                                 
                    
                    <asp:TextBox 
                        ID="Apu_Categoria_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Apu_Categoria_Codigo") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Apu_Indice_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Apu_Indice_Codigo") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Int_Moneda_Simbolo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                    </asp:TextBox>
                    
                    <%--<asp:TextBox 
                        ID="Campo_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Campo_Nombre") %>'>
                    </asp:TextBox>--%>
                    
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
                        ID="Rec_Apu_Oferta"
                        meta:resourcekey="Rec_Apu_Oferta_Mano_ObraRecursoKCG">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label                                        
                                        ID="lblOferta"                                                                           
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Apu_Oferta_CodigoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Oferta_Codigo" 
                                        runat="server"                                         
                                        ReadOnly="true"
                                        TabIndex="-1"
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
                                        Text='<%# Bind("Apu_Oferta_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <asp:Panel
                        runat="server"
                        ID="Rec_Apu_Oferta_Mano_Obra"
                        meta:resourcekey="Rec_Apu_Oferta_Mano_Obra_Mano_ObraRecursoKCG">
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
                                        Text='<%# GetLocalResourceObject("Apu_Mano_Obra_CodigoRecursoKCG.Text").ToString() %>'
                                        ID="lblCodigoManoObra"                                                                           
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Codigo" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Tooltip='<%# GetLocalResourceObject("Apu_Mano_Obra_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Codigo") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("Apu_Mano_Obra_NombreRecursoKCG.Text").ToString() %>'
                                        ID="lblNombreManoObra"                                                                           
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td>                                    
                                    <asp:TextBox 
                                        ID="Nombre" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Width="400px"
                                        Tooltip='<%# GetLocalResourceObject("Apu_Mano_Obra_NombreRecursoKCG.ToolTip").ToString() %>'                                        
                                        Text='<%# Bind("Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label                                        
                                        ID="lblCategoria"                                                                           
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Apu_Categoria_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Categoria_Nombre" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Width="400px"
                                        Tooltip='<%# GetLocalResourceObject("Apu_Categoria_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Categoria_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label                                        
                                        ID="lbl_Costo_Diario"                                                                           
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Costo_DiarioRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">                                    
                                    <asp:TextBox 
                                        ID="Costo_Diario" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Style="text-align:right"
                                        Tooltip='<%# GetLocalResourceObject("Costo_DiarioRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Costo_Diario","{0:N4}") %>'>
                                    </asp:TextBox>  
                                    <asp:Label
                                        id="lbla"
                                        runat="server"
                                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>       
                                    <asp:TextBox 
                                        ID="Apu_Mano_Obra_Costo_Diario" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Style="text-align:right"                                        
                                        Text='<%# Bind("Apu_Mano_Obra_Costo_Diario","{0:N4}") %>'>
                                    </asp:TextBox> 
                                    <asp:Label
                                        id="lbl_Simbol3"
                                        runat="server"
                                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>                                
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("CostoRecursoKCG.Text").ToString() %>'
                                        ID="lblCostoTotal"                                                                           
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Costo_Hora" 
                                        runat="server" 
                                        Style="text-align:right"
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Tooltip='<%# GetLocalResourceObject("CostoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Costo_Hora","{0:N4}") %>'>
                                    </asp:TextBox>
                                    <asp:Label
                                        id="lbl_Simbol2"
                                        runat="server"
                                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
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
                                        runat="server" 
                                        ReadOnly="true"
                                        Width="400px"
                                        TabIndex="-1"
                                        Tooltip='<%# GetLocalResourceObject("Apu_Indice_NombreRecursoKCG.ToolTip").ToString() %>'                                        
                                        Text='<%# Bind("Apu_Indice_Nombre") %>'>
                                    </asp:TextBox>
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
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_EditarRecursoKCG.AccesKey").ToString() %>'  
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_EditRecursoKCG.Text").ToString() %>'
                                        ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_EditRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:Button>
                                    <%--<asp:Button 
                                        ID="DeleteButton" 
                                        runat="server" 
                                        CausesValidation="False" 
                                        CommandName="Delete"
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_EliminarRecursoKCG.AccesKey").ToString() %>'  
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_DeleteRecursoKCG.Text").ToString() %>'
                                        ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_DeleteRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:Button>--%>
                                    <%--<asp:Button 
                                        ID="NewButton" 
                                        runat="server" 
                                        CausesValidation="False" 
                                        CommandName="New"
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_NuevoRecursoKCG.AccesKey").ToString() %>'  
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_NewRecursoKCG.Text").ToString() %>'
                                        ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_NewRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:Button>--%>
                                    <%--<uc2:wucMensajeEliminar 
                                        ID="WucMensajeEliminar1" 
                                        runat="server" />--%>                      
                                </td>                        
                            </tr>
                        </table>                    
                    </asp:Panel>
                    
                    <%--Ids--%>
                    
                    <asp:TextBox 
                        ID="Apu_Oferta_Id" 
                        runat="server" 
                        Style="display:none"
                        Text='<%# Bind("Apu_Oferta_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Apu_Mano_Obra_Id" 
                        runat="server" 
                        Style="display:none"
                        Text='<%# Bind("Apu_Mano_Obra_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Apu_Categoria_Id" 
                        runat="server" 
                        Style="display:none"
                        Text='<%# Bind("Apu_Categoria_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Apu_Indice_Id" 
                        runat="server" 
                        Style="display:none"
                        Text='<%# Bind("Apu_Indice_Id") %>'>
                    </asp:TextBox>         
                    
                    <asp:TextBox 
                        ID="Id" 
                        runat="server" 
                        Style="display:none"
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    
                    <%--Ocultos--%>
                    
                    <asp:TextBox 
                        ID="Apu_Oferta_Etapa" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Apu_Oferta_Etapa") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Costo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Costo") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Apu_Mano_Obra_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Apu_Mano_Obra_Codigo") %>'>
                    </asp:TextBox>
                     
                    <asp:TextBox 
                        ID="Apu_Mano_Obra_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Apu_Mano_Obra_Nombre") %>'>
                    </asp:TextBox>                                 
                    
                    <asp:TextBox 
                        ID="Apu_Categoria_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Apu_Categoria_Codigo") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Apu_Indice_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Apu_Indice_Codigo") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Int_Moneda_Simbolo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                    </asp:TextBox>
                    
                    <%--<asp:TextBox 
                        ID="Campo_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Campo_Nombre") %>'>
                    </asp:TextBox>--%>
                    
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
                            GridViewID="gvApuOfertaManoObra"
                            FormViewID="FormView1" 
                            OnNavegar="nav_Siguiente"/>    
                    </td>
                </tr>
            </table>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger 
                ControlID="gvApuOfertaManoObra" 
                EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
    
    <asp:ObjectDataSource 
        ID="odsfvApuOfertaManoObra" 
        runat="server" 
        ConflictDetection="CompareAllValues"
        OldValuesParameterFormatString="original{0}" 
        SelectMethod="GetById" 
        SortParameterName="sortExpression"
        TypeName="FEL.APU.BO_Apu_Oferta_Mano_Obra" 
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
                ObjectDataSourceID="odsgvApuOfertaManoObra"/>   
            <asp:Panel
                runat="server"
                ID="Rec_Apu_Oferta_Listado"
                meta:resourcekey="Rec_Apu_Oferta_Mano_Obra_ListadoRecursoKCG">                
                <Koala:KGrid 
                    ID="gvApuOfertaManoObra" 
                    runat="server" 
                    AllowPaging="True" 
                    AllowSorting="True"
                    AutoGenerateColumns="False" 
                    DataKeyNames="Id" 
                    DataSourceID="odsgvApuOfertaManoObra"
                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>'>
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
                            <itemstyle horizontalalign="Right" /> 
                        </asp:BoundField>
                         <asp:BoundField 
                            DataField="Apu_Mano_Obra_Nombre" 
                            meta:resourcekey="BoundApu_Mano_Obra_NombreRecursoKCG"
                            SortExpression="Apu_Mano_Obra_Nombre">
                            <itemstyle wrap="true" width="80mm" />
                        </asp:BoundField>          
                        <asp:BoundField 
                            DataField="Apu_Categoria_Nombre" 
                            meta:resourcekey="BoundApu_Categoria_NombreRecursoKCG"
                            SortExpression="Apu_Categoria_Nombre">
                             <itemstyle wrap="true" width="80mm" />
                        </asp:BoundField>   
                        <asp:BoundField 
                            DataField="Costo_Diario" 
                            meta:resourcekey="BoundCosto_DiarioRecursoKCG"
                            SortExpression="Costo_Diario"
                            DataFormatString="{0:N4}">
                            <itemstyle horizontalalign="Right" />
                        </asp:BoundField>  
                        <asp:BoundField 
                            DataField="Costo_Hora" 
                            HeaderText="Costo Hora"
                            SortExpression="Costo_Hora"
                            DataFormatString="{0:N4}">
                            <itemstyle horizontalalign="Right" />
                        </asp:BoundField>                   
                        <asp:BoundField 
                            DataField="Costo" 
                            HeaderText="Costo" 
                            SortExpression="Costo"
                            Visible="False" />                         
                        <asp:BoundField 
                            DataField="Apu_Oferta_Id" 
                            HeaderText="Apu_Oferta_Id" 
                            SortExpression="Apu_Oferta_Id"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Mano_Obra_Id" 
                            HeaderText="Apu_Mano_Obra_Id" 
                            SortExpression="Apu_Mano_Obra_Id"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Categoria_Id" 
                            HeaderText="Apu_Categoria_Id" 
                            SortExpression="Apu_Categoria_Id"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Indice_Id" 
                            HeaderText="Apu_Indice_Id"  
                            SortExpression="Apu_Indice_Id"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Indice_Id" 
                            HeaderText="Apu_Indice_Id"  
                            SortExpression="Apu_Indice_Id"
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
                            DataField="Apu_Oferta_Etapa" 
                            HeaderText="Apu_Oferta_Etapa" 
                            SortExpression="Apu_Oferta_Etapa"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Codigo" 
                            HeaderText="Codigo"
                            SortExpression="Codigo"
                            Visible="False" />                        
                        <asp:BoundField 
                            DataField="Nombre" 
                            HeaderText="Nombre"
                            SortExpression="Nombre"
                            Visible="False" />                        
                        <asp:BoundField 
                            DataField="Apu_Indice_Codigo" 
                            HeaderText="Apu_Indice_Codigo" 
                            SortExpression="Apu_Indice_Codigo"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Indice_Nombre" 
                            HeaderText="Apu_Indice_Nombre" 
                            SortExpression="Apu_Indice_Nombre"
                            Visible="False" />                        
                        <asp:BoundField 
                            DataField="Int_Moneda_Simbolo" 
                            HeaderText="Int_Moneda_Simbolo" 
                            SortExpression="Int_Moneda_Simbolo"
                            Visible="False" />
                        <asp:BoundField     
                            DataField="Estado_Nombre" 
                            HeaderText="Estado_Nombre" 
                            SortExpression="Estado_Nombre"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Campo_Nombre" 
                            HeaderText="Campo_Nombre" 
                            SortExpression="Campo_Nombre"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Id" 
                            HeaderText="Id" 
                            SortExpression="Id"
                            Visible="False" />                 
                        <asp:BoundField 
                            DataField="Estado" 
                            HeaderText="Estado" 
                            SortExpression="Estado"
                            Visible="False" />
                    </Columns>
                </Koala:KGrid >            
            </asp:Panel>                
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:ObjectDataSource 
        ID="odsgvApuOfertaManoObra" 
        runat="server" 
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetByOferta" 
        TypeName="FEL.APU.BO_Apu_Oferta_Mano_Obra">
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

