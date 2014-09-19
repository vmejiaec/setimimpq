<%@ Page 
Language="C#" 
MasterPageFile="~/KOALA.master" 
AutoEventWireup="true" 
CodeFile="APU_OFERTA_RUBRO_TRANSPORTE.aspx.cs" 
Inherits="APU_APU_OFERTA_RUBRO_TRANSPORTE" 
Theme="EstiloKCG"
StylesheetTheme="EstiloKCG"
meta:resourcekey="Tit_Apu_Oferta_Rubro_TransporteRecursoKCG" %>

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
                ID="fvapu_oferta_rubro_transporte" 
                runat="server" 
                DataSourceID="odsfvapu_oferta_rubro_transporte"
                DefaultMode="Insert">
                <EditItemTemplate>
                    <asp:Panel
                        id="panelI1"
                        runat="server"
                        meta:resourcekey="Rec_Oferta_Rubro_Transporte_OfertaRecursoKCG">
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
                                        ReadOnly="true"
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
                                        ReadOnly="true"
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
                        id="panelI2"
                        runat="server"
                        meta:resourcekey="Rec_Apu_Oferta_Rubro_Transporte_RubroRecursoKCG">
                        <table>
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
                                    ID="Apu_Rubro_Codigo" 
                                    runat="server" 
                                    TabIndex="-1"
                                    Width="100"
                                    ReadOnly="true"
                                    ToolTip='<%# GetLocalResourceObject("Apu_Rubro_CodigoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Rubro_Codigo") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Apu_Rubro_Nombre" 
                                    runat="server" 
                                    TabIndex="-1"
                                    Width="340"
                                    ReadOnly="true"
                                    ToolTip='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Rubro_Nombre") %>'>
                                </asp:TextBox><br />
                            </td>
                        </tr>
                        <tr>
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
                                    Width="100"
                                    ReadOnly="true"
                                    ToolTip='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Rubro_Unidad") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                        </table>
                    </asp:Panel>
                    <asp:Panel
                        id="panelI3"
                        runat="server"
                        meta:resourcekey="Rec_Apu_Oferta_Rubro_TransporteRecursoKCG">
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
                            <tr>
                                <td>
                                    <asp:Label
                                        id="lblmaterial"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Apu_Material_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Material_Nombre" 
                                        runat="server" 
                                        Height="50px"
                                        TextMode="MultiLine" 
                                        TabIndex="-1"    
                                        CssClass="TEXTO_EDICION_KCG"                                 
                                        Width="400px"
                                        ReadOnly="true"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Material_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Material_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        id="lblcostotransporte"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Costo_TransporteRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Costo_Transporte" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG"
                                        Style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("Costo_TransporteRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Costo_Transporte","{0:N2}") %>'>
                                    </asp:TextBox>
                                    <AjaxControlToolkit:MaskedEditExtender 
                                        ID="meeCosto_Transporte" 
                                        runat="server"
                                        TargetControlID="Costo_Transporte"
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
                                        ControlExtender="meeCosto_Transporte"
                                        ControlToValidate="Costo_Transporte"
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
                                    <asp:Label
                                        id="lblb"
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
                        ID="Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    
                     <asp:TextBox 
                        ID="Apu_Oferta_Rubro_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Apu_Oferta_Rubro_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Apu_Material_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Apu_Material_Id") %>'>
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
                        ID="UpdateTransporte_Per_Personal_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("UpdateTransporte_Per_Personal_Id") %>'>
                    </asp:TextBox> 
                    
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
                    
                    <%--campos no visibles--%>
                                   
                    
                    <asp:TextBox 
                        ID="Costo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Costo") %>'>
                    </asp:TextBox>                    
                    
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
                        ID="Fecha_UpdateTransporte" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Fecha_UpdateTransporte") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Apu_Oferta_Rubro_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Apu_Oferta_Rubro_Codigo") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Apu_Oferta_Etapa" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Apu_Oferta_Etapa") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Apu_Material_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Apu_Material_Codigo") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Apu_Material_Unidad" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Apu_Material_Unidad") %>'>
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
                        ID="UpdateTransporte_Per_Personal_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("UpdateTransporte_Per_Personal_Codigo") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="UpdateTransporte_Per_Personal_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("UpdateTransporte_Per_Personal_Nombre") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="int_moneda_simbolo" 
                        runat="server"
                        Visible="false" 
                        Text='<%# Bind("int_moneda_simbolo") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Estado_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Estado_Nombre") %>'>
                    </asp:TextBox>
                    
                    <%--<asp:TextBox 
                        ID="Campo_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Campo_Nombre") %>'>
                    </asp:TextBox>--%>
                    <asp:TextBox 
                        ID="Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Codigo") %>'>
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
                        id="panelI1"
                        runat="server"
                        meta:resourcekey="Rec_Oferta_Rubro_Transporte_OfertaRecursoKCG">
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
                                        TabIndex="-1"
                                        runat="server" 
                                        ReadOnly="true"
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
                                        ReadOnly="true"
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
                        id="panelI2"
                        runat="server"
                        meta:resourcekey="Rec_Apu_Oferta_Rubro_Transporte_RubroRecursoKCG">
                        <table>
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
                                    ID="Apu_Rubro_Codigo" 
                                    runat="server" 
                                    Width="100"
                                    TabIndex="-1"
                                    ReadOnly="true"
                                    ToolTip='<%# GetLocalResourceObject("Apu_Rubro_CodigoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Rubro_Codigo") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Apu_Rubro_Nombre" 
                                    runat="server" 
                                    TabIndex="-1"
                                    Width="340"
                                    ReadOnly="true"
                                    ToolTip='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Rubro_Nombre") %>'>
                                </asp:TextBox><br />
                            </td>
                        </tr>
                        <tr>
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
                                    Width="100"
                                    ReadOnly="true"
                                    ToolTip='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Rubro_Unidad") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                        </table>
                    </asp:Panel>
                    <asp:Panel
                        id="panelI3"
                        runat="server"
                        meta:resourcekey="Rec_Apu_Oferta_Rubro_TransporteRecursoKCG">
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
                            <tr>
                                <td>
                                    <asp:Label
                                        id="lblmaterial"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Apu_Material_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Material_Nombre" 
                                        runat="server" 
                                        TabIndex="-1"
                                        Height="50px"
                                        TextMode="MultiLine"
                                        CssClass="TEXTO_EDICION_KCG" 
                                        Width="400px"                                        
                                        ToolTip='<%# GetLocalResourceObject("Apu_Material_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Material_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        id="lblcostotransporte"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Costo_TransporteRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Costo_Transporte" 
                                        runat="server"    
                                        CssClass="TEXTO_EDICION_KCG"                                     
                                        Style="text-align:right"                                        
                                        ToolTip='<%# GetLocalResourceObject("Costo_TransporteRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Costo_Transporte","{0:N2}") %>'>
                                    </asp:TextBox>
                                    <AjaxControlToolkit:MaskedEditExtender 
                                        ID="meeCosto_Transporte" 
                                        runat="server"
                                        TargetControlID="Costo_Transporte"
                                        Mask="9,999,999,999,999.99"
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
                                    <AjaxControlToolkit:MaskedEditValidator 
                                        ID="MaskedEditValidator2" 
                                        runat="server"
                                        ControlExtender="meeCosto_Transporte"
                                        ControlToValidate="Costo_Transporte"
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
                                    <asp:Label
                                        id="lblb"
                                        runat="server"
                                        Text='<%# Bind("int_moneda_simbolo") %>'>
                                    </asp:Label>        
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Button 
                                        ID="InsertButton" 
                                        runat="server" 
                                        CausesValidation="True" 
                                        CommandName="Insert"
                                        Enabled="false"
                                        Text="Insert">
                                    </asp:Button>
                                    <asp:Button 
                                        ID="InsertCancelButton" 
                                        runat="server" 
                                        Enabled="false"
                                        CausesValidation="False" 
                                        CommandName="Cancel"
                                        Text="Cancel">
                                    </asp:Button>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    
                    <%--id's--%>   
                     <asp:TextBox    
                        ID="Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    
                     <asp:TextBox 
                        ID="Apu_Oferta_Rubro_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Apu_Oferta_Rubro_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Apu_Material_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Apu_Material_Id") %>'>
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
                        ID="UpdateTransporte_Per_Personal_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("UpdateTransporte_Per_Personal_Id") %>'>
                    </asp:TextBox> 
                    
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
                    
                    <%--campos no visibles--%>
                                   
                    
                    <asp:TextBox 
                        ID="Costo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Costo") %>'>
                    </asp:TextBox>                    
                    
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
                        ID="Fecha_UpdateTransporte" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Fecha_UpdateTransporte") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Apu_Oferta_Rubro_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Apu_Oferta_Rubro_Codigo") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Apu_Oferta_Etapa" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Apu_Oferta_Etapa") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Apu_Material_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Apu_Material_Codigo") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Apu_Material_Unidad" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Apu_Material_Unidad") %>'>
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
                        ID="UpdateTransporte_Per_Personal_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("UpdateTransporte_Per_Personal_Codigo") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="UpdateTransporte_Per_Personal_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("UpdateTransporte_Per_Personal_Nombre") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="int_moneda_simbolo" 
                        runat="server"
                        Visible="false" 
                        Text='<%# Bind("int_moneda_simbolo") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Estado_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Estado_Nombre") %>'>
                    </asp:TextBox>
                    
                    <%--<asp:TextBox 
                        ID="Campo_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Campo_Nombre") %>'>
                    </asp:TextBox>--%>
                    <asp:TextBox 
                        ID="Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Codigo") %>'>
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
                        id="panelI1"
                        runat="server"
                        meta:resourcekey="Rec_Oferta_Rubro_Transporte_OfertaRecursoKCG">
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
                                        ReadOnly="true"
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
                                        ReadOnly="true"
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
                        id="panelI2"
                        runat="server"
                        meta:resourcekey="Rec_Apu_Oferta_Rubro_Transporte_RubroRecursoKCG">
                        <table>
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
                                    ID="Apu_Rubro_Codigo" 
                                    runat="server" 
                                    TabIndex="-1"
                                    Width="100"
                                    ReadOnly="true"
                                    ToolTip='<%# GetLocalResourceObject("Apu_Rubro_CodigoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Rubro_Codigo") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Apu_Rubro_Nombre" 
                                    runat="server" 
                                    TabIndex="-1"
                                    Width="340"
                                    ReadOnly="true"
                                    ToolTip='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Rubro_Nombre") %>'>
                                </asp:TextBox><br />
                            </td>
                        </tr>
                        <tr>
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
                                    Width="100"
                                    TabIndex="-1"
                                    ReadOnly="true"
                                    ToolTip='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Rubro_Unidad") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                        </table>
                    </asp:Panel>
                    <asp:Panel
                        id="panelI3"
                        runat="server"
                        meta:resourcekey="Rec_Apu_Oferta_Rubro_TransporteRecursoKCG">
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
                            <tr>
                                <td>
                                    <asp:Label
                                        id="lblmaterial"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Apu_Material_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Material_Nombre" 
                                        runat="server" 
                                        TabIndex="-1"
                                        ReadOnly="true"
                                        CssClass="TEXTO_LECTURA_KCG"
                                        Height="50px"
                                        TextMode ="MultiLine"
                                        Width="400px"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Material_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Material_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        id="lblcostotransporte"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Costo_TransporteRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Costo_Transporte" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"                                        
                                        Style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("Costo_TransporteRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Costo_Transporte","{0:N2}") %>'>
                                    </asp:TextBox>                                    
                                    <asp:Label
                                        id="lblb"
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
                                            Enabled='<%# HER.PermisosMovimientos.Movimiento_Apu_Oferta_Rubro_Material(ApuOferta_Actual.Estado, ApuOferta_Actual.Apu_Presupuesto_Estado, HER.PermisosMovimientos.ModoOperacion.Editar ) %>'
                                            AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_EditarRecursoKCG.AccesKey").ToString() %>'  
                                            Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_EditRecursoKCG.Text").ToString() %>'
                                            ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_EditRecursoKCG.ToolTip").ToString() %>'>
                                       </asp:Button>
                                       <asp:Button 
                                            ID="DeleteButton" 
                                            runat="server" 
                                            CausesValidation="False" 
                                            CommandName="Delete"
                                            Enabled="false"
                                            AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_EliminarRecursoKCG.AccesKey").ToString() %>'  
                                            Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_DeleteRecursoKCG.Text").ToString() %>'
                                            ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_DeleteRecursoKCG.ToolTip").ToString() %>'>
                                       </asp:Button>
                                       <asp:Button 
                                            ID="NewButton" 
                                            runat="server" 
                                            CausesValidation="False" 
                                            CommandName="New"
                                            Enabled="false"
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
                        ID="Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    
                     <asp:TextBox 
                        ID="Apu_Oferta_Rubro_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Apu_Oferta_Rubro_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Apu_Material_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Apu_Material_Id") %>'>
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
                        ID="UpdateTransporte_Per_Personal_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("UpdateTransporte_Per_Personal_Id") %>'>
                    </asp:TextBox> 
                    
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
                    
                    <%--campos no visibles--%>
                                   
                    
                    <asp:TextBox 
                        ID="Costo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Costo") %>'>
                    </asp:TextBox>                    
                    
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
                        ID="Fecha_UpdateTransporte" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Fecha_UpdateTransporte") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Apu_Oferta_Rubro_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Apu_Oferta_Rubro_Codigo") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Apu_Oferta_Etapa" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Apu_Oferta_Etapa") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Apu_Material_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Apu_Material_Codigo") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Apu_Material_Unidad" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Apu_Material_Unidad") %>'>
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
                        ID="UpdateTransporte_Per_Personal_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("UpdateTransporte_Per_Personal_Codigo") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="UpdateTransporte_Per_Personal_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("UpdateTransporte_Per_Personal_Nombre") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="int_moneda_simbolo" 
                        runat="server"
                        Visible="false" 
                        Text='<%# Bind("int_moneda_simbolo") %>'>
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
            <koala:KNavegacion ID="nav"
                                runat="server"
                                GridViewID="gvapu_oferta_rubro_transporte"
                                FormViewID="FormView1" OnNavegar="nav_Siguiente" />   
            </ContentTemplate> 
                <Triggers>
                    <asp:AsyncPostBackTrigger 
                    ControlID="gvapu_oferta_rubro_transporte" 
                    EventName="SelectedIndexChanged" />
                </Triggers>
            </asp:UpdatePanel>
            <asp:ObjectDataSource 
                ID="odsfvapu_oferta_rubro_transporte" 
                runat="server" ConflictDetection="CompareAllValues"
                OldValuesParameterFormatString="original{0}" 
                SelectMethod="GetById" 
                SortParameterName="sortExpression"
                TypeName="FEL.APU.BO_Apu_Oferta_Rubro_Material" 
                UpdateMethod="Update">
                <SelectParameters>
                    <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
                    <asp:Parameter Name="Id" Type="String" />
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
                        Contenedor="APU_OFERTA_RUBRO_TRANSPORTE" 
                        Objeto="APU_OFERTA_RUBRO_MATERIAL" 
                        IndiceScope ="Scope"
                        Orden="1"
                        ObjectDataSourceID="odsgvapu_oferta_rubro_transporte" />
                </td>
                <td>
                    <asp:Button 
                        ID="RubroButton" 
                        runat="server"  
                        Text='<%# GetLocalResourceObject("Btn_Apu_Oferta_Rubro_Transporte_RubroRecursoKCG.Text").ToString() %>'                                           
                        OnClick="RubroButton_Click"/>
                </td>  
                </tr>
            </table>            
            <asp:Panel 
                id="pnlDatosGrid"
                runat="server"                
                meta:resourcekey="Rec_Listado_Apu_Oferta_Transporte_MaterialRecursoKCG">                 
                <koala:KGrid  
                    ID="gvapu_oferta_rubro_transporte" 
                    runat="server" 
                    AllowPaging="True" 
                    AllowSorting="True"
                    AutoGenerateColumns="False"
                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>'
                    DataKeyNames="Id" 
                    DataSourceID="odsgvapu_oferta_rubro_transporte">
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
                            DataField="Apu_Material_Codigo" 
                            meta:resourcekey="BoundApu_Material_CodigoRecursoKCG" 
                            SortExpression="Apu_Material_Codigo" >
                            <itemstyle horizontalalign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Apu_Material_Nombre" 
                            meta:resourcekey="BoundApu_Material_NombreRecursoKCG" 
                            SortExpression="Apu_Material_Nombre" >
                            <headerstyle width="80mm" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Costo_Transporte" 
                            meta:resourcekey="BoundCosto_TransporteRecursoKCG" 
                            SortExpression="Costo_Transporte" 
                            dataformatstring="{0:N2}">
                            <itemstyle horizontalalign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Apu_Oferta_Rubro_Id" 
                            HeaderText="Apu_Oferta_Rubro_Id"
                            SortExpression="Apu_Oferta_Rubro_Id" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Material_Id" 
                            HeaderText="Apu_Material_Id" 
                            SortExpression="Apu_Material_Id" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Costo" 
                            HeaderText="Costo" 
                            SortExpression="Costo" 
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
                            DataField="Fecha_Update" 
                            HeaderText="Fecha_Update" 
                            SortExpression="Fecha_Update" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Update_Per_Personal_Id" 
                            HeaderText="Update_Per_Personal_Id"
                            SortExpression="Update_Per_Personal_Id" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Fecha_UpdateTransporte" 
                            HeaderText="Fecha_UpdateTransporte"
                            SortExpression="Fecha_UpdateTransporte" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="UpdateTransporte_Per_Personal_Id" 
                            HeaderText="UpdateTransporte_Per_Personal_Id"
                            SortExpression="UpdateTransporte_Per_Personal_Id" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Oferta_Rubro_Codigo" 
                            HeaderText="Apu_Oferta_Rubro_Codigo"
                            SortExpression="Apu_Oferta_Rubro_Codigo" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Oferta_Id" 
                            HeaderText="Apu_Oferta_Id" 
                            SortExpression="Apu_Oferta_Id" 
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
                            DataField="Apu_Rubro_Id" 
                            HeaderText="Apu_Rubro_Id" 
                            SortExpression="Apu_Rubro_Id" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Rubro_Codigo" 
                            HeaderText="Apu_Rubro_Codigo" 
                            SortExpression="Apu_Rubro_Codigo" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Rubro_Nombre" 
                            HeaderText="Apu_Rubro_Nombre" 
                            SortExpression="Apu_Rubro_Nombre" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Rubro_Unidad" 
                            HeaderText="Apu_Rubro_Unidad" 
                            SortExpression="Apu_Rubro_Unidad" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Material_Unidad" 
                            HeaderText="Apu_Material_Unidad"
                            SortExpression="Apu_Material_Unidad" 
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
                            DataField="UpdateTransporte_Per_Personal_Codigo" 
                            HeaderText="UpdateTransporte_Per_Personal_Codigo"
                            SortExpression="UpdateTransporte_Per_Personal_Codigo" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="UpdateTransporte_Per_Personal_Nombre" 
                            HeaderText="UpdateTransporte_Per_Personal_Nombre"
                            SortExpression="UpdateTransporte_Per_Personal_Nombre" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="int_moneda_simbolo" 
                            HeaderText="int_moneda_simbolo" 
                            SortExpression="int_moneda_simbolo" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Estado_Nombre" 
                            HeaderText="Estado_Nombre" 
                            SortExpression="Estado_Nombre" 
                            Visible="False" />
                       <%-- <asp:BoundField 
                            DataField="Campo_Nombre" 
                            HeaderText="Campo_Nombre" 
                            SortExpression="Campo_Nombre" 
                            Visible="False" />--%>
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
        </ContentTemplate>
    </asp:UpdatePanel> 
            <asp:ObjectDataSource 
                ID="odsgvapu_oferta_rubro_transporte" 
                runat="server" 
                OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetByOfertaRubro" 
                TypeName="FEL.APU.BO_Apu_Oferta_Rubro_Material">
                <SelectParameters>
                    <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
                    <asp:QueryStringParameter Name="Apu_Oferta_Rubro_Id" QueryStringField="Apu_Oferta_Rubro_Id" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>       
</asp:Content>

