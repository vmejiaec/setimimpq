<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="APU_MATERIAL.aspx.cs" 
    StylesheetTheme="EstiloKCG"
    Theme="EstiloKCG"
    Inherits="APU_APU_MATERIAL" 
    meta:resourcekey="Tit_Apu_MaterialRecursoKCG" %>
    
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
        UpdateMode="Always">
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
        
            <asp:Panel
                runat="server"
                ID="Rec_Apu_Material"
                meta:resourcekey="Rec_Apu_MaterialRecursoKCG">
                
                <asp:FormView 
                    ID="fvApuMaterial" 
                    runat="server" 
                    DataSourceID="odsfvApuMaterial" 
                    DefaultMode="Insert">
                    
                    <EditItemTemplate>
                        <table>                           
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
                                    <asp:TextBox 
                                        ID="txt_p3" 
                                        Width="16px"
                                        TabIndex="-1"
                                        BorderColor="white"
                                        BorderStyle="Solid"
                                        ReadOnly="true"
                                        runat="server"
                                        Text="">
                                    </asp:TextBox>                                                                         
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("DisponibleRecursoKCG.Text").ToString() %>'
                                        ID="lblDisponoble"                                                                           
                                        runat="server">
                                    </asp:Label>                                
                                    <asp:DropDownList 
                                        ID="listaDisponoble" 
                                        runat="server" 
                                        TabIndex="-1"
                                        Width="155px"
                                        CssClass="TEXTO_EDICION_KCG"
                                        DataSourceID="odslistaDisponible" 
                                        Tooltip='<%# GetLocalResourceObject("DisponibleRecursoKCG.ToolTip").ToString() %>'
                                        DataTextField="Nombre" 
                                        DataValueField="Dic_Dominio_Dominio"
                                        SelectedValue='<%# Bind("Disponible") %>'>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource 
                                        ID="odslistaDisponible" 
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
                                                DefaultValue="APU_MATERIAL" 
                                                Name="Dic_Objeto_Nombre" 
                                                Type="String" />
                                            <asp:Parameter 
                                                DefaultValue="DISPONIBLE" 
                                                Name="Dic_Campo_Nombre" 
                                                Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </td>   
                                <td
                                    colspan="2"
                                    align="right">
                                    <asp:Label 
                                        ID="estado_nombre" 
                                        runat="server" 
                                        Text='<%# Bind("estado_nombre") %>'>
                                    </asp:Label>
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
                                <td>
                                    <asp:TextBox 
                                        ID="Nombre" 
                                        runat="server" 
                                        Tooltip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>'                                        
                                        Width="400px"
                                        Height="50px"
                                        TextMode ="MultiLine" 
                                        CssClass="TEXTO_EDICION_KCG"
                                        Style="text-transform:uppercase"
                                        Text='<%# Bind("Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        runat="server" 
                                        ID="NombreReq"
                                        ControlToValidate="Nombre"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="NombreReqE"
                                        TargetControlID="NombreReq" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("UnidadRecursoKCG.Text").ToString() %>'
                                        ID="lblUnidad"                                                                           
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Unidad" 
                                        runat="server" 
                                        Tooltip='<%# GetLocalResourceObject("UnidadRecursoKCG.ToolTip").ToString() %>'     
                                        CssClass="TEXTO_EDICION_KCG"
                                        Style="text-transform:uppercase"                                   
                                        Text='<%# Bind("Unidad") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        runat="server" 
                                        ID="UnidadReq"
                                        ControlToValidate="Unidad"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="UnidadReqE"
                                        TargetControlID="UnidadReq" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("Costo_ParcialRecursoKCG.Text").ToString() %>'
                                        ID="lblCostoParcial"                                                                           
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td
                                    colspan="3">
                                    <asp:TextBox 
                                        ID="Costo_Parcial" 
                                        runat="server" 
                                        Tooltip='<%# GetLocalResourceObject("Costo_ParcialRecursoKCG.ToolTip").ToString() %>'
                                        CssClass="TEXTO_EDICION_KCG"
                                        Style="text-align:right"
                                        Text='<%# Bind("Costo_Parcial") %>'>
                                    </asp:TextBox>
                                    <asp:Label        
                                        ID="lblIntMonedaSimbolo1" 
                                        runat="server"                                         
                                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                                    <AjaxControlToolkit:MaskedEditExtender 
                                        ID="fCostoParcial" 
                                        runat="server"
                                        TargetControlID="Costo_Parcial"
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
                                        ControlExtender="fCostoParcial"
                                        ControlToValidate="Costo_Parcial"
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
                                        TargetControlID="MaskedEditValidator1"/>  
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("Costo_OtrosRecursoKCG.Text").ToString() %>'
                                        ID="lblCostoOtros"                                                                           
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td
                                    colspan="3">
                                    <asp:TextBox 
                                        ID="Costo_Otros" 
                                        runat="server" 
                                        Tooltip='<%# GetLocalResourceObject("Costo_OtrosRecursoKCG.ToolTip").ToString() %>'
                                        CssClass="TEXTO_EDICION_KCG"
                                        Style="text-align:right"
                                        Text='<%# Bind("Costo_Otros") %>'>
                                    </asp:TextBox>
                                    <asp:Label        
                                        ID="lblIntMonedaSimbolo2" 
                                        runat="server"                                         
                                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                                    <AjaxControlToolkit:MaskedEditExtender 
                                        ID="forCostoOtros" 
                                        runat="server"
                                        TargetControlID="Costo_Otros"
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
                                        ID="MaskedEditValidator2" 
                                        runat="server"
                                        ControlExtender="forCostoOtros"
                                        ControlToValidate="Costo_Otros"
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
                                        ID="ValidatorCalloutExtender2"
                                        TargetControlID="MaskedEditValidator2"/>              
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.Text").ToString() %>'
                                        ID="lblCostoTotal"                                                                           
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td
                                    colspan="3">
                                    <asp:TextBox 
                                        ID="Costo_Total" 
                                        runat="server" 
                                        Tooltip='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        Style="text-align:right"
                                        TabIndex="-1"
                                        Text='<%# Bind("Costo_Total","{0:N4}") %>'>
                                    </asp:TextBox>
                                    <asp:Label        
                                        ID="lblIntModendaSimbolo3" 
                                        runat="server"                                         
                                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label> 
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("Costo_TransporteRecursoKCG.Text").ToString() %>'
                                        ID="lblContoTransporte"                                                                           
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td
                                    colspan="3">
                                    <asp:TextBox 
                                        ID="Costo_Transporte" 
                                        runat="server" 
                                        Tooltip='<%# GetLocalResourceObject("Costo_TransporteRecursoKCG.ToolTip").ToString() %>'
                                        CssClass="TEXTO_EDICION_KCG"
                                        Style="text-align:right"
                                        Text='<%# Bind("Costo_Transporte") %>'>
                                    </asp:TextBox>
                                    <asp:Label        
                                        ID="lblIntMonedaSimbolo4" 
                                        runat="server"                                         
                                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                                    <AjaxControlToolkit:MaskedEditExtender 
                                        ID="forCostoTransporte" 
                                        runat="server"
                                        TargetControlID="Costo_Transporte"
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
                                        ID="MaskedEditValidator4" 
                                        runat="server"
                                        ControlExtender="forCostoTransporte"
                                        ControlToValidate="Costo_Transporte"
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
                                        ID="ValidatorCalloutExtender4"
                                        TargetControlID="MaskedEditValidator4"/>          
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("Costo_total_costo_TransporteRecursoKCG.Text").ToString() %>'
                                        ID="lblCostoTotalCostoTransporte"                                                                           
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td
                                    colspan="3">
                                    <asp:TextBox 
                                        ID="Costo_Total_Costo_Transporte" 
                                        runat="server" 
                                        Tooltip='<%# GetLocalResourceObject("Costo_total_costo_TransporteRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Style="text-align:right"
                                        Text='<%# Bind("Costo_Total_Costo_Transporte","{0:N4}") %>'>
                                    </asp:TextBox>
                                    <asp:Label        
                                        ID="lblIntMonedaSimbolo5" 
                                        runat="server"                                         
                                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>                           
                                </td>                                
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("Update_Per_Personal_NombreRecursoKCG.Text").ToString() %>'
                                        ID="lblUltimaActualizacion"                                                                           
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td
                                    colspan="3">
                                    <asp:TextBox 
                                        ID="Update_Per_Personal_Nombre" 
                                        runat="server" 
                                        Tooltip='<%# GetLocalResourceObject("Update_Per_Personal_NombreRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Width="250px"
                                        Text='<%# Bind("Update_Per_Personal_Nombre") %>'>
                                    </asp:TextBox>                                
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("Update_FechaRecursoKCG.Text").ToString() %>'
                                        ID="lblFechaUpdate"                                                                           
                                        runat="server">
                                    </asp:Label>                               
                                    <asp:TextBox 
                                        ID="Fecha_Update" 
                                        runat="server" 
                                        Tooltip='<%# GetLocalResourceObject("Update_FechaRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        TabIndex="-1"
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
                            ID="Int_Empresa_Id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Int_Empresa_Id") %>'>
                        </asp:TextBox><br />
                        
                        <asp:TextBox 
                            ID="Id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Id") %>'>
                        </asp:TextBox>
                        
                        <%--Ocultos--%>
                        
                        <asp:TextBox 
                            ID="Fecha_Creacion" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Fecha_Creacion") %>'>
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
                            ID="Disponible_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Disponible_Nombre") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Estado" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Estado") %>'>
                        </asp:TextBox> 
                    </EditItemTemplate>
                    
                    <InsertItemTemplate>
                        <table>                            
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
                                        Visible="false"
                                        ReadOnly="true"
                                        Text='<%# Bind("Codigo") %>'>
                                    </asp:TextBox>   
                                    <asp:TextBox 
                                        ID="txt_p3" 
                                        Width="175px"
                                        TabIndex="-1"
                                        BorderColor="white"
                                        BorderStyle="Solid"
                                        ReadOnly="true"
                                        runat="server"
                                        Text="">
                                    </asp:TextBox>      
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("DisponibleRecursoKCG.Text").ToString() %>'
                                        ID="lblDisponoble"                                                                           
                                        runat="server">
                                    </asp:Label>                                
                                    <asp:DropDownList 
                                        ID="listaDisponoble" 
                                        runat="server" 
                                        TabIndex="-1"
                                        Width="155px"
                                        CssClass="TEXTO_EDICION_KCG"
                                        DataSourceID="odslistaDisponible" 
                                        Tooltip='<%# GetLocalResourceObject("DisponibleRecursoKCG.ToolTip").ToString() %>'
                                        DataTextField="Nombre" 
                                        DataValueField="Dic_Dominio_Dominio"
                                        SelectedValue='<%# Bind("Disponible") %>'
                                        OnDataBound="Disponible_DataBound">
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource 
                                        ID="odslistaDisponible" 
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
                                                DefaultValue="APU_MATERIAL" 
                                                Name="Dic_Objeto_Nombre" 
                                                Type="String" />
                                            <asp:Parameter 
                                                DefaultValue="DISPONIBLE" 
                                                Name="Dic_Campo_Nombre" 
                                                Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </td>  
                                <td
                                    colspan="2"
                                    align="right">
                                    <asp:Label 
                                        ID="estado_nombre" 
                                        runat="server" 
                                        Text='<%# Bind("estado_nombre") %>'>
                                    </asp:Label>
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
                                <td>
                                    <asp:TextBox 
                                        ID="Nombre" 
                                        runat="server" 
                                        Tooltip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>'                                        
                                        Width="400px"
                                        Height="50px"
                                        TextMode ="MultiLine"
                                        CssClass="TEXTO_EDICION_KCG"
                                        Style="text-transform:uppercase"
                                        Text='<%# Bind("Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        runat="server" 
                                        ID="NombreReq"
                                        ControlToValidate="Nombre"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="NombreReqE"
                                        TargetControlID="NombreReq" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("UnidadRecursoKCG.Text").ToString() %>'
                                        ID="lblUnidad"                                                                           
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Unidad" 
                                        runat="server" 
                                        Tooltip='<%# GetLocalResourceObject("UnidadRecursoKCG.ToolTip").ToString() %>'     
                                        CssClass="TEXTO_EDICION_KCG"
                                        Style="text-transform:uppercase"                                   
                                        Text='<%# Bind("Unidad") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        runat="server" 
                                        ID="UnidadReq"
                                        ControlToValidate="Unidad"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="UnidadReqE"
                                        TargetControlID="UnidadReq" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("Costo_ParcialRecursoKCG.Text").ToString() %>'
                                        ID="lblCostoParcial"                                                                           
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td
                                    colspan="3">
                                    <asp:TextBox 
                                        ID="Costo_Parcial" 
                                        runat="server" 
                                        Tooltip='<%# GetLocalResourceObject("Costo_ParcialRecursoKCG.ToolTip").ToString() %>'
                                        CssClass="TEXTO_EDICION_KCG"
                                        Style="text-align:right"
                                        Text='<%# Bind("Costo_Parcial") %>'>
                                    </asp:TextBox>
                                    <AjaxControlToolkit:MaskedEditExtender 
                                        ID="fCostoParcial" 
                                        runat="server"
                                        TargetControlID="Costo_Parcial"
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
                                        ControlExtender="fCostoParcial"
                                        ControlToValidate="Costo_Parcial"
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
                                        TargetControlID="MaskedEditValidator1"/>                               
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("Costo_OtrosRecursoKCG.Text").ToString() %>'
                                        ID="lblCostoOtros"                                                                           
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td
                                    colspan="3">
                                    <asp:TextBox 
                                        ID="Costo_Otros" 
                                        runat="server" 
                                        Tooltip='<%# GetLocalResourceObject("Costo_OtrosRecursoKCG.ToolTip").ToString() %>'
                                        CssClass="TEXTO_EDICION_KCG"
                                        Style="text-align:right"
                                        Text='<%# Bind("Costo_Otros") %>'>
                                    </asp:TextBox>
                                    <AjaxControlToolkit:MaskedEditExtender 
                                        ID="forCostoOtros" 
                                        runat="server"
                                        TargetControlID="Costo_Otros"
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
                                        ID="MaskedEditValidator2" 
                                        runat="server"
                                        ControlExtender="forCostoOtros"
                                        ControlToValidate="Costo_Otros"
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
                                        ID="ValidatorCalloutExtender2"
                                        TargetControlID="MaskedEditValidator2"/>                                  
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.Text").ToString() %>'
                                        ID="lblCostoTotal"                                                                           
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td
                                    colspan="3">
                                    <asp:TextBox 
                                        ID="Costo_Total" 
                                        runat="server" 
                                        Tooltip='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        Style="text-align:right"
                                        TabIndex="-1"
                                        Text='<%# Bind("Costo_Total","{0:N4}") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("Costo_TransporteRecursoKCG.Text").ToString() %>'
                                        ID="lblContoTransporte"                                                                           
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td
                                    colspan="3">
                                    <asp:TextBox 
                                        ID="Costo_Transporte" 
                                        runat="server" 
                                        Tooltip='<%# GetLocalResourceObject("Costo_TransporteRecursoKCG.ToolTip").ToString() %>'
                                        CssClass="TEXTO_EDICION_KCG"
                                        Style="text-align:right"
                                        Text='<%# Bind("Costo_Transporte") %>'>
                                    </asp:TextBox>
                                    <AjaxControlToolkit:MaskedEditExtender 
                                        ID="forCostoTransporte" 
                                        runat="server"
                                        TargetControlID="Costo_Transporte"
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
                                        ID="MaskedEditValidator4" 
                                        runat="server"
                                        ControlExtender="forCostoTransporte"
                                        ControlToValidate="Costo_Transporte"
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
                                        ID="ValidatorCalloutExtender4"
                                        TargetControlID="MaskedEditValidator4"/>                                 
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("Costo_total_costo_TransporteRecursoKCG.Text").ToString() %>'
                                        ID="lblCostoTotalCostoTransporte"                                                                           
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td
                                    colspan="3">
                                    <asp:TextBox 
                                        ID="Costo_Total_Costo_Transporte" 
                                        runat="server" 
                                        Tooltip='<%# GetLocalResourceObject("Costo_total_costo_TransporteRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Style="text-align:right"
                                        Text='<%# Bind("Costo_Total_Costo_Transporte","{0:N4}") %>'>
                                    </asp:TextBox>                          
                                </td>
                                <td>
                                    <script type="text/javascript">
                                       
                                        Sys.Application.add_load(page_load);
                                        Sys.Application.add_unload(page_unload);
                                        
                                        var Costo_Parcial = null;
                                        var Costo_Otros = null; 
                                        var Costo_Transporte = null;
                                        
                                        function page_load(sender, e)
                                        {
                                            Costo_Parcial = $get("ctl00_ContentPlaceHolder1_fvApuMaterial_Costo_Parcial");                                
                                            Costo_Otros = $get("ctl00_ContentPlaceHolder1_fvApuMaterial_Costo_Otros");
                                            Costo_Transporte = $get("ctl00_ContentPlaceHolder1_fvApuMaterial_Costo_Transporte");
                                            $addHandler(Costo_Parcial, "change", datos_onchange);    
                                            $addHandler(Costo_Otros, "change", datos_onchange2);
                                            $addHandler(Costo_Transporte, "change", datos_onchange3);
                                        }
                                        
                                        function page_unload(sender, e)
                                        {
                                            $removeHandler(Costo_Parcial, "change", datos_onchange);                                                                       
                                            $removeHandler(Costo_Otros, "change", datos_onchange2);
                                            $removeHandler(Costo_Transporte, "change", datos_onchange3);
                                        }
                                        
                                        function datos_onchange(sender, e)
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
                                            var costoTotalCalculado = 0.00;  
                                            var costoTotalTransporteCalculado = 0.00;                                    
                                            var numCosto_Parcial = Number.parseLocale(Costo_Parcial.value);
                                            var numCosto_Otros = Number.parseLocale(Costo_Otros.value);                                              
                                            var numCosto_Transporte = Number.parseLocale(Costo_Transporte.value);                                          
                                            var Costo_Total = $get("ctl00_ContentPlaceHolder1_fvApuMaterial_Costo_Total");  
                                            var Costo_Total_Costo_Transporte = $get("ctl00_ContentPlaceHolder1_fvApuMaterial_Costo_Total_Costo_Transporte");                                          
                                            
                                            if(isNaN(numCosto_Parcial))
                                                numCosto_Parcial = 0.00;                                               
                                            if(isNaN(numCosto_Otros))
                                                numCosto_Otros = 0.00;      
                                                
                                            costoTotalCalculado = numCosto_Parcial + numCosto_Otros;                                                                                                                                      
                                            Costo_Total.value = costoTotalCalculado.localeFormat("N4");   
                                            
                                            var numCosto_Total = Number.parseLocale(Costo_Total.value);  
                                            
                                            if(isNaN(numCosto_Transporte))
                                                numCosto_Transporte = 0.00;
                                            
                                            if(isNaN(numCosto_Total))
                                                numCosto_Total = 0.00;    
                                            
                                            costoTotalTransporteCalculado = numCosto_Transporte + numCosto_Total;
                                            Costo_Total_Costo_Transporte.value = costoTotalTransporteCalculado.localeFormat("N4");                           
                                        }                            
                                    </script>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("Update_Per_Personal_NombreRecursoKCG.Text").ToString() %>'
                                        ID="lblUltimaActualizacion"                                                                           
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td
                                    colspan="3">
                                    <asp:TextBox 
                                        ID="Update_Per_Personal_Nombre" 
                                        runat="server" 
                                        Tooltip='<%# GetLocalResourceObject("Update_Per_Personal_NombreRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Width="250px"
                                        Text='<%# Bind("Update_Per_Personal_Nombre") %>'>
                                    </asp:TextBox>                                
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("Update_FechaRecursoKCG.Text").ToString() %>'
                                        ID="lblFechaUpdate"                                                                           
                                        runat="server">
                                    </asp:Label>                               
                                    <asp:TextBox 
                                        ID="Fecha_Update" 
                                        runat="server" 
                                        Tooltip='<%# GetLocalResourceObject("Update_FechaRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Text='<%# Bind("Fecha_Update") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" colspan="2">
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
                            ID="Int_Empresa_Id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Int_Empresa_Id") %>'>
                        </asp:TextBox><br />
                        
                        <asp:TextBox 
                            ID="Id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Id") %>'>
                        </asp:TextBox>
                        
                        <%--Ocultos--%>
                        
                        <asp:TextBox 
                            ID="Fecha_Creacion" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Fecha_Creacion") %>'>
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
                            ID="Int_Moneda_Simbolo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Disponible_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Disponible_Nombre") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Estado" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Estado") %>'>
                        </asp:TextBox>                 
                    </InsertItemTemplate>
                    
                    <ItemTemplate>
                        <table>                            
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
                                    <asp:TextBox 
                                        ID="txt_p3" 
                                        Width="16px"
                                        TabIndex="-1"
                                        BorderColor="white"
                                        BorderStyle="Solid"
                                        ReadOnly="true"
                                        runat="server"
                                        Text="">
                                    </asp:TextBox>                                                        
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("DisponibleRecursoKCG.Text").ToString() %>'
                                        ID="lblDisponoble"                                                                           
                                        runat="server">
                                    </asp:Label>                                
                                    <%--<asp:DropDownList 
                                        ID="listaDisponoble" 
                                        runat="server"     
                                        TabIndex="-1"    
                                        Width="155px"                                
                                        DataSourceID="odslistaDisponible" 
                                        Tooltip='<%# GetLocalResourceObject("DisponibleRecursoKCG.ToolTip").ToString() %>'
                                        DataTextField="Nombre" 
                                        Enabled="false"
                                        DataValueField="Dic_Dominio_Dominio"
                                        SelectedValue='<%# Bind("Disponible") %>'>
                                    </asp:DropDownList>--%>
                                    <asp:ObjectDataSource 
                                        ID="odslistaDisponible" 
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
                                                DefaultValue="APU_MATERIAL" 
                                                Name="Dic_Objeto_Nombre" 
                                                Type="String" />
                                            <asp:Parameter 
                                                DefaultValue="DISPONIBLE" 
                                                Name="Dic_Campo_Nombre" 
                                                Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </td>     
                                <td
                                    colspan="2"
                                    align="right">
                                    <asp:Label 
                                        ID="estado_nombre" 
                                        runat="server" 
                                        Text='<%# Bind("estado_nombre") %>'>
                                    </asp:Label>
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
                                <td>
                                    <asp:TextBox 
                                        ID="Nombre" 
                                        runat="server" 
                                        TabIndex="-1"
                                        Tooltip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>'                                        
                                        Width="400px"
                                        Height="50px"
                                        TextMode ="MultiLine"
                                        CssClass="TEXTO_LECTURA_KCG"
                                        ReadOnly="true"
                                        Style="text-transform:uppercase"
                                        Text='<%# Bind("Nombre") %>'>
                                    </asp:TextBox>                                    
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("UnidadRecursoKCG.Text").ToString() %>'
                                        ID="lblUnidad"                                                                           
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Unidad" 
                                        runat="server" 
                                        TabIndex="-1"
                                        Tooltip='<%# GetLocalResourceObject("UnidadRecursoKCG.ToolTip").ToString() %>'     
                                        ReadOnly="true"
                                        Style="text-transform:uppercase"                                   
                                        Text='<%# Bind("Unidad") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("Costo_ParcialRecursoKCG.Text").ToString() %>'
                                        ID="lblCostoParcial"                                                                           
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td
                                    colspan="3">
                                    <asp:TextBox 
                                        ID="Costo_Parcial" 
                                        runat="server" 
                                        TabIndex="-1"
                                        Tooltip='<%# GetLocalResourceObject("Costo_ParcialRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        Style="text-align:right"
                                        Text='<%# Bind("Costo_Parcial","{0:N4}") %>'>
                                    </asp:TextBox>         
                                    <asp:Label        
                                        ID="lblIntMonedaSimbolo1" 
                                        runat="server"                                         
                                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>                                                         
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("Costo_OtrosRecursoKCG.Text").ToString() %>'
                                        ID="lblCostoOtros"                                                                           
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td
                                    colspan="3">
                                    <asp:TextBox 
                                        ID="Costo_Otros" 
                                        runat="server" 
                                        TabIndex="-1"
                                        Tooltip='<%# GetLocalResourceObject("Costo_OtrosRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        Style="text-align:right"
                                        Text='<%# Bind("Costo_Otros","{0:N4}") %>'>
                                    </asp:TextBox>
                                    <asp:Label        
                                        ID="lblIntMonedaSimbolo2" 
                                        runat="server"                                         
                                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>                   
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.Text").ToString() %>'
                                        ID="lblCostoTotal"                                                                           
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td
                                    colspan="3">
                                    <asp:TextBox 
                                        ID="Costo_Total" 
                                        TabIndex="-1"
                                        runat="server" 
                                        Tooltip='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        Style="text-align:right"                                        
                                        Text='<%# Bind("Costo_Total","{0:N4}") %>'>
                                    </asp:TextBox>  
                                    <asp:Label        
                                        ID="lblIntMonedaSimbolo3" 
                                        runat="server"                                         
                                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label> 
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("Costo_TransporteRecursoKCG.Text").ToString() %>'
                                        ID="lblContoTransporte"                                                                           
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td
                                    colspan="3">
                                    <asp:TextBox 
                                        ID="Costo_Transporte" 
                                        runat="server" 
                                        TabIndex="-1"
                                        Tooltip='<%# GetLocalResourceObject("Costo_TransporteRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        Style="text-align:right"
                                        Text='<%# Bind("Costo_Transporte","{0:N4}") %>'>
                                    </asp:TextBox>  
                                    <asp:Label        
                                        ID="lblIntMonedaSimbolo4" 
                                        runat="server"                                         
                                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>                               
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("Costo_total_costo_TransporteRecursoKCG.Text").ToString() %>'
                                        ID="lblCostoTotalCostoTransporte"                                                                           
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td
                                    colspan="3">
                                    <asp:TextBox 
                                        ID="Costo_Total_Costo_Transporte" 
                                        runat="server" 
                                        TabIndex="-1"
                                        Tooltip='<%# GetLocalResourceObject("Costo_total_costo_TransporteRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"                                        
                                        Style="text-align:right"
                                        Text='<%# Bind("Costo_Total_Costo_Transporte","{0:N4}") %>'>
                                    </asp:TextBox>  
                                    <asp:Label        
                                        ID="lblIntMonedaSimbolo5" 
                                        runat="server"                                         
                                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>                           
                                </td>                                
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("Update_Per_Personal_NombreRecursoKCG.Text").ToString() %>'
                                        ID="lblUltimaActualizacion"                                                                           
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td
                                    colspan="3">
                                    <asp:TextBox 
                                        ID="Update_Per_Personal_Nombre" 
                                        runat="server" 
                                        Tooltip='<%# GetLocalResourceObject("Update_Per_Personal_NombreRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Width="250px"
                                        Text='<%# Bind("Update_Per_Personal_Nombre") %>'>
                                    </asp:TextBox>                                
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("Update_FechaRecursoKCG.Text").ToString() %>'
                                        ID="lblFechaUpdate"                                                                           
                                        runat="server">
                                    </asp:Label>                               
                                    <asp:TextBox 
                                        ID="Fecha_Update" 
                                        runat="server" 
                                        Tooltip='<%# GetLocalResourceObject("Update_FechaRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        TabIndex="-1"
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
                            ID="Int_Empresa_Id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Int_Empresa_Id") %>'>
                        </asp:TextBox><br />
                        
                        <asp:TextBox 
                            ID="Id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Id") %>'>
                        </asp:TextBox>
                        
                        <%--Ocultos--%>
                        
                        <asp:TextBox 
                            ID="Fecha_Creacion" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Fecha_Creacion") %>'>
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
                            ID="Int_Moneda_Simbolo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Disponible_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Disponible_Nombre") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Estado" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Estado") %>'>
                        </asp:TextBox>
                    </ItemTemplate>                
                    
                </asp:FormView>
            </asp:Panel>
            <koala:KNavegacion 
                ID="nav"
                runat="server"
                GridViewID="gvApuMaterial"
                FormViewID="FormView1" 
                OnNavegar="nav_Siguiente"/>                       
            
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger 
                ControlID="gvApuMaterial" 
                EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
    
    <asp:ObjectDataSource 
        ID="odsfvApuMaterial" 
        runat="server" 
        ConflictDetection="CompareAllValues"
        DeleteMethod="Delete" 
        InsertMethod="Insert" 
        OldValuesParameterFormatString="original{0}"
        SelectMethod="GetById" 
        SortParameterName="sortExpression" 
        TypeName="FEL.APU.BO_Apu_Material"
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
                        Contenedor="APU_MATERIAL" 
                        Objeto="APU_MATERIAL" 
                        IndiceScope ="Scope"
                        Orden="1"
                        ObjectDataSourceID="odsGvApuMaterial"
                        PaginacionFina="true"/>   
                </td>
                <td>
                    <asp:Button 
                        ID="Btn_Clonar_Material" 
                        runat="server"
                        OnClick="Btn_Clonar_Material_Click" />  
                </td>
                <td>                 
                    <asp:Button 
                        ID="Btn_Historico_Material" 
                        runat="server" 
                        OnClick="Btn_Historico_Material_Click"/>
                </td>
            </tr>
        </table>
        <asp:Panel
            runat="server"
            ID="Pnl_Listado_Material"
            meta:resourcekey="Rec_Listado_Apu_MaterialRecursoKCG">
                <koala:KGridBase 
                    ID="gvApuMaterial" 
                    runat="server" 
                    AllowPaging="True" 
                    AutoGenerateColumns="False"
                    DataKeyNames="Id" 
                    DataSourceID="odsgvApuMaterial" 
                    AllowSorting="True"
                    PageSize="20"
                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>'>
                    <AlternatingRowStyle CssClass="alternatingrowstyle" />
                    <HeaderStyle CssClass="headerstyle" />
                    <PagerStyle CssClass="pagerstyle" />
                    <SelectedRowStyle CssClass="selectedrowstyle" />
                    
                    <Columns>
                        <asp:CommandField 
                            ButtonType="Button" 
                            SelectText="...." 
                            ShowSelectButton="True" />
                        <asp:BoundField 
                            DataField="Codigo" 
                            meta:resourcekey="BoundCodigoRecursoKCG"
                            SortExpression="Sort_Codigo" >
                            <headerstyle wrap="False" />
                            <itemstyle wrap="False" horizontalalign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Nombre" 
                            meta:resourcekey="BoundNombreRecursoKCG"
                            SortExpression="Nombre" >
                            <headerstyle wrap="False" />
                            <itemstyle wrap="False" width="80mm" />
                        </asp:BoundField>                    
                        <asp:BoundField 
                            DataField="Unidad" 
                            meta:resourcekey="BoundUnidadRecursoKCG"
                            SortExpression="Unidad" >
                            <headerstyle wrap="False" />
                            <itemstyle wrap="False" horizontalalign="Center" />
                        </asp:BoundField>                    
                        <asp:BoundField 
                            DataField="Costo_Parcial" 
                            meta:resourcekey="BoundCosto_ParcialRecursoKCG"
                            SortExpression="Costo_Parcial" 
                            dataformatstring="{0:N4}" >
                            <headerstyle wrap="True" />
                            <itemstyle wrap="False" horizontalalign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Costo_Otros" 
                            meta:resourcekey="BoundCosto_OtrosRecursoKCG"
                            SortExpression="Costo_Otros" 
                            dataformatstring="{0:N4}" >
                            <headerstyle wrap="True" />
                            <itemstyle wrap="False" horizontalalign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Costo_Transporte" 
                            meta:resourcekey="BoundCosto_TransporteRecursoKCG"
                            SortExpression="Costo_Transporte" 
                            dataformatstring="{0:N4}" >
                            <headerstyle wrap="True" />
                            <itemstyle wrap="False" horizontalalign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Costo_Total_Costo_Transporte" 
                            meta:resourcekey="BoundCosto_total_costo_TransporteRecursoKCG"
                            SortExpression="Costo_Total_Costo_Transporte" 
                            dataformatstring="{0:N4}" >
                            <headerstyle wrap="True" />
                            <itemstyle wrap="False" horizontalalign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Update_Per_Personal_Nombre" 
                            meta:resourcekey="BoundUpdate_Per_Personal_NombreRecursoKCG"
                            SortExpression="Update_Per_Personal_Nombre" >
                            <headerstyle wrap="True" />
                            <itemstyle wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Fecha_Update" 
                            meta:resourcekey="BoundUpdate_FechaRecursoKCG"
                            SortExpression="Fecha_Update" >
                            <headerstyle wrap="True" />
                            <itemstyle wrap="True" />
                        </asp:BoundField>                     
                        <asp:BoundField 
                            DataField="Disponible" 
                            HeaderText="Disponible" 
                            SortExpression="Disponible"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Int_Sucursal_Id" 
                            HeaderText="Int_Sucursal_Id" 
                            SortExpression="Int_Sucursal_Id"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Int_Moneda_Id" 
                            HeaderText="Int_Moneda_Id" 
                            SortExpression="Int_Moneda_Id"
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
                            DataField="Update_Per_Personal_Id" 
                            HeaderText="Update_Per_Personal_Id"
                            SortExpression="Update_Per_Personal_Id"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Int_Sucursal_Codigo" 
                            HeaderText="Int_Sucursal_Codigo"
                            SortExpression="Int_Sucursal_Codigo"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Int_Sucursal_Nombre" 
                            HeaderText="Int_Sucursal_Nombre"
                            SortExpression="Int_Sucursal_Nombre"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Int_Moneda_Codigo" 
                            HeaderText="Int_Moneda_Codigo" 
                            SortExpression="Int_Moneda_Codigo"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Int_Moneda_Nombre" 
                            HeaderText="Int_Moneda_Nombre" 
                            SortExpression="Int_Moneda_Nombre"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Int_Empresa_Id" 
                            HeaderText="Int_Empresa_Id" 
                            SortExpression="Int_Empresa_Id"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Int_Empresa_Codigo" 
                            HeaderText="Int_Empresa_Codigo" 
                            SortExpression="Int_Empresa_Codigo"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Int_Empresa_Nombre" 
                            HeaderText="Int_Empresa_Nombre" 
                            SortExpression="Int_Empresa_Nombre"
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
                            DataField="Costo_Total" 
                            HeaderText="Costo_Total" 
                            SortExpression="Costo_Total"
                            Visible="False" />                        
                        <asp:BoundField 
                            DataField="Int_Moneda_Simbolo" 
                            HeaderText="Int_Moneda_Simbolo" 
                            SortExpression="Int_Moneda_Simbolo"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Disponible_Nombre" 
                            HeaderText="Disponible_Nombre" 
                            SortExpression="Disponible_Nombre"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="estado_nombre" 
                            HeaderText="estado_nombre" 
                            SortExpression="estado_nombre"
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
                </Koala:KGridBase>
        </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:ObjectDataSource 
        ID="odsgvApuMaterial" 
        runat="server"
        ConflictDetection="CompareAllValues"
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetBySucursal" 
        TypeName="FEL.APU.BO_Apu_Material" >
        <SelectParameters>
            <asp:SessionParameter 
                Name="s" 
                SessionField="Scope" 
                Type="Object" />
            <asp:Parameter 
                Name="Int_Sucursal_id" 
                Type="String" />
            <asp:Parameter 
                Name="Codigo_Desde" 
                Type="String" />
            <asp:Parameter 
                Name="Codigo_Hasta" 
                Type="String" />
            <asp:Parameter 
                Name="Nombre" 
                Type="String" />
            <asp:Parameter 
                Name="Unidad" 
                Type="String" />
            <asp:Parameter 
                Name="Costo_Total_Desde" 
                Type="Decimal" />
            <asp:Parameter 
                Name="Costo_Total_Hasta" 
                Type="Decimal" />
            <asp:Parameter 
                Name="Disponible" 
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>   
    
</asp:Content>

