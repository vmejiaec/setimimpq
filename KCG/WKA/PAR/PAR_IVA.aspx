<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="PAR_IVA.aspx.cs" 
    Inherits="PAR_PAR_IVA" 
    Theme="EstiloKCG"
    StylesheetTheme="EstiloKCG"  
    meta:resourcekey="Tit_Par_IvaRecursoKCG" %>

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
            <asp:FormView 
                ID="Fv_Par_Iva" 
                runat="server" 
                DataSourceID="odsFv_Par_Iva" 
                DefaultMode="Insert">
                <EditItemTemplate>
                    <asp:Panel
                        Id="pnl_Clientes"
                        runat="server"
                        meta:resourcekey="Rec_Par_Iva_Tipo_IvaRecursoKCG">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lbl_Codigo" 
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Codigo" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("Codigo") %>'>
                                    </asp:TextBox>
                                </td>
                                <td align="right" colspan="2">
                                    <asp:Label 
                                        ID="lbl_Estado" 
                                        runat="server" 
                                        ForeColor="Red"
                                        Text='<%# Bind("Estado_Nombre") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lbl_Nombre" 
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Nombre" 
                                        runat="server"
                                        Width="400px"
                                        CssClass="TEXTO_EDICION_KCG" 
                                        ToolTip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        runat="server" 
                                        ID="rfv_Nombre"
                                        ControlToValidate="Nombre"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="vce_Nombre"
                                        TargetControlID="rfv_Nombre"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lbl_Valor" 
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("ValorRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Valor" 
                                        runat="server" 
                                        style="text-align:right"
                                        CssClass="TEXTO_EDICION_KCG"                                         
                                        ToolTip='<%# GetLocalResourceObject("ValorRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("Valor") %>'>
                                    </asp:TextBox>     
                                    <AjaxControlToolkit:MaskedEditExtender 
                                        ID="rfv_Valor" 
                                        runat="server"
                                        TargetControlID="Valor"
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
                                        ID="mev_Valor" 
                                        runat="server"
                                        ControlExtender="rfv_Valor"
                                        ControlToValidate="Valor"
                                        IsValidEmpty="False"
                                        EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        MinimumValue="0.00"
                                        MaximumValue="100.00" 
                                        Display="Dynamic"
                                        EmptyValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>'
                                        InvalidValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>'
                                        MaximumValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>' 
                                        MinimumValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>'
                                        ValidationGroup="I" />                                        
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="vce_Valor"
                                        TargetControlID="mev_Valor"/>                                                                                                             
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
                                        TextMode="MultiLine"
                                        CssClass="TEXTO_EDICION_KCG"
                                        ToolTip='<%# GetLocalResourceObject("DescripcionRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("Descripcion") %>'>
                                    </asp:TextBox>
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
                    
                    <%--Id's--%>
                    
                    <asp:TextBox 
                        ID="Int_Empresa_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Int_Empresa_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Creacion_Per_Personal_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Creacion_Per_Personal_Id") %>'>
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
                    
                    <%--campos no visible--%>
                    
                    <asp:TextBox 
                        ID="Fecha_Creacion" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Fecha_Creacion") %>'>
                    </asp:TextBox>                                       
                    
                    <asp:TextBox 
                        ID="Fecha_Update" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Fecha_Update") %>'>
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
                        ID="Estado_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Estado_Nombre") %>'>
                    </asp:TextBox>                                        
                    
                    <asp:TextBox 
                        ID="Codigo_int" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Codigo_int") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Estado" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Estado") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Cuenta" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Cuenta") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Tipo_Auxiliar" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Tipo_Auxiliar") %>'>
                    </asp:TextBox>                                                                                                             
                    <asp:TextBox 
                        ID="Auxiliar" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Auxiliar") %>'>
                    </asp:TextBox>
                </EditItemTemplate>
                
                <InsertItemTemplate>
                    <asp:Panel
                        Id="pnl_Clientes"
                        runat="server"
                        meta:resourcekey="Rec_Par_Iva_Tipo_IvaRecursoKCG">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lbl_Codigo" 
                                        runat="server"
                                        Visible="false"
                                        Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Codigo" 
                                        runat="server" 
                                        Visible="false"
                                        ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("Codigo") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lbl_Nombre" 
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Nombre" 
                                        runat="server"
                                        Width="400px"
                                        CssClass="TEXTO_EDICION_KCG" 
                                        ToolTip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        runat="server" 
                                        ID="rfv_Nombre"
                                        ControlToValidate="Nombre"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="vce_Nombre"
                                        TargetControlID="rfv_Nombre"/>
                                </td>
                                <td align="right" colspan="2">
                                    <asp:Label 
                                        ID="lbl_Estado" 
                                        runat="server" 
                                        ForeColor="Red"
                                        Text='<%# Bind("Estado_Nombre") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lbl_Valor" 
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("ValorRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Valor" 
                                        runat="server" 
                                        style="text-align:right"
                                        CssClass="TEXTO_EDICION_KCG" 
                                        ToolTip='<%# GetLocalResourceObject("ValorRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("Valor") %>'>
                                    </asp:TextBox>    
                                    <AjaxControlToolkit:MaskedEditExtender 
                                        ID="rfv_Valor" 
                                        runat="server"
                                        TargetControlID="Valor"
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
                                    <%--<AjaxControlToolkit:MaskedEditValidator 
                                        ID="mev_Valor" 
                                        runat="server"
                                        ControlExtender="rfv_Valor"
                                        ControlToValidate="Valor"
                                        IsValidEmpty="False"
                                        EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        MinimumValue="0.00"
                                        MaximumValue="100.00" 
                                        Display="Dynamic"
                                        EmptyValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>'
                                        InvalidValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>'
                                        MaximumValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>' 
                                        MinimumValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>'
                                        ValidationGroup="I" />                                        
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="vce_Valor"
                                        TargetControlID="mev_Valor"/>--%>                                                                                                     
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
                                        TextMode="MultiLine"
                                        CssClass="TEXTO_EDICION_KCG"
                                        ToolTip='<%# GetLocalResourceObject("DescripcionRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("Descripcion") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" >
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
                    
                    <%--Id's--%>
                    
                    <asp:TextBox 
                        ID="Int_Empresa_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Int_Empresa_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Creacion_Per_Personal_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Creacion_Per_Personal_Id") %>'>
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
                    
                    <%--campos no visible--%>
                    
                    <asp:TextBox 
                        ID="Fecha_Creacion" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Fecha_Creacion") %>'>
                    </asp:TextBox>                                       
                    
                    <asp:TextBox 
                        ID="Fecha_Update" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Fecha_Update") %>'>
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
                        ID="Estado_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Estado_Nombre") %>'>
                    </asp:TextBox>                                        
                    
                    <asp:TextBox 
                        ID="Codigo_int" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Codigo_int") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Estado" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Estado") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Cuenta" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Cuenta") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Tipo_Auxiliar" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Tipo_Auxiliar") %>'>
                    </asp:TextBox>                                                                                                             
                    <asp:TextBox 
                        ID="Auxiliar" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Auxiliar") %>'>
                    </asp:TextBox>
                </InsertItemTemplate>
                
                <ItemTemplate>
                    <asp:Panel
                        Id="pnl_Clientes"
                        runat="server"
                        meta:resourcekey="Rec_Par_Iva_Tipo_IvaRecursoKCG">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lbl_Codigo" 
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Codigo" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Text='<%# Bind("Codigo") %>'>
                                    </asp:TextBox>
                                </td>
                                <td align="right" colspan="2">
                                    <asp:Label 
                                        ID="lbl_Estado" 
                                        runat="server" 
                                        ForeColor="Red"
                                        Text='<%# Bind("Estado_Nombre") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lbl_Nombre" 
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Nombre" 
                                        runat="server"
                                        Width="400px"
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lbl_Valor" 
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("ValorRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Valor" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("ValorRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("Valor") %>'>
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
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        TextMode="MultiLine"
                                        CssClass="TEXTO_LECTURA_KCG"
                                        ToolTip='<%# GetLocalResourceObject("DescripcionRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("Descripcion") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr align="left">
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
                                    <asp:Button 
                                        ID="NewButton" 
                                        runat="server" 
                                        CausesValidation="False"
                                        CommandName="New"                                        
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_NuevoRecursoKCG.AccesKey").ToString() %>'  
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_NewRecursoKCG.Text").ToString() %>'
                                        ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_NewRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:Button>
                                    <uc1:wucMensajeEliminar 
                                        ID="WucMensajeEliminar1" 
                                        runat="server" />
                                </td>
                            </tr>  
                        </table>
                    </asp:Panel>
                    
                    <%--Id's--%>
                    
                    <asp:TextBox 
                        ID="Int_Empresa_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Int_Empresa_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Creacion_Per_Personal_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Creacion_Per_Personal_Id") %>'>
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
                    
                    <%--campos no visible--%>
                    
                    <asp:TextBox 
                        ID="Fecha_Creacion" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Fecha_Creacion") %>'>
                    </asp:TextBox>                                       
                    
                    <asp:TextBox 
                        ID="Fecha_Update" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Fecha_Update") %>'>
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
                        ID="Estado_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Estado_Nombre") %>'>
                    </asp:TextBox>                                        
                    
                    <asp:TextBox 
                        ID="Codigo_int" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Codigo_int") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Estado" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Estado") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Cuenta" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Cuenta") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Tipo_Auxiliar" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Tipo_Auxiliar") %>'>
                    </asp:TextBox>                                                                                                             
                    <asp:TextBox 
                        ID="Auxiliar" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Auxiliar") %>'>
                    </asp:TextBox>                    
                </ItemTemplate>
            </asp:FormView>
            <asp:ObjectDataSource 
                ID="odsFv_Par_Iva" 
                runat="server" 
                ConflictDetection="CompareAllValues" 
                OldValuesParameterFormatString="original{0}"
                SelectMethod="GetById" 
                SortParameterName="sortExpression" 
                TypeName="FEL.PAR.BO_Par_Iva" 
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
                            GridViewID="Gv_Par_Iva"
                            OnNavegar="nav_Siguiente" />
                    </td>
                    <td>
                        <koala:KFiltro 
                            ID="KFiltro" 
                            runat="server" 
                            Contenedor="PAR_IVA" 
                            Objeto="Par_Iva" 
                            IndiceScope ="Scope"
                            Orden="1"
                            ObjectDataSourceID="odsGv_Par_Iva" />
                    </td>                    
                </tr>
            </table>
            <asp:Panel
                runat="server"
                ID="pnl_Listado"
                meta:resourcekey="Rec_Par_Iva_ListadoRecursoKCG">
                <Koala:KGrid 
                    ID="Gv_Par_Iva" 
                    runat="server" 
                    AllowPaging="True" 
                    AutoGenerateColumns="False"
                    DataKeyNames="Id" 
                    DataSourceID="odsGv_Par_Iva" 
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
                            DataField="Codigo" 
                            meta:resourcekey="BoundCodigoRecursoKCG" 
                            SortExpression="Codigo">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Nombre" 
                            meta:resourcekey="BoundNombreRecursoKCG" 
                            SortExpression="Nombre">
                            <ItemStyle Width="80mm" Wrap="True" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Valor" 
                            meta:resourcekey="BoundValorRecursoKCG" 
                            SortExpression="Valor">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Cuenta" 
                            meta:resourcekey="BoundCuentaRecursoKCG" 
                            SortExpression="Cuenta"
                            Visible="false" >
                            <ItemStyle Width="80mm" Wrap="True" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Tipo_Auxiliar" 
                            meta:resourcekey="BoundTipo_AuxiliarRecursoKCG" 
                            SortExpression="Tipo_Auxiliar"
                            Visible="false">
                            <ItemStyle Width="80mm" Wrap="True" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Auxiliar" 
                            meta:resourcekey="BoundAuxiliarRecursoKCG" 
                            SortExpression="Auxiliar"
                            Visible="false">
                            <ItemStyle Width="80mm" Wrap="True" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Descripcion" 
                            meta:resourcekey="BoundDescripcionRecursoKCG" 
                            SortExpression="Descripcion">
                            <ItemStyle Width="80mm" Wrap="True" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Int_Empresa_Id" 
                            HeaderText="Int_Empresa_Id" 
                            SortExpression="Int_Empresa_Id"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Creacion_Per_Personal_Id" 
                            HeaderText="Creacion_Per_Personal_Id"
                            SortExpression="Creacion_Per_Personal_Id" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Fecha_Creacion" 
                            HeaderText="Fecha_Creacion" 
                            SortExpression="Fecha_Creacion"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Update_Per_Personal_Id" 
                            HeaderText="Update_Per_Personal_Id"
                            SortExpression="Update_Per_Personal_Id" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Fecha_Update" 
                            HeaderText="Fecha_Update" 
                            SortExpression="Fecha_Update"
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
                            DataField="Codigo_int" 
                            HeaderText="Codigo_int" 
                            SortExpression="Codigo_int"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Estado" 
                            HeaderText="Estado" 
                            SortExpression="Estado" 
                            Visible="False" />
                    </Columns>
                </Koala:KGrid>  
                <asp:ObjectDataSource 
                    ID="odsGv_Par_Iva" 
                    runat="server" 
                    OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetByEmpresa" 
                    TypeName="FEL.PAR.BO_Par_Iva" DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
                    <SelectParameters>
                        <asp:SessionParameter 
                            Name="s" 
                            SessionField="Scope" 
                            Type="Object" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="s" Type="Object" />
                        <asp:Parameter Name="o" Type="Object" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="s" Type="Object" />
                        <asp:Parameter Name="o" Type="Object" />
                        <asp:Parameter Name="original" Type="Object" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="s" Type="Object" />
                        <asp:Parameter Name="o" Type="Object" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

