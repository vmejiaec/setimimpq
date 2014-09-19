<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="APU_MANO_OBRA.aspx.cs" 
    StylesheetTheme="EstiloKCG"
    Theme="EstiloKCG"
    Inherits="APU_APU_MANO_OBRA" 
    meta:resourcekey="Tit_Apu_Mano_ObraRecursoKCG" %>

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
            <asp:Panel
                runat="server"
                ID="pnlfvApuManoObra"
                meta:resourcekey="Rec_Apu_Mano_ObraRecursoKCG">
                <script type="text/javascript">
                                       
                    Sys.Application.add_load(page_load);
                    Sys.Application.add_unload(page_unload);
                    
                    var Costo_Diario = null;
                    
                    function page_load(sender, e)
                    {
                        Costo_Diario = $get("ctl00_ContentPlaceHolder1_fvApuManoObra_Costo_Diario");                                                                            
                        $addHandler(Costo_Diario, "change", datos_onchange);    
                        
                    }
                    
                    function page_unload(sender, e)
                    {
                        $removeHandler(Costo_Diario, "change", datos_onchange);                                   
                    }
                    
                    function datos_onchange(sender, e)
                    {
                        Calculo();
                    }                                 
                    
                    function Calculo()
                    {
                        var division = 0.00;  
                        var numCosto_Diario = Number.parseLocale(Costo_Diario.value);                                                                       
                        var Costo_Hora = $get("ctl00_ContentPlaceHolder1_fvApuManoObra_Costo_Hora");  
                        
                        if(isNaN(numCosto_Diario))
                            numCosto_Diario = 0.00;                                               
                                                                       
                        division = numCosto_Diario / 8;                                                                                                                                      
                        Costo_Hora.value = division.localeFormat("N4");                                                                     
                    }        
                    
                    function ItemSelected_ApuCateNom( source, eventArgs ) 
                        {
                            var valor = eventArgs.get_value();
                            var temp = new Array();
                            temp = valor.split('||');

                            var Apu_Categoria_Id = $get("ctl00_ContentPlaceHolder1_fvApuManoObra_Apu_Categoria_Id");
                            Apu_Categoria_Id.value = temp[0];
                            var Apu_Categoria_Codigo = $get("ctl00_ContentPlaceHolder1_fvApuManoObra_Apu_Categoria_Codigo");
                            Apu_Categoria_Codigo.value = temp[1];
                            var Costo_Diario = $get("ctl00_ContentPlaceHolder1_fvApuManoObra_Costo_Diario");
                            Costo_Diario.value = temp[2];
                            var Costo_Hora = $get("ctl00_ContentPlaceHolder1_fvApuManoObra_Costo_Hora");
                            Costo_Hora.value = temp[3];                                                         
                        }
                                            
                </script>  
                <input 
                    type="submit" 
                    style="display:none;" />
                <asp:FormView 
                    ID="fvApuManoObra" 
                    runat="server" 
                    DataSourceID="odsFvApuManoObra" 
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
                                        Text='<%# Bind("Estado_Nombre") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'
                                        ID="lblCodigo"                                   
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Codigo"                                         
                                        runat="server"
                                        TabIndex="-1"
                                        Tooltip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'                                        
                                        ReadOnly="true"                                       
                                        Text='<%# Bind("Codigo") %>'>
                                    </asp:TextBox>
                                </td>                                                                                           
                                <td
                                    colspan="2">
                                    <asp:Label                                        
                                        Text='<%# GetLocalResourceObject("DisponibleRecursoKCG.Text").ToString() %>'
                                        ID="lblDisponibilidad"                                    
                                        runat="server">
                                    </asp:Label>                         
                                    <asp:DropDownList 
                                        ID="Disponible" 
                                        runat="server" 
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("DisponibleRecursoKCG.ToolTip").ToString() %>'                               
                                        CssClass="TEXTO_EDICION_KCG"
                                        DataSourceID="odsDisponible"
                                        DataTextField="Nombre" 
                                        DataValueField="Dic_Dominio_Dominio"
                                        SelectedValue='<%# Bind("Disponible") %>'>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource 
                                        ID="odsDisponible" 
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
                                                Name="s" 
                                                SessionField="Scope" 
                                                Type="Object" />
                                            <asp:Parameter 
                                                DefaultValue="APU_MANO_OBRA" 
                                                Name="Dic_Objeto_Nombre" 
                                                Type="String" />
                                            <asp:Parameter 
                                                DefaultValue="DISPONIBLE" 
                                                Name="Dic_Campo_Nombre" 
                                                Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>    
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'
                                        ID="lblNombre"                                                                 
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td
                                    colspan="3">
                                    <asp:TextBox 
                                        ID="Nombre" 
                                        runat="server" 
                                        ToolTip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>'
                                        Style="text-transform:uppercase"
                                        Height="50px"
                                        TextMode="MultiLine"  
                                        Width="400px"
                                        CssClass="TEXTO_EDICION_KCG"
                                        Text='<%# Bind("Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        runat="server" 
                                        ID="UsuarioReq"
                                        ControlToValidate="Nombre"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="UsuarioReqE"
                                        TargetControlID="UsuarioReq" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        Text='<%# GetLocalResourceObject("Apu_Categoria_CodigoRecursoKCG.Text").ToString() %>'
                                        ID="lblCategoria"                                                                 
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td
                                    style="white-space:nowrap">
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
                                        ToolTip='<%# GetLocalResourceObject("Apu_Categoria_NombreRecursoKCG.ToolTip").ToString() %>'
                                        CssClass="TEXTO_COMBOPER_KCG"
                                        Text='<%# Bind("Apu_Categoria_Nombre") %>'>
                                    </asp:TextBox>                                                                       
                                    <AjaxControlToolkit:AutoCompleteExtender
                                        runat="server" 
                                        BehaviorID="AutoComp_ApuCateNom"
                                        ID="ace_ApuCateNom" 
                                        TargetControlID="Apu_Categoria_Nombre"
                                        ServicePath="~/APU/APU_MANO_OBRA.aspx" 
                                        ServiceMethod="Get_ApuCateNom"
                                        MinimumPrefixLength="0" 
                                        CompletionInterval="500"
                                        EnableCaching="true"
                                        CompletionSetCount="500"
                                        CompletionListCssClass="autocomplete_completionListElement" 
                                        CompletionListItemCssClass="autocomplete_listItem" 
                                        CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                        OnClientItemSelected="ItemSelected_ApuCateNom">
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
                                                        var behavior = $find('AutoComp_ApuCateNom');
                                                        if (!behavior._height) {
                                                            var target = behavior.get_completionList();
                                                            behavior._height = target.offsetHeight - 2;
                                                            target.style.height = '0px';
                                                        }" />
                                                    
                                                    <%-- Expand from 0px to the appropriate size while fading in --%>
                                                    <Parallel Duration=".4">
                                                        <FadeIn />
                                                        <Length PropertyKey="height" StartValue="0" EndValueScript="$find('AutoComp_ApuCateNom')._height" />
                                                    </Parallel>
                                                </Sequence>
                                            </OnShow>
                                            <OnHide>
                                                <%-- Collapse down to 0px and fade out --%>
                                                <Parallel Duration=".4">
                                                    <FadeOut />
                                                    <Length PropertyKey="height" StartValueScript="$find('AutoComp_ApuCateNom')._height" EndValue="0" />
                                                </Parallel>
                                            </OnHide>
                                        </Animations>
                                    </AjaxControlToolkit:AutoCompleteExtender>                                                                    
                                    <asp:Button 
                                        ID="btnZoom" 
                                        runat="server" 
                                        CommandArgument="RutaDestino: ~/APU/APU_CATEGORIA.aspx; Filtro: Apu_Categoria_Codigo|Apu_Categoria_Nombre; Obtener: Costo_Diario|Costo_Diario, Costo_Hora|Costo_Hora;"
                                        CommandName="Zoom" 
                                        Text="..." />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        Text='<%# GetLocalResourceObject("Costo_DiarioRecursoKCG.Text").ToString() %>'
                                        ID="lblJornal_Diario"                                                                 
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td
                                    colspan="3">
                                    <asp:TextBox 
                                        ID="Costo_Diario" 
                                        runat="server"   
                                        CssClass="TEXTO_EDICION_KCG"                                                                                    
                                        Style="text-align:right"   
                                        ToolTip='<%# GetLocalResourceObject("Costo_DiarioRecursoKCG.ToolTip").ToString() %>'                      
                                        Text='<%# Bind("Costo_Diario") %>'>
                                    </asp:TextBox>                                    
                                    <AjaxControlToolkit:MaskedEditExtender 
                                        ID="acostoparcial" 
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
				                        ID="MaskedEditValidator1" 
				                        runat="server"
                                        ControlExtender="acostoparcial"
                                        ControlToValidate="Costo_Diario"
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
                                        ID="ValidatorCalloutExtender2"
                                        TargetControlID="MaskedEditValidator1"/>
                                    <asp:Label
                                        Text='<%# Bind("Int_Moneda_Simbolo") %>'
                                        ID="lblInt_Moneda_Simbolo" 
                                        runat="server">
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        Text='<%# GetLocalResourceObject("Costo_HoraRecursoKCG.Text").ToString() %>'
                                        ID="lblJornal_Hora"                                                                 
                                        runat="server">
                                    </asp:Label>                                
                                </td>
                                <td
                                    style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Costo_Hora" 
                                        runat="server"       
                                        CssClass="TEXTO_EDICION_KCG"                                                                          
                                        Style="text-align:right"       
                                        ToolTip='<%# GetLocalResourceObject("Costo_HoraRecursoKCG.ToolTip").ToString() %>'                                                                    
                                        Text='<%# Bind("Costo_Hora") %>'>
                                    </asp:TextBox>                                      
                                    <AjaxControlToolkit:MaskedEditExtender 
                                        ID="meeCostoHora" 
                                        runat="server"
                                        TargetControlID="Costo_Hora"
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
                                    <asp:Label
                                        Text='<%# Bind("Int_Moneda_Simbolo") %>'
                                        ID="lblInt_Moneda_Simbolo1" 
                                        runat="server">
                                    </asp:Label>                                                                                             
                                </td>                                             
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        Text='<%# GetLocalResourceObject("Update_Per_Personal_NombreRecursoKCG.Text").ToString() %>'
                                        ID="lblUltima_Actualizacion"                                                                 
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td
                                    colspan="3">
                                    <asp:TextBox 
                                        ID="Update_Per_Personal_Nombre" 
                                        runat="server" 
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Update_Per_Personal_NombreRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        Text='<%# Bind("Update_Per_Personal_Nombre") %>'>
                                    </asp:TextBox>                                
                                    <asp:Label  
                                        Text='<%# GetLocalResourceObject("Fecha_UpdateRecursoKCG.Text").ToString() %>'
                                        ID="lblFecha"                                                                 
                                        runat="server">
                                    </asp:Label>                                
                                    <asp:TextBox 
                                        ID="Fecha_Update" 
                                        runat="server" 
                                        tabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Fecha_UpdateRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        Text='<%# Bind("Fecha_Update") %>'>
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
                            ID="Int_Sucursal_Id" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Int_Sucursal_Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Update_Per_Personal_Id" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Update_Per_Personal_Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Id" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Apu_Categoria_Id" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Apu_Categoria_Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_Empresa_Id" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Int_Empresa_Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_Moneda_Id" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Int_Moneda_Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Creacion_Per_Personal_Id" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Creacion_Per_Personal_Id") %>'>
                        </asp:TextBox>
                        
                        <%--Oculto--%>
                        
                        <asp:TextBox 
                            ID="Creacion_Per_Personal_Codigo" 
                            runat="server"                             
                            Visible="false"
                            Text='<%# Bind("Creacion_Per_Personal_Codigo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Disponible_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Disponible_Nombre") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Update_Per_Personal_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Update_Per_Personal_Codigo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_Empresa_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_Empresa_Nombre") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Fecha_Creacion" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Fecha_Creacion") %>'>
                        </asp:TextBox>                    
                        
                        <asp:TextBox 
                            ID="Int_Sucursal_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_Sucursal_Nombre") %>'>
                        </asp:TextBox>

                        <asp:TextBox 
                            ID="Creacion_Per_Personal_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Creacion_Per_Personal_Nombre") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_Moneda_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_Moneda_Codigo") %>'>
                        </asp:TextBox>               
                        
                        <asp:TextBox 
                            ID="Estado" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Estado") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_Sucursal_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_Sucursal_Codigo") %>'>
                        </asp:TextBox>               
                        
                        <asp:TextBox 
                            ID="Int_Moneda_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_Moneda_Nombre") %>'>
                        </asp:TextBox>        
                        
                        <asp:TextBox 
                            ID="Int_Empresa_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_Empresa_Codigo") %>'>
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
                                        Text='<%# Bind("Estado_Nombre") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'
                                        ID="lblCodigo" 
                                        Visible="false"                                           
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Codigo"                                         
                                        runat="server"
                                        Tooltip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'                                         
                                        ReadOnly="true"
                                        Visible="false"                                        
                                        Text='<%# Bind("Codigo") %>'>
                                    </asp:TextBox>
                                </td>                                 
                                <td
                                    colspan="2">
                                    <asp:Label                                        
                                        Text='<%# GetLocalResourceObject("DisponibleRecursoKCG.Text").ToString() %>'
                                        ID="lblDisponibilidad"                                    
                                        runat="server">
                                    </asp:Label>                         
                                    <asp:DropDownList 
                                        ID="Disponible" 
                                        runat="server" 
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("DisponibleRecursoKCG.ToolTip").ToString() %>'                               
                                        CssClass="TEXTO_EDICION_KCG"
                                        DataSourceID="odsDisponible"
                                        DataTextField="Nombre"                                         
                                        DataValueField="Dic_Dominio_Dominio"
                                        SelectedValue='<%# Bind("Disponible") %>'
                                        OnDataBound="Disponible_DataBound">
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource 
                                        ID="odsDisponible" 
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
                                                Name="s" 
                                                SessionField="Scope" 
                                                Type="Object" />
                                            <asp:Parameter 
                                                DefaultValue="APU_MANO_OBRA" 
                                                Name="Dic_Objeto_Nombre" 
                                                Type="String" />
                                            <asp:Parameter 
                                                DefaultValue="DISPONIBLE" 
                                                Name="Dic_Campo_Nombre" 
                                                Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>                     
                            <tr>
                                <td>
                                    <asp:Label 
                                        Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'
                                        ID="lblNombre"                                                                 
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td
                                    colspan="3">
                                    <asp:TextBox 
                                        ID="Nombre" 
                                        runat="server" 
                                        ToolTip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>'
                                        CssClass="TEXTO_EDICION_KCG"
                                        Height="50px"
                                        TextMode="MultiLine"  
                                        Width="400px"
                                        Style="text-transform:uppercase"
                                        Text='<%# Bind("Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        runat="server" 
                                        ID="UsuarioReq"
                                        ControlToValidate="Nombre"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                        <AjaxControlToolkit:ValidatorCalloutExtender 
                                            runat="Server" 
                                            ID="UsuarioReqE"
                                            TargetControlID="UsuarioReq" />                        
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        Text='<%# GetLocalResourceObject("Apu_Categoria_CodigoRecursoKCG.Text").ToString() %>'
                                        ID="lblCategoria"                                                                 
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td
                                    style="white-space:nowrap">
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
                                        ToolTip='<%# GetLocalResourceObject("Apu_Categoria_NombreRecursoKCG.ToolTip").ToString() %>'
                                        CssClass="TEXTO_COMBOPER_KCG"
                                        Text='<%# Bind("Apu_Categoria_Nombre") %>'>
                                    </asp:TextBox>                                                                       
                                    <AjaxControlToolkit:AutoCompleteExtender
                                        runat="server" 
                                        BehaviorID="AutoComp_ApuCateNom"
                                        ID="ace_ApuCateNom" 
                                        TargetControlID="Apu_Categoria_Nombre"
                                        ServicePath="~/APU/APU_MANO_OBRA.aspx" 
                                        ServiceMethod="Get_ApuCateNom"
                                        MinimumPrefixLength="0" 
                                        CompletionInterval="500"
                                        EnableCaching="true"
                                        CompletionSetCount="500"
                                        CompletionListCssClass="autocomplete_completionListElement" 
                                        CompletionListItemCssClass="autocomplete_listItem" 
                                        CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                        OnClientItemSelected="ItemSelected_ApuCateNom">
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
                                                        var behavior = $find('AutoComp_ApuCateNom');
                                                        if (!behavior._height) {
                                                            var target = behavior.get_completionList();
                                                            behavior._height = target.offsetHeight - 2;
                                                            target.style.height = '0px';
                                                        }" />
                                                    
                                                    <%-- Expand from 0px to the appropriate size while fading in --%>
                                                    <Parallel Duration=".4">
                                                        <FadeIn />
                                                        <Length PropertyKey="height" StartValue="0" EndValueScript="$find('AutoComp_ApuCateNom')._height" />
                                                    </Parallel>
                                                </Sequence>
                                            </OnShow>
                                            <OnHide>
                                                <%-- Collapse down to 0px and fade out --%>
                                                <Parallel Duration=".4">
                                                    <FadeOut />
                                                    <Length PropertyKey="height" StartValueScript="$find('AutoComp_ApuCateNom')._height" EndValue="0" />
                                                </Parallel>
                                            </OnHide>
                                        </Animations>
                                    </AjaxControlToolkit:AutoCompleteExtender>
                                    <asp:Button 
                                        ID="btnZoom" 
                                        runat="server" 
                                        CommandArgument="RutaDestino: ~/APU/APU_CATEGORIA.aspx; Filtro: Apu_Categoria_Codigo|Apu_Categoria_Nombre; Obtener: Costo_Diario|Costo_Diario, Costo_Hora|Costo_Hora;"
                                        CommandName="Zoom"                                  
                                        Text="..." />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        Text='<%# GetLocalResourceObject("Costo_DiarioRecursoKCG.Text").ToString() %>'
                                        ID="lblJornal_Diario"                                                                 
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td
                                    colspan="3">
                                    <asp:TextBox 
                                        ID="Costo_Diario" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG" 
                                        Style="text-align:right"       
                                        ToolTip='<%# GetLocalResourceObject("Costo_DiarioRecursoKCG.ToolTip").ToString() %>'                                 
                                        Text='<%# Bind("Costo_Diario") %>'>
                                    </asp:TextBox>
                                    <AjaxControlToolkit:MaskedEditExtender 
                                        ID="acostoparcial" 
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
				                        ID="MaskedEditValidator1" 
				                        runat="server"
                                        ControlExtender="acostoparcial"
                                        ControlToValidate="Costo_Diario"
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
                                        ID="ValidatorCalloutExtender2"
                                        TargetControlID="MaskedEditValidator1"/>       
                                </td>                                
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        Text='<%# GetLocalResourceObject("Costo_HoraRecursoKCG.Text").ToString() %>'
                                        ID="lblJornal_Hora"                                                                 
                                        runat="server">
                                    </asp:Label>                                
                                </td>
                                <td
                                    colspan="2">
                                    <asp:TextBox 
                                        ID="Costo_Hora" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG" 
                                        Style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("Costo_HoraRecursoKCG.ToolTip").ToString() %>'                                        
                                        Text='<%# Bind("Costo_Hora") %>'>
                                    </asp:TextBox>   
                                    <AjaxControlToolkit:MaskedEditExtender 
                                        ID="meeCostoHora" 
                                        runat="server"
                                        TargetControlID="Costo_Hora"
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
                                </td>                                                                                                
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        Text='<%# GetLocalResourceObject("Update_Per_Personal_NombreRecursoKCG.Text").ToString() %>'
                                        ID="lblUltima_Actualizacion"                                                                                                                                 
                                        runat="server">
                                    </asp:Label>    
                                </td>                    
                                <td
                                    colspan="3">        
                                    <asp:TextBox 
                                        ID="Update_Per_Personal_Nombre" 
                                        runat="server" 
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Update_Per_Personal_NombreRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        Text='<%# Bind("Update_Per_Personal_Nombre") %>'>
                                    </asp:TextBox>                          
                                    <asp:Label  
                                        Text='<%# GetLocalResourceObject("Fecha_UpdateRecursoKCG.Text").ToString() %>'
                                        ID="lblFecha"                                                                 
                                        runat="server">
                                    </asp:Label>                                                                                                      
                                    <asp:TextBox 
                                        ID="Fecha_Update" 
                                        runat="server" 
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Fecha_UpdateRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        Text='<%# Bind("Fecha_Update") %>'>
                                    </asp:TextBox>                                    
                                </td>                        
                            </tr>
                            <tr>
                                <td colspan="2" align="left">
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
                            ID="Int_Sucursal_Id" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Int_Sucursal_Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Update_Per_Personal_Id" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Update_Per_Personal_Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Id" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Apu_Categoria_Id" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Apu_Categoria_Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_Empresa_Id" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Int_Empresa_Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_Moneda_Id" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Int_Moneda_Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Creacion_Per_Personal_Id" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Creacion_Per_Personal_Id") %>'>
                        </asp:TextBox>
                        
                        <%--Oculto--%>
                        
                        <asp:TextBox 
                            ID="Creacion_Per_Personal_Codigo" 
                            runat="server"                             
                            Visible="false"
                            Text='<%# Bind("Creacion_Per_Personal_Codigo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Disponible_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Disponible_Nombre") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Update_Per_Personal_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Update_Per_Personal_Codigo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_Empresa_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_Empresa_Nombre") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Fecha_Creacion" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Fecha_Creacion") %>'>
                        </asp:TextBox>                    
                        
                        <asp:TextBox 
                            ID="Int_Sucursal_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_Sucursal_Nombre") %>'>
                        </asp:TextBox>

                        <asp:TextBox 
                            ID="Creacion_Per_Personal_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Creacion_Per_Personal_Nombre") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_Moneda_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_Moneda_Codigo") %>'>
                        </asp:TextBox>               
                        
                        <asp:TextBox 
                            ID="Estado" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Estado") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_Sucursal_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_Sucursal_Codigo") %>'>
                        </asp:TextBox>               
                        
                        <asp:TextBox 
                            ID="Int_Moneda_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_Moneda_Nombre") %>'>
                        </asp:TextBox>        
                        
                        <asp:TextBox 
                            ID="Int_Empresa_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_Empresa_Codigo") %>'>
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
                                        Text='<%# Bind("Estado_Nombre") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'
                                        ID="lblCodigo"                                  
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Codigo"                                         
                                        runat="server"   
                                        TabIndex="-1"                                     
                                        Tooltip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'                                        
                                        ReadOnly="true"                                        
                                        Text='<%# Bind("Codigo") %>'>
                                    </asp:TextBox>
                                </td>                                                              
                                <td
                                    colspan="2">
                                    <asp:Label                                        
                                        Text='<%# GetLocalResourceObject("DisponibleRecursoKCG.Text").ToString() %>'
                                        ID="lblDisponibilidad"                                    
                                        runat="server">
                                    </asp:Label>            
                                    
                                                                                                                               
                                    <%--<asp:DropDownList 
                                        ID="Disponible" 
                                        runat="server" 
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("DisponibleRecursoKCG.ToolTip").ToString() %>'                                                                                                           
                                        DataSourceID="odsDisponible"
                                        DataTextField="Nombre" 
                                        DataValueField="Dic_Dominio_Dominio"
                                        SelectedValue='<%# Bind("Disponible") %>' 
                                        >
                                    </asp:DropDownList>--%>
                                    
                                    <asp:ObjectDataSource 
                                        ID="odsDisponible" 
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
                                                Name="s" 
                                                SessionField="Scope" 
                                                Type="Object" />
                                            <asp:Parameter 
                                                DefaultValue="APU_MANO_OBRA" 
                                                Name="Dic_Objeto_Nombre" 
                                                Type="String" />
                                            <asp:Parameter 
                                                DefaultValue="DISPONIBLE" 
                                                Name="Dic_Campo_Nombre" 
                                                Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>    
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'
                                        ID="lblNombre"                                                                 
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td
                                    colspan="3">                                
                                    <asp:TextBox 
                                        ID="Nombre" 
                                        runat="server" 
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>'                                        
                                        ReadOnly="true"
                                        Height="50px"
                                        TextMode="MultiLine"  
                                        CssClass="TEXTO_LECTURA_KCG"
                                        Width="400px"
                                        Text='<%# Bind("Nombre") %>'>
                                    </asp:TextBox>                                    
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        Text='<%# GetLocalResourceObject("Apu_Categoria_CodigoRecursoKCG.Text").ToString() %>'
                                        ID="lblCategoria"                                                                 
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td
                                    style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Apu_Categoria_Codigo" 
                                        runat="server" 
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Categoria_CodigoRecursoKCG.ToolTip").ToString() %>'                                        
                                        ReadOnly="true"
                                        Text='<%# Bind("Apu_Categoria_Codigo") %>'>
                                    </asp:TextBox>                        
                                    <asp:TextBox 
                                        ID="Apu_Categoria_Nombre" 
                                        runat="server" 
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Categoria_NombreRecursoKCG.ToolTip").ToString() %>'                                        
                                        ReadOnly="true"
                                        Text='<%# Bind("Apu_Categoria_Nombre") %>'>
                                    </asp:TextBox>    
                                    <asp:Button 
                                        ID="btnZoom" 
                                        runat="server" 
                                        Enabled="false"
                                        CommandArgument="RutaDestino: ~/APU/APU_CATEGORIA.aspx; Filtro: Apu_Categoria_Codigo|Apu_Categoria_Nombre; Obtener: Costo_Diario|Costo_Diario, Costo_Hora|Costo_Hora;"
                                        CommandName="Zoom" 
                                        Text="..." />                                                          
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        Text='<%# GetLocalResourceObject("Costo_DiarioRecursoKCG.Text").ToString() %>'
                                        ID="lblJornal_Diario"                                                                 
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td
                                    colspan="2">
                                    <asp:TextBox 
                                        ID="Costo_Diario" 
                                        runat="server" 
                                        TabIndex="-1"                                                                                
                                        ReadOnly="true"
                                        style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("Costo_DiarioRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Costo_Diario","{0:N4}") %>'>
                                    </asp:TextBox>
                                    <asp:Label
                                        Text='<%# Bind("Int_Moneda_Simbolo") %>'
                                        ID="lblInt_Moneda_Simbolo" 
                                        runat="server">
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        Text='<%# GetLocalResourceObject("Costo_HoraRecursoKCG.Text").ToString() %>'
                                        ID="lblJornal_Hora"                                                                 
                                        runat="server">
                                    </asp:Label>                                
                                </td>
                                <td
                                    colspan="2">
                                    <asp:TextBox 
                                        ID="Costo_Hora" 
                                        runat="server" 
                                        TabIndex="-1"                                        
                                        ReadOnly="true"
                                        style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("Costo_HoraRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Costo_Hora","{0:N4}") %>'>
                                    </asp:TextBox>
                                    <asp:Label
                                        Text='<%# Bind("Int_Moneda_Simbolo") %>'
                                        ID="lblInt_Moneda_Simbolo1" 
                                        runat="server">
                                    </asp:Label>
                                </td>                             
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        Text='<%# GetLocalResourceObject("Update_Per_Personal_NombreRecursoKCG.Text").ToString() %>'
                                        ID="lblUltima_Actualizacion"                                         
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td
                                    colspan="3">
                                    <asp:TextBox 
                                        ID="Update_Per_Personal_Nombre" 
                                        runat="server" 
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Update_Per_Personal_NombreRecursoKCG.ToolTip").ToString() %>'                                        
                                        ReadOnly="true"
                                        Text='<%# Bind("Update_Per_Personal_Nombre") %>'>
                                    </asp:TextBox>                                
                                    <asp:Label  
                                        Text='<%# GetLocalResourceObject("Fecha_UpdateRecursoKCG.Text").ToString() %>'
                                        ID="lblFecha"                                                                 
                                        runat="server">
                                    </asp:Label>                                                           
                                    <asp:TextBox 
                                        ID="Fecha_Update" 
                                        runat="server" 
                                        TabIndex="-1"                                        
                                        ToolTip='<%# GetLocalResourceObject("Fecha_UpdateRecursoKCG.ToolTip").ToString() %>'                                        
                                        ReadOnly="true"
                                        Text='<%# Bind("Fecha_Update") %>'>
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
                                    <uc2:wucMensajeEliminar 
                                        ID="WucMensajeEliminar1" 
                                        runat="server" />                      
                                </td>
                            </tr>
                        </table>
                        
                        <%--Ids--%>
                        
                        <asp:TextBox    
                            ID="Int_Sucursal_Id" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Int_Sucursal_Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Update_Per_Personal_Id" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Update_Per_Personal_Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Id" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Apu_Categoria_Id" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Apu_Categoria_Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_Empresa_Id" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Int_Empresa_Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_Moneda_Id" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Int_Moneda_Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Creacion_Per_Personal_Id" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Creacion_Per_Personal_Id") %>'>
                        </asp:TextBox>
                        
                        <%--Oculto--%>
                        
                        <asp:TextBox 
                            ID="Creacion_Per_Personal_Codigo" 
                            runat="server"                             
                            Visible="false"
                            Text='<%# Bind("Creacion_Per_Personal_Codigo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Disponible_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Disponible_Nombre") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Update_Per_Personal_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Update_Per_Personal_Codigo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_Empresa_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_Empresa_Nombre") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Fecha_Creacion" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Fecha_Creacion") %>'>
                        </asp:TextBox>                    
                        
                        <asp:TextBox 
                            ID="Int_Sucursal_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_Sucursal_Nombre") %>'>
                        </asp:TextBox>

                        <asp:TextBox 
                            ID="Creacion_Per_Personal_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Creacion_Per_Personal_Nombre") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_Moneda_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_Moneda_Codigo") %>'>
                        </asp:TextBox>               
                        
                        <asp:TextBox 
                            ID="Estado" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Estado") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_Sucursal_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_Sucursal_Codigo") %>'>
                        </asp:TextBox>               
                        
                        <asp:TextBox 
                            ID="Int_Moneda_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_Moneda_Nombre") %>'>
                        </asp:TextBox>        
                        
                        <asp:TextBox 
                            ID="Int_Empresa_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_Empresa_Codigo") %>'>
                        </asp:TextBox>
                    </ItemTemplate>
                
                </asp:FormView>                
                <koala:KNavegacion 
                    ID="nav"
                    runat="server"
                    GridViewID="gvApuManoObra"
                    FormViewID="FormView1" 
                    OnNavegar="nav_Siguiente"/>                                                           
            </asp:Panel>            
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger 
                ControlID="gvApuManoObra" 
                EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>

    <asp:ObjectDataSource 
        ID="odsFvApuManoObra" 
        runat="server" 
        ConflictDetection="CompareAllValues"
        DeleteMethod="Delete" 
        InsertMethod="Insert" 
        OldValuesParameterFormatString="original{0}"
        SelectMethod="GetById" 
        SortParameterName="sortExpression" 
        TypeName="FEL.APU.BO_Apu_Mano_Obra"
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
                        Contenedor="APU_MANO_OBRA" 
                        Objeto="APU_MANO_OBRA" 
                        IndiceScope ="Scope"
                        Orden="1"
                        ObjectDataSourceID="odsGvApuManoObra"/>            
                </td>
                <td>
                    <asp:Button 
                        ID="Btn_Clonar" 
                        runat="server"
                        OnClick="Btn_Clonar_Click" />  
                </td>
                <td>                 
                    <asp:Button 
                        ID="Btn_Historico" 
                        runat="server" 
                        OnClick="Btn_Historico_Click"/>
                </td>
            </tr>
        </table>    
            <asp:Panel
                runat="server"
                ID="pnlgvApuManoObra"
                meta:resourcekey="Rec_Listado_Mano_ObraRecursoKCG">
                    
                <koala:KGrid 
                    ID="gvApuManoObra" 
                    runat="server" 
                    AllowPaging="True" 
                    AllowSorting="True"
                    AutoGenerateColumns="False" 
                    DataKeyNames="Id"
                    DataSourceID="odsGvApuManoObra"
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
                            DataField="Codigo" 
                            meta:resourcekey="BoundCodigoRecursoKCG" 
                            SortExpression="Codigo" >
                            <itemstyle horizontalalign="Right" /> 
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Nombre" 
                            meta:resourcekey="BoundNombreRecursoKCG"
                            SortExpression="Nombre" >
                            <headerstyle wrap="False" />
                            <itemstyle wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Apu_Categoria_Nombre" 
                            meta:resourcekey="BoundApu_Categoria_NombreRecursoKCG"
                            SortExpression="Apu_Categoria_Nombre" >
                            <itemstyle horizontalalign="Center" />
                        </asp:BoundField>  
                        <asp:BoundField 
                            DataField="Costo_Diario" 
                            meta:resourcekey="BoundCosto_DiarioRecursoKCG"
                            SortExpression="Costo_Diario" 
                            dataformatstring="{0:N4}" >
                            <itemstyle horizontalalign="Right" /> 
                         </asp:BoundField>
                        <asp:BoundField 
                            DataField="Costo_Hora" 
                            meta:resourcekey="BoundCosto_HoraRecursoKCG"
                            SortExpression="Costo_Hora"
                            dataformatstring="{0:N4}" >
                            <itemstyle horizontalalign="Right" /> 
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Fecha_Update" 
                            meta:resourcekey="BoundFecha_UpdateRecursoKCG" 
                            SortExpression="Fecha_Update" >
                            <headerstyle wrap="False" />
                            <itemstyle wrap="False" />
                        </asp:BoundField>                        
                        <asp:BoundField 
                            DataField="Int_Sucursal_Id" 
                            HeaderText="Int_Sucursal_Id" 
                            SortExpression="Int_Sucursal_Id" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Creacion_Per_Personal_Codigo" 
                            HeaderText="Creacion_Per_Personal_Codigo"
                            SortExpression="Creacion_Per_Personal_Codigo" 
                            Visible="False"/>                        
                        <asp:BoundField 
                            DataField="Disponible_Nombre" 
                            HeaderText="Disponible_Nombre" 
                            SortExpression="Disponible_Nombre" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Update_Per_Personal_Codigo" 
                            HeaderText="Update_Per_Personal_Codigo"
                            SortExpression="Update_Per_Personal_Codigo" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Disponible" 
                            HeaderText="Disponible" 
                            SortExpression="Disponible" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Int_Empresa_Nombre" 
                            HeaderText="Int_Empresa_Nombre" 
                            SortExpression="Int_Empresa_Nombre" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Fecha_Creacion" 
                            HeaderText="Fecha_Creacion" 
                            SortExpression="Fecha_Creacion" 
                            Visible="False"/>                        
                        <asp:BoundField 
                            DataField="Update_Per_Personal_Id" 
                            HeaderText="Update_Per_Personal_Id"
                            SortExpression="Update_Per_Personal_Id" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Update_Per_Personal_Nombre" 
                            HeaderText="Update_Per_Personal_Nombre"
                            SortExpression="Update_Per_Personal_Nombre" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Id" 
                            HeaderText="Id" 
                            SortExpression="Id" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Nombre" 
                            HeaderText="Nombre" 
                            SortExpression="Nombre" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Apu_Categoria_Codigo" 
                            HeaderText="Apu_Categoria_Codigo"
                            SortExpression="Apu_Categoria_Codigo" 
                            Visible="False"/>  
                        <asp:BoundField 
                            DataField="Estado_Nombre" 
                            HeaderText="Estado_Nombre" 
                            SortExpression="Estado_Nombre" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Int_Sucursal_Nombre" 
                            HeaderText="Int_Sucursal_Nombre"
                            SortExpression="Int_Sucursal_Nombre" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Creacion_Per_Personal_Nombre" 
                            HeaderText="Creacion_Per_Personal_Nombre"
                            SortExpression="Creacion_Per_Personal_Nombre" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Apu_Categoria_Nombre" 
                            HeaderText="Apu_Categoria_Nombre"
                            SortExpression="Apu_Categoria_Nombre" 
                            Visible="False"/>                            
                        <asp:BoundField 
                            DataField="Int_Moneda_Codigo" 
                            HeaderText="Int_Moneda_Codigo" 
                            SortExpression="Int_Moneda_Codigo" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Apu_Categoria_Id" 
                            HeaderText="Apu_Categoria_Id" 
                            SortExpression="Apu_Categoria_Id" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Estado" 
                            HeaderText="Estado" 
                            SortExpression="Estado" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Int_Sucursal_Codigo" 
                            HeaderText="Int_Sucursal_Codigo"
                            SortExpression="Int_Sucursal_Codigo" 
                            Visible="False"/>  
                        <asp:BoundField 
                            DataField="Int_Empresa_Id" 
                            HeaderText="Int_Empresa_Id" 
                            SortExpression="Int_Empresa_Id" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Int_Moneda_Id" 
                            HeaderText="Int_Moneda_Id" 
                            SortExpression="Int_Moneda_Id" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Int_Moneda_Nombre" 
                            HeaderText="Int_Moneda_Nombre" 
                            SortExpression="Int_Moneda_Nombre" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Creacion_Per_Personal_Id" 
                            HeaderText="Creacion_Per_Personal_Id"
                            SortExpression="Creacion_Per_Personal_Id" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Int_Empresa_Codigo" 
                            HeaderText="Int_Empresa_Codigo" 
                            SortExpression="Int_Empresa_Codigo" 
                            Visible="False"/>
                    </Columns>
                </koala:KGrid>            
            </asp:Panel>      
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:ObjectDataSource 
        ID="odsGvApuManoObra" 
        runat="server" 
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetBySucursal" 
        TypeName="FEL.APU.BO_Apu_Mano_Obra">
        <SelectParameters>
            <asp:SessionParameter 
                Name="s" 
                SessionField="Scope" 
                Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

