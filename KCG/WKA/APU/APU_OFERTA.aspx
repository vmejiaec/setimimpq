<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="APU_OFERTA.aspx.cs" 
    StylesheetTheme="EstiloKCG"
    Theme="EstiloKCG"
    Inherits="APU_APU_OFERTA" 
    meta:resourcekey="Tit_Apu_OfertaRecursoKCG" %>

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
        
        var Area = null;
        var Porcentaje_Costo_Indirecto = null;
        var Porcentaje_Costo_Otros = null;
        
        Sys.Application.add_load(page_load);
        Sys.Application.add_unload(page_unload);   
                
        function page_load(sender, e){
            
            var Id = $get("ctl00_ContentPlaceHolder1_fvApuOferta_Id");
            var Codigo_Institucion = $get("ctl00_ContentPlaceHolder1_fvApuOferta_Codigo_Institucion");
            var Auxiliar_Codigo = $get("ctl00_ContentPlaceHolder1_Auxiliar_Codigo");
            if(Id.value != "")
                Auxiliar_Codigo.value = Codigo_Institucion.value;                                
                                                      
            Area = $get("ctl00_ContentPlaceHolder1_fvApuOferta_Area");
            Porcentaje_Costo_Indirecto = $get("ctl00_ContentPlaceHolder1_fvApuOferta_Porcentaje_Costo_Indirecto");
            Porcentaje_Costo_Otros = $get("ctl00_ContentPlaceHolder1_fvApuOferta_Porcentaje_Costo_Otros");                                                                                
            $addHandler(Area, "change", datos_onchange1);
            $addHandler(Porcentaje_Costo_Indirecto, "change", datos_onchange2);
            $addHandler(Porcentaje_Costo_Otros, "change", datos_onchange3);
        }
        
        function page_unload(sender, e)
        {                                            
            $removeHandler(Area, "change", datos_onchange1);
            $removeHandler(Porcentaje_Costo_Indirecto, "change", datos_onchange2);
            $removeHandler(Porcentaje_Costo_Otros, "change", datos_onchange3);
        }                                     
                
        function ItemSelected_Codigo_Institucion( source, eventArgs ) 
        {   
            var valor = eventArgs.get_value();
            var temp = new Array();
            temp = valor.split('||');
              
            var Codigo_Institucion = $get("ctl00_ContentPlaceHolder1_fvApuOferta_Codigo_Institucion");
            Codigo_Institucion.value = temp[0];  
            var Auxiliar_Codigo = $get("ctl00_ContentPlaceHolder1_Auxiliar_Codigo");
            Auxiliar_Codigo.value = temp[0];                                                                                
        } 
        
        function checkSelectedValue_Tipo_Contrato()
        {   
            var ddl_Tipo_Contrato = $get("ctl00_ContentPlaceHolder1_fvApuOferta_ddl_Tipo_Contrato");
            var Tipo_Contrato = $get("ctl00_ContentPlaceHolder1_fvApuOferta_Tipo_Contrato");            
            var Tipo_Nombre = $get("ctl00_ContentPlaceHolder1_fvApuOferta_Tipo_Nombre");
                            
            Tipo_Contrato.value = ddl_Tipo_Contrato.options[ddl_Tipo_Contrato.selectedIndex].value;
            Tipo_Nombre.value = ddl_Tipo_Contrato.options[ddl_Tipo_Contrato.selectedIndex].text;                            
        } 
      
        function datos_onchange1(sender, e)
        {
            Suma_cuatro_decimales();
        }
        
        function datos_onchange2(sender, e)
        {
            Suma_cuatro_decimales();
        }
        
        function datos_onchange3(sender, e)
        {
            Suma_cuatro_decimales();
        }                               
        
        function Suma_cuatro_decimales()
        {
            var costoM2calculado = 0.00;
            var costoIndirectocalculado = 0.00;     
            var costoOtroscalculado = 0.00;
            var costoTotalcalculado = 0.00;                                                                           
            var numArea = Number.parseLocale(Area.value);                                              
            var numPorcentaje_Costo_Indirecto = Number.parseLocale(Porcentaje_Costo_Indirecto.value);                                          
            var numPorcentaje_Costo_Otros = Number.parseLocale(Porcentaje_Costo_Otros.value);
            var Costo_M2 = $get("ctl00_ContentPlaceHolder1_fvApuOferta_Costo_Metro_Cuadrado");                                
            var Costo_Directo = $get("ctl00_ContentPlaceHolder1_fvApuOferta_Costo_Directo");                                
            var Costo_Indirecto = $get("ctl00_ContentPlaceHolder1_fvApuOferta_Costo_Indirecto");                                
            var Costo_Otros = $get("ctl00_ContentPlaceHolder1_fvApuOferta_Costo_Otros");  
            var Costo_Total = $get("ctl00_ContentPlaceHolder1_fvApuOferta_Costo_Total");      
            var numCosto_Directo = Number.parseLocale(Costo_Directo.value);
            var numCosto_Total = Number.parseLocale(Costo_Total.value);
            
            if(isNaN(numCosto_Directo))
                numCosto_Directo = 0.00;                                            
            if(isNaN(numArea))
                numArea = 0.00;                                                  
                
            costoM2calculado = numCosto_Total / numArea;
            Costo_M2.value = costoM2calculado.localeFormat("N2");    
            
            if(isNaN(numCosto_Directo))
                numCosto_Directo = 0.00;                                            
            if(isNaN(numPorcentaje_Costo_Indirecto))
                numPorcentaje_Costo_Indirecto = 0.00;
                
            costoIndirectocalculado = (numCosto_Directo * numPorcentaje_Costo_Indirecto) / 100;
            Costo_Indirecto.value = costoIndirectocalculado.localeFormat("N2");   
            
            if(isNaN(numCosto_Directo))
                numCosto_Directo = 0.00;
            if(isNaN(numPorcentaje_Costo_Otros))
                numPorcentaje_Costo_Otros = 0.00
                
            costoOtroscalculado = (numCosto_Directo * numPorcentaje_Costo_Otros) / 100;
            Costo_Otros.value = costoOtroscalculado.localeFormat("N2");
            
            var numCosto_Indirecto = Number.parseLocale(Costo_Indirecto.value);
            var numCosto_Otros = Number.parseLocale(Costo_Otros.value);
            
            if(isNaN(numCosto_Directo))
                numCosto_Directo = 0.00;  
            if(isNaN(numCosto_Indirecto))
                numCosto_Indirecto = 0.00;
            if(isNaN(numCosto_Otros))
                numCosto_Otros = 0.00;
                
            costoTotalcalculado = numCosto_Directo + numCosto_Indirecto + numCosto_Otros;                                                                                                                                    
            Costo_Total.value = costoTotalcalculado.localeFormat("N2");   
        }                            
    </script>
    <asp:TextBox 
        ID="Auxiliar" 
        style="display:none"
        runat="server">
    </asp:TextBox>
    <asp:TextBox
        ID="txtApu_Proyecto_Id"
        runat="server"
        style="display:none">        
    </asp:TextBox>
    <asp:TextBox 
        ID="Auxiliar_Codigo" 
        style="display:none"
        runat="server">
    </asp:TextBox>
    <AjaxControlToolkit:MaskedEditExtender 
        ID="meeAuxiliar_Codigo" 
        runat="server"
        TargetControlID="Auxiliar_Codigo"
        Mask="999-999-999-9999-99999"
        MessageValidatorTip="false"
        OnFocusCssClass="MaskedEditFocus"
        OnInvalidCssClass="MaskedEditError"
        MaskType="None"
        InputDirection="RightToLeft"
        AcceptNegative="None"
        DisplayMoney="None"
        ErrorTooltipEnabled="false"
        ClearMaskOnLostFocus="False" />
    <asp:UpdatePanel 
        ID="UpdatePanel1" 
        runat="server">
        <ContentTemplate>
            <asp:Panel
                runat="server"
                ID="Rec_Apu_Oferta"
                meta:resourcekey="Rec_Apu_OfertaRecursoKCG">
                
                <asp:FormView 
                    ID="fvApuOferta" 
                    runat="server" 
                    DataKeyNames="Estado,Id" 
                    DataSourceID="osdfvApuOferta" 
                    DefaultMode="Insert">        
                    
                    <EditItemTemplate>
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
                                        ID="lblCodigo" 
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
                                        Text='<%# Bind("Codigo") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>   
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lblCodigo_Institucion"
                                        runat="server"  
                                        Text='<%# GetLocalResourceObject("Codigo_InstitucionRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox ID="Codigo_Institucion"
                                        CssClass="TEXTO_COMBOPER_KCG" 
                                        runat="server" 
                                        Width="170px"
                                        Text='<%# Bind("Codigo_Institucion") %>'
                                        ToolTip='<%# GetLocalResourceObject("Codigo_InstitucionRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:TextBox>                                    
                                    <asp:CustomValidator 
                                        ID="ctvCodigo_Institucion" 
                                        runat="server" 
                                        ErrorMessage="Error"
                                        Display="None"
                                        ControlToValidate="Codigo_Institucion"
                                        SetFocusOnError="true"
                                        ValidationGroup="I"
                                        OnServerValidate="ctvCodigo_Institucion_ServerValidate">
                                    </asp:CustomValidator>                                    
                                    <AjaxControlToolkit:MaskedEditExtender 
                                        ID="meeCodigo_Institucion" 
                                        runat="server"
                                        TargetControlID="Codigo_Institucion"
                                        Mask="999-999-999-9999-99999"
                                        MessageValidatorTip="false"
                                        OnFocusCssClass="MaskedEditFocus"
                                        OnInvalidCssClass="MaskedEditError"
                                        MaskType="None"
                                        InputDirection="RightToLeft"
                                        AcceptNegative="None"
                                        DisplayMoney="None"
                                        ErrorTooltipEnabled="false"
                                        ClearMaskOnLostFocus="False" />
                                    <AjaxControlToolkit:AutoCompleteExtender
                                        runat="server" 
                                        BehaviorID="AutoCompleteEx_Codigo_Institucion"
                                        ID="AutoCo_Codigo_Institucion" 
                                        TargetControlID="Codigo_Institucion"
                                        ServicePath="~/APU/APU_PROYECTO.aspx" 
                                        ServiceMethod="Get_Codigo_Institucion"
                                        MinimumPrefixLength="0" 
                                        CompletionInterval="500"
                                        EnableCaching="true"
                                        CompletionSetCount="500"
                                        CompletionListCssClass="autocomplete_completionListElement" 
                                        CompletionListItemCssClass="autocomplete_listItem" 
                                        CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                        OnClientItemSelected="ItemSelected_Codigo_Institucion" >    
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
                                                        var behavior = $find('AutoCompleteEx_Codigo_Institucion');
                                                        if (!behavior._height) {
                                                            var target = behavior.get_completionList();
                                                            behavior._height = target.offsetHeight - 2;
                                                            target.style.height = '0px';
                                                        }" />                                                    
                                                    <%-- Expand from 0px to the appropriate size while fading in --%>
                                                    <Parallel Duration=".4">
                                                        <FadeIn />
                                                        <Length PropertyKey="height" StartValue="0" EndValueScript="$find('AutoCompleteEx_Codigo_Institucion')._height" />
                                                    </Parallel>
                                                </Sequence>
                                            </OnShow>
                                            <OnHide>
                                                <%-- Collapse down to 0px and fade out --%>
                                                <Parallel Duration=".4">
                                                    <FadeOut />
                                                    <Length PropertyKey="height" StartValueScript="$find('AutoCompleteEx_Codigo_Institucion')._height" EndValue="0" />
                                                </Parallel>
                                            </OnHide>
                                        </Animations>
                                    </AjaxControlToolkit:AutoCompleteExtender>  
                                    <asp:Label
                                        ID="lbl_Tipo_Contrato"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Tipo_ContratoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                    <asp:TextBox 
                                        ID="Tipo_Contrato" 
                                        runat="server" 
                                        style="display:none"
                                        Text='<%# Bind("Tipo_Contrato") %>'>
                                    </asp:TextBox>
                                    <asp:DropDownList 
                                        ID="ddl_Tipo_Contrato" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG"
                                        DataSourceID="odsddl_Tipo_Contrato"
                                        DataTextField="Nombre" 
                                        DataValueField="Dic_Dominio_Dominio"
                                        OnDataBound="Tipo_Contrato_DataBound">
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource 
                                        ID="odsddl_Tipo_Contrato" 
                                        runat="server" 
                                        OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetByObjetoCampo" 
                                        TypeName="FEL.VER.BO_Ver_Dominio">
                                        <SelectParameters>
                                        <asp:Parameter 
                                            DefaultValue="Nombre" 
                                            Name="sortExpression" 
                                            Type="String" />
                                        <asp:SessionParameter 
                                            DefaultValue="" 
                                            Name="s" 
                                            SessionField="Scope" 
                                            Type="Object" />
                                        <asp:Parameter 
                                        DefaultValue="Apu_Oferta" 
                                            Name="Dic_Objeto_Nombre" 
                                            Type="String" />
                                        <asp:Parameter 
                                            DefaultValue="Tipo_Contrato" 
                                            Name="Dic_Campo_Nombre" 
                                            Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>                                         
                            <tr>
                                <td>                                    
                                    <asp:Label 
                                        ID="lblNombre" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>                                                                
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Nombre" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG"
                                        Style="text-transform:uppercase"
                                        Tooltip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>'
                                        Width="400px"
                                        Height="50px"
                                        TextMode="MultiLine"
                                        Text='<%# Bind("Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        ID="rfvNombre" 
                                        runat="server"                                                
                                        ValidationGroup="I"
                                        ControlToValidate="Nombre" 
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/>
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="vceValidator"
                                        TargetControlID="rfvNombre"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lblProvincia" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Apu_Provincia_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Provincia_Nombre" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG"
                                        Style="text-transform:uppercase"
                                        Tooltip='<%# GetLocalResourceObject("Apu_Provincia_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Width="400px"
                                        Text='<%# Bind("Apu_Provincia_Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:Button 
                                        ID="btn_Zoom_Provincia" 
                                        runat="server" 
                                        CommandArgument="RutaDestino: ~/APU/APU_PROVINCIA.aspx; Filtro: Apu_Provincia_Nombre; NoGuardar:Apu_Lugar_Nombre|Apu_Lugar_Id|Apu_Lugar_Codigo;"
                                        CommandName="Zoom" 
                                        Text="..." />
                                    <asp:RequiredFieldValidator 
                                        ID="rfvProvinciaNombre" 
                                        runat="server"                                                
                                        ValidationGroup="I"
                                        ControlToValidate="Apu_Provincia_Nombre" 
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/>
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="rfvProvinciaNombrevce"
                                        TargetControlID="rfvProvinciaNombre"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lblLugar" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Apu_Lugar_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Lugar_Nombre" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG"
                                        Style="text-transform:uppercase"
                                        Tooltip='<%# GetLocalResourceObject("Apu_Lugar_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Width="400px"
                                        Text='<%# Bind("Apu_Lugar_Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:Button 
                                        ID="btn_Zoom_Lugar" 
                                        runat="server" 
                                        CommandArgument="RutaDestino: ~/APU/APU_Lugar.aspx; Filtro: Apu_Lugar_Nombre|Apu_Provincia_Nombre;"
                                        CommandName="Zoom" 
                                        Text="..." />
                                    <asp:RequiredFieldValidator 
                                        ID="rfvLugarNombre" 
                                        runat="server"                                                
                                        ValidationGroup="I"
                                        ControlToValidate="Apu_Lugar_Nombre" 
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/>
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="rfvLugarNombrevce"
                                        TargetControlID="rfvLugarNombre"/>
                                </td>
                            </tr>
                        </table>
                        <table>                        
                            <tr>
                                <td
                                    style="white-space:nowrap">
                                    <asp:Label 
                                        ID="lblCostoM2" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Costo_Metro_CuadradoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Costo_Metro_Cuadrado" 
                                        runat="server" 
                                        tabIndex="-1"
                                        style="text-align:right"
                                        Tooltip='<%# GetLocalResourceObject("Costo_Metro_CuadradoRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        Text='<%# Bind("Costo_Metro_Cuadrado","{0:N2}") %>'>
                                    </asp:TextBox>
                                    <asp:Label 
                                        ID="Int_Moneda_Simbolo0" 
                                        runat="server" 
                                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:Label 
                                        ID="lblArea" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("AreaRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Area" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG"
                                        style="text-align:right"
                                        Tooltip='<%# GetLocalResourceObject("AreaRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Area","{0:N2}") %>'>
                                    </asp:TextBox>
                                    <AjaxControlToolkit:MaskedEditExtender 
                                        ID="fArea" 
                                        runat="server"
                                        TargetControlID="Area"
                                        Mask="999.99"
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
				                        ID="MaskedEditValidator2" 
				                        runat="server"
                                        ControlExtender="fArea"
                                        ControlToValidate="Area"
                                        IsValidEmpty="False"
                                        EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                        InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                        MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                        MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                        MinimumValue="0.01"
                                        MaximumValue="999.99" 
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
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lblCostoDirecto" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Costo_DirectoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                    <asp:TextBox 
                                        ID="txt_p1" 
                                        Width="25px"
                                        TabIndex="-1"
                                        BorderColor="white"
                                        BorderStyle="Solid"
                                        ReadOnly="true"
                                        runat="server"
                                        Text="">
                                    </asp:TextBox>   
                                </td>
                                <td
                                    style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Costo_Directo" 
                                        runat="server" 
                                        TabIndex="-1"
                                        style="text-align:right"
                                        Tooltip='<%# GetLocalResourceObject("Costo_DirectoRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        Text='<%# Bind("Costo_Directo","{0:N2}") %>'>
                                    </asp:TextBox>
                                    <asp:Label 
                                        ID="Int_Moneda_Simbolo1" 
                                        runat="server" 
                                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>        
                                 </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lblCostoIndirecto" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Costo_IndirectoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Costo_Indirecto" 
                                        runat="server" 
                                        TabIndex="-1"
                                        style="text-align:right"
                                        Tooltip='<%# GetLocalResourceObject("Costo_DirectoRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        Text='<%# Bind("Costo_Indirecto","{0:N2}") %>'>
                                    </asp:TextBox>
                                    <asp:Label 
                                        ID="Int_Moneda_Simbolo2" 
                                        runat="server" 
                                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:Label 
                                        ID="lblPorcentajeCostoIndirecto" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Porcentaje_Costo_IndirectoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Porcentaje_Costo_Indirecto" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG"
                                        style="text-align:right"
                                        Tooltip='<%# GetLocalResourceObject("Porcentaje_Costo_IndirectoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Porcentaje_Costo_Indirecto","{0:N2}") %>'>
                                    </asp:TextBox>
                                    <asp:Label 
                                        ID="lblSimboloPorcentaje" 
                                        runat="server" 
                                        Text="%">
                                    </asp:Label>
                                    <AjaxControlToolkit:MaskedEditExtender 
                                        ID="fProcentajeCostoIndirecto" 
                                        runat="server"
                                        TargetControlID="Porcentaje_Costo_Indirecto"
                                        Mask="999.99"
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
				                        ID="MaskedEditValidator5" 
				                        runat="server"
                                        ControlExtender="fProcentajeCostoIndirecto"
                                        ControlToValidate="Porcentaje_Costo_Indirecto"
                                        IsValidEmpty="False"
                                        EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                        InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                        MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                        MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                        MinimumValue="0.00"
                                        MaximumValue="100.00" 
                                        Display="Dynamic"
                                        EmptyValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>'
                                        InvalidValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>'
                                        MaximumValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>' 
                                        MinimumValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>'
                                        ValidationGroup="I" />                                   
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="ValidatorCalloutExtender5"
                                        TargetControlID="MaskedEditValidator5"/>                                    
                                </td>
                            </tr>
                            <tr>
                                <td
                                    style="white-space:nowrap">
                                    <asp:Label 
                                        ID="lblCostoOtros" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Costo_OtrosRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Costo_Otros" 
                                        runat="server" 
                                        TabIndex="-1"
                                        style="text-align:right"
                                        Tooltip='<%# GetLocalResourceObject("Costo_OtrosRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        Text='<%# Bind("Costo_Otros","{0:N2}") %>'>
                                    </asp:TextBox>
                                    <asp:Label 
                                        ID="Int_Moneda_Simbolo3" 
                                        runat="server" 
                                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                                </td>
                                <td>                                
                                    <asp:Label 
                                        ID="lblPorcentajeCostoOtros" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Porcentaje_Costo_OtrosRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Porcentaje_Costo_Otros" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG"
                                        style="text-align:right"
                                        Tooltip='<%# GetLocalResourceObject("Porcentaje_Costo_OtrosRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Porcentaje_Costo_Otros") %>'>
                                    </asp:TextBox>        
                                    <asp:Label 
                                        ID="lblSimboloPorcentaje1" 
                                        runat="server" 
                                        Text="%">
                                    </asp:Label>                        
                                    <AjaxControlToolkit:MaskedEditExtender 
                                        ID="fPorcentajeCostoOtros" 
                                        runat="server"
                                        TargetControlID="Porcentaje_Costo_Otros"
                                        Mask="999.99"
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
				                        ID="MaskedEditValidator7" 
				                        runat="server"
                                        ControlExtender="fPorcentajeCostoOtros"
                                        ControlToValidate="Porcentaje_Costo_Otros"
                                        IsValidEmpty="False"
                                        EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                        InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                        MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                        MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                        MinimumValue="0.00"
                                        MaximumValue="100.00" 
                                        Display="Dynamic"
                                        EmptyValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>'
                                        InvalidValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>'
                                        MaximumValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>' 
                                        MinimumValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>'
                                        ValidationGroup="I" />                                   
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="ValidatorCalloutExtender7"
                                        TargetControlID="MaskedEditValidator7"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lblCostoTotal" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td
                                    style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Costo_Total" 
                                        runat="server"      
                                        TabIndex="-1"                
                                        style="text-align:right"                   
                                        Tooltip='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        Text='<%# Bind("Costo_Total","{0:N2}") %>'>
                                    </asp:TextBox>
                                    <asp:Label 
                                        ID="Int_Moneda_Simbolo4" 
                                        runat="server" 
                                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lblFechaCreación" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Fecha_CreacionRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Fecha_Creacion" 
                                        runat="server" 
                                        ReadOnly="false"
                                        Tooltip='<%# GetLocalResourceObject("Fecha_CreacionRecursoKCG.ToolTip").ToString() %>'
                                        TabIndex="-1"
                                        Text='<%# Bind("Fecha_Creacion") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <table>                                                                                                                                       
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lblTecnicoCosto" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Tecnico_Per_Personal_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Tecnico_Per_Personal_Nombre" 
                                        runat="server" 
                                        Width="400px"
                                        Tooltip='<%# GetLocalResourceObject("Tecnico_Per_Personal_NombreRecursoKCG.ToolTip").ToString() %>'
                                        CssClass="TEXTO_EDICION_KCG"
                                        Text='<%# Bind("Tecnico_Per_Personal_Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:Button 
                                        ID="Btn_Per_Personal" 
                                        runat="server" 
                                        CommandArgument="RutaDestino: ~/PER/PER_PERSONAL.aspx; Filtro: Tecnico_Per_Personal_Nombre; Obtener: Int_Moneda_Simbolo|Par_Razon_Social_Nombre, Coeficiente_Sumatoria|Id; Alias:Tecnico"
                                        CommandName="Zoom" 
                                        OnClick="Btn_Per_Personal_Click"
                                        Text="..." />
                                    <asp:RequiredFieldValidator 
                                        ID="rfvTecnico" 
                                        runat="server"                                                
                                        ValidationGroup="I"
                                        ControlToValidate="Tecnico_Per_Personal_Nombre" 
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/>
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="rfvTecnicovce"
                                        TargetControlID="rfvTecnico"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Descripcion" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("DescripcionRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                    <asp:TextBox 
                                        ID="txt_P2" 
                                        Width="35px"
                                        TabIndex="-1"
                                        BorderColor="white"
                                        BorderStyle="Solid"
                                        ReadOnly="true"
                                        runat="server"
                                        Text="">
                                    </asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox
                                        ID="Descripcion"
                                        runat="server"
                                        Width="400px"
                                        Height="50px"
                                        CssClass="TEXTO_EDICION_KCG"
                                        TextMode="MultiLine"
                                        Tooltip='<%# GetLocalResourceObject("DescripcionRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Descripcion") %>'>
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
                        
                        <%--Ids--%>                 
                        
                        <asp:TextBox 
                            ID="Creacion_Per_Personal_Id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Creacion_Per_Personal_Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Update_Per_Personal_Id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Update_Per_Personal_Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Tecnico_Per_Personal_Id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Tecnico_Per_Personal_Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_Sucursal_Id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Int_Sucursal_Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_Moneda_Id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Int_Moneda_Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Apu_Lugar_Id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Apu_Lugar_Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Apu_provincia_id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Apu_provincia_id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_Empresa_Id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Int_Empresa_Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Id") %>'>
                        </asp:TextBox>
                        
                        <%--Ocultos--%>                
                        
                        <asp:TextBox 
                            ID="Contratista" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Contratista") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Fecha_Update" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Fecha_Update") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Etapa" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Etapa") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Apu_Lugar_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Apu_Lugar_Codigo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Apu_Provincia_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Apu_Provincia_Codigo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_Sucursal_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_Sucursal_Codigo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_Sucursal_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_Sucursal_Nombre") %>'>
                        </asp:TextBox>                        
                        
                        <asp:TextBox 
                            ID="Int_Empresa_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_Empresa_Codigo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_Empresa_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_Empresa_Nombre") %>'>
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
                            ID="Tecnico_Per_Personal_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Tecnico_Per_Personal_Codigo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_Moneda_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_Moneda_Codigo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_Moneda_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_Moneda_Nombre") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_Moneda_Simbolo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Costo_Equipo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Costo_Equipo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Costo_Mano_Obra" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Costo_Mano_Obra") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Costo_Material" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Costo_Material") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Costo_Transporte" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Costo_Transporte") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Costo_Indirecto_Otros" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Costo_Indirecto_Otros") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Porcentaje_Costo_Indirecto_Otros" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Porcentaje_Costo_Indirecto_Otros") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Indice_Sumatoria" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Indice_Sumatoria") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Coeficiente_Sumatoria" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Coeficiente_Sumatoria") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Cuadrilla_Sumatoria" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Cuadrilla_Sumatoria") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Cuadrilla_Coeficiente_Sumatoria" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Cuadrilla_Coeficiente_Sumatoria") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Suma_Porcentaje_Indice_Transporte" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Suma_Porcentaje_Indice_Transporte") %>'>
                        </asp:TextBox>
                                                                                     
                        <asp:TextBox 
                            ID="Estado" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Estado") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Apu_Presupuesto_Estado" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Apu_Presupuesto_Estado") %>'>
                        </asp:TextBox> 
                        
                        <asp:TextBox 
                            ID="Tipo_Nombre" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Tipo_Nombre") %>'>
                        </asp:TextBox>             
                    </EditItemTemplate>
                    
                    <InsertItemTemplate>
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
                                        ID="lblCodigo" 
                                        runat="server" 
                                        Visible="false"
                                        Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Codigo" 
                                        runat="server"                                         
                                        ReadOnly="true"
                                        Visible="false"
                                        Text='<%# Bind("Codigo") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>                
                            <tr >
                                <td>
                                    <asp:Label 
                                        ID="lblCodigo_Institucion"
                                        runat="server"  
                                        Text='<%# GetLocalResourceObject("Codigo_InstitucionRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox ID="Codigo_Institucion"
                                        CssClass="TEXTO_COMBOPER_KCG" 
                                        runat="server" 
                                        Width="170px"
                                        Text='<%# Bind("Codigo_Institucion") %>'
                                        ToolTip='<%# GetLocalResourceObject("Codigo_InstitucionRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:TextBox>
                                    <asp:CustomValidator 
                                        ID="ctvCodigo_Institucion" 
                                        runat="server" 
                                        ErrorMessage="Error"
                                        Display="None"
                                        ControlToValidate="Codigo_Institucion"
                                        SetFocusOnError="true"
                                        ValidationGroup="I"
                                        OnServerValidate="ctvCodigo_Institucion_ServerValidate">
                                    </asp:CustomValidator>                                    
                                    <AjaxControlToolkit:MaskedEditExtender 
                                        ID="meeCodigo_Institucion" 
                                        runat="server"
                                        TargetControlID="Codigo_Institucion"
                                        Mask="999-999-999-9999-99999"
                                        MessageValidatorTip="false"
                                        OnFocusCssClass="MaskedEditFocus"
                                        OnInvalidCssClass="MaskedEditError"
                                        MaskType="None"
                                        InputDirection="RightToLeft"
                                        AcceptNegative="None"
                                        DisplayMoney="None"
                                        ErrorTooltipEnabled="false"
                                        ClearMaskOnLostFocus="False" />
                                    <AjaxControlToolkit:AutoCompleteExtender
                                        runat="server" 
                                        BehaviorID="AutoCompleteEx_Codigo_Institucion"
                                        ID="AutoCo_Codigo_Institucion" 
                                        TargetControlID="Codigo_Institucion"
                                        ServicePath="~/APU/APU_PROYECTO.aspx" 
                                        ServiceMethod="Get_Codigo_Institucion"
                                        MinimumPrefixLength="0" 
                                        CompletionInterval="500"
                                        EnableCaching="true"
                                        CompletionSetCount="500"
                                        CompletionListCssClass="autocomplete_completionListElement" 
                                        CompletionListItemCssClass="autocomplete_listItem" 
                                        CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                        OnClientItemSelected="ItemSelected_Codigo_Institucion" >    
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
                                                        var behavior = $find('AutoCompleteEx_Codigo_Institucion');
                                                        if (!behavior._height) {
                                                            var target = behavior.get_completionList();
                                                            behavior._height = target.offsetHeight - 2;
                                                            target.style.height = '0px';
                                                        }" />                                                    
                                                    <%-- Expand from 0px to the appropriate size while fading in --%>
                                                    <Parallel Duration=".4">
                                                        <FadeIn />
                                                        <Length PropertyKey="height" StartValue="0" EndValueScript="$find('AutoCompleteEx_Codigo_Institucion')._height" />
                                                    </Parallel>
                                                </Sequence>
                                            </OnShow>
                                            <OnHide>
                                                <%-- Collapse down to 0px and fade out --%>
                                                <Parallel Duration=".4">
                                                    <FadeOut />
                                                    <Length PropertyKey="height" StartValueScript="$find('AutoCompleteEx_Codigo_Institucion')._height" EndValue="0" />
                                                </Parallel>
                                            </OnHide>
                                        </Animations>
                                    </AjaxControlToolkit:AutoCompleteExtender>  
                                    <asp:Label
                                        ID="lbl_Tipo_Contrato"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Tipo_ContratoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                    <asp:TextBox 
                                        ID="Tipo_Contrato" 
                                        runat="server" 
                                        style="display:none"
                                        Text='<%# Bind("Tipo_Contrato") %>'>
                                    </asp:TextBox>
                                    <asp:DropDownList 
                                        ID="ddl_Tipo_Contrato" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG"
                                        DataSourceID="odsddl_Tipo_Contrato"
                                        DataTextField="Nombre" 
                                        DataValueField="Dic_Dominio_Dominio"
                                        OnDataBound="Tipo_Contrato_DataBound">
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource 
                                        ID="odsddl_Tipo_Contrato" 
                                        runat="server" 
                                        OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetByObjetoCampo" 
                                        TypeName="FEL.VER.BO_Ver_Dominio">
                                        <SelectParameters>
                                        <asp:Parameter 
                                            DefaultValue="Nombre" 
                                            Name="sortExpression" 
                                            Type="String" />
                                        <asp:SessionParameter 
                                            DefaultValue="" 
                                            Name="s" 
                                            SessionField="Scope" 
                                            Type="Object" />
                                        <asp:Parameter 
                                        DefaultValue="Apu_Oferta" 
                                            Name="Dic_Objeto_Nombre" 
                                            Type="String" />
                                        <asp:Parameter 
                                            DefaultValue="Tipo_Contrato" 
                                            Name="Dic_Campo_Nombre" 
                                            Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>  
                            <tr>
                                <td>                                    
                                    <asp:Label 
                                        ID="lblNombre" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>                                                                
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Nombre" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG"
                                        Style="text-transform:uppercase"
                                        Tooltip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>'
                                        Width="400px"
                                        Height="50px"
                                        TextMode="MultiLine"
                                        Text='<%# Bind("Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        ID="rfvNombre" 
                                        runat="server"                                                
                                        ValidationGroup="I"
                                        ControlToValidate="Nombre" 
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/>
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="vceValidator"
                                        TargetControlID="rfvNombre"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lblProvincia" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Apu_Provincia_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Provincia_Nombre" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG"
                                        Style="text-transform:uppercase"
                                        Tooltip='<%# GetLocalResourceObject("Apu_Provincia_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Width="400px"
                                        Text='<%# Bind("Apu_Provincia_Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:Button 
                                        ID="btn_Zoom_Provincia" 
                                        runat="server" 
                                        CommandArgument="RutaDestino: ~/APU/APU_PROVINCIA.aspx; Filtro: Apu_Provincia_Nombre; NoGuardar:Apu_Lugar_Nombre|Apu_Lugar_Id|Apu_Lugar_Codigo;"
                                        CommandName="Zoom" 
                                        Text="..." />
                                    <asp:RequiredFieldValidator 
                                        ID="rfvProvinciaNombre" 
                                        runat="server"                                                
                                        ValidationGroup="I"
                                        ControlToValidate="Apu_Provincia_Nombre" 
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/>
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="rfvProvinciaNombrevce"
                                        TargetControlID="rfvProvinciaNombre"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lblLugar" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Apu_Lugar_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Lugar_Nombre" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG"
                                        Style="text-transform:uppercase"
                                        Tooltip='<%# GetLocalResourceObject("Apu_Lugar_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Width="400px"
                                        Text='<%# Bind("Apu_Lugar_Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:Button 
                                        ID="btn_Zoom_Lugar" 
                                        runat="server" 
                                        CommandArgument="RutaDestino: ~/APU/APU_Lugar.aspx; Filtro: Apu_Lugar_Nombre|Apu_Provincia_Nombre;"
                                        CommandName="Zoom" 
                                        Text="..." />
                                    <asp:RequiredFieldValidator 
                                        ID="rfvLugarNombre" 
                                        runat="server"                                                
                                        ValidationGroup="I"
                                        ControlToValidate="Apu_Lugar_Nombre" 
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/>
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="rfvLugarNombrevce"
                                        TargetControlID="rfvLugarNombre"/>
                                </td>
                            </tr>
                        </table>
                        <table>   
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lblCostoM2" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Costo_Metro_CuadradoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Costo_Metro_Cuadrado" 
                                        runat="server" 
                                        style="text-align:right"
                                        TabIndex="-1"
                                        Tooltip='<%# GetLocalResourceObject("Costo_Metro_CuadradoRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        Text='<%# Bind("Costo_Metro_Cuadrado") %>'>
                                    </asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label 
                                        ID="lblArea" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("AreaRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Area" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG"
                                        style="text-align:right"
                                        Tooltip='<%# GetLocalResourceObject("AreaRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Area") %>'>
                                    </asp:TextBox>
                                    <AjaxControlToolkit:MaskedEditExtender 
                                        ID="fArea" 
                                        runat="server"
                                        TargetControlID="Area"
                                        Mask="999.99"
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
				                        ID="MaskedEditValidator2" 
				                        runat="server"
                                        ControlExtender="fArea"
                                        ControlToValidate="Area"
                                        IsValidEmpty="False"
                                        EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                        InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                        MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                        MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                        MinimumValue="0.01"
                                        MaximumValue="999.99" 
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
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lblCostoDirecto" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Costo_DirectoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                    <asp:TextBox 
                                        ID="txt_p1" 
                                        Width="25px"
                                        TabIndex="-1"
                                        BorderColor="white"
                                        BorderStyle="Solid"
                                        ReadOnly="true"
                                        runat="server"
                                        Text="">
                                    </asp:TextBox>   
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Costo_Directo" 
                                        runat="server" 
                                        style="text-align:right"
                                        Tooltip='<%# GetLocalResourceObject("Costo_DirectoRecursoKCG.ToolTip").ToString() %>'
                                        TabIndex="-1"
                                        ReadOnly="true"
                                        Text='<%# Bind("Costo_Directo") %>'>
                                    </asp:TextBox>      
                                 </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lblCostoIndirecto" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Costo_IndirectoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Costo_Indirecto" 
                                        runat="server" 
                                        style="text-align:right"
                                        Tooltip='<%# GetLocalResourceObject("Costo_DirectoRecursoKCG.ToolTip").ToString() %>'
                                        TabIndex="-1"
                                        ReadOnly="true"
                                        Text='<%# Bind("Costo_Indirecto") %>'>
                                    </asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label 
                                        ID="lblPorcentajeCostoIndirecto" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Porcentaje_Costo_IndirectoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Porcentaje_Costo_Indirecto" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG"
                                        style="text-align:right"
                                        Tooltip='<%# GetLocalResourceObject("Porcentaje_Costo_IndirectoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Porcentaje_Costo_Indirecto") %>'>
                                    </asp:TextBox>
                                    <asp:Label 
                                        ID="lblSimboloPorcentaje" 
                                        runat="server" 
                                        Text="%">
                                    </asp:Label>
                                    <AjaxControlToolkit:MaskedEditExtender 
                                        ID="fProcentajeCostoIndirecto" 
                                        runat="server"
                                        TargetControlID="Porcentaje_Costo_Indirecto"
                                        Mask="999.99"
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
				                        ID="MaskedEditValidator5" 
				                        runat="server"
                                        ControlExtender="fProcentajeCostoIndirecto"
                                        ControlToValidate="Porcentaje_Costo_Indirecto"
                                        IsValidEmpty="False"
                                        EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                        InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                        MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                        MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                        MinimumValue="0.00"
                                        MaximumValue="100.00" 
                                        Display="Dynamic"
                                        EmptyValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>'
                                        InvalidValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>'
                                        MaximumValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>' 
                                        MinimumValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>'
                                        ValidationGroup="I" />                                   
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="ValidatorCalloutExtender5"
                                        TargetControlID="MaskedEditValidator5"/>                                    
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lblCostoOtros" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Costo_OtrosRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td
                                    style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Costo_Otros" 
                                        runat="server" 
                                        TabIndex="-1"
                                        style="text-align:right"
                                        Tooltip='<%# GetLocalResourceObject("Costo_OtrosRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        Text='<%# Bind("Costo_Otros") %>'>
                                    </asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label 
                                        ID="lblPorcentajeCostoOtros" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Porcentaje_Costo_OtrosRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Porcentaje_Costo_Otros" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG"
                                        style="text-align:right"
                                        Tooltip='<%# GetLocalResourceObject("Porcentaje_Costo_OtrosRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Porcentaje_Costo_Otros") %>'>
                                    </asp:TextBox>   
                                    <asp:Label 
                                        ID="lblSimboloPorcentaje1" 
                                        runat="server" 
                                        Text="%">
                                    </asp:Label>                             
                                    <AjaxControlToolkit:MaskedEditExtender 
                                        ID="fPorcentajeCostoOtros" 
                                        runat="server"
                                        TargetControlID="Porcentaje_Costo_Otros"
                                        Mask="999.99"
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
				                        ID="MaskedEditValidator7" 
				                        runat="server"
                                        ControlExtender="fPorcentajeCostoOtros"
                                        ControlToValidate="Porcentaje_Costo_Otros"
                                        IsValidEmpty="False"
                                        EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                        InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                        MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                        MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                        MinimumValue="0.00"
                                        MaximumValue="100.00" 
                                        Display="Dynamic"
                                        EmptyValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>'
                                        InvalidValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>'
                                        MaximumValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>' 
                                        MinimumValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>'
                                        ValidationGroup="I" />                                   
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="ValidatorCalloutExtender7"
                                        TargetControlID="MaskedEditValidator7"/>                                    
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lblCostoTotal" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Costo_Total" 
                                        runat="server"         
                                        style="text-align:right"                                
                                        TabIndex="-1"
                                        Tooltip='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.ToolTip").ToString() %>'                                        
                                        ReadOnly="true"
                                        Text='<%# Bind("Costo_Total") %>'>
                                    </asp:TextBox>
                                </td>     
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lblFechaCreación" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Fecha_CreacionRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Fecha_Creacion" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Tooltip='<%# GetLocalResourceObject("Fecha_CreacionRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Fecha_Creacion") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <table>                               
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lblTecnicoCosto" 
                                        runat="server"                                         
                                        Text='<%# GetLocalResourceObject("Tecnico_Per_Personal_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Tecnico_Per_Personal_Nombre" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG"
                                        Width="400px"
                                        Tooltip='<%# GetLocalResourceObject("Tecnico_Per_Personal_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Tecnico_Per_Personal_Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:Button 
                                        ID="Btn_Per_Personal" 
                                        runat="server" 
                                        CommandArgument="RutaDestino: ~/PER/PER_PERSONAL.aspx; Filtro: Tecnico_Per_Personal_Nombre; Obtener: Int_Moneda_Simbolo|Par_Razon_Social_Nombre; Alias:Tecnico;"
                                        CommandName="Zoom" 
                                        Text="..." />
                                    <asp:RequiredFieldValidator 
                                        ID="rfvTecnico" 
                                        runat="server"                                                
                                        ValidationGroup="I"
                                        ControlToValidate="Tecnico_Per_Personal_Nombre" 
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/>
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="rfvTecnicovce"
                                        TargetControlID="rfvTecnico"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Descripcion" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("DescripcionRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                    <asp:TextBox 
                                        ID="txt_P2" 
                                        Width="35px"
                                        TabIndex="-1"
                                        BorderColor="white"
                                        BorderStyle="Solid"
                                        ReadOnly="true"
                                        runat="server"
                                        Text="">
                                    </asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox
                                        ID="Descripcion"
                                        runat="server"
                                        Width="400px"
                                        Height="50px"
                                        CssClass="TEXTO_EDICION_KCG"
                                        TextMode="MultiLine"
                                        Tooltip='<%# GetLocalResourceObject("DescripcionRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Descripcion") %>'>
                                    </asp:TextBox>
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
                            ID="Creacion_Per_Personal_Id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Creacion_Per_Personal_Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Update_Per_Personal_Id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Update_Per_Personal_Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Tecnico_Per_Personal_Id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Tecnico_Per_Personal_Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_Sucursal_Id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Int_Sucursal_Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_Moneda_Id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Int_Moneda_Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Apu_Lugar_Id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Apu_Lugar_Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Apu_provincia_id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Apu_provincia_id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_Empresa_Id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Int_Empresa_Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Id") %>'>
                        </asp:TextBox>
                        
                        <%--Ocultos--%>                
                        
                        <asp:TextBox 
                            ID="Contratista" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Contratista") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Fecha_Update" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Fecha_Update") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Etapa" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Etapa") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Apu_Lugar_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Apu_Lugar_Codigo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Apu_Provincia_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Apu_Provincia_Codigo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_Sucursal_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_Sucursal_Codigo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_Sucursal_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_Sucursal_Nombre") %>'>
                        </asp:TextBox>                        
                        
                        <asp:TextBox 
                            ID="Int_Empresa_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_Empresa_Codigo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_Empresa_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_Empresa_Nombre") %>'>
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
                            ID="Tecnico_Per_Personal_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Tecnico_Per_Personal_Codigo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_Moneda_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_Moneda_Codigo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_Moneda_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_Moneda_Nombre") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_Moneda_Simbolo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Costo_Equipo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Costo_Equipo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Costo_Mano_Obra" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Costo_Mano_Obra") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Costo_Material" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Costo_Material") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Costo_Transporte" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Costo_Transporte") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Costo_Indirecto_Otros" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Costo_Indirecto_Otros") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Porcentaje_Costo_Indirecto_Otros" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Porcentaje_Costo_Indirecto_Otros") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Indice_Sumatoria" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Indice_Sumatoria") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Coeficiente_Sumatoria" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Coeficiente_Sumatoria") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Cuadrilla_Sumatoria" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Cuadrilla_Sumatoria") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Cuadrilla_Coeficiente_Sumatoria" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Cuadrilla_Coeficiente_Sumatoria") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Suma_Porcentaje_Indice_Transporte" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Suma_Porcentaje_Indice_Transporte") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Campo_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Campo_Nombre") %>'>
                        </asp:TextBox>                      
                        
                        <asp:TextBox 
                            ID="Estado" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Estado") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Apu_Presupuesto_Estado" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Apu_Presupuesto_Estado") %>'>
                        </asp:TextBox>  
                        
                        <asp:TextBox 
                            ID="Tipo_Nombre" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Tipo_Nombre") %>'>
                        </asp:TextBox> 
                    </InsertItemTemplate>
                    
                    <ItemTemplate>
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
                                        ID="lblCodigo" 
                                        runat="server"                                         
                                        Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Codigo" 
                                        TabIndex="-1"
                                        runat="server" 
                                        ReadOnly="true"
                                        Text='<%# Bind("Codigo") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>                
                            <tr >
                                <td>
                                    <asp:Label 
                                        ID="lblCodigo_Institucion"
                                        runat="server"  
                                        Text='<%# GetLocalResourceObject("Codigo_InstitucionRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox ID="Codigo_Institucion"
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        runat="server" 
                                        Text='<%# Bind("Codigo_Institucion") %>'
                                        ToolTip='<%# GetLocalResourceObject("Codigo_InstitucionRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:TextBox> 
                                    <asp:Label
                                        ID="lbl_Tipo_Contrato"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Tipo_ContratoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label> 
                                    <asp:TextBox 
                                        ID="Tipo_Nombre" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"   
                                        ToolTip='<%# GetLocalResourceObject("Tipo_ContratoRecursoKCG.ToolTip").ToString() %>'                                    
                                        Text='<%# Bind("Tipo_Nombre") %>'>
                                    </asp:TextBox>                                  
                                </td>
                            </tr>  
                            <tr>
                                <td>                                    
                                    <asp:Label 
                                        ID="lblNombre" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>                                                                
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Nombre" 
                                        runat="server" 
                                        TabIndex="-1"
                                        CssClass ="TEXTO_LECTURA_KCG"
                                        ReadOnly="true"
                                        Tooltip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>'
                                        Width="400px"
                                        Height="50px"
                                        TextMode="MultiLine"
                                        Text='<%# Bind("Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lblProvincia" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Apu_Provincia_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Provincia_Nombre" 
                                        runat="server"                                            
                                        TabIndex="-1"                                   
                                        ReadOnly="true"
                                        Tooltip='<%# GetLocalResourceObject("Apu_Provincia_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Width="400px"
                                        Text='<%# Bind("Apu_Provincia_Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:Button 
                                        ID="btn_Zoom_Provincia" 
                                        runat="server" 
                                        CommandArgument="RutaDestino: ~/APU/APU_PROVINCIA.aspx; Filtro: Apu_Provincia_Nombre;"
                                        Enabled="false"
                                        CommandName="Zoom" 
                                        Text="..." />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lblLugar" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Apu_Lugar_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Lugar_Nombre" 
                                        runat="server" 
                                       TabIndex="-1"    
                                        ReadOnly="true"
                                        Tooltip='<%# GetLocalResourceObject("Apu_Lugar_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Width="400px"
                                        Text='<%# Bind("Apu_Lugar_Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:Button 
                                        ID="btn_Zoom_Lugar" 
                                        runat="server" 
                                        CommandArgument="RutaDestino: ~/APU/APU_Lugar.aspx; Filtro: Apu_Lugar_Nombre;"
                                        Enabled="false"
                                        CommandName="Zoom" 
                                        Text="..." />
                                </td>
                            </tr>
                        </table>
                        <table>   
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lblCostoM2" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Costo_Metro_CuadradoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Costo_Metro_Cuadrado" 
                                        runat="server" 
                                        TabIndex="-1"    
                                        style="text-align:right"
                                        Tooltip='<%# GetLocalResourceObject("Costo_Metro_CuadradoRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        Text='<%# Bind("Costo_Metro_Cuadrado","{0:N2}") %>'>
                                    </asp:TextBox>
                                    <asp:Label 
                                        ID="Int_Moneda_Simbolo0" 
                                        runat="server" 
                                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label> 
                                </td>
                                <td>
                                    <asp:Label 
                                        ID="lblArea" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("AreaRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>                                
                                    <asp:TextBox 
                                        ID="Area" 
                                        runat="server" 
                                        TabIndex="-1" 
                                        ReadOnly="true"
                                        style="text-align:right"
                                        Tooltip='<%# GetLocalResourceObject("AreaRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Area","{0:N2}") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lblCostoDirecto" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Costo_DirectoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                    <asp:TextBox 
                                        ID="txt_p1" 
                                        Width="25px"
                                        TabIndex="-1"
                                        BorderColor="white"
                                        BorderStyle="Solid"
                                        ReadOnly="true"
                                        runat="server"
                                        Text="">
                                    </asp:TextBox>   
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Costo_Directo" 
                                        runat="server" 
                                        TabIndex="-1"    
                                        style="text-align:right"
                                        Tooltip='<%# GetLocalResourceObject("Costo_DirectoRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        Text='<%# Bind("Costo_Directo","{0:N2}") %>'>
                                    </asp:TextBox>     
                                    <asp:Label 
                                        ID="Int_Moneda_Simbolo1" 
                                        runat="server" 
                                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>     
                                 </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lblCostoIndirecto" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Costo_IndirectoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Costo_Indirecto" 
                                        runat="server" 
                                        TabIndex="-1"    
                                        style="text-align:right"
                                        Tooltip='<%# GetLocalResourceObject("Costo_DirectoRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        Text='<%# Bind("Costo_Indirecto","{0:N2}") %>'>
                                    </asp:TextBox>    
                                    <asp:Label 
                                        ID="Int_Moneda_Simbolo2" 
                                        runat="server" 
                                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>                     
                                </td>
                                <td>
                                    <asp:Label 
                                        ID="lblPorcentajeCostoIndirecto" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Porcentaje_Costo_IndirectoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Porcentaje_Costo_Indirecto" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"    
                                        style="text-align:right"
                                        Tooltip='<%# GetLocalResourceObject("Porcentaje_Costo_IndirectoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Porcentaje_Costo_Indirecto") %>'>
                                    </asp:TextBox>                                    
                                    <asp:Label 
                                        ID="lblSimboloPorcentaje" 
                                        runat="server" 
                                        Text="%">
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lblCostoOtros" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Costo_OtrosRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Costo_Otros" 
                                        runat="server" 
                                        TabIndex="-1"    
                                        style="text-align:right"
                                        Tooltip='<%# GetLocalResourceObject("Costo_OtrosRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        Text='<%# Bind("Costo_Otros","{0:N2}") %>'>
                                    </asp:TextBox>
                                    <asp:Label 
                                        ID="Int_Moneda_Simbolo3" 
                                        runat="server" 
                                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:Label 
                                        ID="lblPorcentajeCostoOtros" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Porcentaje_Costo_OtrosRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Porcentaje_Costo_Otros" 
                                        runat="server" 
                                        TabIndex="-1"       
                                        ReadOnly="true"
                                        style="text-align:right"
                                        Tooltip='<%# GetLocalResourceObject("Porcentaje_Costo_OtrosRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Porcentaje_Costo_Otros") %>'>
                                    </asp:TextBox>
                                    <asp:Label 
                                        ID="lblSimboloPorcentaje1" 
                                        runat="server" 
                                        Text="%">
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lblCostoTotal" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Costo_Total" 
                                        runat="server"   
                                        TabIndex="-1"           
                                        style="text-align:right"                               
                                        Tooltip='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        Text='<%# Bind("Costo_Total","{0:N2}") %>'>
                                    </asp:TextBox>
                                    <asp:Label 
                                        ID="Int_Moneda_Simbolo4" 
                                        runat="server" 
                                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lblFechaCreación" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Fecha_CreacionRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Fecha_Creacion" 
                                        runat="server"                                         
                                        TabIndex="-1"    
                                        ReadOnly="true"
                                        Tooltip='<%# GetLocalResourceObject("Fecha_CreacionRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Fecha_Creacion") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <table>                               
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lblTecnicoCosto" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Tecnico_Per_Personal_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>                                       
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Tecnico_Per_Personal_Nombre" 
                                        runat="server" 
                                        ReadONly="true"
                                        TabIndex="-1" 
                                        Width="400px"
                                        Tooltip='<%# GetLocalResourceObject("Tecnico_Per_Personal_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Tecnico_Per_Personal_Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:Button 
                                        ID="Btn_Per_Personal" 
                                        runat="server" 
                                        CommandArgument="RutaDestino: ~/PER/PER_PERSONAL.aspx; Filtro: Tecnico_Per_Personal_Nombre; Alias:Tecnico;"
                                        Enabled="false"
                                        CommandName="Zoom" 
                                        Text="..." />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Descripcion" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("DescripcionRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                    <asp:TextBox 
                                        ID="txt_P2" 
                                        Width="35px"
                                        TabIndex="-1"
                                        BorderColor="white"
                                        BorderStyle="Solid"
                                        ReadOnly="true"
                                        runat="server"
                                        Text="">
                                    </asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox
                                        ID="Descripcion"
                                        runat="server"
                                        Width="400px"
                                        Height="50px"
                                        TabIndex="-1"
                                        ReadOnly="true"
                                        TextMode="MultiLine"
                                        CssClass ="TEXTO_LECTURA_KCG"
                                        Tooltip='<%# GetLocalResourceObject("DescripcionRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Descripcion") %>'>
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
                                        Enabled='<%# HER.PermisosMovimientos.Movimiento_Apu_Oferta(Eval("Estado"),HER.PermisosMovimientos.ModoOperacion.Editar) %>'
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_EditarRecursoKCG.AccesKey").ToString() %>'  
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_EditRecursoKCG.Text").ToString() %>'
                                        ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_EditRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:Button>
                                    <asp:Button 
                                        ID="DeleteButton" 
                                        runat="server" 
                                        CausesValidation="False" 
                                        CommandName="Delete"
                                        Enabled='<%# HER.PermisosMovimientos.Movimiento_Apu_Oferta(Eval("Estado"),HER.PermisosMovimientos.ModoOperacion.Eliminar) %>'
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
                                    <uc2:wucMensajeEliminar 
                                        ID="WucMensajeEliminar1" 
                                        runat="server" />                      
                                </td>                        
                            </tr>
                        </table>
                        
                        <%--Ids--%>                 
                        
                        <asp:TextBox 
                            ID="Creacion_Per_Personal_Id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Creacion_Per_Personal_Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Update_Per_Personal_Id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Update_Per_Personal_Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Tecnico_Per_Personal_Id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Tecnico_Per_Personal_Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_Sucursal_Id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Int_Sucursal_Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_Moneda_Id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Int_Moneda_Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Apu_Lugar_Id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Apu_Lugar_Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Apu_provincia_id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Apu_provincia_id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_Empresa_Id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Int_Empresa_Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Id") %>'>
                        </asp:TextBox>
                        
                        <%--Ocultos--%> 
                        
                        <asp:TextBox 
                            ID="Contratista" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Contratista") %>'>
                        </asp:TextBox>               
                        
                        <asp:TextBox 
                            ID="Fecha_Update" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Fecha_Update") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Etapa" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Etapa") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Apu_Lugar_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Apu_Lugar_Codigo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Apu_Provincia_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Apu_Provincia_Codigo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_Sucursal_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_Sucursal_Codigo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_Sucursal_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_Sucursal_Nombre") %>'>
                        </asp:TextBox>                        
                        
                        <asp:TextBox 
                            ID="Int_Empresa_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_Empresa_Codigo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_Empresa_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_Empresa_Nombre") %>'>
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
                            ID="Tecnico_Per_Personal_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Tecnico_Per_Personal_Codigo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_Moneda_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_Moneda_Codigo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_Moneda_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_Moneda_Nombre") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_Moneda_Simbolo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Costo_Equipo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Costo_Equipo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Costo_Mano_Obra" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Costo_Mano_Obra") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Costo_Material" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Costo_Material") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Costo_Transporte" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Costo_Transporte") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Costo_Indirecto_Otros" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Costo_Indirecto_Otros") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Porcentaje_Costo_Indirecto_Otros" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Porcentaje_Costo_Indirecto_Otros") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Indice_Sumatoria" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Indice_Sumatoria") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Coeficiente_Sumatoria" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Coeficiente_Sumatoria") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Cuadrilla_Sumatoria" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Cuadrilla_Sumatoria") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Cuadrilla_Coeficiente_Sumatoria" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Cuadrilla_Coeficiente_Sumatoria") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Suma_Porcentaje_Indice_Transporte" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Suma_Porcentaje_Indice_Transporte") %>'>
                        </asp:TextBox>                  
                        
                        <asp:TextBox 
                            ID="Estado" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Estado") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Apu_Presupuesto_Estado" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Apu_Presupuesto_Estado") %>'>
                        </asp:TextBox> 
                        
                        <asp:TextBox 
                            ID="Tipo_Contrato" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Tipo_Contrato") %>'>
                        </asp:TextBox> 
                    </ItemTemplate>    
                            
                </asp:FormView>                
            </asp:Panel>  
            <table>
                <tr>
                    <td>                        
                        <asp:Button 
                            ID="Btn_Apu_Oferta_Rubro" 
                            runat="server" 
                            OnClick="Btn_Apu_Oferta_Rubro_Click" />
                        <asp:Button 
                            ID="Btn_Apu_Listado_Oferta" 
                            runat="server" 
                            OnClick="Btn_Apu_Listado_Oferta_Click" />
                        <asp:Button 
                            ID="Btn_Apu_Oferta_Categoria" 
                            runat="server" 
                            meta:resourcekey="Btn_Apu_Oferta_CategoriaRecursoKCG"
                            OnClick="Btn_Apu_Oferta_Categoria_Click" />
                        <asp:Button 
                            ID="Btn_Apu_Mano_Obra" 
                            runat="server" 
                            meta:resourcekey="Btn_Apu_Oferta_Mano_ObraRecursoKCG"
                            OnClick="Btn_Apu_Mano_Obra_Click" />                                                                                   
                    </td>          
                </tr>
            </table>   
            <asp:Panel 
                ID="Panel1" 
                runat="server"
                meta:resourcekey="Rec_Apu_Oferta_Formula_PoliRecursoKCG" >
                <table>
                    <tr>
                        <td>
                            <asp:Button 
                                ID="Btn_Apu_Oferta_Formula_Poli" 
                                runat="server" 
                                meta:resourcekey="Btn_Apu_Oferta_Formula_PoliRecursoKCG"
                                OnClick="Btn_Apu_Oferta_Formula_Poli_Click" />
                        </td>   
                        <td>
                            <asp:Button 
                                ID="Btn_Apu_Oferta_Cuadrilla" 
                                runat="server" 
                                meta:resourcekey="Btn_Apu_Oferta_CuadrillaRecursoKCG"
                                OnClick="Btn_Apu_Oferta_Cuadrilla_Click" />
                        </td>
                        <td>
                            <asp:UpdatePanel 
                                ID="opopop"
                                runat="server">
                                <ContentTemplate>                            
                                <koala:KEstado 
                                    ID="Estado" 
                                    Runat="Server" 
                                    ObjetoNombre="APU_OFERTA"
                                    CampoNombre="Estado" />
                                </ContentTemplate>
                            </asp:UpdatePanel> 
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    
    <asp:ObjectDataSource 
        ID="osdfvApuOferta" 
        runat="server" 
        ConflictDetection="CompareAllValues"
        OldValuesParameterFormatString="original{0}" 
        SelectMethod="GetByIdResumido" 
        SortParameterName="sortExpression"
        TypeName="FEL.APU.BO_Apu_Oferta" 
        DeleteMethod="Delete" 
        InsertMethod="Insert" 
        UpdateMethod="Update">
        <SelectParameters>
            <asp:SessionParameter 
                Name="s" 
                SessionField="Scope" 
                Type="Object" />
            <asp:ControlParameter
                    ControlID="txtApu_Proyecto_Id" 
                    Name="Apu_Oferta_Id" 
                    PropertyName="Text" 
                    Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    
</asp:Content>

