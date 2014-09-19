<%@ Page Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="APU_PROYECTO.aspx.cs" 
    Inherits="APU_APU_PROYECTO" 
    meta:resourcekey="Tit_Apu_ProyectoRecursoKCG"
    StylesheetTheme="EstiloKCG"
    Theme="EstiloKCG" %>

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
    
    <%@ Register tagprefix="koala" 
    assembly="KoalaWebControls" 
    namespace="Koala.KoalaWebControls" %>    
    
<asp:Content ID="Content1" 
    ContentPlaceHolderID="ContentPlaceHolder1" 
    Runat="Server">
    <script type="text/javascript">
           
        function ItemSelected_Codigo_Institucion( source, eventArgs ) 
        {   
            var valor = eventArgs.get_value();
            var temp = new Array();
            temp = valor.split('||');
              
            var Codigo_Institucion = $get("ctl00_ContentPlaceHolder1_fvApuProyecto_Codigo_Institucion");
            Codigo_Institucion.value = temp[0];   
            var Auxiliar_Codigo = $get("ctl00_ContentPlaceHolder1_Auxiliar_Codigo");
            Auxiliar_Codigo.value = temp[0];                                                                                 
        }  
        
        function ItemSelected_txtTras( source, eventArgs ) 
        {
            var valor = eventArgs.get_value();
            var temp = new Array();
            temp = valor.split('||');

            var txt_Tras_Id = $get("ctl00_ContentPlaceHolder1_txt_Tras_Id");
            txt_Tras_Id.value = temp[0];  
            var btn_Transpasar = $get("ctl00_ContentPlaceHolder1_btn_Transpasar");  
            btn_Transpasar.disabled = false                                                                                        
        }
        
        function checkSelectedValueTipoC()
        {   Sys.Debug.fail("2");
            var ddlTipo_Contrato = $get("ctl00_ContentPlaceHolder1_fvApuProyecto_ddl_Tipo_Contrato");
            var Tipo_Contrato = $get("ctl00_ContentPlaceHolder1_fvApuProyecto_Tipo_Contrato");  
            var Tipo_Nombre = $get("ctl00_ContentPlaceHolder1_fvApuProyecto_Tipo_Nombre");            
                            
            Tipo_Contrato.value = ddlTipo_Contrato.options[ddlTipo_Contrato.selectedIndex].value;
            Tipo_Nombre.value = ddlTipo_Contrato.options[ddlTipo_Contrato.selectedIndex].text;                                      
        }
        
    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>        
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
    <asp:FormView 
        ID="fvApuProyecto" 
        runat="server" 
        DataSourceID="odsApuProyecto"
        DataKeyNames= "Estado,Id"
        DefaultMode="Insert"  >
        <EditItemTemplate>
            <asp:Panel 
                ID="pnlProyecto" 
                runat="server" 
                meta:resourcekey="Rec_Apu_ProyectoRecursoKCG">
                <table>
                    <tr align="right">
                        <td colspan="4">
                            <asp:Label 
                                ID="Estado_Nombre" 
                                runat="server" 
                                ForeColor="Blue"
                                Text='<%# Bind("Estado_Nombre") %>'>
                            </asp:Label>
                        </td>
                    </tr>
                    <tr >
                        <td>
                            <asp:Label 
                                ID="lblCodigo"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Codigo"
                                ReadOnly="true"
                                TabIndex="-1"
                                runat="server" 
                                Text='<%# Bind("Codigo") %>'
                                ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>' >
                            </asp:TextBox>
                        </td>
                   <%-- </tr>
                    <tr align="left">--%>
                <%--        <td>
                            <asp:Label 
                                ID="lblEtapa_Nombre"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Etapa_NombreRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Etapa_Nombre"
                                ReadOnly="true" 
                                TabIndex="-1"
                                runat="server" 
                                Text='<%# Bind("Etapa_Nombre") %>'
                                ToolTip='<%# GetLocalResourceObject("Etapa_NombreRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>--%>
                    <tr >
                        <td>
                            <asp:Label 
                                ID="lblCodigo_Institucion"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Codigo_InstitucionRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
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
                                EnableClientScript="false"
                                ErrorMessage="Error"                                        
                                ControlToValidate="Codigo_Institucion"                                        
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
                                ID="lbl_TipoContrato"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Tipo_NombreRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                            <asp:TextBox 
                                ID="Tipo_Contrato" 
                                runat="server"                                
                                Style="display:none"
                                Text='<%# Bind("Tipo_Contrato") %>'>
                            </asp:TextBox>
                            <asp:DropDownList 
                                ID="ddl_Tipo_Contrato" 
                                runat="server" 
                                CssClass="TEXTO_EDICION_KCG"
                                DataSourceID="odsddl_Tipo_Contrato"
                                DataTextField="Nombre" 
                                DataValueField="Dic_Dominio_Dominio"
                                OnDataBound="TipoContrato_DataBound">
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
                                DefaultValue="APU_PROYECTO" 
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
                    <tr >
                        <td>
                            <asp:Label 
                                ID="lblNombre"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td Style="white-space:nowrap">
                            <asp:TextBox ID="Nombre"
                                CssClass="TEXTO_EDICION_KCG"
                                Style="text-transform:uppercase"
                                runat="server"
                                Width="400px"
                                Height="50px"
                                TextMode="MultiLine"
                                Text='<%# Bind("Nombre") %>'
                                ToolTip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>'>
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
                                ID="lblApu_Provincia_Nombre"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Apu_Provincia_NombreRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td Style="white-space:nowrap">
                            <asp:TextBox ID="Apu_Provincia_Nombre"
                                ReadOnly="true"
                                CssClass="TEXTO_EDICION_KCG" 
                                runat="server" 
                                Text='<%# Bind("Apu_Provincia_Nombre") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Provincia_NombreRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:Button 
                                ID="btnApuProvinciaNombre" 
                                runat="server" 
                                CommandArgument="RutaDestino:~/APU/APU_PROVINCIA.aspx; Filtro:Apu_Provincia_Nombre;NoGuardar:Apu_Lugar_Nombre|Apu_Lugar_Id|Apu_Lugar_Codigo"
                                CommandName="Zoom" 
                                Text="..." />                        
                            <asp:Label 
                                ID="lblApu_Lugar_Nombre"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Apu_Lugar_NombreRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                            <asp:TextBox 
                                ID="txt_p2" 
                                Width="35px"
                                TabIndex="-1"
                                BorderColor="white"
                                BorderStyle="Solid"
                                ReadOnly="true"
                                runat="server"
                                Text="">
                            </asp:TextBox>   
                            <asp:TextBox ID="Apu_Lugar_Nombre"
                                CssClass="TEXTO_EDICION_KCG"
                                ReadOnly="true" 
                                runat="server" 
                                Text='<%# Bind("Apu_Lugar_Nombre") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Lugar_NombreRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:Button 
                                ID="btnApu_Lugar_Nombre" 
                                runat="server" 
                                CommandArgument="RutaDestino: ~/APU/APU_LUGAR.aspx;Filtro:Apu_Lugar_Nombre|Apu_Provincia_Nombre;"
                                CommandName="Zoom" 
                                Text="..." />
                            <asp:RequiredFieldValidator 
                                ID="rfvApu_Lugar_Nombre" 
                                runat="server"                                                
                                ValidationGroup="I"
                                ControlToValidate="Apu_Lugar_Nombre" 
                                ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/>
                            <AjaxControlToolkit:ValidatorCalloutExtender 
                                runat="Server" 
                                ID="vceApu_Lugar_Nombre"
                                TargetControlID="rfvApu_Lugar_Nombre"/>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>
                            <asp:Label 
                                ID="lblCosto_Metro_Cuadrado"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Costo_Metro_CuadradoRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td style="white-space:nowrap">
                            <asp:TextBox ID="Costo_Metro_Cuadrado" 
                                Style="text-align:right"
                                TabIndex="-1"
                                ReadOnly="true"
                                runat="server" 
                                Text='<%# Bind("Costo_Metro_Cuadrado","{0:N4}") %>'
                                ToolTip='<%# GetLocalResourceObject("Costo_Metro_CuadradoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:Label ID="lbl" 
                                runat="server" 
                                Text='<%# Eval("Int_Moneda_Simbolo") %>'>
                            </asp:Label>
                            <asp:TextBox 
                                ID="txt_p4" 
                                Width="1px"
                                TabIndex="-1"
                                BorderColor="white"
                                BorderStyle="Solid"
                                ReadOnly="true"
                                runat="server"
                                Text="">
                            </asp:TextBox>   
                            <asp:Label 
                                ID="lblArea"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("AreaRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                            <asp:TextBox 
                                ID="txt_p8" 
                                Width="50px"
                                TabIndex="-1"
                                BorderColor="white"
                                BorderStyle="Solid"
                                ReadOnly="true"
                                runat="server"
                                Text="">
                            </asp:TextBox>         
                            <asp:TextBox ID="Area"
                                Style="text-align:right" 
                                CssClass="TEXTO_EDICION_KCG"
                                runat="server" 
                                Text='<%# Bind("Area") %>'
                                ToolTip='<%# GetLocalResourceObject("AreaRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <AjaxControlToolkit:MaskedEditExtender 
                                ID="meeArea" 
                                runat="server"
                                TargetControlID="Area"
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
                                ControlExtender="meeArea"
                                ControlToValidate="Area"
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
                        </td>
                    </tr>
                    <tr >
                        <td>
                            <asp:Label 
                                ID="lblCosto_Directo"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Costo_DirectoRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td style="white-space:nowrap">
                            <asp:TextBox ID="Costo_Directo"
                                Style="text-align:right" 
                                TabIndex="-1"
                                ReadOnly="true"
                                runat="server" 
                                Text='<%# Bind("Costo_Directo","{0:N4}") %>'
                                ToolTip='<%# GetLocalResourceObject("Costo_DirectoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:Label ID="Label1" 
                                runat="server" 
                                Text='<%# Eval("Int_Moneda_Simbolo") %>'>
                            </asp:Label>
                        </td>
                    </tr>
                    <tr >
                        <td>
                            <asp:Label 
                                ID="lblCosto_Indirecto"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Costo_IndirectoRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td style="white-space:nowrap">
                            <asp:TextBox ID="Costo_Indirecto"
                                TabIndex="-1"
                                Style="text-align:right"
                                ReadOnly="true" 
                                runat="server" 
                                Text='<%# Bind("Costo_Indirecto","{0:N4}") %>'
                                ToolTip='<%# GetLocalResourceObject("Costo_IndirectoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:Label ID="Label2" 
                                runat="server" 
                                Text='<%# Eval("Int_Moneda_Simbolo") %>'>
                            </asp:Label>
                            <asp:TextBox 
                                ID="txt_p5" 
                                Width="1px"
                                TabIndex="-1"
                                BorderColor="white"
                                BorderStyle="Solid"
                                ReadOnly="true"
                                runat="server"
                                Text="">
                            </asp:TextBox>        
                            <asp:Label 
                                ID="lblPorcentaje_Costo_Indirecto"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Porcentaje_Costo_IndirectoRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                       
                            <asp:TextBox ID="Porcentaje_Costo_Indirecto" 
                                CssClass="TEXTO_EDICION_KCG"
                                Style="text-align:right"
                                runat="server" 
                                Text='<%# Bind("Porcentaje_Costo_Indirecto") %>'
                                ToolTip='<%# GetLocalResourceObject("Porcentaje_Costo_IndirectoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox><b>%</b>
                            <AjaxControlToolkit:MaskedEditExtender 
                                    ID="meePorcentaje_Costo_Indirecto" 
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
                                    ErrorTooltipEnabled="False"
                                    ClearMaskOnLostFocus="True"
                                    />

                                <AjaxControlToolkit:MaskedEditValidator ID="mevPorcentaje_Costo_Indirecto" runat="server"
                                    ControlExtender="meePorcentaje_Costo_Indirecto"
                                    ControlToValidate="Porcentaje_Costo_Indirecto"
                                    IsValidEmpty="False"
                                    EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ24RecursoKCG.ErrorMessage").ToString() %>'
                                    InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ24RecursoKCG.ErrorMessage").ToString() %>'
                                    MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ24RecursoKCG.ErrorMessage").ToString() %>'
                                    MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ24RecursoKCG.ErrorMessage").ToString() %>'
                                    MinimumValue="0.00"
                                    MaximumValue="100.00" 
                                    Display="Dynamic"
                                    EmptyValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.Text").ToString() %>'
                                    InvalidValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.Text").ToString() %>'
                                    MaximumValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.Text").ToString() %>' 
                                    MinimumValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.Text").ToString() %>'
                                    ValidationGroup="I" />  
                                  
                                  <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server" 
                                    ID="ValidatorCalloutExtender2"
                                    TargetControlID="mevPorcentaje_Costo_Indirecto"/> 
                        </td>
                    </tr>
                    <tr >
                        <td>
                            <asp:Label 
                                ID="lblCosto_Otros"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Costo_OtrosRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td style="white-space:nowrap">
                            <asp:TextBox ID="Costo_Otros"
                                Style="text-align:right"
                                TabIndex="-1"
                                ReadOnly="true" 
                                runat="server" 
                                Text='<%# Bind("Costo_Otros","{0:N4}") %>'
                                ToolTip='<%# GetLocalResourceObject("Costo_OtrosRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:Label ID="Label3" 
                                runat="server" 
                                Text='<%# Eval("Int_Moneda_Simbolo") %>'>
                            </asp:Label>
                            <asp:TextBox 
                                ID="txt_p6" 
                                Width="1px"
                                TabIndex="-1"
                                BorderColor="white"
                                BorderStyle="Solid"
                                ReadOnly="true"
                                runat="server"
                                Text="">
                            </asp:TextBox>   
                            <asp:Label 
                                ID="lblPorcentaje_Costo_Otros"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Porcentaje_Costo_OtrosRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                            <asp:TextBox 
                                ID="txt_p9" 
                                Width="15px"
                                TabIndex="-1"
                                BorderColor="white"
                                BorderStyle="Solid"
                                ReadOnly="true"
                                runat="server"
                                Text="">
                            </asp:TextBox>      
                            <asp:TextBox ID="Porcentaje_Costo_Otros" 
                                CssClass="TEXTO_EDICION_KCG"
                                Style="text-align:right"
                                runat="server" 
                                Text='<%# Bind("Porcentaje_Costo_Otros") %>'
                                ToolTip='<%# GetLocalResourceObject("Porcentaje_Costo_OtrosRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox><b>%</b>
                            <AjaxControlToolkit:MaskedEditExtender 
                                    ID="meePorcentaje_Costo_Otros" 
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
                                    ErrorTooltipEnabled="False"
                                    ClearMaskOnLostFocus="True"
                                    />

                                <AjaxControlToolkit:MaskedEditValidator ID="mevPorcentaje_Costo_Otros" runat="server"
                                    ControlExtender="meePorcentaje_Costo_Otros"
                                    ControlToValidate="Porcentaje_Costo_Otros"
                                    IsValidEmpty="False"
                                    EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ24RecursoKCG.ErrorMessage").ToString() %>'
                                    InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ24RecursoKCG.ErrorMessage").ToString() %>'
                                    MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ24RecursoKCG.ErrorMessage").ToString() %>'
                                    MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ24RecursoKCG.ErrorMessage").ToString() %>'
                                    MinimumValue="0.00"
                                    MaximumValue="100.00" 
                                    Display="Dynamic"
                                    EmptyValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.Text").ToString() %>'
                                    InvalidValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.Text").ToString() %>'
                                    MaximumValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.Text").ToString() %>' 
                                    MinimumValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.Text").ToString() %>'
                                    ValidationGroup="I" />  
                                  
                                  <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server" 
                                    ID="ValidatorCalloutExtender3"
                                    TargetControlID="mevPorcentaje_Costo_Otros"/> 
                        </td>
                    </tr>
                    <tr >
                        <td>
                            <asp:Label 
                                ID="lblCosto_Total"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td style="white-space:nowrap">
                            <asp:TextBox ID="Costo_Total"
                                TabIndex="-1"
                                Style="text-align:right"
                                ReadOnly="true" 
                                runat="server" 
                                Text='<%# Bind("Costo_Total","{0:N4}") %>'
                                ToolTip='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:Label ID="Label4" 
                                runat="server" 
                                Text='<%# Eval("Int_Moneda_Simbolo") %>'>
                            </asp:Label>
                        </td>
                    </tr>
                    <tr >
                        <td>
                            <asp:Label 
                                ID="lblFecha_Creacion"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Fecha_CreacionRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Fecha_Creacion" 
                                ReadOnly="true"
                                TabIndex="-1"
                                runat="server" 
                                Text='<%# Bind("Fecha_Creacion") %>'
                                ToolTip='<%# GetLocalResourceObject("Fecha_CreacionRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label 
                                ID="lblTecnico_Per_Personal_Nombre"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Tecnico_Per_Personal_NombreRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td style="white-space:nowrap">
                            <asp:TextBox ID="Tecnico_Per_Personal_Nombre"
                                Width="400px"
                                ReadOnly="True" 
                                runat="server" 
                                Text='<%# Bind("Tecnico_Per_Personal_Nombre") %>'
                                ToolTip='<%# GetLocalResourceObject("Tecnico_Per_Personal_NombreRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label 
                                ID="lbl_Descripcion" 
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
                                Tooltip='<%# GetLocalResourceObject("DescripcionRecursoKCG.ToolTip").ToString() %>'
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
            
            <asp:Panel ID="pnlApu" 
                runat="server" 
                meta:resourcekey="Rec_Apu_Proyecto_PrecioRecursoKCG">
                <table style="white-space:nowrap">
                    <tr align="left">
                        <td>
                            <asp:Label 
                                ID="lblCosto_Equipo"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Costo_EquipoRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Costo_Equipo"
                                Style="text-align:right"
                                ReadOnly="True" 
                                runat="server" 
                                TabIndex="-1"
                                Text='<%# Bind("Costo_Equipo","{0:N4}") %>'
                                ToolTip='<%# GetLocalResourceObject("Costo_EquipoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:Label ID="Label5" 
                                runat="server" 
                                Text='<%# Eval("Int_Moneda_Simbolo") %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:Label 
                                ID="lblCosto_Mano_Obra"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Costo_Mano_ObraRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Costo_Mano_Obra" 
                                Style="text-align:right"
                                ReadOnly="True" 
                                TabIndex="-1"
                                runat="server" 
                                Text='<%# Bind("Costo_Mano_Obra","{0:N2}") %>'
                                ToolTip='<%# GetLocalResourceObject("Costo_Mano_ObraRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:Label ID="Label6" 
                                runat="server" 
                                Text='<%# Eval("Int_Moneda_Simbolo") %>'>
                            </asp:Label>
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            <asp:Label 
                                ID="lblCosto_Material"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Costo_MaterialRecursoKCG.Text").ToString() %>'>
                            </asp:Label>    
                        </td>
                        <td>
                            <asp:TextBox ID="Costo_Material"
                                Style="text-align:right" 
                                ReadOnly="True" 
                                TabIndex="-1"
                                runat="server" 
                                Text='<%# Bind("Costo_Material","{0:N4}") %>'
                                ToolTip='<%# GetLocalResourceObject("Costo_MaterialRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:Label ID="Label7" 
                                runat="server" 
                                Text='<%# Eval("Int_Moneda_Simbolo") %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:Label 
                                ID="lblCosto_Transporte"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Costo_TransporteRecursoKCG.Text").ToString() %>'>
                            </asp:Label>    
                        </td>
                        <td>
                            <asp:TextBox ID="Costo_Transporte"
                                Style="text-align:right" 
                                ReadOnly="True" 
                                TabIndex="-1"
                                runat="server" 
                                Text='<%# Bind("Costo_Transporte") %>'
                                ToolTip='<%# GetLocalResourceObject("Costo_TransporteRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:Label ID="Label8" 
                                runat="server" 
                                Text='<%# Eval("Int_Moneda_Simbolo") %>'>
                            </asp:Label>
                        </td>
                    </tr>
                </table> 
            </asp:Panel>
            
            <div style="text-align:left">                
           <%--     <asp:Button ID="EstadoButton" runat="server"  meta:resourcekey="Btn_Apu_Proyecto_EstadoRecursoKCG"/>--%>
                <asp:Button ID="RubrosButton" runat="server" meta:resourcekey="Btn_Apu_Proyecto_RubroRecursoKCG" OnClick="RubrosButton_Click"/>
                <asp:Button ID="btn_Apu_proyecto_listado_proyecto" 
                    runat="server" 
                    meta:ResourceKey="Btn_Apu_Proyecto_ListadoRecursoKCG" OnClick="btn_Apu_proyecto_listado_proyecto_Click" >
                </asp:Button>
            </div>
            <asp:Panel ID="pnlInsumos" runat="server" meta:resourcekey="Rec_Apu_Proyecto_PrecioRecursoKCG">
                <div style="text-align:left">
                    <asp:Button ID="EquiposButton" runat="server" meta:resourcekey="Btn_Apu_Proyecto_EquipoRecursoKCG"/>
                    <asp:Button ID="btn_Categorias" runat="server"  meta:resourcekey="Btn_Apu_Proyecto_CategoriasRecursoKCG" OnClick="btn_Categorias_Click"/> 
                    <asp:Button ID="ManoObraButton" runat="server"  meta:resourcekey="Btn_Apu_Proyecto_Mano_ObraRecursoKCG"/>
                    <asp:Button ID="MaterialTransporteButton" runat="server"  meta:resourcekey="Btn_Apu_Proyecto_MaterialRecursoKCG"/>                     
                    
                </div>
            </asp:Panel>                        
            
            <%--IDs--%> 
            <asp:TextBox Style="display:none"
                ID="Tipo_Nombre"
                runat="server" 
                Text='<%# Bind("Tipo_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox Style="display:none"
                ID="Coordinador_Per_Personal_Id"
                runat="server" 
                Text='<%# Bind("Coordinador_Per_Personal_Id") %>'>
            </asp:TextBox>
            <asp:TextBox Style="display:none"
                ID="Tecnico_Per_Personal_Id" 
                runat="server" 
                Text='<%# Bind("Tecnico_Per_Personal_Id") %>'>
            </asp:TextBox>
            <asp:TextBox Style="display:none"
                ID="Int_Sucursal_Id" 
                runat="server" 
                Text='<%# Bind("Int_Sucursal_Id") %>'>
            </asp:TextBox>
            <asp:TextBox Style="display:none"
                ID="Int_Moneda_Id" 
                runat="server" 
                Text='<%# Bind("Int_Moneda_Id") %>'>
            </asp:TextBox>
            <asp:TextBox Style="display:none"
                ID="Creacion_Per_Personal_Id" 
                runat="server" 
                Text='<%# Bind("Creacion_Per_Personal_Id") %>'>
            </asp:TextBox>
            <asp:TextBox Style="display:none"
                ID="Update_Per_Personal_Id" 
                runat="server" 
                Text='<%# Bind("Update_Per_Personal_Id") %>'>
            </asp:TextBox>
            <asp:TextBox Style="display:none"
                ID="Apu_Lugar_Id" 
                runat="server" 
                Text='<%# Bind("Apu_Lugar_Id") %>'>
            </asp:TextBox>
            <asp:TextBox Style="display:none"
                ID="Apu_provincia_id" 
                runat="server" 
                Text='<%# Bind("Apu_provincia_id") %>'>
            </asp:TextBox>
            <asp:TextBox Style="display:none"
                ID="Int_Empresa_Id" 
                runat="server" 
                Text='<%# Bind("Int_Empresa_Id") %>'>
            </asp:TextBox>
            <asp:TextBox Style="display:none"
                ID="Id" 
                runat="server" 
                Text='<%# Bind("Id") %>'>
            </asp:TextBox>
            <asp:TextBox Style="display:none"
                ID="Etapa" 
                runat="server" 
                Text='<%# Bind("Etapa") %>'>
            
            <%--Campos ocultos--%>
            
            
            </asp:TextBox>
            <asp:TextBox Visible="false"
                ID="Fecha_Update" 
                runat="server" 
                Text='<%# Bind("Fecha_Update") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false"
                ID="Apu_Lugar_Codigo" 
                runat="server" 
                Text='<%# Bind("Apu_Lugar_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false"
                ID="Apu_Provincia_Codigo" 
                runat="server" 
                Text='<%# Bind("Apu_Provincia_Codigo") %>'>
            </asp:TextBox> 
            <asp:TextBox Visible="false"
                ID="Int_Sucursal_Codigo" 
                runat="server" 
                Text='<%# Bind("Int_Sucursal_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false"
                ID="Int_Sucursal_Nombre" 
                runat="server" 
                Text='<%# Bind("Int_Sucursal_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false"
                ID="Int_Empresa_Codigo" 
                runat="server" 
                Text='<%# Bind("Int_Empresa_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false"
                ID="Int_Empresa_Nombre" 
                runat="server" 
                Text='<%# Bind("Int_Empresa_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false"
                ID="Creacion_Per_Personal_Codigo" 
                runat="server" 
                Text='<%# Bind("Creacion_Per_Personal_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false"
                ID="Creacion_Per_Personal_Nombre" 
                runat="server" 
                Text='<%# Bind("Creacion_Per_Personal_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false"
                ID="Update_Per_Personal_Codigo" 
                runat="server" 
                Text='<%# Bind("Update_Per_Personal_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false"
                ID="Update_Per_Personal_Nombre" 
                runat="server" 
                Text='<%# Bind("Update_Per_Personal_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false"
                ID="Coordinador_Per_Personal_Codigo" 
                runat="server" 
                Text='<%# Bind("Coordinador_Per_Personal_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false"
                ID="Tecnico_Per_Personal_Codigo" 
                runat="server" 
                Text='<%# Bind("Tecnico_Per_Personal_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false"
                ID="Int_Moneda_Codigo" 
                runat="server" 
                Text='<%# Bind("Int_Moneda_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false"
                ID="Int_Moneda_Nombre" 
                runat="server" 
                Text='<%# Bind("Int_Moneda_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false"
                ID="Int_Moneda_Simbolo" 
                runat="server" 
                Text='<%# Bind("Int_Moneda_Simbolo") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false"
                ID="Costo_Indirecto_Otros" 
                runat="server" 
                Text='<%# Bind("Costo_Indirecto_Otros") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false"
                ID="Porcentaje_Costo_Indirecto_Otros" 
                runat="server" 
                Text='<%# Bind("Porcentaje_Costo_Indirecto_Otros") %>'>
            </asp:TextBox>
            <%--<asp:TextBox Visible="false"
                ID="Indice_Sumatora" 
                runat="server" 
                Text='<%# Bind("Indice_Sumatora") %>'>
            </asp:TextBox>--%>
           <%-- <asp:TextBox Visible="false"
                ID="Coeficiente_Sumatora" 
                runat="server" 
                Text='<%# Bind("Coeficiente_Sumatora") %>'>
            </asp:TextBox>--%>
            <asp:TextBox Visible="false"
                ID="Cuadrilla_Sumatoria" 
                runat="server" 
                Text='<%# Bind("Cuadrilla_Sumatoria") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false"
                ID="Cuadrilla_Coeficiente_Sumatoria" 
                runat="server" 
                Text='<%# Bind("Cuadrilla_Coeficiente_Sumatoria") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false"
                ID="Suma_Porcentaje_Indice_Transporte" 
                runat="server" 
                Text='<%# Bind("Suma_Porcentaje_Indice_Transporte") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false"
                ID="Indice_Sumatoria" 
                runat="server" 
                Text='<%# Bind("Indice_Sumatoria") %>'>
            </asp:TextBox>
            <asp:TextBox Style="display:none"
                ID="Coeficiente_Sumatoria" 
                runat="server" 
                Text='<%# Bind("Coeficiente_Sumatoria") %>'>
            </asp:TextBox>
            <asp:TextBox 
                ID="Estado" 
                runat="server" 
                Style="display:none"
                Text='<%# Bind("Estado") %>'>
            </asp:TextBox>
            <asp:TextBox 
                ID="Apu_Presupuesto_Estado" 
                runat="server" 
                Style="display:none"
                Text='<%# Bind("Apu_Presupuesto_Estado") %>'>
            </asp:TextBox>  
            <asp:TextBox 
                ID="Coordinador_Per_Personal_Nombre"                                 
                runat="server" 
                Visible="false"
                Text='<%# Bind("Coordinador_Per_Personal_Nombre") %>'>
            </asp:TextBox>  
        </EditItemTemplate>
        
        <InsertItemTemplate>
            <asp:Panel 
                ID="pnlProyecto" 
                runat="server" 
                meta:resourcekey="Rec_Apu_ProyectoRecursoKCG">
                <table>
                    <tr align="right">
                        <td colspan="4">
                            <asp:Label 
                                ID="Estado_Nombre" 
                                runat="server" 
                                ForeColor="Blue"
                                Text='<%# Bind("Estado_Nombre") %>'>
                            </asp:Label>
                        </td>
                    </tr>
                    <tr >
                        <td>
                            <asp:Label 
                                ID="lblCodigo"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Codigo"
                                ReadOnly="true"
                                TabIndex="-1"
                                runat="server" 
                                Text='<%# Bind("Codigo") %>'
                                ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>' >
                            </asp:TextBox>
                        </td>
                    <%--</tr>
                    <tr align="left">--%>
                 <%--       <td>
                            <asp:Label 
                                ID="lblEtapa_Nombre"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Etapa_NombreRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Etapa_Nombre"
                                ReadOnly="true" 
                                TabIndex="-1"
                                runat="server" 
                                Text='<%# Bind("Etapa_Nombre") %>'
                                ToolTip='<%# GetLocalResourceObject("Etapa_NombreRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>--%>
                    <tr >
                        <td>
                            <asp:Label 
                                ID="lblCodigo_Institucion"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Codigo_InstitucionRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
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
                                EnableClientScript="false"
                                ErrorMessage="Error"                                        
                                ControlToValidate="Codigo_Institucion"                                        
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
                                ID="lbl_TipoContrato"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Tipo_NombreRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                            <asp:TextBox 
                                ID="Tipo_Contrato" 
                                runat="server" 
                                Style="display:none"
                                Text='<%# Bind("Tipo_Contrato") %>'>
                            </asp:TextBox>
                            <asp:DropDownList 
                                ID="ddl_Tipo_Contrato" 
                                runat="server" 
                                CssClass="TEXTO_EDICION_KCG"
                                DataSourceID="odsddl_Tipo_Contrato"
                                DataTextField="Nombre" 
                                DataValueField="Dic_Dominio_Dominio"
                                OnDataBound="TipoContrato_DataBound">
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
                                DefaultValue="APU_PROYECTO" 
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
                    <tr >
                        <td>
                            <asp:Label 
                                ID="lblNombre"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td style="white-space:nowrap">
                            <asp:TextBox ID="Nombre"
                                CssClass="TEXTO_EDICION_KCG"
                                Style="text-transform:uppercase"
                                runat="server"
                                Width="400px"
                                Height="50px"
                                TextMode="MultiLine"
                                Text='<%# Bind("Nombre") %>'
                                ToolTip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>'>
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
                    <tr >
                        <td>
                            <asp:Label 
                                ID="lblApu_Provincia_Nombre"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Apu_Provincia_NombreRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td style="white-space:nowrap">
                            <asp:TextBox ID="Apu_Provincia_Nombre"
                                ReadOnly="true"
                                CssClass="TEXTO_EDICION_KCG" 
                                runat="server" 
                                Text='<%# Bind("Apu_Provincia_Nombre") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Provincia_NombreRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:Button 
                                ID="btnApuProvinciaNombre" 
                                runat="server" 
                                CommandArgument="RutaDestino:~/APU/APU_PROVINCIA.aspx;Filtro:Apu_Provincia_Nombre;NoGuardar:Apu_Lugar_Nombre|Apu_Lugar_Id|Apu_Lugar_Codigo"
                                CommandName="Zoom" 
                                Text="..." />
                        
                            <asp:Label 
                                ID="lblApu_Lugar_Nombre"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Apu_Lugar_NombreRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                            <asp:TextBox 
                                ID="txt_p2" 
                                Width="39px"
                                TabIndex="-1"
                                BorderColor="white"
                                BorderStyle="Solid"
                                ReadOnly="true"
                                runat="server"
                                Text="">
                            </asp:TextBox>   
                            <asp:TextBox ID="Apu_Lugar_Nombre"
                                CssClass="TEXTO_EDICION_KCG"
                                ReadOnly="true" 
                                runat="server" 
                                Text='<%# Bind("Apu_Lugar_Nombre") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Lugar_NombreRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:Button 
                                ID="btnApu_Lugar_Nombre" 
                                runat="server" 
                                CommandArgument="RutaDestino: ~/APU/APU_LUGAR.aspx;Filtro:Apu_Lugar_Nombre|Apu_Provincia_Nombre;"
                                CommandName="Zoom" 
                                Text="..." />
                            <asp:RequiredFieldValidator 
                                ID="rfvApu_Lugar_Nombre" 
                                runat="server"                                                
                                ValidationGroup="I"
                                ControlToValidate="Apu_Lugar_Nombre" 
                                ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/>
                            <AjaxControlToolkit:ValidatorCalloutExtender 
                                runat="Server" 
                                ID="vceApu_Lugar_Nombre"
                                TargetControlID="rfvApu_Lugar_Nombre"/>
                        </td>
                    </tr>
                    
                    <tr >
                        <td>
                            <asp:Label 
                                ID="lblCosto_Metro_Cuadrado"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Costo_Metro_CuadradoRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Costo_Metro_Cuadrado"
                                Style="text-align:right" 
                                ReadOnly="true"
                                TabIndex="-1"
                                runat="server" 
                                Text='<%# Bind("Costo_Metro_Cuadrado","{0:N4}") %>'
                                ToolTip='<%# GetLocalResourceObject("Costo_Metro_CuadradoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:Label ID="lbl" 
                                runat="server" 
                                Text='<%# Eval("Int_Moneda_Simbolo") %>'>
                            </asp:Label>
                            <asp:TextBox 
                                ID="txt_p4" 
                                Width="15px"
                                TabIndex="-1"
                                BorderColor="white"
                                BorderStyle="Solid"
                                ReadOnly="true"
                                runat="server"
                                Text="">
                            </asp:TextBox>   
                            <asp:Label 
                                ID="lblArea"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("AreaRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                            <asp:TextBox 
                                ID="txt_p8" 
                                Width="50px"
                                TabIndex="-1"
                                BorderColor="white"
                                BorderStyle="Solid"
                                ReadOnly="true"
                                runat="server"
                                Text="">
                            </asp:TextBox>     
                            <asp:TextBox ID="Area"
                                Style="text-align:right" 
                                CssClass="TEXTO_EDICION_KCG"
                                runat="server" 
                                Text='<%# Bind("Area") %>'
                                ToolTip='<%# GetLocalResourceObject("AreaRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                              <AjaxControlToolkit:MaskedEditExtender 
                                ID="meeArea" 
                                runat="server"
                                TargetControlID="Area"
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
                                ControlExtender="meeArea"
                                ControlToValidate="Area"
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
                        </td>
                    </tr>
                    <tr >
                        <td>
                            <asp:Label 
                                ID="lblCosto_Directo"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Costo_DirectoRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Costo_Directo"
                                Style="text-align:right" 
                                TabIndex="-1"
                                ReadOnly="true"
                                runat="server" 
                                Text='<%# Bind("Costo_Directo","{0:N4}") %>'
                                ToolTip='<%# GetLocalResourceObject("Costo_DirectoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:Label ID="Label1" 
                                runat="server" 
                                Text='<%# Eval("Int_Moneda_Simbolo") %>'>
                            </asp:Label>
                        </td>
                    </tr>
                    <tr >
                        <td>
                            <asp:Label 
                                ID="lblCosto_Indirecto"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Costo_IndirectoRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Costo_Indirecto"
                                Style="text-align:right"
                                TabIndex="-1"
                                ReadOnly="true" 
                                runat="server" 
                                Text='<%# Bind("Costo_Indirecto","{0:N4}") %>'
                                ToolTip='<%# GetLocalResourceObject("Costo_IndirectoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:Label ID="Label2" 
                                runat="server" 
                                Text='<%# Eval("Int_Moneda_Simbolo") %>'>
                            </asp:Label>
                            <asp:TextBox 
                                ID="txt_p5" 
                                Width="15px"
                                TabIndex="-1"
                                BorderColor="white"
                                BorderStyle="Solid"
                                ReadOnly="true"
                                runat="server"
                                Text="">
                            </asp:TextBox>     
                            <asp:Label 
                                ID="lblPorcentaje_Costo_Indirecto"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Porcentaje_Costo_IndirectoRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        
                            <asp:TextBox ID="Porcentaje_Costo_Indirecto" 
                                CssClass="TEXTO_EDICION_KCG"
                                Style="text-align:right"
                                runat="server" 
                                Text='<%# Bind("Porcentaje_Costo_Indirecto") %>'
                                ToolTip='<%# GetLocalResourceObject("Porcentaje_Costo_IndirectoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox><b>%</b>
                            <AjaxControlToolkit:MaskedEditExtender 
                                    ID="meePorcentaje_Costo_Indirecto" 
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
                                    ErrorTooltipEnabled="False"
                                    ClearMaskOnLostFocus="True"
                                    />

                                <AjaxControlToolkit:MaskedEditValidator ID="mevPorcentaje_Costo_Indirecto" runat="server"
                                    ControlExtender="meePorcentaje_Costo_Indirecto"
                                    ControlToValidate="Porcentaje_Costo_Indirecto"
                                    IsValidEmpty="False"
                                    EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ24RecursoKCG.ErrorMessage").ToString() %>'
                                    InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ24RecursoKCG.ErrorMessage").ToString() %>'
                                    MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ24RecursoKCG.ErrorMessage").ToString() %>'
                                    MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ24RecursoKCG.ErrorMessage").ToString() %>'
                                    MinimumValue="0.00"
                                    MaximumValue="100.00" 
                                    Display="Dynamic"
                                    EmptyValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.Text").ToString() %>'
                                    InvalidValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.Text").ToString() %>'
                                    MaximumValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.Text").ToString() %>' 
                                    MinimumValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.Text").ToString() %>'
                                    ValidationGroup="I" />  
                                  
                                  <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server" 
                                    ID="ValidatorCalloutExtender2"
                                    TargetControlID="mevPorcentaje_Costo_Indirecto"/> 
                        </td>
                    </tr>
                    <tr >
                        <td>
                            <asp:Label 
                                ID="lblCosto_Otros"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Costo_OtrosRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Costo_Otros"
                                Style="text-align:right"
                                TabIndex="-1"
                                ReadOnly="true" 
                                runat="server" 
                                Text='<%# Bind("Costo_Otros","{0:N4}") %>'
                                ToolTip='<%# GetLocalResourceObject("Costo_OtrosRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:Label ID="Label3" 
                                runat="server" 
                                Text='<%# Eval("Int_Moneda_Simbolo") %>'>
                            </asp:Label>
                            <asp:TextBox 
                                ID="txt_p6" 
                                Width="15px"
                                TabIndex="-1"
                                BorderColor="white"
                                BorderStyle="Solid"
                                ReadOnly="true"
                                runat="server"
                                Text="">
                            </asp:TextBox>   
                            <asp:Label 
                                ID="lblPorcentaje_Costo_Otros"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Porcentaje_Costo_OtrosRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                            <asp:TextBox 
                                ID="txt_p9" 
                                Width="15px"
                                TabIndex="-1"
                                BorderColor="white"
                                BorderStyle="Solid"
                                ReadOnly="true"
                                runat="server"
                                Text="">
                            </asp:TextBox>      
                            <asp:TextBox ID="Porcentaje_Costo_Otros" 
                                CssClass="TEXTO_EDICION_KCG"
                                Style="text-align:right"
                                runat="server" 
                                Text='<%# Bind("Porcentaje_Costo_Otros") %>'
                                ToolTip='<%# GetLocalResourceObject("Porcentaje_Costo_OtrosRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox><b>%</b>
                            <AjaxControlToolkit:MaskedEditExtender 
                                    ID="meePorcentaje_Costo_Otros" 
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
                                    ErrorTooltipEnabled="False"
                                    ClearMaskOnLostFocus="True"
                                    />

                                <AjaxControlToolkit:MaskedEditValidator ID="mevPorcentaje_Costo_Otros" runat="server"
                                    ControlExtender="meePorcentaje_Costo_Otros"
                                    ControlToValidate="Porcentaje_Costo_Otros"
                                    IsValidEmpty="False"
                                    EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ24RecursoKCG.ErrorMessage").ToString() %>'
                                    InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ24RecursoKCG.ErrorMessage").ToString() %>'
                                    MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ24RecursoKCG.ErrorMessage").ToString() %>'
                                    MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ24RecursoKCG.ErrorMessage").ToString() %>'
                                    MinimumValue="0.00"
                                    MaximumValue="100.00" 
                                    Display="Dynamic"
                                    EmptyValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.Text").ToString() %>'
                                    InvalidValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.Text").ToString() %>'
                                    MaximumValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.Text").ToString() %>' 
                                    MinimumValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.Text").ToString() %>'
                                    ValidationGroup="I" />  
                                  
                                  <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server" 
                                    ID="ValidatorCalloutExtender3"
                                    TargetControlID="mevPorcentaje_Costo_Otros"/> 
                        </td>
                    </tr>
                    <tr >
                        <td>
                            <asp:Label 
                                ID="lblCosto_Total"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Costo_Total"
                                Style="text-align:right"
                                TabIndex="-1"
                                ReadOnly="true" 
                                runat="server" 
                                Text='<%# Bind("Costo_Total","{0:N4}") %>'
                                ToolTip='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:Label ID="Label4" 
                                runat="server" 
                                Text='<%# Eval("Int_Moneda_Simbolo") %>'>
                            </asp:Label>
                        </td>
                    </tr>
                    <tr >
                        <td>
                            <asp:Label 
                                ID="lblFecha_Creacion"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Fecha_CreacionRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Fecha_Creacion" 
                                ReadOnly="true"
                                TabIndex="-1"
                                runat="server" 
                                Text='<%# Bind("Fecha_Creacion") %>'
                                ToolTip='<%# GetLocalResourceObject("Fecha_CreacionRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label 
                                ID="lblTecnico_Per_Personal_Nombre"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Tecnico_Per_Personal_NombreRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td style="white-space:nowrap">
                            <asp:TextBox ID="Tecnico_Per_Personal_Nombre"
                                ReadOnly="True"
                                TabIndex="-1"
                                Width="400px"
                                runat="server" 
                                Text='<%# Bind("Tecnico_Per_Personal_Nombre") %>'
                                ToolTip='<%# GetLocalResourceObject("Tecnico_Per_Personal_NombreRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label 
                                ID="lbl_Descripcion" 
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
                                Tooltip='<%# GetLocalResourceObject("DescripcionRecursoKCG.ToolTip").ToString() %>'
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
            
            <asp:Panel ID="pnlApu" 
                runat="server" 
                meta:resourcekey="Rec_Apu_Proyecto_PrecioRecursoKCG">
                <table style="white-space:nowrap">
                    <tr align="left">
                        <td>
                            <asp:Label 
                                ID="lblCosto_Equipo"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Costo_EquipoRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Costo_Equipo"
                                Style="text-align:right"
                                TabIndex="-1"
                                ReadOnly="True" 
                                runat="server" 
                                Text='<%# Bind("Costo_Equipo","{0:N4}") %>'
                                ToolTip='<%# GetLocalResourceObject("Costo_EquipoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:Label ID="Label5" 
                                runat="server" 
                                Text='<%# Eval("Int_Moneda_Simbolo") %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:Label 
                                ID="lblCosto_Mano_Obra"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Costo_Mano_ObraRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Costo_Mano_Obra"
                                Style="text-align:right" 
                                TabIndex="-1"
                                ReadOnly="True" 
                                runat="server" 
                                Text='<%# Bind("Costo_Mano_Obra","{0:N2}") %>'
                                ToolTip='<%# GetLocalResourceObject("Costo_Mano_ObraRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:Label ID="Label6" 
                                runat="server" 
                                Text='<%# Eval("Int_Moneda_Simbolo") %>'>
                            </asp:Label>
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            <asp:Label 
                                ID="lblCosto_Material"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Costo_MaterialRecursoKCG.Text").ToString() %>'>
                            </asp:Label>    
                        </td>
                        <td>
                            <asp:TextBox ID="Costo_Material"
                                Style="text-align:right"
                                TabIndex="-1" 
                                ReadOnly="True" 
                                runat="server" 
                                Text='<%# Bind("Costo_Material","{0:N4}") %>'
                                ToolTip='<%# GetLocalResourceObject("Costo_MaterialRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:Label ID="Label7" 
                                runat="server" 
                                Text='<%# Eval("Int_Moneda_Simbolo") %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:Label 
                                ID="lblCosto_Transporte"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Costo_TransporteRecursoKCG.Text").ToString() %>'>
                            </asp:Label>    
                        </td>
                        <td>
                            <asp:TextBox ID="Costo_Transporte" 
                                Style="text-align:right"
                                TabIndex="-1"
                                ReadOnly="True" 
                                runat="server" 
                                Text='<%# Bind("Costo_Transporte","{0:N4}") %>'
                                ToolTip='<%# GetLocalResourceObject("Costo_TransporteRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:Label ID="Label8" 
                                runat="server" 
                                Text='<%# Eval("Int_Moneda_Simbolo") %>'>
                            </asp:Label>
                        </td>
                    </tr>
                </table> 
            </asp:Panel>
            
            <div style="text-align:left">                                
                <%--<asp:Button ID="EstadoButton" runat="server"  meta:resourcekey="Btn_Apu_Proyecto_EstadoRecursoKCG"/>--%>
                <asp:Button ID="RubrosButton" runat="server" meta:resourcekey="Btn_Apu_Proyecto_RubroRecursoKCG" OnClick="RubrosButton_Click"/>
                <asp:Button ID="btn_Apu_proyecto_listado_proyecto" runat="server" 
                            meta:ResourceKey="Btn_Apu_Proyecto_ListadoRecursoKCG" OnClick="btn_Apu_proyecto_listado_proyecto_Click">
                </asp:Button>
            </div>
            <asp:Panel ID="pnlInsumos" runat="server" meta:resourcekey="Rec_Apu_Proyecto_PrecioRecursoKCG">
                <div style="text-align:left">
                    <asp:Button ID="EquiposButton" runat="server" meta:resourcekey="Btn_Apu_Proyecto_EquipoRecursoKCG"/>
                    <asp:Button ID="btn_Categorias" runat="server"  meta:resourcekey="Btn_Apu_Proyecto_CategoriasRecursoKCG" OnClick="btn_Categorias_Click"/> 
                    <asp:Button ID="ManoObraButton" runat="server"  meta:resourcekey="Btn_Apu_Proyecto_Mano_ObraRecursoKCG"/>
                    <asp:Button ID="MaterialTransporteButton" runat="server"  meta:resourcekey="Btn_Apu_Proyecto_MaterialRecursoKCG"/>                    
                </div>
            </asp:Panel>
            
            
            
            <%--IDs--%>
            <asp:TextBox Style="display:none"
                ID="Tipo_Nombre"
                runat="server" 
                Text='<%# Bind("Tipo_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox Style="display:none"
                ID="Coordinador_Per_Personal_Id"
                runat="server" 
                Text='<%# Bind("Coordinador_Per_Personal_Id") %>'>
            </asp:TextBox>
            <asp:TextBox Style="display:none"
                ID="Tecnico_Per_Personal_Id" 
                runat="server" 
                Text='<%# Bind("Tecnico_Per_Personal_Id") %>'>
            </asp:TextBox>
            <asp:TextBox Style="display:none"
                ID="Int_Sucursal_Id" 
                runat="server" 
                Text='<%# Bind("Int_Sucursal_Id") %>'>
            </asp:TextBox>
            <asp:TextBox Style="display:none"
                ID="Int_Moneda_Id" 
                runat="server" 
                Text='<%# Bind("Int_Moneda_Id") %>'>
            </asp:TextBox>
            <asp:TextBox Style="display:none"
                ID="Creacion_Per_Personal_Id" 
                runat="server" 
                Text='<%# Bind("Creacion_Per_Personal_Id") %>'>
            </asp:TextBox>
            <asp:TextBox Style="display:none"
                ID="Update_Per_Personal_Id" 
                runat="server" 
                Text='<%# Bind("Update_Per_Personal_Id") %>'>
            </asp:TextBox>
            <asp:TextBox Style="display:none"
                ID="Apu_Lugar_Id" 
                runat="server" 
                Text='<%# Bind("Apu_Lugar_Id") %>'>
            </asp:TextBox>
            <asp:TextBox Style="display:none"
                ID="Apu_provincia_id" 
                runat="server" 
                Text='<%# Bind("Apu_provincia_id") %>'>
            </asp:TextBox>
            <asp:TextBox Style="display:none"
                ID="Int_Empresa_Id" 
                runat="server" 
                Text='<%# Bind("Int_Empresa_Id") %>'>
            </asp:TextBox>
            <asp:TextBox 
                ID="Id" Style="display:none"
                runat="server" 
                Text='<%# Bind("Id") %>'>
            </asp:TextBox>
            <asp:TextBox Style="display:none"
                ID="Etapa" 
                runat="server" 
                Text='<%# Bind("Etapa") %>'>
            </asp:TextBox>
            
            <%--Campos ocultos--%>
            
            
            <asp:TextBox Visible="false"
                ID="Fecha_Update" 
                runat="server" 
                Text='<%# Bind("Fecha_Update") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false"
                ID="Apu_Lugar_Codigo" 
                runat="server" 
                Text='<%# Bind("Apu_Lugar_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox 
                Visible="false"
                ID="Apu_Provincia_Codigo" 
                runat="server" 
                Text='<%# Bind("Apu_Provincia_Codigo") %>'>
            </asp:TextBox> 
            <asp:TextBox Visible="false"
                ID="Int_Sucursal_Codigo" 
                runat="server" 
                Text='<%# Bind("Int_Sucursal_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false"
                ID="Int_Sucursal_Nombre" 
                runat="server" 
                Text='<%# Bind("Int_Sucursal_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false"
                ID="Int_Empresa_Codigo" 
                runat="server" 
                Text='<%# Bind("Int_Empresa_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false"
                ID="Int_Empresa_Nombre" 
                runat="server" 
                Text='<%# Bind("Int_Empresa_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false"
                ID="Creacion_Per_Personal_Codigo" 
                runat="server" 
                Text='<%# Bind("Creacion_Per_Personal_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false"
                ID="Creacion_Per_Personal_Nombre" 
                runat="server" 
                Text='<%# Bind("Creacion_Per_Personal_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false"
                ID="Update_Per_Personal_Codigo" 
                runat="server" 
                Text='<%# Bind("Update_Per_Personal_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false"
                ID="Update_Per_Personal_Nombre" 
                runat="server" 
                Text='<%# Bind("Update_Per_Personal_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false"
                ID="Coordinador_Per_Personal_Codigo" 
                runat="server" 
                Text='<%# Bind("Coordinador_Per_Personal_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false"
                ID="Tecnico_Per_Personal_Codigo" 
                runat="server" 
                Text='<%# Bind("Tecnico_Per_Personal_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false"
                ID="Int_Moneda_Codigo" 
                runat="server" 
                Text='<%# Bind("Int_Moneda_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false"
                ID="Int_Moneda_Nombre" 
                runat="server" 
                Text='<%# Bind("Int_Moneda_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false"
                ID="Int_Moneda_Simbolo" 
                runat="server" 
                Text='<%# Bind("Int_Moneda_Simbolo") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false"
                ID="Costo_Indirecto_Otros" 
                runat="server" 
                Text='<%# Bind("Costo_Indirecto_Otros") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false"
                ID="Porcentaje_Costo_Indirecto_Otros" 
                runat="server" 
                Text='<%# Bind("Porcentaje_Costo_Indirecto_Otros") %>'>
            </asp:TextBox>
            <%--<asp:TextBox Visible="false"
                ID="Indice_Sumatora" 
                runat="server" 
                Text='<%# Bind("Indice_Sumatora") %>'>
            </asp:TextBox>--%>
           <%-- <asp:TextBox Visible="false"
                ID="Coeficiente_Sumatora" 
                runat="server" 
                Text='<%# Bind("Coeficiente_Sumatora") %>'>
            </asp:TextBox>--%>
            <asp:TextBox Visible="false"
                ID="Cuadrilla_Sumatoria" 
                runat="server" 
                Text='<%# Bind("Cuadrilla_Sumatoria") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false"
                ID="Cuadrilla_Coeficiente_Sumatoria" 
                runat="server" 
                Text='<%# Bind("Cuadrilla_Coeficiente_Sumatoria") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false"
                ID="Suma_Porcentaje_Indice_Transporte" 
                runat="server" 
                Text='<%# Bind("Suma_Porcentaje_Indice_Transporte") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false"
                ID="Indice_Sumatoria" 
                runat="server" 
                Text='<%# Bind("Indice_Sumatoria") %>'>
            </asp:TextBox>
            <asp:TextBox Style="display:none"
                ID="Coeficiente_Sumatoria" 
                runat="server" 
                Text='<%# Bind("Coeficiente_Sumatoria") %>'>
            </asp:TextBox>
            <asp:TextBox 
                ID="Estado" 
                runat="server" 
                Style="display:none"
                Text='<%# Bind("Estado") %>'>
            </asp:TextBox>
            <asp:TextBox 
                ID="Apu_Presupuesto_Estado" 
                runat="server" 
                Style="display:none"
                Text='<%# Bind("Apu_Presupuesto_Estado") %>'>
            </asp:TextBox>  
            <asp:TextBox 
                ID="Coordinador_Per_Personal_Nombre" 
                runat="server" 
                Visible="false"
                Text='<%# Bind("Coordinador_Per_Personal_Nombre") %>'>
            </asp:TextBox>   
        </InsertItemTemplate>
        
        <ItemTemplate>
            <asp:Panel 
                ID="pnlProyecto" 
                runat="server" 
                meta:resourcekey="Rec_Apu_ProyectoRecursoKCG">
                <table>
                    <tr align="right">
                        <td colspan="4">
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
                            <asp:TextBox ID="Codigo"
                                ReadOnly="True" 
                                TabIndex="-1"
                                runat="server" 
                                Text='<%# Bind("Codigo") %>'
                                ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>' >
                            </asp:TextBox>
                        </td>
                    <%--</tr>
                    <tr align="left">--%>
             <%--           <td>
                            <asp:Label 
                                ID="lblEtapa_Nombre"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Etapa_NombreRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Etapa_Nombre"
                                ReadOnly="True" 
                                TabIndex="-1"
                                runat="server" 
                                Text='<%# Bind("Etapa_Nombre") %>'
                                ToolTip='<%# GetLocalResourceObject("Etapa_NombreRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>--%>
                    <tr>
                        <td>
                            <asp:Label 
                                ID="lblCodigo_Institucion"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Codigo_InstitucionRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Codigo_Institucion"
                                ReadOnly="True" 
                                TabIndex="-1"
                                runat="server" 
                                Text='<%# Bind("Codigo_Institucion") %>'
                                ToolTip='<%# GetLocalResourceObject("Codigo_InstitucionRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:Label 
                                ID="lbl_TipoContrato"
                                runat="server"
                                Text='<%# GetLocalResourceObject("Tipo_NombreRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                            <asp:TextBox 
                                ID="Tipo_Nombre" 
                                runat="server" 
                                TabIndex="-1"
                                ToolTip='<%# GetLocalResourceObject("Tipo_NombreRecursoKCG.ToolTip").ToString() %>'
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
                            <asp:TextBox ID="Nombre"
                                ReadOnly="True"
                                TabIndex="-1"
                                CssClass ="TEXTO_LECTURA_KCG"
                                Style="text-transform:uppercase"
                                runat="server" 
                                Width="400px"
                                Height="50px"
                                TextMode="MultiLine"
                                Text='<%# Bind("Nombre") %>'
                                ToolTip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label 
                                ID="lblApu_Provincia_Nombre"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Apu_Provincia_NombreRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td style="white-space:nowrap">
                            <asp:TextBox ID="Apu_Provincia_Nombre"
                                ReadOnly="True" 
                                TabIndex="-1"
                                runat="server" 
                                Text='<%# Bind("Apu_Provincia_Nombre") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Provincia_NombreRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:TextBox 
                                ID="txt_p3" 
                                Width="10px"
                                TabIndex="-1"
                                BorderColor="white"
                                BorderStyle="Solid"
                                ReadOnly="true"
                                runat="server"
                                Text="">
                            </asp:TextBox>   
                            <asp:Label 
                                ID="lblApu_Lugar_Nombre"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Apu_Lugar_NombreRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                            <asp:TextBox 
                                ID="txt_p2" 
                                Width="39px"
                                TabIndex="-1"
                                BorderColor="white"
                                BorderStyle="Solid"
                                ReadOnly="true"
                                runat="server"
                                Text="">
                            </asp:TextBox>   
                            <asp:TextBox ID="Apu_Lugar_Nombre" 
                                ReadOnly="True"
                                TabIndex="-1"
                                runat="server" 
                                Text='<%# Bind("Apu_Lugar_Nombre") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Lugar_NombreRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>
                            <asp:Label 
                                ID="lblCosto_Metro_Cuadrado"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Costo_Metro_CuadradoRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Costo_Metro_Cuadrado"
                                Style="text-align:right"
                                TabIndex="-1"
                                ReadOnly="True" 
                                runat="server" 
                                Text='<%# Bind("Costo_Metro_Cuadrado","{0:N4}") %>'
                                ToolTip='<%# GetLocalResourceObject("Costo_Metro_CuadradoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox> 
                            <asp:Label ID="lbl" 
                                runat="server" 
                                Text='<%# Eval("Int_Moneda_Simbolo") %>'>
                            </asp:Label>
                            <asp:TextBox 
                                ID="txt_p4" 
                                Width="1px"
                                TabIndex="-1"
                                BorderColor="white"
                                BorderStyle="Solid"
                                ReadOnly="true"
                                runat="server"
                                Text="">
                            </asp:TextBox>   
                            <asp:Label 
                                ID="lblArea"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("AreaRecursoKCG.Text").ToString() %>'>
                            </asp:Label>      
                            <asp:TextBox 
                                ID="txt_p8" 
                                Width="50px"
                                TabIndex="-1"
                                BorderColor="white"
                                BorderStyle="Solid"
                                ReadOnly="true"
                                runat="server"
                                Text="">
                            </asp:TextBox>                     
                            <asp:TextBox ID="Area"
                                Style="text-align:right" 
                                TabIndex="-1"
                                runat="server" 
                                Text='<%# Bind("Area") %>'
                                ToolTip='<%# GetLocalResourceObject("AreaRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label 
                                ID="lblCosto_Directo"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Costo_DirectoRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Costo_Directo"
                                Style="text-align:right" 
                                TabIndex="-1"
                                ReadOnly="True"
                                runat="server" 
                                Text='<%# Bind("Costo_Directo","{0:N4}") %>'
                                ToolTip='<%# GetLocalResourceObject("Costo_DirectoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:Label ID="Label1" 
                                runat="server" 
                                Text='<%# Eval("Int_Moneda_Simbolo") %>'>
                            </asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label 
                                ID="lblCosto_Indirecto"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Costo_IndirectoRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Costo_Indirecto"
                                Style="text-align:right" 
                                TabIndex="-1"
                                ReadOnly="True"
                                runat="server" 
                                Text='<%# Bind("Costo_Indirecto","{0:N4}") %>'
                                ToolTip='<%# GetLocalResourceObject("Costo_IndirectoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:Label ID="Label2" 
                                runat="server" 
                                Text='<%# Eval("Int_Moneda_Simbolo") %>'>
                            </asp:Label>
                            <asp:TextBox 
                                ID="txt_p5" 
                                Width="1px"
                                TabIndex="-1"
                                BorderColor="white"
                                BorderStyle="Solid"
                                ReadOnly="true"
                                runat="server"
                                Text="">
                            </asp:TextBox>                           
                            <asp:Label 
                                ID="lblPorcentaje_Costo_Indirecto"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Porcentaje_Costo_IndirectoRecursoKCG.Text").ToString() %>'>
                            </asp:Label>                                      
                            <asp:TextBox ID="Porcentaje_Costo_Indirecto"
                                Style="text-align:right"
                                TabIndex="-1"
                                ReadOnly="True" 
                                runat="server" 
                                Text='<%# Bind("Porcentaje_Costo_Indirecto") %>'
                                ToolTip='<%# GetLocalResourceObject("Porcentaje_Costo_IndirectoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label 
                                ID="lblCosto_Otros"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Costo_OtrosRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Costo_Otros"
                                Style="text-align:right" 
                                TabIndex="-1"
                                ReadOnly="True"
                                runat="server" 
                                Text='<%# Bind("Costo_Otros","{0:N4}") %>'
                                ToolTip='<%# GetLocalResourceObject("Costo_OtrosRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:Label ID="Label3" 
                                runat="server" 
                                Text='<%# Eval("Int_Moneda_Simbolo") %>'>
                            </asp:Label>
                            <asp:TextBox 
                                ID="txt_p6" 
                                Width="1px"
                                TabIndex="-1"
                                BorderColor="white"
                                BorderStyle="Solid"
                                ReadOnly="true"
                                runat="server"
                                Text="">
                            </asp:TextBox>   
                            <asp:Label 
                                ID="lblPorcentaje_Costo_Otros"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Porcentaje_Costo_OtrosRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                            <asp:TextBox 
                                ID="txt_p9" 
                                Width="15px"
                                TabIndex="-1"
                                BorderColor="white"
                                BorderStyle="Solid"
                                ReadOnly="true"
                                runat="server"
                                Text="">
                            </asp:TextBox>      
                            <asp:TextBox ID="Porcentaje_Costo_Otros"
                                Style="text-align:right"
                                TabIndex="-1"
                                ReadOnly="True" 
                                runat="server" 
                                Text='<%# Bind("Porcentaje_Costo_Otros") %>'
                                ToolTip='<%# GetLocalResourceObject("Porcentaje_Costo_OtrosRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label 
                                ID="lblCosto_Total"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td style="white-space:nowrap">
                            <asp:TextBox ID="Costo_Total"
                                Style="text-align:right" 
                                TabIndex="-1"
                                ReadOnly="True"
                                runat="server" 
                                Text='<%# Bind("Costo_Total","{0:N4}") %>'
                                ToolTip='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:Label ID="Label4" 
                                runat="server" 
                                Text='<%# Eval("Int_Moneda_Simbolo") %>'>
                            </asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label 
                                ID="lblFecha_Creacion"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Fecha_CreacionRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Fecha_Creacion" 
                                ReadOnly="True"
                                runat="server" 
                                TabIndex="-1"
                                Text='<%# Bind("Fecha_Creacion") %>'
                                ToolTip='<%# GetLocalResourceObject("Fecha_CreacionRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>                    
                    <tr>
                        <td>
                            <asp:Label 
                                ID="lblTecnico_Per_Personal_Nombre"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Tecnico_Per_Personal_NombreRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td colspan="3">
                            <asp:TextBox ID="Tecnico_Per_Personal_Nombre" 
                                ReadOnly="True"
                                Width="400px"
                                TabIndex="-1"
                                runat="server" 
                                Text='<%# Bind("Tecnico_Per_Personal_Nombre") %>'
                                ToolTip='<%# GetLocalResourceObject("Tecnico_Per_Personal_NombreRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label 
                                ID="lbl_Descripcion" 
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
                                TabIndex="-1"
                                ReadOnly="true"
                                TextMode="MultiLine"
                                CssClass="TEXTO_LECTURA_KCG"
                                Tooltip='<%# GetLocalResourceObject("DescripcionRecursoKCG.ToolTip").ToString() %>'
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
                                Enabled='<%# HER.PermisosMovimientos.Movimiento_Apu_Proyecto(Eval("Estado").ToString(), HER.PermisosMovimientos.ModoOperacion.Editar ) %>'
                                AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_EditarRecursoKCG.AccesKey").ToString() %>'  
                                Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_EditRecursoKCG.Text").ToString() %>'
                                ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_EditRecursoKCG.ToolTip").ToString() %>'>
                            </asp:Button>
                            <asp:Button 
                                ID="DeleteButton" 
                                runat="server" 
                                CausesValidation="False" 
                                CommandName="Delete"
                                Enabled='<%# HER.PermisosMovimientos.Movimiento_Apu_Proyecto(Eval("Estado").ToString(), HER.PermisosMovimientos.ModoOperacion.Eliminar ) %>'
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
                            <asp:Button 
                                ID="CopyButton" 
                                runat="server"
                                CausesValidation="False" 
                                CommandName="New"                                           
                                Text="Copia"                                        
                                OnClick="CopyButton_Click">
                           </asp:Button>
                            <uc2:wucMensajeEliminar ID="WucMensajeEliminar1" runat="server" /> 
                        </td>
                    </tr>
                    
                    
                </table>
            </asp:Panel>
            
            <asp:Panel ID="pnlApu" 
                runat="server" 
                meta:resourcekey="Rec_Apu_Proyecto_PrecioRecursoKCG">
                <table>
                    <tr align="left">
                        <td>
                            <asp:Label 
                                ID="lblCosto_Equipo"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Costo_EquipoRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td style="white-space:nowrap">
                            <asp:TextBox ID="Costo_Equipo"
                                Style="text-align:right"
                                TabIndex="-1"
                                ReadOnly="true" 
                                runat="server" 
                                Text='<%# Bind("Costo_Equipo","{0:N4}") %>'
                                ToolTip='<%# GetLocalResourceObject("Costo_EquipoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:Label ID="Label5" 
                                runat="server" 
                                Text='<%# Eval("Int_Moneda_Simbolo") %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:Label 
                                ID="lblCosto_Mano_Obra"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Costo_Mano_ObraRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td style="white-space:nowrap">
                            <asp:TextBox ID="Costo_Mano_Obra"
                                Style="text-align:right"
                                TabIndex="-1"
                                ReadOnly="true" 
                                runat="server" 
                                Text='<%# Bind("Costo_Mano_Obra","{0:N2}") %>'
                                ToolTip='<%# GetLocalResourceObject("Costo_Mano_ObraRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:Label ID="Label6" 
                                runat="server" 
                                Text='<%# Eval("Int_Moneda_Simbolo") %>'>
                            </asp:Label>
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            <asp:Label 
                                ID="lblCosto_Material"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Costo_MaterialRecursoKCG.Text").ToString() %>'>
                            </asp:Label>    
                        </td>
                        <td style="white-space:nowrap">
                            <asp:TextBox ID="Costo_Material"
                                Style="text-align:right"
                                TabIndex="-1"
                                ReadOnly="true" 
                                runat="server" 
                                Text='<%# Bind("Costo_Material","{0:N4}") %>'
                                ToolTip='<%# GetLocalResourceObject("Costo_MaterialRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:Label ID="Label7" 
                                runat="server" 
                                Text='<%# Eval("Int_Moneda_Simbolo") %>'>
                            </asp:Label>
                        </td>
                    
                        <td>
                            <asp:Label 
                                ID="lblCosto_Transporte"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Costo_TransporteRecursoKCG.Text").ToString() %>'>
                            </asp:Label>    
                        </td>
                        <td style="white-space:nowrap">
                            <asp:TextBox ID="Costo_Transporte" 
                                Style="text-align:right"
                                TabIndex="-1"
                                ReadOnly="true"
                                runat="server" 
                                Text='<%# Bind("Costo_Transporte","{0:N4}") %>'
                                ToolTip='<%# GetLocalResourceObject("Costo_TransporteRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:Label ID="Label8" 
                                runat="server" 
                                Text='<%# Eval("Int_Moneda_Simbolo") %>'>
                            </asp:Label>
                        </td>
                    </tr>

                </table> 
            </asp:Panel>
            
            <div style="text-align:left">                
                <%--<asp:Button ID="EstadoButton" runat="server"  meta:resourcekey="Btn_Apu_Proyecto_EstadoRecursoKCG"/>--%>
                <asp:Button ID="RubrosButton" runat="server" meta:resourcekey="Btn_Apu_Proyecto_RubroRecursoKCG" OnClick="RubrosButton_Click"/>
                <asp:Button ID="btn_Apu_proyecto_listado_proyecto" runat="server" 
                            meta:ResourceKey="Btn_Apu_Proyecto_ListadoRecursoKCG" OnClick="btn_Apu_proyecto_listado_proyecto_Click">
                </asp:Button>
            </div>
            <asp:Panel ID="pnlInsumos" runat="server" meta:resourcekey="Rec_Apu_Proyecto_PrecioRecursoKCG">
                <div style="text-align:left">
                    <asp:Button ID="EquiposButton" runat="server" meta:resourcekey="Btn_Apu_Proyecto_EquipoRecursoKCG" OnClick="btn_EquiposButton_Click"/> 
                    <asp:Button ID="btn_Categorias" runat="server"  meta:resourcekey="Btn_Apu_Proyecto_CategoriasRecursoKCG" OnClick="btn_Categorias_Click"/> 
                    <asp:Button ID="ManoObraButton" runat="server"  meta:resourcekey="Btn_Apu_Proyecto_Mano_ObraRecursoKCG" OnClick="btn_ManoObraButton_Click"/>
                    <asp:Button ID="MaterialTransporteButton" runat="server"  meta:resourcekey="Btn_Apu_Proyecto_MaterialRecursoKCG" OnClick="btn_MaterialTransporteButton_Click"/>                  
                </div>
            </asp:Panel>
            
            
            <%--IDs--%>
            <asp:TextBox Style="display:none"
                ID="Coordinador_Per_Personal_Id"
                runat="server" 
                Text='<%# Bind("Coordinador_Per_Personal_Id") %>'>
            </asp:TextBox>
            <asp:TextBox Style="display:none"
                ID="Tecnico_Per_Personal_Id" 
                runat="server" 
                Text='<%# Bind("Tecnico_Per_Personal_Id") %>'>
            </asp:TextBox>
            <asp:TextBox Style="display:none"
                ID="Int_Sucursal_Id" 
                runat="server" 
                Text='<%# Bind("Int_Sucursal_Id") %>'>
            </asp:TextBox>
            <asp:TextBox Style="display:none"
                ID="Int_Moneda_Id" 
                runat="server" 
                Text='<%# Bind("Int_Moneda_Id") %>'>
            </asp:TextBox>
            <asp:TextBox Style="display:none"
                ID="Creacion_Per_Personal_Id" 
                runat="server" 
                Text='<%# Bind("Creacion_Per_Personal_Id") %>'>
            </asp:TextBox>
            <asp:TextBox Style="display:none"
                ID="Update_Per_Personal_Id" 
                runat="server" 
                Text='<%# Bind("Update_Per_Personal_Id") %>'>
            </asp:TextBox>
            <asp:TextBox Style="display:none"
                ID="Apu_Lugar_Id" 
                runat="server" 
                Text='<%# Bind("Apu_Lugar_Id") %>'>
            </asp:TextBox>
            <asp:TextBox Style="display:none"
                ID="Apu_provincia_id" 
                runat="server" 
                Text='<%# Bind("Apu_provincia_id") %>'>
            </asp:TextBox>
            <asp:TextBox Style="display:none"
                ID="Int_Empresa_Id" 
                runat="server" 
                Text='<%# Bind("Int_Empresa_Id") %>'>
            </asp:TextBox>
            <asp:TextBox Style="display:none"
                ID="Id" 
                runat="server" 
                Text='<%# Bind("Id") %>'>
            </asp:TextBox>
            <asp:TextBox Style="display:none"
                ID="Etapa" 
                runat="server" 
                Text='<%# Bind("Etapa") %>'>
            </asp:TextBox>
            
            <%--Campos ocultos--%>
            
            
            <asp:TextBox Visible="false"
                ID="Fecha_Update" 
                runat="server" 
                Text='<%# Bind("Fecha_Update") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false"
                ID="Apu_Lugar_Codigo" 
                runat="server" 
                Text='<%# Bind("Apu_Lugar_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false"
                ID="Apu_Provincia_Codigo" 
                runat="server" 
                Text='<%# Bind("Apu_Provincia_Codigo") %>'>
            </asp:TextBox> 
            <asp:TextBox Visible="false"
                ID="Int_Sucursal_Codigo" 
                runat="server" 
                Text='<%# Bind("Int_Sucursal_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false"
                ID="Int_Sucursal_Nombre" 
                runat="server" 
                Text='<%# Bind("Int_Sucursal_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false"
                ID="Int_Empresa_Codigo" 
                runat="server" 
                Text='<%# Bind("Int_Empresa_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false"
                ID="Int_Empresa_Nombre" 
                runat="server" 
                Text='<%# Bind("Int_Empresa_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false"
                ID="Creacion_Per_Personal_Codigo" 
                runat="server" 
                Text='<%# Bind("Creacion_Per_Personal_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false"
                ID="Creacion_Per_Personal_Nombre" 
                runat="server" 
                Text='<%# Bind("Creacion_Per_Personal_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false"
                ID="Update_Per_Personal_Codigo" 
                runat="server" 
                Text='<%# Bind("Update_Per_Personal_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false"
                ID="Update_Per_Personal_Nombre" 
                runat="server" 
                Text='<%# Bind("Update_Per_Personal_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false"
                ID="Coordinador_Per_Personal_Codigo" 
                runat="server" 
                Text='<%# Bind("Coordinador_Per_Personal_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false"
                ID="Tecnico_Per_Personal_Codigo" 
                runat="server" 
                Text='<%# Bind("Tecnico_Per_Personal_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false"
                ID="Int_Moneda_Codigo" 
                runat="server" 
                Text='<%# Bind("Int_Moneda_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false"
                ID="Int_Moneda_Nombre" 
                runat="server" 
                Text='<%# Bind("Int_Moneda_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false"
                ID="Int_Moneda_Simbolo" 
                runat="server" 
                Text='<%# Bind("Int_Moneda_Simbolo") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false"
                ID="Costo_Indirecto_Otros" 
                runat="server" 
                Text='<%# Bind("Costo_Indirecto_Otros") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false"
                ID="Porcentaje_Costo_Indirecto_Otros" 
                runat="server" 
                Text='<%# Bind("Porcentaje_Costo_Indirecto_Otros") %>'>
            </asp:TextBox>
            <%--<asp:TextBox Visible="false"
                ID="Indice_Sumatora" 
                runat="server" 
                Text='<%# Bind("Indice_Sumatora") %>'>
            </asp:TextBox>--%>
           <%-- <asp:TextBox Visible="false"
                ID="Coeficiente_Sumatora" 
                runat="server" 
                Text='<%# Bind("Coeficiente_Sumatora") %>'>
            </asp:TextBox>--%>
            <asp:TextBox Visible="false"
                ID="Cuadrilla_Sumatoria" 
                runat="server" 
                Text='<%# Bind("Cuadrilla_Sumatoria") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false"
                ID="Cuadrilla_Coeficiente_Sumatoria" 
                runat="server" 
                Text='<%# Bind("Cuadrilla_Coeficiente_Sumatoria") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false"
                ID="Suma_Porcentaje_Indice_Transporte" 
                runat="server" 
                Text='<%# Bind("Suma_Porcentaje_Indice_Transporte") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false"
                ID="Indice_Sumatoria" 
                runat="server" 
                Text='<%# Bind("Indice_Sumatoria") %>'>
            </asp:TextBox>
            <asp:TextBox Style="display:none"
                ID="Coeficiente_Sumatoria" 
                runat="server" 
                Text='<%# Bind("Coeficiente_Sumatoria") %>'>
            </asp:TextBox>
            <asp:TextBox 
                ID="Estado" 
                runat="server" 
                Style="display:none"
                Text='<%# Bind("Estado") %>'>
            </asp:TextBox>   
            <asp:TextBox 
                ID="Apu_Presupuesto_Estado" 
                runat="server" 
                Style="display:none"
                Text='<%# Bind("Apu_Presupuesto_Estado") %>'>
            </asp:TextBox>   
            <asp:TextBox 
                ID="Coordinador_Per_Personal_Nombre"    
                runat="server"                                                             
                Visible="false"
                Text='<%# Bind("Coordinador_Per_Personal_Nombre") %>'>
            </asp:TextBox>
        </ItemTemplate>
    </asp:FormView>
    <table>
        <tr>
            <td>
                <asp:Panel
                    ID="pnl_Formulas_Polinomicas"
                    runat="server"
                    GroupingText="-">
                    <table>
                        <tr>
                            <td>
                                <asp:Button 
                                    ID="btn_Formula_Polinomica" 
                                    runat="server" 
                                    meta:resourcekey="Btn_Apu_Proyecto_FormulaRecursoKCG"
                                    OnClick="btn_Formula_Polinomica_Click"/>
                            </td>
                            <td>
                                <asp:Button 
                                    ID="btn_Cuadrilla" 
                                    runat="server" 
                                    meta:resourcekey="Btn_Apu_Proyecto_CuadrillaRecursoKCG"
                                    OnClick="btn_Cuadrilla_Click"/>
                            </td> 
                            <td>                
                                <asp:UpdatePanel 
                                    ID="opopop"
                                    runat="server">
                                    <ContentTemplate>                            
                                    <koala:KEstado 
                                        ID="Estado" 
                                        Runat="Server" 
                                        ObjetoNombre="APU_PROYECTO"
                                        CampoNombre="Estado" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>                                                   
                            </td>
                            <td>
                                <asp:Button 
                                    ID="btn_Actualizar_Costos" 
                                    runat="server" 
                                    meta:resourcekey="Btn_Actualizar_CostosRecursoKCG"
                                    OnClick="btn_Actualizar_Costos_Click"/>
                            </td>  
                            <td>
                                <asp:Button
                                    ID="btn_Transpasar"
                                    runat="server"
                                    OnClick="btn_Transpasar_Click"
                                    meta:resourcekey="Btn_Transpasar_OfertaRecursoKCG"/>
                            </td>         
                            <td>
                                <asp:TextBox 
                                    ID="txt_Tras_Id" 
                                    runat="server"
                                    style="display:none">
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="txt_Traspasar" 
                                    runat="server"
                                    Width="80px"
                                    CssClass="TEXTO_EDICION_KCG">
                                </asp:TextBox>
                                <AjaxControlToolkit:AutoCompleteExtender
                                    runat="server" 
                                    BehaviorID="AutoComEx_txtTras"
                                    ID="ace_txtTras" 
                                    TargetControlID="txt_Traspasar"
                                    ServicePath="~/APU/APU_PROYECTO.aspx" 
                                    ServiceMethod="Get_txtTras"
                                    MinimumPrefixLength="0" 
                                    CompletionInterval="500"
                                    EnableCaching="true"
                                    CompletionSetCount="500"
                                    CompletionListCssClass="autocomplete_completionListElement" 
                                    CompletionListItemCssClass="autocomplete_listItem" 
                                    CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                    OnClientItemSelected="ItemSelected_txtTras" >
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
                                                    var behavior = $find('AutoComEx_txtTras');
                                                    if (!behavior._height) {
                                                        var target = behavior.get_completionList();
                                                        behavior._height = target.offsetHeight - 2;
                                                        target.style.height = '0px';
                                                    }" />                                                    
                                                <%-- Expand from 0px to the appropriate size while fading in --%>
                                                <Parallel Duration=".4">
                                                    <FadeIn />
                                                    <Length PropertyKey="height" StartValue="0" EndValueScript="$find('AutoComEx_txtTras')._height" />
                                                </Parallel>
                                            </Sequence>
                                        </OnShow>
                                        <OnHide>
                                            <%-- Collapse down to 0px and fade out --%>
                                            <Parallel Duration=".4">
                                                <FadeOut />
                                                <Length PropertyKey="height" StartValueScript="$find('AutoComEx_txtTras')._height" EndValue="0" />
                                            </Parallel>
                                        </OnHide>
                                    </Animations>
                                </AjaxControlToolkit:AutoCompleteExtender>  
                            </td>                            
                        </tr>
                    </table>                
                </asp:Panel>
            </td>            
        </tr>
    </table>        
    
        </ContentTemplate>
    </asp:UpdatePanel>
    
    <asp:ObjectDataSource ID="odsApuProyecto" 
        runat="server" 
        ConflictDetection="CompareAllValues"
        DeleteMethod="Delete" 
        InsertMethod="Insert" 
        OldValuesParameterFormatString="original{0}"
        SelectMethod="GetByIdResumido" 
        SortParameterName="sortExpression" 
        TypeName="FEL.APU.BO_Apu_Proyecto"
        UpdateMethod="Update">
        <SelectParameters>
            <asp:SessionParameter Name="s" 
                SessionField="Scope" 
                Type="Object" />
            <asp:ControlParameter
                    ControlID="txtApu_Proyecto_Id" 
                    Name="Id" 
                    PropertyName="Text" 
                    Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    
</asp:Content>

