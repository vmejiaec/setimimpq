<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="APU_OFERTA_CATEGORIA.aspx.cs" 
    Inherits="APU_APU_OFERTA_CATEGORIA" 
    StylesheetTheme="EstiloKCG"
    Theme="EstiloKCG"
    meta:resourcekey="Tit_Apu_Oferta_CategoriaRecursoKCG" %>

<%@ Register Src="../WebUserControls/wucMensajeActualizar.ascx" 
    TagName="wucMensajeActualizar"
    TagPrefix="uc2" %>
        
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
        runat="server">
        <ContentTemplate>
        <script type="text/javascript">
            Sys.Application.add_load(page_load);
            Sys.Application.add_unload(page_unload);
            
            var Costo_Diario = null;
            var Costo_Hora = null;
            
            function page_load(sender, e)
            {
                Costo_Diario = $get("ctl00_ContentPlaceHolder1_Fv_Apu_Oferta_Categoria_Costo_Diario");                            
                                                                                                                        
                $addHandler(Costo_Diario, "change", Calcular_CostoHora);
            }
                        
            function page_unload(sender, e)
            {                            
                $removeHandler(Costo_Diario, "change", Calcular_CostoHora);
            }
            
            function Calcular_CostoHora()
            {   
                Costo_Hora = $get("ctl00_ContentPlaceHolder1_Fv_Apu_Oferta_Categoria_Costo_Hora");    
                
                var resultado = 0.00;
                                
                var numCosto_Diario = Number.parseLocale(Costo_Diario.value);
                if(isNaN(numCosto_Diario))
                    numCosto_Diario = 0.0;                                 
                
                resultado = numCosto_Diario / 8;                
                Costo_Hora.value =resultado.localeFormat("N4");                
            }         
                    
        </script>
            <asp:FormView 
                ID="Fv_Apu_Oferta_Categoria" 
                runat="server" 
                DataSourceID="odsFv_Apu_Oferta_Categoria"
                DefaultMode="Insert">
                <EditItemTemplate>
                    <asp:Panel 
                        ID="pnl_Oferta" 
                        runat="server"  
                        meta:resourcekey="Rec_Apu_Oferta_Categoria_OfertaRecursoKCG" >
                        <table>
                            <tr>
                                <td>
                                    <asp:Label                                        
                                        ID="lbl_Oferta"                                                                           
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Apu_Oferta_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Oferta_Codigo" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
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
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Width="400px"
                                        Height="50px"
                                        TextMode="MultiLine"
                                        CssClass="TEXTO_LECTURA_KCG"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Oferta_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Oferta_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <asp:Panel 
                        ID="pnl_Categoria" 
                        runat="server" 
                        meta:resourcekey="Rec_Apu_Oferta_CategoriaRecursoKCG" >
                        <table>
                            <tr>
                                <td>
                                    <asp:Label                                        
                                        ID="lbl_Categoria"                                                                           
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Apu_Categoria_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Categoria_Codigo" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Tooltip='<%# GetLocalResourceObject("Apu_Categoria_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Categoria_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Apu_Categoria_Nombre" 
                                        runat="server" 
                                        Width="400px"
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Tooltip='<%# GetLocalResourceObject("Apu_Categoria_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Categoria_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                                <td align="right" colspan="2">
                                    <asp:Label 
                                        ID="lbl_Estado_Nombre" 
                                        runat="server" 
                                        ForeColor="Red"
                                        Text='<%# Bind("Estado_Nombre") %>'>
                                    </asp:Label>
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
                                <td>
                                    <asp:TextBox 
                                        ID="Costo_Diario" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG"
                                        style="text-align:right"
                                        Tooltip='<%# GetLocalResourceObject("Costo_DiarioRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Costo_Diario","{0:N4}") %>'>
                                    </asp:TextBox>
                                    <asp:Label 
                                        ID="lbl_Simbol1" 
                                        runat="server" 
                                        Text='<%# Bind("int_moneda_simbolo") %>'>
                                    </asp:Label>
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
                                        EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                        InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                        MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                        MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                        MinimumValue="0.000"
                                        MaximumValue="9999999999999.9999" 
                                        Display="Dynamic"
                                        EmptyValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>'
                                        InvalidValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>'
                                        MaximumValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>' 
                                        MinimumValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>'
                                        ValidationGroup="I" />                                        
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="vce_Costo_Diario"
                                        TargetControlID="mev_Costo_Diario"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label                                        
                                        ID="lbl_Costo_Hora"                                                                           
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Costo_HoraRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Costo_Hora" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        style="text-align:right"
                                        Tooltip='<%# GetLocalResourceObject("Costo_HoraRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Costo_Hora","{0:N4}") %>'>
                                    </asp:TextBox>
                                    <asp:Label 
                                        ID="lbl_simbol2" 
                                        runat="server" 
                                        Text='<%# Bind("int_moneda_simbolo") %>'>
                                    </asp:Label>
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
                                     <uc2:wucMensajeActualizar 
                                        ID="WucMensajeActualizar1" 
                                        runat="server" />                 
                                </td>                        
                            </tr>
                        </table>
                    </asp:Panel>
                    
                    <%--Id's--%>
                                        
                    <asp:TextBox 
                        ID="Apu_Oferta_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Apu_Oferta_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Apu_Categoria_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Apu_Categoria_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Int_Empresa_id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Int_Empresa_id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    
                    <%--Campos no visibles--%>                                        
                    
                    <asp:TextBox 
                        ID="Apu_Oferta_Etapa" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Apu_Oferta_Etapa") %>'>
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
                        ID="Int_Moneda_Simbolo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
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
                        ID="pnl_Oferta" 
                        runat="server"  
                        meta:resourcekey="Rec_Apu_Oferta_Categoria_OfertaRecursoKCG" >
                        <table>
                            <tr>
                                <td>
                                    <asp:Label                                        
                                        ID="lbl_Oferta"                                                                           
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Apu_Oferta_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Oferta_Codigo" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
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
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Width="400px"
                                        Height="50px"
                                        TextMode="MultiLine"
                                        CssClass="TEXTO_LECTURA_KCG"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Oferta_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Oferta_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <asp:Panel 
                        ID="pnl_Categoria" 
                        runat="server" 
                        meta:resourcekey="Rec_Apu_Oferta_CategoriaRecursoKCG" >
                        <table>
                            <tr>
                                <td>
                                    <asp:Label                                        
                                        ID="lbl_Categoria"                                                                           
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Apu_Categoria_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Categoria_Codigo" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Tooltip='<%# GetLocalResourceObject("Apu_Categoria_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Categoria_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Apu_Categoria_Nombre" 
                                        runat="server" 
                                        Width="400px"
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Tooltip='<%# GetLocalResourceObject("Apu_Categoria_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Categoria_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                                <td align="right" colspan="2">
                                    <asp:Label 
                                        ID="lbl_Estado_Nombre" 
                                        runat="server" 
                                        ForeColor="Red"
                                        Text='<%# Bind("Estado_Nombre") %>'>
                                    </asp:Label>
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
                                <td>
                                    <asp:TextBox 
                                        ID="Costo_Diario" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Tooltip='<%# GetLocalResourceObject("Costo_DiarioRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Costo_Diario") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label                                        
                                        ID="lbl_Costo_Hora"                                                                           
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Costo_HoraRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Costo_Hora" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Tooltip='<%# GetLocalResourceObject("Costo_HoraRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Costo_Hora") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    
                    <%--Id's--%>
                                        
                    <asp:TextBox 
                        ID="Apu_Oferta_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Apu_Oferta_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Apu_Categoria_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Apu_Categoria_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Int_Empresa_id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Int_Empresa_id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    
                    <%--Campos no visibles--%>                                        
                    
                    <asp:TextBox 
                        ID="Apu_Oferta_Etapa" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Apu_Oferta_Etapa") %>'>
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
                        ID="Int_Moneda_Simbolo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
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
                        ID="pnl_Oferta" 
                        runat="server"  
                        meta:resourcekey="Rec_Apu_Oferta_Categoria_OfertaRecursoKCG" >
                        <table>
                            <tr>
                                <td>
                                    <asp:Label                                        
                                        ID="lbl_Oferta"                                                                           
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Apu_Oferta_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Oferta_Codigo" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
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
                                        Width="400px"
                                        Height="50px"
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        TextMode="MultiLine"
                                        CssClass="TEXTO_LECTURA_KCG"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Oferta_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Oferta_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <asp:Panel 
                        ID="pnl_Categoria" 
                        runat="server" 
                        meta:resourcekey="Rec_Apu_Oferta_CategoriaRecursoKCG" >
                        <table>
                            <tr>
                                <td>
                                    <asp:Label                                        
                                        ID="lbl_Categoria"                                                                           
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Apu_Categoria_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Categoria_Codigo" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Tooltip='<%# GetLocalResourceObject("Apu_Categoria_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Categoria_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Apu_Categoria_Nombre" 
                                        runat="server" 
                                        Width="400px"
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Tooltip='<%# GetLocalResourceObject("Apu_Categoria_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Categoria_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                                <td align="right" colspan="2">
                                    <asp:Label 
                                        ID="lbl_Estado_Nombre" 
                                        runat="server" 
                                        ForeColor="Red"
                                        Text='<%# Bind("Estado_Nombre") %>'>
                                    </asp:Label>
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
                                <td>
                                    <asp:TextBox 
                                        ID="Costo_Diario" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        style="text-align:right"
                                        Tooltip='<%# GetLocalResourceObject("Costo_DiarioRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Costo_Diario","{0:N4}") %>'>
                                    </asp:TextBox>
                                    <asp:Label 
                                        ID="lbl_Simbol1" 
                                        runat="server" 
                                        Text='<%# Bind("int_moneda_simbolo") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label                                        
                                        ID="lbl_Costo_Hora"                                                                           
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Costo_HoraRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Costo_Hora" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        style="text-align:right"
                                        Tooltip='<%# GetLocalResourceObject("Costo_HoraRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Costo_Hora","{0:N4}") %>'>
                                    </asp:TextBox>
                                    <asp:Label 
                                        ID="lbl_simbol2" 
                                        runat="server" 
                                        Text='<%# Bind("int_moneda_simbolo") %>'>
                                    </asp:Label>
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
                                </td>                        
                            </tr>
                        </table>
                    </asp:Panel>
                    
                    <%--Id's--%>
                                        
                    <asp:TextBox 
                        ID="Apu_Oferta_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Apu_Oferta_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Apu_Categoria_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Apu_Categoria_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Int_Empresa_id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Int_Empresa_id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    
                    <%--Campos no visibles--%>                                        
                    
                    <asp:TextBox 
                        ID="Apu_Oferta_Etapa" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Apu_Oferta_Etapa") %>'>
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
                        ID="Int_Moneda_Simbolo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
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
                ID="odsFv_Apu_Oferta_Categoria" 
                runat="server" 
                ConflictDetection="CompareAllValues"
                DeleteMethod="Delte" 
                InsertMethod="Insert" 
                OldValuesParameterFormatString="original{0}"
                SelectMethod="GetById" 
                SortParameterName="sortExpression" 
                TypeName="FEL.APU.BO_Apu_Oferta_Categoria"
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
                            GridViewID="Gv_Apu_Oferta_Categoria"
                            OnNavegar="nav_Siguiente" />
                    </td>
                    <td>
                        <koala:KFiltro 
                            ID="KFiltro" 
                            runat="server" 
                            Contenedor="APU_OFERTA_CATEGORIA" 
                            Objeto="Apu_Oferta_Categoria" 
                            IndiceScope ="Scope"
                            Orden="1"
                            ObjectDataSourceID="odsGv_Apu_Oferta_Categoria" />
                    </td>                                                          
                </tr>
            </table> 
            <asp:Panel 
                ID="pnl_Listado" 
                runat="server" 
                meta:resourcekey="Rec_Apu_Oferta_Categoria_ListadoRecursoKCG" >
                <Koala:KGrid
                    ID="Gv_Apu_Oferta_Categoria" 
                    runat="server" 
                    AllowPaging="True" 
                    AllowSorting="True"
                    AutoGenerateColumns="False" 
                    DataKeyNames="Id" 
                    PageSize="20"
                    DataSourceID="odsGv_Apu_Oferta_Categoria"
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
                            DataField="Apu_Categoria_Codigo" 
                            meta:resourcekey="BoundApu_Categoria_CodigoRecursoKCG" 
                            SortExpression="Apu_Categoria_Codigo">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Apu_Categoria_Nombre" 
                            meta:resourcekey="BoundApu_Categoria_NombreRecursoKCG" 
                            SortExpression="Apu_Categoria_Nombre">
                            <ItemStyle Width="80mm" Wrap="true" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Costo_Diario" 
                            meta:resourcekey="BoundCosto_DiarioRecursoKCG" 
                            SortExpression="Costo_Diario"
                            DataFormatString="{0:N4}">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Costo_Hora" 
                            meta:resourcekey="BoundCosto_HoraRecursoKCG" 
                            SortExpression="Costo_Hora"
                            DataFormatString="{0:N4}">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Apu_Oferta_Id" 
                            HeaderText="Apu_Oferta_Id" 
                            SortExpression="Apu_Oferta_Id"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Categoria_Id" 
                            HeaderText="Apu_Categoria_Id" 
                            SortExpression="Apu_Categoria_Id"
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
                            DataField="Int_Empresa_id" 
                            HeaderText="Int_Empresa_id" 
                            SortExpression="Int_Empresa_id"
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
                </Koala:KGrid>
                <asp:ObjectDataSource 
                    ID="odsGv_Apu_Oferta_Categoria" 
                    runat="server" 
                    ConflictDetection="CompareAllValues"
                    OldValuesParameterFormatString="original_{0}" 
                    SelectMethod="GetByOferta" 
                    TypeName="FEL.APU.BO_Apu_Oferta_Categoria">
                    <SelectParameters>
                        <asp:SessionParameter 
                            Name="s" 
                            SessionField="Scope" 
                            Type="Object" />
                        <asp:QueryStringParameter 
                            Name="apu_oferta_Id" 
                            QueryStringField="apu_oferta_Id" 
                            Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

