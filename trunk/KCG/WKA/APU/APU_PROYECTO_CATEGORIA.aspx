<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="APU_PROYECTO_CATEGORIA.aspx.cs" 
    StylesheetTheme="EstiloKCG"
    Theme="EstiloKCG"
    Inherits="APU_APU_PROYECTO_CATEGORIA" 
    meta:resourcekey="Tit_Apu_Proyecto_CategoriaRecursoKCG" %>
    
<%@ Register 
        Src="../WebUserControls/wucMensajeEliminar.ascx" 
        TagName="wucMensajeEliminar"
        TagPrefix="uc1" %>
    
<%@ Register 
        Src="../WebUserControls/wucMensajeActualizar.ascx" 
        TagName="wucMensajeActualizar"
        TagPrefix="uc1" %>

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
                ID="fvApuProyectoCategoria" 
                runat="server" 
                DataSourceID="odsfvApuProyectoCategoría"
                DefaultMode="Insert">                
                
                <EditItemTemplate>
                    <asp:Panel
                        runat="server"
                        ID="Rec_Apu_Proyecto_Categoria_Proyecto"
                        meta:resourcekey="Rec_Apu_Proyecto_Categoria_ProyectoRecursoKCG">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("Apu_Proyecto_NombreRecursoKCG.Text").ToString() %>'
                                        ID="lblCodigo"                                   
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Proyecto_Codigo" 
                                        runat="server" 
                                        TabIndex="-1"
                                        ReadOnly="true"
                                        Tooltip='<%# GetLocalResourceObject("Apu_Proyecto_CodigoRecursoKCG.ToolTip").ToString() %>'
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
                                        ReadOnly="true"
                                        Width="400px"
                                        Height="50px"
                                        TextMode="MultiLine"
                                        CssClass="TEXTO_LECTURA_KCG"
                                        Tooltip='<%# GetLocalResourceObject("Apu_Proyecto_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Proyecto_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                        </table>              
                    </asp:Panel>
                    <asp:Panel
                        runat="server"
                        ID="Rec_Apu_Proyecto_Categoria"
                        meta:resourcekey="Rec_Apu_Proyecto_CategoriaRecursoKCG">
                        <table>
                            <tr>
                                <td 
                                    colspan="2"
                                    align="right">
                                    <asp:Label 
                                        ID="Label1" 
                                        runat="server" 
                                        Text='<%# Bind("Estado_Nombre") %>'>
                                    </asp:Label>
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
                                <td
                                    style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Apu_Categoria_Codigo" 
                                        runat="server" 
                                        TabIndex="-1"
                                        ReadOnly="true"
                                        Tooltip='<%# GetLocalResourceObject("Apu_Categoria_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Categoria_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Apu_Categoria_Nombre" 
                                        runat="server" 
                                        TabIndex="-1"
                                        ReadOnly="true"
                                        Tooltip='<%# GetLocalResourceObject("Apu_Categoria_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Categoria_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td
                                    style="white-space:nowrap">
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("Costo_DiarioRecursoKCG.Text").ToString() %>'
                                        ID="lblCostoDiario"                                   
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td
                                    style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Costo_Diario" 
                                        runat="server"                                         
                                        style="text-align:right"
                                        CssClass="TEXTO_EDICION_KCG"
                                        Tooltip='<%# GetLocalResourceObject("Costo_DiarioRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Costo_Diario") %>'>
                                    </asp:TextBox>
                                    <asp:Label 
                                        ID="lblInt_Moneda_Simbolo1" 
                                        runat="server" 
                                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>                                    
                                    <AjaxControlToolkit:MaskedEditExtender 
                                        ID="fCostoDiario" 
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
                                    <AjaxControlToolkit:MaskedEditValidator 
                                        ID="MaskedEditValidator2" 
                                        runat="server"
                                        ControlExtender="fCostoDiario"
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
                                        ID="ValidatorCalloutExtender1"
                                        TargetControlID="MaskedEditValidator2"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("Costo_HoraRecursoKCG.Text").ToString() %>'
                                        ID="lblCostoHora"                                   
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td
                                    style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Costo_Hora" 
                                        runat="server"                                         
                                        style="text-align:right"
                                        ReadOnly="true"
                                        Tooltip='<%# GetLocalResourceObject("Costo_HoraRecursoKCG.ToolTip").ToString() %>'     
                                        TabIndex="-1"                                   
                                        Text='<%# Bind("Costo_Hora","{0:N4}") %>'>
                                    </asp:TextBox>
                                    <asp:Label 
                                        ID="lblInt_Moneda_Simbolo2" 
                                        runat="server" 
                                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                                </td>                                
                            </tr>
                            <tr>
                                <td
                                    colspan="2">
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
                        ID="Int_Empresa_id" 
                        runat="server" 
                        Style="display:none"
                        Text='<%# Bind("Int_Empresa_id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Apu_Proyecto_Id" 
                        runat="server"
                        Style="display:none"
                        Text='<%# Bind("Apu_Proyecto_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Id" 
                        runat="server" 
                        Style="display:none"
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Apu_Categoria_Id" 
                        runat="server" 
                        Style="display:none"
                        Text='<%# Bind("Apu_Categoria_Id") %>'>
                    </asp:TextBox>
                    
                    <%--Ocultos--%>
                                  
                    <asp:TextBox 
                        ID="Apu_Proyecto_Etapa" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Apu_Proyecto_Etapa") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Int_Empresa_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Int_Empresa_Codigo") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Estado_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Estado_Nombre") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Estado" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Estado") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Codigo" 
                        runat="server"
                        Visible="false"
                        Text='<%# Bind("Codigo") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Int_Empresa_Nombre"
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Int_Empresa_Nombre") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Nombre") %>'>
                    </asp:TextBox>                    
                </EditItemTemplate>
                
                <InsertItemTemplate>
                    <asp:Panel
                        runat="server"
                        ID="Rec_Apu_Proyecto_Categoria_Proyecto"
                        meta:resourcekey="Rec_Apu_Proyecto_Categoria_ProyectoRecursoKCG">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("Apu_Proyecto_NombreRecursoKCG.Text").ToString() %>'
                                        ID="lblCodigo"                                   
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Proyecto_Codigo" 
                                        runat="server"
                                        TabIndex="-1" 
                                        ReadOnly="true"
                                        Tooltip='<%# GetLocalResourceObject("Apu_Proyecto_CodigoRecursoKCG.ToolTip").ToString() %>'
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
                                        ReadOnly="true"
                                        Width="400px"
                                        Height="50px"
                                        TextMode="MultiLine"
                                        CssClass="TEXTO_LECTURA_KCG"
                                        Tooltip='<%# GetLocalResourceObject("Apu_Proyecto_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Proyecto_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                        </table>              
                    </asp:Panel>
                    <asp:Panel
                        runat="server"
                        ID="Rec_Apu_Proyecto_Categoria"
                        meta:resourcekey="Rec_Apu_Proyecto_CategoriaRecursoKCG">
                        <table>
                            <tr>
                                <td 
                                    colspan="2"
                                    align="right">
                                    <asp:Label 
                                        ID="Label1" 
                                        runat="server" 
                                        Text='<%# Bind("Estado_Nombre") %>'>
                                    </asp:Label>
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
                                <td
                                    style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Apu_Categoria_Codigo" 
                                        runat="server" 
                                        TabIndex="-1"
                                        ReadOnly="true"
                                        Tooltip='<%# GetLocalResourceObject("Apu_Categoria_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Categoria_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Apu_Categoria_Nombre" 
                                        runat="server" 
                                        TabIndex="-1"
                                        ReadOnly="true"
                                        Tooltip='<%# GetLocalResourceObject("Apu_Categoria_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Categoria_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td
                                    style="white-space:nowrap">
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("Costo_DiarioRecursoKCG.Text").ToString() %>'
                                        ID="lblCostoDiario"                                   
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td
                                    style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Costo_Diario" 
                                        runat="server" 
                                        TabIndex="-1"
                                        style="text-align:right"
                                        ReadOnly="true"
                                        Tooltip='<%# GetLocalResourceObject("Costo_DiarioRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Costo_Diario","{0:N4}") %>'>
                                    </asp:TextBox> 
                                    <asp:Label 
                                        ID="lblInt_Moneda_Simbolo1" 
                                        runat="server" 
                                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("Costo_HoraRecursoKCG.Text").ToString() %>'
                                        ID="lblCostoHora"                                   
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td
                                    style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Costo_Hora" 
                                        runat="server" 
                                        TabIndex="-1"
                                        style="text-align:right"
                                        ReadOnly="true"
                                        Tooltip='<%# GetLocalResourceObject("Costo_HoraRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Costo_Hora","{0:N4}") %>'>
                                    </asp:TextBox>
                                    <asp:Label 
                                        ID="lblInt_Moneda_Simbolo2" 
                                        runat="server" 
                                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <script type="text/javascript">
                                        
                                        Sys.Application.add_load(page_load);
                                        Sys.Application.add_unload(page_unload);       
                                        
                                        var Costo_Diario = null;                            

                                        function page_load(sender, e)
                                        {                                            
                                            Costo_Diario = $get("ctl00_ContentPlaceHolder1_fvApuProyectoCategoria_Costo_Diario");                                            
                                            $addHandler(Costo_Diario, "change", dato_onchange);
                                        }
                                                                               
                                        function page_unload(sender, e)
                                        {
                                            $removeHandler(Costo_Diario, "change", dato_onchange);
                                        }
                                        
                                        function dato_onchange(sender, e)
                                        {
                                            Calcular_Division();
                                        }             
                                                                                
                                        function Calcular_Division()
                                        {                                       
                                            var calculo_pre = 0.0000;
                                            var Costo_Hora = $get("ctl00_ContentPlaceHolder1_fvApuProyectoCategoria_Costo_Hora");
                                            
                                            var numCosto_Diario = Number.parseLocale(Costo_Diario.value);
                                            if(isNaN(numCosto_Diario))
                                                numCosto_Diario = 0.0000;
                                            
                                            calculo_pre = numCosto_Diario / 8;
                                            Costo_Hora.value = calculo_pre.localeFormat("N4");                                    
                                        }                    
                                    </script>                     
                                </td>                                                     
                            </tr>                                             
                        </table>                        
                    </asp:Panel>
                    
                    <%--Ids--%>
                                        
                    <asp:TextBox 
                        ID="Int_Empresa_id" 
                        runat="server" 
                        Style="display:none"
                        Text='<%# Bind("Int_Empresa_id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Apu_Proyecto_Id" 
                        runat="server"
                        Style="display:none"
                        Text='<%# Bind("Apu_Proyecto_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Id" 
                        runat="server" 
                        Style="display:none"
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Apu_Categoria_Id" 
                        runat="server" 
                        Style="display:none"
                        Text='<%# Bind("Apu_Categoria_Id") %>'>
                    </asp:TextBox>
                    
                    <%--Ocultos--%>
                                  
                    <asp:TextBox 
                        ID="Apu_Proyecto_Etapa" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Apu_Proyecto_Etapa") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Int_Empresa_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Int_Empresa_Codigo") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Estado_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Estado_Nombre") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Estado" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Estado") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Codigo" 
                        runat="server"
                        Visible="false"
                        Text='<%# Bind("Codigo") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Int_Empresa_Nombre"
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Int_Empresa_Nombre") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Nombre") %>'>
                    </asp:TextBox>    
                </InsertItemTemplate>
                
                <ItemTemplate>
                    <asp:Panel
                        runat="server"
                        ID="Rec_Apu_Proyecto_Categoria_Proyecto"
                        meta:resourcekey="Rec_Apu_Proyecto_Categoria_ProyectoRecursoKCG">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("Apu_Proyecto_NombreRecursoKCG.Text").ToString() %>'
                                        ID="lblCodigo"                                   
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Proyecto_Codigo" 
                                        runat="server" 
                                        TabIndex="-1"
                                        ReadOnly="true"
                                        Tooltip='<%# GetLocalResourceObject("Apu_Proyecto_CodigoRecursoKCG.ToolTip").ToString() %>'
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
                                        ReadOnly="true"
                                        Width="400px"
                                        Height="50px"
                                        TextMode="MultiLine"
                                        CssClass="TEXTO_LECTURA_KCG"
                                        Tooltip='<%# GetLocalResourceObject("Apu_Proyecto_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Proyecto_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                        </table>              
                    </asp:Panel>
                    <asp:Panel
                        runat="server"
                        ID="Rec_Apu_Proyecto_Categoria"
                        meta:resourcekey="Rec_Apu_Proyecto_CategoriaRecursoKCG">
                        <table>
                            <tr>
                                <td 
                                    colspan="2"
                                    align="right">
                                    <asp:Label 
                                        ID="Label1" 
                                        runat="server" 
                                        Text='<%# Bind("Estado_Nombre") %>'>
                                    </asp:Label>
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
                                <td
                                    style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Apu_Categoria_Codigo" 
                                        runat="server" 
                                        TabIndex="-1"
                                        ReadOnly="true"
                                        Tooltip='<%# GetLocalResourceObject("Apu_Categoria_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Categoria_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Apu_Categoria_Nombre" 
                                        runat="server" 
                                        TabIndex="-1"
                                        ReadOnly="true"
                                        Tooltip='<%# GetLocalResourceObject("Apu_Categoria_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Categoria_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td
                                    style="white-space:nowrap">
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("Costo_DiarioRecursoKCG.Text").ToString() %>'
                                        ID="lblCostoDiario"                                   
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td
                                    style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Costo_Diario" 
                                        runat="server" 
                                        TabIndex="-1"
                                        style="text-align:right"
                                        ReadOnly="true"
                                        Tooltip='<%# GetLocalResourceObject("Costo_DiarioRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Costo_Diario","{0:N4}") %>'>
                                    </asp:TextBox> 
                                    <asp:Label 
                                        ID="lblInt_Moneda_Simbolo1" 
                                        runat="server" 
                                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("Costo_HoraRecursoKCG.Text").ToString() %>'
                                        ID="lblCostoHora"                                   
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td
                                    style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Costo_Hora" 
                                        runat="server" 
                                        TabIndex="-1"
                                        style="text-align:right"
                                        ReadOnly="true"
                                        Tooltip='<%# GetLocalResourceObject("Costo_HoraRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Costo_Hora","{0:N4}") %>'>
                                    </asp:TextBox>
                                    <asp:Label 
                                        ID="lblInt_Moneda_Simbolo2" 
                                        runat="server" 
                                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                                </td>                                                                
                            </tr>
                            <tr>
                                <td colspan="2">
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
                                   <uc1:wucMensajeEliminar 
                                        ID="WucMensajeEliminar1" 
                                        runat="server" />
                                </td>
                            </tr>                               
                        </table>                        
                    </asp:Panel>
                    
                    <%--Ids--%>
                                        
                    <asp:TextBox 
                        ID="Int_Empresa_id" 
                        runat="server" 
                        Style="display:none"
                        Text='<%# Bind("Int_Empresa_id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Apu_Proyecto_Id" 
                        runat="server"
                        Style="display:none"
                        Text='<%# Bind("Apu_Proyecto_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Id" 
                        runat="server" 
                        Style="display:none"
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Apu_Categoria_Id" 
                        runat="server" 
                        Style="display:none"
                        Text='<%# Bind("Apu_Categoria_Id") %>'>
                    </asp:TextBox>
                    
                    <%--Ocultos--%>
                                  
                    <asp:TextBox 
                        ID="Apu_Proyecto_Etapa" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Apu_Proyecto_Etapa") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Int_Empresa_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Int_Empresa_Codigo") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Estado_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Estado_Nombre") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Estado" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Estado") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Codigo" 
                        runat="server"
                        Visible="false"
                        Text='<%# Bind("Codigo") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Int_Empresa_Nombre"
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Int_Empresa_Nombre") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Nombre") %>'>
                    </asp:TextBox>
                </ItemTemplate>            
            </asp:FormView>
            <table>
                <tr>
                    <td>
                        <koala:KNavegacion 
                            ID="nav"
                            runat="server"
                            GridViewID="gvApuProyectoCategoria"
                            FormViewID="FormView1" 
                            OnNavegar="nav_Siguiente"/>  
                    </td>
                </tr>
            </table>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger 
                ControlID="gvApuProyectoCategoria" 
                EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>    
    <asp:ObjectDataSource 
        ID="odsfvApuProyectoCategoría" 
        runat="server" 
        ConflictDetection="CompareAllValues"
        OldValuesParameterFormatString="original{0}" 
        SelectMethod="GetById" 
        SortParameterName="SortExpression"
        TypeName="FEL.APU.BO_Apu_Proyecto_Categoria" 
        UpdateMethod="Update" 
        DeleteMethod="Delete">
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
                Contenedor="APU_PROYECTO_CATEGORIA" 
                Objeto="APU_PROYECTO_CATEGORIA" 
                IndiceScope ="Scope"
                Orden="1"
                ObjectDataSourceID="odsgvApuProyectoCategoria"/>   
                                     
            <asp:Button
                ID="Btn_Proyecto"
                runat="server"
                meta:resourcekey="Btn_Apu_ProyectoRecursoKCG"
                OnClick="Btn_Proyecto_Click" />
            <asp:Panel
                runat="server"
                ID="Rec_Apu_Proyecto_Categoria_Listado"
                meta:resourcekey="Rec_Apu_Proyecto_Categoria_ListadoRecursoKCG">
                
                <Koala:KGrid 
                    ID="gvApuProyectoCategoria" 
                    runat="server" 
                    AllowPaging="True" 
                    AutoGenerateColumns="False"
                    DataKeyNames="Id" 
                    DataSourceID="odsgvApuProyectoCategoria" 
                    AllowSorting="True" 
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
                            SortExpression="Apu_Categoria_Codigo" >
                            <itemstyle horizontalalign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Apu_Categoria_Nombre" 
                            meta:resourcekey="BoundApu_Categoria_NombreRecursoKCG"
                            SortExpression="Apu_Categoria_Nombre" >   
                             <itemstyle width="80mm"   />
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
                            DataField="Apu_Proyecto_Etapa" 
                            HeaderText="Apu_Proyecto_Etapa" 
                            SortExpression="Apu_Proyecto_Etapa" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Apu_Proyecto_Nombre" 
                            HeaderText="Apu_Proyecto_Nombre"
                            SortExpression="Apu_Proyecto_Nombre" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Int_Empresa_id" 
                            HeaderText="Int_Empresa_id" 
                            SortExpression="Int_Empresa_id" 
                            Visible="False"/>                        
                        <asp:BoundField 
                            DataField="Int_Moneda_Simbolo" 
                            HeaderText="Int_Moneda_Simbolo" 
                            SortExpression="Int_Moneda_Simbolo" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Apu_Proyecto_Id" 
                            HeaderText="Apu_Proyecto_Id" 
                            SortExpression="Apu_Proyecto_Id" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Int_Empresa_Codigo" 
                            HeaderText="Int_Empresa_Codigo" 
                            SortExpression="Int_Empresa_Codigo" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Estado_Nombre" 
                            HeaderText="Estado_Nombre" 
                            SortExpression="Estado_Nombre" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Estado" 
                            HeaderText="Estado" 
                            SortExpression="Estado" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Apu_Proyecto_Codigo" 
                            HeaderText="Apu_Proyecto_Codigo"
                            SortExpression="Apu_Proyecto_Codigo" 
                            Visible="False"/>                       
                        <asp:BoundField 
                            DataField="Id" 
                            HeaderText="Id" 
                            SortExpression="Id" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Apu_Categoria_Id" 
                            HeaderText="Apu_Categoria_Id" 
                            SortExpression="Apu_Categoria_Id" 
                            Visible="False"/>                     
                        <asp:BoundField 
                            DataField="Int_Empresa_Nombre" 
                            HeaderText="Int_Empresa_Nombre" 
                            SortExpression="Int_Empresa_Nombre" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Codigo" 
                            HeaderText="Codigo" 
                            SortExpression="Codigo" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Nombre" 
                            HeaderText="Nombre" 
                            SortExpression="Nombre" 
                            Visible="False"/>
                    </Columns>
                </Koala:KGrid>            
            </asp:Panel>      
        </ContentTemplate>
    </asp:UpdatePanel>
    
    <asp:ObjectDataSource 
        ID="odsgvApuProyectoCategoria" 
        runat="server" 
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetByProyecto" 
        TypeName="FEL.APU.BO_Apu_Proyecto_Categoria">
        <SelectParameters>
            <asp:SessionParameter 
                Name="s" 
                SessionField="Scope" 
                Type="Object" />
            <asp:QueryStringParameter 
                Name="Apu_Proyecto_Id" 
                QueryStringField="Apu_Proyecto_Id"
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>  
    
</asp:Content>

