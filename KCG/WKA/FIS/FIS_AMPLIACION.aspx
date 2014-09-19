<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="FIS_AMPLIACION.aspx.cs" 
    Inherits="FIS_FIS_AMPLIACION" 
    StylesheetTheme="EstiloKCG"
    Theme="EstiloKCG"
    meta:resourcekey="Tit_Fis_AmpliacionRecursoKCG"%>
    
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
            <asp:Panel 
                ID="pnl_Proyecto" 
                runat="server" 
                meta:resourcekey="Rec_Fis_Ampliacion_FiscalizacionRecursoKCG">       
                <table>
                    <tr>
                        <td>
                            <asp:Label 
                                ID="lbl_Proy_Cod" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("Lbl_CodigoRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="Proy_Codigo" 
                                runat="server"
                                onfocus="this.blur()" 
                                TabIndex="-1"
                                ToolTip='<%# GetLocalResourceObject("Lbl_CodigoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                        <td>
                            <asp:Label 
                                ID="lbl_Proy_Cod_Inst" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("Lbl_Codigo_InstitucionalRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="Proy_Cod_Inst" 
                                runat="server"
                                onfocus="this.blur()" 
                                TabIndex="-1"
                                ToolTip='<%# GetLocalResourceObject("Lbl_Codigo_InstitucionalRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                        <td>
                            <asp:Label 
                                ID="lbl_Proy_Estado" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("Lbl_EstadoRecursoKCG.Text").ToString() %>'>    
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="Proy_Estado" 
                                runat="server"
                                onfocus="this.blur()" 
                                TabIndex="-1"
                                ToolTip='<%# GetLocalResourceObject("Lbl_EstadoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label 
                                ID="lbl_Proy_FechI" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("Lbl_Fecha_InicioRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="Proy_FechI" 
                                runat="server"
                                onfocus="this.blur()" 
                                TabIndex="-1"
                                ToolTip='<%# GetLocalResourceObject("Lbl_Fecha_InicioRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                        <td>
                            <asp:Label 
                                ID="lbl_Proy_Plazo" 
                                runat="server"                                 
                                Text='<%# GetLocalResourceObject("Lbl_PlazoRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="Proy_Plazo" 
                                runat="server"
                                onfocus="this.blur()" 
                                TabIndex="-1"
                                style="text-align:right"
                                ToolTip='<%# GetLocalResourceObject("Lbl_PlazoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                        <td>
                            <asp:Label 
                                ID="lbl_Proy_FechF" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("Lbl_Fecha_FinRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="Proy_FechF" 
                                runat="server"
                                onfocus="this.blur()" 
                                TabIndex="-1"
                                ToolTip='<%# GetLocalResourceObject("Lbl_Fecha_FinRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>   
                </table>
                <table>             
                    <tr>
                        <td>
                            <asp:Label 
                                ID="lbl_Proyecto" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("Lbl_ProyectoRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                            <asp:TextBox 
                                ID="txt_p3" 
                                Width="5px"
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
                                ID="Proy_Proyecto" 
                                Width="650px"
                                Height="50px"
                                runat="server"
                                onfocus="this.blur()" 
                                TabIndex="-1"
                                TextMode="MultiLine"
                                CssClass="TEXTO_LECTURA_KCG"
                                ToolTip='<%# GetLocalResourceObject("Lbl_ProyectoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>                
                    <tr align="right" >
                        <td>                            
                        </td>
                        <td>
                            <asp:Label 
                                ID="lbl_Proy_Total" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("Plazo_Total_ProrrogaRecursoKCG.Text").ToString() %>'>
                            </asp:Label>                            
                            <asp:TextBox 
                                ID="Proy_Plazo_Total_Prorroga" 
                                runat="server"
                                onfocus="this.blur()" 
                                TabIndex="-1"
                                style="text-align:right"
                                ToolTip='<%# GetLocalResourceObject("Plazo_Total_ProrrogaRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>                        
                            <asp:Label 
                                ID="lbl_Proy_Fecha_FinP" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("Fecha_Final_ProrrogaRecursoKCG.Text").ToString() %>'>
                            </asp:Label>                        
                            <asp:TextBox 
                                ID="Proy_Fecha_Final_Prorroga" 
                                runat="server"
                                onfocus="this.blur()" 
                                TabIndex="-1"
                                ToolTip='<%# GetLocalResourceObject("Fecha_Final_ProrrogaRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                </table>
            </asp:Panel>            
                <asp:FormView 
                    ID="Fv_Fis_Ampliacion" 
                    runat="server" 
                    DataSourceID="odsFv_Fis_Ampliacion"
                    DefaultMode="Insert">
                    <EditItemTemplate>
                        <asp:Panel 
                            ID="pnl_Ampliaciones" 
                            runat="server" 
                            meta:resourcekey="Rec_Fis_AmpliacionRecursoKCG">
                            <table>
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
                                            ReadOnly="true"
                                            TabIndex="-1"
                                            ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'
                                            Text='<%# Bind("Codigo") %>'>
                                        </asp:TextBox>
                                    </td>                            
                                    <td>
                                        <asp:Label 
                                            ID="lbl_Memo" 
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
                                    </td>
                                    <td>
                                        <asp:Label 
                                            ID="lbl_Autorizacion" 
                                            runat="server"
                                            Text='<%# GetLocalResourceObject("Fecha_AutorizacionRecursoKCG.Text").ToString() %>'>
                                        </asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox 
                                            ID="Fecha_Autorizacion" 
                                            runat="server" 
                                            CssClass="TEXTO_EDICION_KCG"
                                            ToolTip='<%# GetLocalResourceObject("Fecha_AutorizacionRecursoKCG.ToolTip").ToString() %>'
                                            Text='<%# Bind("Fecha_Autorizacion") %>'>
                                        </asp:TextBox>
                                        <AjaxControlToolkit:CalendarExtender
                                            ID="ce_Fecha_Autorizacion" 
                                            runat="server" 
                                            TargetControlID="Fecha_Autorizacion" 
                                            Format="dd/MM/yyyy">          
                                        </AjaxControlToolkit:CalendarExtender>
                                        <AjaxControlToolkit:MaskedEditExtender 
                                            TargetControlID="Fecha_Autorizacion" 
                                            Mask="99/99/9999" 
                                            MaskType="Date"  
                                            ID="mee_Fecha_Autorizacion"          
                                            OnFocusCssClass="MaskedEditFocus"
                                            runat="server">
                                       </AjaxControlToolkit:MaskedEditExtender>
                                        <AjaxControlToolkit:MaskedEditValidator
                                            ControlToValidate="Fecha_Autorizacion" 
                                            ControlExtender="mee_Fecha_Autorizacion" 
                                            id="mev_Fecha_Autorizacion"   
                                            TooltipMessage="Formato (dd/MM/yyyy)"  
                                            runat="server" 
                                            IsValidEmpty="false" 
                                            MaximumValue="01/01/2079"
                                            MaximumValueMessage="Fecha < 01/01/2079"
                                            MinimumValueMessage="Fecha > 01/01/1900"
                                            MinimumValue="01/01/1900"
                                            EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                            InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ7RecursoKCG.ErrorMessage").ToString() %>'                                        
                                            EmptyValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'
                                            InvalidValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ7RecursoKCG.Text").ToString() %>' 
                                            ValidationGroup="I"
                                            Display="Dynamic" />  
                                        <AjaxControlToolkit:ValidatorCalloutExtender 
                                            runat="Server" 
                                            ID="vce_Fecha_Autorizacion"
                                            TargetControlID="mev_Fecha_Autorizacion" />
                                    </td>
                                </tr>                            
                                <tr>
                                    <td>
                                        <asp:Label 
                                            ID="lbl_Plazo" 
                                            runat="server"
                                            Text='<%# GetLocalResourceObject("Plazo_DiasRecursoKCG.Text").ToString() %>'>
                                        </asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox 
                                            ID="Plazo_Dias" 
                                            runat="server" 
                                            CssClass="TEXTO_EDICION_KCG"
                                            style="text-align:right"
                                            ToolTip='<%# GetLocalResourceObject("Plazo_DiasRecursoKCG.ToolTip").ToString() %>'
                                            Text='<%# Bind("Plazo_Dias","{0:N0}") %>'>
                                        </asp:TextBox>
                                        <AjaxControlToolkit:MaskedEditExtender 
                                            ID="mee_Plazo_Dias" 
                                            runat="server"
                                            TargetControlID="Plazo_Dias"
                                            Mask="9999999999999"
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
                                            ID="mev_Plazo_Dias" 
                                            runat="server"
                                            ControlExtender="mee_Plazo_Dias"
                                            ControlToValidate="Plazo_Dias"
                                            IsValidEmpty="False"
                                            EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                            InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                            MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                            MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                            MinimumValue="0"
                                            MaximumValue="9999999999999"
                                            Display="Dynamic"
                                            EmptyValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>'
                                            InvalidValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>'
                                            MaximumValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>' 
                                            MinimumValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>'
                                            ValidationGroup="I" />                                        
                                        <AjaxControlToolkit:ValidatorCalloutExtender 
                                            runat="Server" 
                                            ID="vce_Plazo_Dias"
                                            TargetControlID="mev_Plazo_Dias"/>  
                                    </td>
                                    <td>
                                        <asp:Label 
                                            ID="lbl_Obser" 
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
                                            ToolTip='<%# GetLocalResourceObject("DescripcionRecursoKCG.ToolTip").ToString() %>'                                                                     
                                            Text='<%# Bind("Descripcion") %>'>
                                        </asp:TextBox>
                                    </td>                                
                                </tr>
                             </table>
                            <table>    
                            <tr>
                                <td align="left" colspan="2" >
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
                            ID="Apu_Presupuesto_Id" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Apu_Presupuesto_Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Id" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Plazo_Total_Prorroga" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Plazo_Total_Prorroga") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Fecha_Final_Prorroga" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Fecha_Final_Prorroga") %>'>
                        </asp:TextBox>
                        
                        <%--campos no visibles--%>                                                                                                
                        
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
                    </EditItemTemplate>
                    
                    <InsertItemTemplate>
                        <asp:Panel 
                            ID="pnl_Ampliaciones" 
                            runat="server" 
                            meta:resourcekey="Rec_Fis_AmpliacionRecursoKCG">
                            <table>
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
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Codigo") %>'>
                                    </asp:TextBox>
                                </td>                            
                                <td>
                                    <asp:Label 
                                        ID="lbl_Memo" 
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
                                </td>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Autorizacion" 
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Fecha_AutorizacionRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Fecha_Autorizacion" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG"
                                        ToolTip='<%# GetLocalResourceObject("Fecha_AutorizacionRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Fecha_Autorizacion") %>'>
                                    </asp:TextBox>
                                    <AjaxControlToolkit:CalendarExtender
                                        ID="ce_Fecha_Autorizacion" 
                                        runat="server" 
                                        TargetControlID="Fecha_Autorizacion" 
                                        Format="dd/MM/yyyy">          
                                    </AjaxControlToolkit:CalendarExtender>
                                    <AjaxControlToolkit:MaskedEditExtender 
                                        TargetControlID="Fecha_Autorizacion" 
                                        Mask="99/99/9999" 
                                        MaskType="Date"  
                                        ID="mee_Fecha_Autorizacion"          
                                        OnFocusCssClass="MaskedEditFocus"
                                        runat="server">
                                   </AjaxControlToolkit:MaskedEditExtender>
                                    <AjaxControlToolkit:MaskedEditValidator
                                        ControlToValidate="Fecha_Autorizacion" 
                                        ControlExtender="mee_Fecha_Autorizacion" 
                                        id="mev_Fecha_Autorizacion"   
                                        TooltipMessage="Formato (dd/MM/yyyy)"  
                                        runat="server" 
                                        IsValidEmpty="false" 
                                        MaximumValue="01/01/2079"
                                        MaximumValueMessage="Fecha < 01/01/2079"
                                        MinimumValueMessage="Fecha > 01/01/1900"
                                        MinimumValue="01/01/1900"
                                        EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                        InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ7RecursoKCG.ErrorMessage").ToString() %>'                                        
                                        EmptyValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'
                                        InvalidValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ7RecursoKCG.Text").ToString() %>' 
                                        ValidationGroup="I"
                                        Display="Dynamic" />  
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="vce_Fecha_Autorizacion"
                                        TargetControlID="mev_Fecha_Autorizacion" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Plazo" 
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Plazo_DiasRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Plazo_Dias" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG"
                                        style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("Plazo_DiasRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Plazo_Dias","{0:N0}") %>'>
                                    </asp:TextBox>
                                    <AjaxControlToolkit:MaskedEditExtender 
                                        ID="mee_Plazo_Dias" 
                                        runat="server"
                                        TargetControlID="Plazo_Dias"
                                        Mask="9999999999999"
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
                                        ID="mev_Plazo_Dias" 
                                        runat="server"
                                        ControlExtender="mee_Plazo_Dias"
                                        ControlToValidate="Plazo_Dias"
                                        IsValidEmpty="False"
                                        EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        MinimumValue="0"
                                        MaximumValue="9999999999999"
                                        Display="Dynamic"
                                        EmptyValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>'
                                        InvalidValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>'
                                        MaximumValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>' 
                                        MinimumValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>'
                                        ValidationGroup="I" />                                        
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="vce_Plazo_Dias"
                                        TargetControlID="mev_Plazo_Dias"/>  
                                </td>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Obser" 
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
                                        ToolTip='<%# GetLocalResourceObject("DescripcionRecursoKCG.ToolTip").ToString() %>'                                                                        
                                        Text='<%# Bind("Descripcion") %>'>
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
                        </asp:Panel>                        
                    
                        <%--Id's--%>
                        
                        <asp:TextBox 
                            ID="Apu_Presupuesto_Id" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Apu_Presupuesto_Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Id" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Plazo_Total_Prorroga" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Plazo_Total_Prorroga") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Fecha_Final_Prorroga" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Fecha_Final_Prorroga") %>'>
                        </asp:TextBox>
                        
                        <%--campos no visibles--%>                                                                                                
                        
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
                    </InsertItemTemplate>
                    
                    <ItemTemplate>
                        <asp:Panel 
                            ID="pnl_Ampliaciones" 
                            runat="server" 
                            meta:resourcekey="Rec_Fis_AmpliacionRecursoKCG">
                            <table>
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
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Codigo") %>'>
                                    </asp:TextBox>     
                                </td>
                                <td>                           
                                    <asp:Label 
                                        ID="lbl_Memo" 
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
                                <td>
                                    <asp:Label 
                                        ID="lbl_Autorizacion" 
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Fecha_AutorizacionRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Fecha_Autorizacion" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Fecha_AutorizacionRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Fecha_Autorizacion","{0:dd/MM/yyyy}") %>'>
                                    </asp:TextBox>                                    
                                </td>
                            </tr>
                        
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Plazo" 
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Plazo_DiasRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Plazo_Dias" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("Plazo_DiasRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Plazo_Dias","{0:N0}") %>'>
                                    </asp:TextBox>  
                                </td>
                                <td>                                  
                                    <asp:Label 
                                        ID="lbl_Obser" 
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
                                        CssClass="TEXTO_LECTURA_KCG"
                                        TextMode="MultiLine"     
                                        ToolTip='<%# GetLocalResourceObject("DescripcionRecursoKCG.ToolTip").ToString() %>'                                                                           
                                        Text='<%# Bind("Descripcion") %>'>
                                    </asp:TextBox>
                                </td>                                
                            </tr>
                            </table>
                            <table>
                                <tr>
                                    <td align="left" colspan="2">
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
                    
                        <%--Id's--%>
                        
                        <asp:TextBox 
                            ID="Apu_Presupuesto_Id" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Apu_Presupuesto_Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Id" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Plazo_Total_Prorroga" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Plazo_Total_Prorroga") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Fecha_Final_Prorroga" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Fecha_Final_Prorroga") %>'>
                        </asp:TextBox>
                        
                        <%--campos no visibles--%>                                                                                                
                        
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
                    </ItemTemplate>
                </asp:FormView>
                <asp:ObjectDataSource 
                    ID="odsFv_Fis_Ampliacion" 
                    runat="server" 
                    ConflictDetection="CompareAllValues"
                    DeleteMethod="Delete" 
                    InsertMethod="Insert" 
                    OldValuesParameterFormatString="original{0}"
                    SelectMethod="GetById" 
                    SortParameterName="sortExpression" 
                    TypeName="FEL.FIS.BO_Fis_Ampliacion"
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
                            ID="nav"
                            runat="server"
                            GridViewID="Gv_Fis_Ampliacion"
                            FormViewID="Fv_Fis_Ampliacion" 
                            OnNavegar="nav_Siguiente" />
                    </td>
                    <td>
                        <koala:KFiltro 
                            ID="kftFiltro" 
                            runat="server" 
                            Contenedor="FIS_AMPLIACION" 
                            Objeto="Fis_Ampliacion" 
                            IndiceScope ="Scope"
                            Orden="1" 
                            ObjectDataSourceID="odsGv_Fis_Ampliacion"/>
                    </td>
                    <td>
                        <asp:Button 
                            ID="Btn_Fis_Ampliacion_Fiscalizacion" 
                            runat="server" 
                            meta:resourcekey="Btn_Fis_Ampliacion_FiscalizacionRecursoKCG" OnClick="Btn_Fis_Ampliacion_Fiscalizacion_Click" />
                    </td>
                </tr>
            </table>
            <asp:Panel 
                ID="pnl_Listado" 
                runat="server" 
                meta:resourcekey="Rec_Fis_Catalogo_ListadoRecursoKCG" >
                <koala:KGrid
                    ID="Gv_Fis_Ampliacion" 
                    runat="server" 
                    AllowPaging="True" 
                    AllowSorting="True"
                    AutoGenerateColumns="False" 
                    DataKeyNames="Id" 
                    DataSourceID="odsGv_Fis_Ampliacion"
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
                            DataField="Codigo" 
                            meta:resourcekey="BoundCodigoRecursoKCG" 
                            SortExpression="Codigo">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Nombre" 
                            meta:resourcekey="BoundNombreRecursoKCG" 
                            SortExpression="Nombre">
                            <ItemStyle Width="80mm" Wrap="true" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Fecha_Autorizacion" 
                            meta:resourcekey="BoundFecha_AutorizacionRecursoKCG" 
                            SortExpression="Fecha_Autorizacion"
                            DataFormatString="{0:dd/MM/yyyy}">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Plazo_Dias" 
                            meta:resourcekey="BoundPlazo_DiasRecursoKCG" 
                            SortExpression="Plazo_Dias"
                            DataFormatString="{0:N0}">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Descripcion" 
                            meta:resourcekey="BoundDescripcionRecursoKCG" 
                            SortExpression="Descripcion">
                            <ItemStyle Width="80mm" Wrap="true" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Apu_Presupuesto_Id" 
                            HeaderText="Apu_Presupuesto_Id" 
                            SortExpression="Apu_Presupuesto_Id"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Plazo_Total_Prorroga" 
                            HeaderText="Plazo_Total_Prorroga"
                            SortExpression="Plazo_Total_Prorroga" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Fecha_Final_Prorroga" 
                            HeaderText="Fecha_Final_Prorroga"
                            SortExpression="Fecha_Final_Prorroga" 
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
                </koala:KGrid>
                <asp:ObjectDataSource 
                    ID="odsGv_Fis_Ampliacion" 
                    runat="server" 
                    ConflictDetection="CompareAllValues"
                    OldValuesParameterFormatString="original_{0}" 
                    SelectMethod="GetByPresuesto" 
                    TypeName="FEL.FIS.BO_Fis_Ampliacion">
                    <SelectParameters>
                        <asp:SessionParameter 
                            Name="s" 
                            SessionField="Scope" 
                            Type="Object" />
                        <asp:QueryStringParameter 
                            Name="Apu_Presupuesto_Id" 
                            QueryStringField="Apu_Presupuesto_Id"
                            Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

