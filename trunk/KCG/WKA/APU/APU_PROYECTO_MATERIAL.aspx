<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="APU_PROYECTO_MATERIAL.aspx.cs" 
    Inherits="APU_APU_PROYECTO_MATERIAL" 
    meta:resourcekey="Tit_Apu_Proyecto_MaterialRecursoKCG"
    Theme="EstiloKCG"
    StylesheetTheme="EstiloKCG" %>
    

<%@ Register Src="../WebUserControls/wucMensajeActualizar.ascx" 
    TagName="wucMensajeActualizar"
    TagPrefix="uc2" %>

<%@ Register Src="../WebUserControls/wucMensajeEliminar.ascx" 
    TagName="wucMensajeEliminar"
    TagPrefix="uc1" %>
        
<%@ Register 
    Assembly="AjaxControlToolkit" 
    Namespace="AjaxControlToolkit" 
    TagPrefix="AjaxControlToolkit" %>

<%@ Register tagprefix="koala" 
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
                ID="fvapu_proyecto_material" 
                runat="server" 
                DataSourceID="odsapu_proyecto_material"
                DefaultMode="Insert">
                <EditItemTemplate>
                <asp:Panel 
                    id="Panel1"
                    runat="server"
                    meta:resourcekey="Rec_Apu_Proyecto_Material_ProyectoRecursoKCG">
                    <table>
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    id="lblproyecto"
                                    runat="server"
                                    Text='<%# GetLocalResourceObject("Apu_Proyecto_NombreRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Apu_Proyecto_Codigo" 
                                    runat="server"   
                                    TabIndex="-1"                                  
                                    ReadOnly="true"
                                    ToolTip ='<%# GetLocalResourceObject("Apu_Proyecto_CodigoRecursoKCG.ToolTip").ToString() %>'
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
                                    width="400px"
                                    Height="50px"
                                    TextMode="MultiLine"
                                    CssClass="TEXTO_LECTURA_KCG"
                                    ToolTip ='<%# GetLocalResourceObject("Apu_Proyecto_NombreRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Proyecto_Nombre") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                    </table>                         
                </asp:Panel>
                <asp:Panel 
                    id="Panele2"
                    runat="server"
                    meta:resourcekey="Rec_Apu_Proyecto_MaterialRecursoKCG">
                    <table>
                        <tr align="right">
                            <td colspan="2">
                                <asp:Label 
                                    ID="lblestadonombre" 
                                    runat="server" 
                                    Text='<%# Bind("Estado_Nombre") %>'>
                                </asp:Label> 
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:Label
                                    ID="lblcodigo"
                                    runat="server"                                      
                                    Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'>                                  
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Codigo" 
                                    runat="server"  
                                    TabIndex="-1"                                  
                                    Readonly="true"                                                                         
                                    ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Codigo") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>  
                        <tr align="left">
                            <td>
                                <asp:Label
                                    ID="lblnombre"
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
                                    CssClass ="TEXTO_LECTURA_KCG"
                                    width="400px"
                                    ReadOnly="true"
                                    ToolTip ='<%# GetLocalResourceObject("Apu_Material_NombreRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Material_Nombre") %>'>
                                </asp:TextBox>                                 
                                 
                            </td>                            
                        </tr> 
                        <tr align="left">
                            <td>
                                <asp:Label
                                    ID="lblunidad"
                                    runat="server"                                    
                                    Text='<%# GetLocalResourceObject("Apu_Material_UnidadRecursoKCG.Text").ToString() %>'>                                  
                                </asp:Label>      
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Apu_Material_Unidad" 
                                    runat="server"   
                                    TabIndex="-1"                                  
                                    ReadOnly="true"
                                    ToolTip ='<%# GetLocalResourceObject("Apu_Material_UnidadRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Material_Unidad") %>'>
                                </asp:TextBox>    
                            </td>
                        </tr>  
                        <tr align="left">
                            <td>
                                <asp:Label
                                    ID="lblparcial"
                                    runat="server"                                    
                                    Text='<%# GetLocalResourceObject("Costo_ParcialRecursoKCG.Text").ToString() %>'>                                  
                                </asp:Label>      
                            </td>
                            <td style="white-space:nowrap">
                                <asp:TextBox 
                                    ID="Costo_Parcial" 
                                    runat="server" 
                                    CssClass="TEXTO_EDICION_KCG"
                                    style="text-align:right" 
                                    ToolTip ='<%# GetLocalResourceObject("Costo_ParcialRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Costo_Parcial") %>'>
                                </asp:TextBox>
                                <asp:Label 
                                    ID="lblmoneda1" 
                                    runat="server" 
                                    Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                </asp:Label>                                
                                <AjaxControlToolkit:MaskedEditExtender   
                                    ID="meeCosto_Parcial" 
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
                                    ClearMaskOnLostFocus="True"/>                                       
                                  
                                    <AjaxControlToolkit:MaskedEditValidator ID="MaskedEditValidator1" runat="server"
                                    ControlExtender="meeCosto_Parcial"
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
                                    ID="ValidatorCalloutExtender10"
                                    TargetControlID="MaskedEditValidator1"/>                            
                                
                                <asp:TextBox 
                                    ID="Apu_Material_Costo_Parcial" 
                                    runat="server"    
                                    TabIndex="-1"                                 
                                    ReadOnly="true"
                                    style="text-align:right"
                                    ToolTip ='<%# GetLocalResourceObject("Apu_Material_Costo_ParcialRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Material_Costo_Parcial","{0:N4}") %>'>
                                </asp:TextBox>
                                <asp:Label 
                                    ID="lblmoneda2" 
                                    runat="server" 
                                    Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                </asp:Label>                                
                            </td>
                        </tr>     
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lblcostootro" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Costo_OtrosRecursoKCG.Text").ToString() %>'>                                  
                                </asp:Label>    
                            </td>
                            <td style="white-space:nowrap">
                                <asp:TextBox 
                                    ID="Costo_Otros" 
                                    runat="server" 
                                    CssClass="TEXTO_EDICION_KCG"
                                    style="text-align:right"
                                    ToolTip ='<%# GetLocalResourceObject("Costo_OtrosRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Costo_Otros") %>'>
                                </asp:TextBox> 
                                <asp:Label 
                                    ID="lblmoneda3" 
                                    runat="server" 
                                    Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                </asp:Label>
                                 <AjaxControlToolkit:MaskedEditExtender   
                                    ID="MaskedEditExtender1" 
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
                                    ClearMaskOnLostFocus="True"/>                                       
                                  
                                    <AjaxControlToolkit:MaskedEditValidator ID="MaskedEditValidator2" runat="server"
                                    ControlExtender="MaskedEditExtender1"
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
                                    ID="ValidatorCalloutExtender5"
                                    TargetControlID="MaskedEditValidator2"/> 
                                
                                
                                <asp:TextBox 
                                    ID="Apu_Material_Costo_Otros" 
                                    runat="server"                                     
                                    ReadOnly="true"
                                    tabindex="-1"
                                    style="text-align:right"
                                    ToolTip ='<%# GetLocalResourceObject("Apu_Material_Costo_OtrosRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Material_Costo_Otros","{0:N4}") %>'>
                                </asp:TextBox>   
                                <asp:Label 
                                    ID="lblmoneda4" 
                                    runat="server" 
                                    Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                </asp:Label>
                            </td>
                        </tr> 
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lblcostototal" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.Text").ToString() %>'>                                  
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Costo_Total" 
                                    runat="server"                                     
                                    style="text-align:right"
                                    readonly="true"
                                    tabindex="-1"
                                    ToolTip ='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Costo_Total","{0:N4}") %>'>
                                </asp:TextBox>
                                <asp:Label 
                                    ID="lblmoneda5" 
                                    runat="server" 
                                    Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                </asp:Label>
                            </td>                        
                        </tr>    
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lblcostotransporte" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Costo_TransporteRecursoKCG.Text").ToString() %>'>                                  
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Costo_Transporte" 
                                    runat="server" 
                                    CssClass="TEXTO_EDICION_KCG"
                                    style="text-align:right"
                                    ToolTip ='<%# GetLocalResourceObject("Costo_TransporteRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Costo_Transporte") %>'>
                                </asp:TextBox> 
                                <asp:Label 
                                    ID="lblmoneda6" 
                                    runat="server" 
                                    Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                </asp:Label>  
                                <AjaxControlToolkit:MaskedEditExtender   
                                    ID="MaskedEditExtender2" 
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
                                    ClearMaskOnLostFocus="True"/>                                       
                                  
                                    <AjaxControlToolkit:MaskedEditValidator ID="MaskedEditValidator3" runat="server"
                                    ControlExtender="MaskedEditExtender2"
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
                                    ID="ValidatorCalloutExtender6"
                                    TargetControlID="MaskedEditValidator3"/> 
                                
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lblcotottransporte" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Costo_Total_Costo_TransporteRecursoKCG.Text").ToString() %>'>                                  
                                </asp:Label>    
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Costo_Total_Costo_Transporte" 
                                    runat="server"                                     
                                    style="text-align:right"
                                    ReadOnly="true"
                                    tabindex="-1"
                                    ToolTip ='<%# GetLocalResourceObject("Costo_Total_Costo_TransporteRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Costo_Total_Costo_Transporte","{0:N4}") %>'>
                                </asp:TextBox>
                                <asp:Label 
                                    ID="Label1" 
                                    runat="server" 
                                    Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                </asp:Label>  
                            </td>
                        </tr> 
                        <tr align="left">
                            <td colspan="2">
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
                
                <%--Ids--%>
                
                <asp:TextBox 
                    ID="Apu_Material_Id" 
                    runat="server" 
                    style="display:none"
                    visible="true"
                    Text='<%# Bind("Apu_Material_Id") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Apu_Proyecto_Id" 
                    runat="server"
                    style="display:none"
                    visible="true" 
                    Text='<%# Bind("Apu_Proyecto_Id") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Apu_Indice_Id" 
                    runat="server" 
                    style="display:none"
                    visible="true"
                    Text='<%# Bind("Apu_Indice_Id") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Id" 
                    runat="server" 
                    style="display:none"
                    visible="true"
                    Text='<%# Bind("Id") %>'>
                </asp:TextBox>
                
                <%--CAMPOS NO VISIBLES--%>
                    
                <asp:TextBox 
                    ID="Apu_Proyecto_Etapa" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Apu_Proyecto_Etapa") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Apu_Material_Codigo" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Apu_Material_Codigo") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Apu_Material_Costo_Total" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Apu_Material_Costo_Total") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Cantidad_Material" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Cantidad_Material") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Cantidad_Material_X_Costo" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Cantidad_Material_X_Costo") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Apu_Indice_Codigo" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Apu_Indice_Codigo") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Apu_Indice_Nombre" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Apu_Indice_Nombre") %>'>
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
                    id="Panel1"
                    runat="server"
                    meta:resourcekey="Rec_Apu_Proyecto_Material_ProyectoRecursoKCG">
                    <table>
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    id="lblproyecto"
                                    runat="server"
                                    Text='<%# GetLocalResourceObject("Apu_Proyecto_NombreRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Apu_Proyecto_Codigo" 
                                    runat="server"   
                                    TabIndex="-1"                                  
                                    ReadOnly="true"
                                    ToolTip ='<%# GetLocalResourceObject("Apu_Proyecto_CodigoRecursoKCG.ToolTip").ToString() %>'
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
                                    width="400px"
                                    Height="50px"
                                    TextMode="MultiLine"
                                    CssClass="TEXTO_LECTURA_KCG"
                                    ToolTip ='<%# GetLocalResourceObject("Apu_Proyecto_NombreRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Proyecto_Nombre") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                    </table>                         
                </asp:Panel>
                <asp:Panel 
                    id="PanelI2"
                    runat="server"
                    meta:resourcekey="Rec_Apu_Proyecto_MaterialRecursoKCG">
                    <table>
                        <tr align="right">
                            <td colspan="2">
                                <asp:Label 
                                    ID="lblestadonombre" 
                                    runat="server" 
                                    Text='<%# Bind("Estado_Nombre") %>'>
                                </asp:Label> 
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:Label
                                    ID="lblcodigo"
                                    runat="server"  
                                    Visible="false"                                  
                                    Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'>                                  
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Codigo" 
                                    runat="server"                                    
                                    Readonly="true"
                                    Visible="false"                                      
                                    ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Codigo") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>  
                        <tr align="left">
                            <td>
                                <asp:Label
                                    ID="lblnombre"
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
                                    width="400px"  
                                    readOnly="true"                                  
                                    ToolTip ='<%# GetLocalResourceObject("Apu_Material_NombreRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Material_Nombre") %>'>
                                </asp:TextBox>                                  
                            </td>                            
                        </tr> 
                        <tr align="left">
                            <td>
                                <asp:Label
                                    ID="lblunidad"
                                    runat="server"                                    
                                    Text='<%# GetLocalResourceObject("Apu_Material_UnidadRecursoKCG.Text").ToString() %>'>                                  
                                </asp:Label>      
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Apu_Material_Unidad" 
                                    runat="server"                                     
                                    ReadOnly="true"
                                    ToolTip ='<%# GetLocalResourceObject("Apu_Material_UnidadRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Material_Unidad") %>'>
                                </asp:TextBox>    
                            </td>
                        </tr>  
                        <tr align="left">
                            <td>
                                <asp:Label
                                    ID="lblparcial"
                                    runat="server"                                    
                                    Text='<%# GetLocalResourceObject("Costo_ParcialRecursoKCG.Text").ToString() %>'>                                  
                                </asp:Label>      
                            </td>
                            <td style="white-space:nowrap">
                                <asp:TextBox 
                                    ID="Costo_Parcial" 
                                    runat="server"                                     
                                    style="text-align:right"
                                    ToolTip ='<%# GetLocalResourceObject("Costo_ParcialRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Costo_Parcial","{0:N4}") %>'>
                                </asp:TextBox>
                                 <asp:Label 
                                    ID="lblmoneda1" 
                                    runat="server" 
                                    Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                </asp:Label>   
                                <asp:TextBox 
                                    ID="Apu_Material_Costo_Parcial" 
                                    runat="server"                                     
                                    ReadOnly="true"
                                    style="text-align:right"
                                    tabindex="-1"
                                    ToolTip ='<%# GetLocalResourceObject("Apu_Material_Costo_ParcialRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Material_Costo_Parcial","{0:N4}") %>'>
                                </asp:TextBox>
                                <asp:Label 
                                    ID="lblmoneda2" 
                                    runat="server" 
                                    Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                </asp:Label>   
                                <script type="text/javascript">
                                    
                                    Sys.Application.add_load(page_load);
                                    Sys.Application.add_unload(page_unload);
                                    
                                    var Costo_Parcial = null;                                    
                                    var Costo_Otros = null;
                                    var Costo_Transporte = null; 
                                    var Costo_Total = null; 
                                    var Costo_Total_Costo_Transporte= null;

                                    
                                    function page_load(sender, e){
                                    Costo_Parcial = $get("ctl00_ContentPlaceHolder1_fvapu_proyecto_material_Costo_Parcial");                                                                        
                                    Costo_Otros = $get("ctl00_ContentPlaceHolder1_fvapu_proyecto_material_Costo_Otros");
                                    Costo_Transporte = $get("ctl00_ContentPlaceHolder1_fvapu_proyecto_material_Costo_Transporte");
                                    
                                    Costo_Total = $get("ctl00_ContentPlaceHolder1_fvapu_proyecto_material_Costo_Total");
                                    Costo_Total_Costo_Transporte = $get("ctl00_ContentPlaceHolder1_fvapu_proyecto_material_Costo_Total_Costo_Transporte");

                                    $addHandler(Costo_Parcial, "change", datos_onchange);                                    
                                    $addHandler(Costo_Otros, "change", datos_onchange);
                                    $addHandler(Costo_Transporte, "change", datos_onchange);
                                    }
                                    
                                    function page_unload(sender, e){
                                    $removeHandler(Costo_Parcial, "change", datos_onchange);
                                    $removeHandler(Costo_Otros, "change", datos_onchange);
                                    $removeHandler(Costo_Transporte, "change", datos_onchange);                                    
                                    }
                                    
                                    function datos_onchange(sender, e){
                                    Sumar();
                                    }
                                    
                                    function Sumar()
                                    {
                                    var numCostoTotal = 0.00;
                                    
                                    var numCosto_Parcial = Number.parseLocale(Costo_Parcial.value);
                                    if(isNaN(numCosto_Parcial))
                                        numCosto_Parcial = 0.0; 
                                                                           
                                    var numCosto_Otros = Number.parseLocale(Costo_Otros.value);
                                    if(isNaN(numCosto_Otros))
                                        numCosto_Otros = 0.0;
                                                                    
                                    var numCostoTotal =  numCosto_Parcial + numCosto_Otros;
                                    
                                    var numCosto_Transporte = Number.parseLocale(Costo_Transporte.value);
                                    
                                    numCosto_Total_Costo_Transporte = numCostoTotal + numCosto_Transporte;                                 
                                    
                                    Costo_Total.value = numCostoTotal.localeFormat("N4");
                                    Costo_Total_Costo_Transporte.value = numCosto_Total_Costo_Transporte.localeFormat("N4");
                                    }
                                    
                                   
                                   </script>      
                                   <input type="submit" style="display:none;" />                             
                            </td>
                        </tr>     
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lblcostootro" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Costo_OtrosRecursoKCG.Text").ToString() %>'>                                  
                                </asp:Label>    
                            </td>
                            <td style="white-space:nowrap">
                                <asp:TextBox 
                                    ID="Costo_Otros" 
                                    runat="server"                                     
                                    style="text-align:right"
                                    ToolTip ='<%# GetLocalResourceObject("Costo_OtrosRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Costo_Otros","{0:N4}") %>'>
                                </asp:TextBox> 
                                <asp:Label 
                                    ID="lblmoneda3" 
                                    runat="server" 
                                    Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                </asp:Label>
                                <asp:TextBox 
                                    ID="Apu_Material_Costo_Otros" 
                                    runat="server"                                     
                                    ReadOnly="true"
                                    tabindex="-1"
                                    ToolTip ='<%# GetLocalResourceObject("Apu_Material_Costo_OtrosRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Material_Costo_Otros","{0:N4}") %>'>
                                </asp:TextBox>   
                                <asp:Label 
                                    ID="lblmoneda4" 
                                    runat="server" 
                                    Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                </asp:Label>
                            </td>
                        </tr> 
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lblcostototal" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.Text").ToString() %>'>                                  
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Costo_Total" 
                                    runat="server" 
                                    readonly="true"
                                    style="text-align:right"
                                    tabindex="-1"
                                    ToolTip ='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Costo_Total","{0:N4}") %>'>
                                </asp:TextBox>
                                <asp:Label 
                                    ID="lblmoneda5" 
                                    runat="server" 
                                    Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                </asp:Label>
                            </td>                        
                        </tr>    
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lblcostotransporte" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Costo_TransporteRecursoKCG.Text").ToString() %>'>                                  
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Costo_Transporte" 
                                    runat="server"                                     
                                    style="text-align:right"
                                    ToolTip ='<%# GetLocalResourceObject("Costo_TransporteRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Costo_Transporte","{0:N4}") %>'>
                                </asp:TextBox> 
                                <asp:Label 
                                    ID="lblmoneda6" 
                                    runat="server" 
                                    Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                </asp:Label>  
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lblcotottransporte" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Costo_Total_Costo_TransporteRecursoKCG.Text").ToString() %>'>                                  
                                </asp:Label>    
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Costo_Total_Costo_Transporte" 
                                    runat="server" 
                                    readonly="true"
                                    style="text-align:right"
                                    tabindex="-1"
                                    ToolTip ='<%# GetLocalResourceObject("Costo_Total_Costo_TransporteRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Costo_Total_Costo_Transporte","{0:N4}") %>'>
                                </asp:TextBox>
                                <asp:Label 
                                    ID="Label2" 
                                    runat="server" 
                                    Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                </asp:Label> 
                            </td>
                        </tr>                         
                        <tr align="left">
                            <td colspan="2">
                                <%--<asp:Button 
                                    ID="InsertButton" 
                                    runat="server" 
                                    CausesValidation="True" 
                                    CommandName="Insert"
                                    ValidationGroup="I"
                                    AccessKey="I"
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_InsertRecursoKCG.Text").ToString() %>'
                                    ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_InsertRecursoKCG.ToolTip").ToString() %>'>
                                </asp:Button>--%>                            
                                <%--<asp:Button 
                                    ID="InsertCancelButton" 
                                    runat="server" 
                                    CausesValidation="False" 
                                    CommandName="Cancel"
                                    AccessKey="C"
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_CancelRecursoKCG.Text").ToString() %>'
                                    ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_CancelRecursoKCG.ToolTip").ToString() %>'>
                                </asp:Button>--%>
                            </td>
                        </tr>
                    </table>     
                </asp:Panel>
                
                <%--Ids--%>
                
                <asp:TextBox 
                    ID="Apu_Material_Id" 
                    runat="server" 
                    style="display:none"
                    visible="true"
                    Text='<%# Bind("Apu_Material_Id") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Apu_Proyecto_Id" 
                    runat="server"
                    style="display:none"
                    visible="true" 
                    Text='<%# Bind("Apu_Proyecto_Id") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Apu_Indice_Id" 
                    runat="server" 
                    style="display:none"
                    visible="true"
                    Text='<%# Bind("Apu_Indice_Id") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Id" 
                    runat="server" 
                    style="display:none"
                    visible="true"
                    Text='<%# Bind("Id") %>'>
                </asp:TextBox>
                
                <%--CAMPOS NO VISIBLES--%>
                    
                <asp:TextBox 
                    ID="Apu_Proyecto_Etapa" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Apu_Proyecto_Etapa") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Apu_Material_Codigo" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Apu_Material_Codigo") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Apu_Material_Costo_Total" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Apu_Material_Costo_Total") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Cantidad_Material" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Cantidad_Material") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Cantidad_Material_X_Costo" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Cantidad_Material_X_Costo") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Apu_Indice_Codigo" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Apu_Indice_Codigo") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Apu_Indice_Nombre" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Apu_Indice_Nombre") %>'>
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
                    id="Panel1"
                    runat="server"
                    meta:resourcekey="Rec_Apu_Proyecto_Material_ProyectoRecursoKCG">
                    <table>
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    id="lblproyecto"
                                    runat="server"
                                    Text='<%# GetLocalResourceObject("Apu_Proyecto_NombreRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Apu_Proyecto_Codigo" 
                                    runat="server"  
                                    TabIndex="-1"                                   
                                    ReadOnly="true"
                                    ToolTip ='<%# GetLocalResourceObject("Apu_Proyecto_CodigoRecursoKCG.ToolTip").ToString() %>'
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
                                    width="400px"
                                    Height="50px"
                                    TextMode="MultiLine"
                                    CssClass="TEXTO_LECTURA_KCG"
                                    ToolTip ='<%# GetLocalResourceObject("Apu_Proyecto_NombreRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Proyecto_Nombre") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                    </table>                         
                </asp:Panel>
                <asp:Panel 
                    id="Panelr2"
                    runat="server"
                    meta:resourcekey="Rec_Apu_Proyecto_MaterialRecursoKCG">
                    <table>
                        <tr align="right">
                            <td colspan="2">
                                <asp:Label 
                                    ID="lblestadonombre" 
                                    runat="server" 
                                    Text='<%# Bind("Estado_Nombre") %>'>
                                </asp:Label> 
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:Label
                                    ID="lblcodigo"
                                    runat="server"                                                                   
                                    Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'>                                  
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Codigo" 
                                    TabIndex="-1"
                                    runat="server"                                    
                                    Readonly="true"                                    
                                    ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Codigo") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>  
                        <tr align="left">
                            <td>
                                <asp:Label
                                    ID="lblnombre"
                                    runat="server"                                    
                                    Text='<%# GetLocalResourceObject("Apu_Material_NombreRecursoKCG.Text").ToString() %>'>                                  
                                </asp:Label>    
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Apu_Material_Nombre" 
                                    runat="server"                                     
                                    ReadOnly="true"
                                    TabIndex="-1"
                                    Height="50px"
                                    TextMode="MultiLine"
                                    CssClass ="TEXTO_LECTURA_KCG"
                                    width="400px"
                                    ToolTip ='<%# GetLocalResourceObject("Apu_Material_NombreRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Material_Nombre") %>'>
                                </asp:TextBox>    
                            </td>                            
                        </tr> 
                        <tr align="left">
                            <td>
                                <asp:Label
                                    ID="lblunidad"
                                    runat="server"                                    
                                    Text='<%# GetLocalResourceObject("Apu_Material_UnidadRecursoKCG.Text").ToString() %>'>                                  
                                </asp:Label>      
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Apu_Material_Unidad" 
                                    runat="server"     
                                    TabIndex="-1"                                
                                    ReadOnly="true"
                                    ToolTip ='<%# GetLocalResourceObject("Apu_Material_UnidadRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Material_Unidad") %>'>
                                </asp:TextBox>    
                            </td>
                        </tr>  
                        <tr align="left">
                            <td>
                                <asp:Label
                                    ID="lblparcial"
                                    runat="server"                                    
                                    Text='<%# GetLocalResourceObject("Costo_ParcialRecursoKCG.Text").ToString() %>'>                                  
                                </asp:Label>      
                            </td>
                            <td style="white-space:nowrap">
                                <asp:TextBox 
                                    ID="Costo_Parcial" 
                                    runat="server" 
                                    TabIndex="-1"
                                    ReadOnly="true"
                                    style="text-align:right"
                                    ToolTip ='<%# GetLocalResourceObject("Costo_ParcialRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Costo_Parcial","{0:N4}") %>'>
                                </asp:TextBox>
                                <asp:Label 
                                    ID="lblmoneda1" 
                                    runat="server" 
                                    Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                </asp:Label>                                                                
                                <asp:TextBox 
                                    ID="Apu_Material_Costo_Parcial" 
                                    runat="server" 
                                    TabIndex="-1"
                                    ReadOnly="true"   
                                    style="text-align:right"                                 
                                    ToolTip ='<%# GetLocalResourceObject("Apu_Material_Costo_ParcialRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Material_Costo_Parcial","{0:N4}") %>'>
                                </asp:TextBox>
                                <asp:Label 
                                    ID="lblmoneda2" 
                                    runat="server" 
                                    Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                </asp:Label>                                
                            </td>
                        </tr>     
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lblcostootro" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Costo_OtrosRecursoKCG.Text").ToString() %>'>                                  
                                </asp:Label>    
                            </td>
                            <td style="white-space:nowrap">
                                <asp:TextBox 
                                    ID="Costo_Otros" 
                                    runat="server" 
                                    TabIndex="-1"
                                    ReadOnly="true"
                                    style="text-align:right"
                                    ToolTip ='<%# GetLocalResourceObject("Costo_OtrosRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Costo_Otros","{0:N4}") %>'>
                                </asp:TextBox> 
                                <asp:Label 
                                    ID="lblmoneda3" 
                                    runat="server" 
                                    Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                </asp:Label>
                                <asp:TextBox 
                                    ID="Apu_Material_Costo_Otros" 
                                    runat="server"  
                                    TabIndex="-1"                                   
                                    ReadOnly="true"
                                    style="text-align:right"
                                    ToolTip ='<%# GetLocalResourceObject("Apu_Material_Costo_OtrosRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Material_Costo_Otros","{0:N4}") %>'>
                                </asp:TextBox>   
                                <asp:Label 
                                    ID="lblmoneda4" 
                                    runat="server" 
                                    Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                </asp:Label>
                            </td>
                        </tr> 
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lblcostototal" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.Text").ToString() %>'>                                  
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Costo_Total" 
                                    runat="server" 
                                    TabIndex="-1"
                                    ReadOnly="true"
                                    style="text-align:right"
                                    ToolTip ='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Costo_Total","{0:N4}") %>'>
                                </asp:TextBox>
                                <asp:Label 
                                    ID="lblmoneda5" 
                                    runat="server" 
                                    Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                </asp:Label>
                            </td>                        
                        </tr>    
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lblcostotransporte" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Costo_TransporteRecursoKCG.Text").ToString() %>'>                                  
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Costo_Transporte" 
                                    runat="server" 
                                    TabIndex="-1"
                                    ReadOnly="true"
                                    style="text-align:right"
                                    ToolTip ='<%# GetLocalResourceObject("Costo_TransporteRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Costo_Transporte","{0:N4}") %>'>
                                </asp:TextBox> 
                                <asp:Label 
                                    ID="lblmoneda6" 
                                    runat="server" 
                                    Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                </asp:Label>                                  
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lblcotottransporte" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Costo_Total_Costo_TransporteRecursoKCG.Text").ToString() %>'>                                  
                                </asp:Label>    
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Costo_Total_Costo_Transporte" 
                                    runat="server" 
                                    TabIndex="-1"
                                    ReadOnly="true"
                                    style="text-align:right"
                                    ToolTip ='<%# GetLocalResourceObject("Costo_Total_Costo_TransporteRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Costo_Total_Costo_Transporte","{0:N4}") %>'>
                                </asp:TextBox>
                                <asp:Label 
                                    ID="Label3" 
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
                                    Enabled='<%# HER.PermisosMovimientos.Movimiento_Apu_Proyecto_Material(Request.QueryString["Estado"], HER.PermisosMovimientos.ModoOperacion.Editar ) %>'
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
                                <%--<asp:Button 
                                    ID="NewButton" 
                                    runat="server" 
                                    CausesValidation="False" 
                                    CommandName="New"
                                    Enabled='<%# HER.PermisosMovimientos.Movimiento_Apu_Proyecto_Material(Request.QueryString["Estado"], HER.PermisosMovimientos.ModoOperacion.Nuevo ) %>'
                                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_NuevoRecursoKCG.AccesKey").ToString() %>'  
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_NewRecursoKCG.Text").ToString() %>'
                                    ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_NewRecursoKCG.ToolTip").ToString() %>'>
                                </asp:Button>--%>
                                <uc1:wucMensajeEliminar ID="WucMensajeEliminar1" runat="server" /> 
                            </td>
                        </tr>
                    </table>     
                </asp:Panel>
                
                <%--Ids--%>
                
                <asp:TextBox 
                    ID="Apu_Material_Id" 
                    runat="server" 
                    style="display:none"
                    visible="true"
                    Text='<%# Bind("Apu_Material_Id") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Apu_Proyecto_Id" 
                    runat="server"
                    style="display:none"
                    visible="true" 
                    Text='<%# Bind("Apu_Proyecto_Id") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Apu_Indice_Id" 
                    runat="server" 
                    style="display:none"
                    visible="true"
                    Text='<%# Bind("Apu_Indice_Id") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Id" 
                    runat="server" 
                    style="display:none"
                    visible="true"
                    Text='<%# Bind("Id") %>'>
                </asp:TextBox>
                
                <%--CAMPOS NO VISIBLES--%>
                    
                <asp:TextBox 
                    ID="Apu_Proyecto_Etapa" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Apu_Proyecto_Etapa") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Apu_Material_Codigo" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Apu_Material_Codigo") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Apu_Material_Costo_Total" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Apu_Material_Costo_Total") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Cantidad_Material" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Cantidad_Material") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Cantidad_Material_X_Costo" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Cantidad_Material_X_Costo") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Apu_Indice_Codigo" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Apu_Indice_Codigo") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Apu_Indice_Nombre" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Apu_Indice_Nombre") %>'>
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
                                GridViewID="gvapu_proyecto_material"
                                FormViewID="FormView1" OnNavegar="nav_Siguiente" />            
        </ContentTemplate> 
        <Triggers>
            <asp:AsyncPostBackTrigger 
                ControlID="gvapu_proyecto_material" 
                EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:ObjectDataSource 
        ID="odsapu_proyecto_material" 
        runat="server" 
        ConflictDetection="CompareAllValues"
        OldValuesParameterFormatString="original{0}" 
        SelectMethod="GetById" 
        SortParameterName="sortExpression"
        TypeName="FEL.APU.BO_Apu_Proyecto_Material" 
        UpdateMethod="Update"
        InsertMethod="Insert"
        DeleteMethod="Delete">
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
                Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_AtrasRecursoKCG.Text").ToString() %>'
                ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_AtrasRecursoKCG.ToolTip").ToString() %>'  
                Visible="False" />
            <asp:Button 
                ID="Seleccionar" 
                runat="server" 
                Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_SeleccionRecursoKCG.Text").ToString() %>'
                ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_SeleccionRecursoKCG.ToolTip").ToString() %>' 
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
                        Contenedor="APU_PROYECTO_MATERIAL" 
                        Objeto="APU_PROYECTO_MATERIAL" 
                        IndiceScope ="Scope"
                        Orden="1" 
                        ObjectDataSourceID="odsgvapu_proyecto_material"/>
                </td>
                <td>
                    <asp:Button 
                        ID="BtnProyecto" 
                        runat="server"                          
                        OnClick="BtnProyecto_Click"/>
                </td>
            </tr>
        </table>
            
            <asp:Panel 
                runat="server"
                id="pnlDatosGrid"
                meta:resourcekey="Rec_Apu_Proyecto_Material_ListadoRecursoKCG">                
                <koala:KGrid  
                    ID="gvapu_proyecto_material" 
                    runat="server" 
                    AutoGenerateColumns="False"
                    DataKeyNames="Id" 
                    DataSourceID="odsgvapu_proyecto_material"
                    AllowPaging="True"
                    AllowSorting="True"                
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
                            SortExpression="Codigo" >
                            <itemstyle horizontalalign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Apu_Material_Nombre" 
                            meta:resourcekey="BoundApu_Material_NombreRecursoKCG" 
                            SortExpression="Apu_Material_Nombre" >
                            <itemstyle width="80mm" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Apu_Material_Unidad" 
                            meta:resourcekey="BoundApu_Material_UnidadRecursoKCG" 
                            SortExpression="Apu_Material_Unidad" >
                            <itemstyle horizontalalign="Center" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Costo_Parcial" 
                            meta:resourcekey="BoundCosto_ParcialRecursoKCG" 
                            SortExpression="Costo_Parcial" 
                            dataformatstring="{0:N4}">
                            <itemstyle horizontalalign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Costo_Otros" 
                            meta:resourcekey="BoundCosto_OtrosRecursoKCG" 
                            SortExpression="Costo_Otros" 
                            dataformatstring="{0:N4}">
                            <itemstyle horizontalalign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Costo_Total" 
                            meta:resourcekey="BoundCosto_TotalRecursoKCG" 
                            SortExpression="Costo_Total" 
                            dataformatstring="{0:N4}">
                            <itemstyle horizontalalign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Costo_Transporte" 
                            meta:resourcekey="BoundCosto_TransporteRecursoKCG" 
                            SortExpression="Costo_Transporte" 
                            dataformatstring="{0:N4}">
                            <itemstyle horizontalalign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Costo_Total_Costo_Transporte" 
                            meta:resourcekey="BoundCosto_Total_Costo_TransporteRecursoKCG" 
                            SortExpression="Costo_Total_Costo_Transporte" 
                            dataformatstring="{0:N4}">
                            <itemstyle horizontalalign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Apu_Material_Id" HeaderText="Apu_Material_Id" SortExpression="Apu_Material_Id"
                            Visible="False" />
                        <asp:BoundField DataField="Apu_Proyecto_Id" HeaderText="Apu_Proyecto_Id" SortExpression="Apu_Proyecto_Id"
                            Visible="False" />
                        <asp:BoundField DataField="Apu_Indice_Id" HeaderText="Apu_Indice_Id" SortExpression="Apu_Indice_Id"
                            Visible="False" />
                        <asp:BoundField DataField="Apu_Proyecto_Codigo" HeaderText="Apu_Proyecto_Codigo"
                            SortExpression="Apu_Proyecto_Codigo" Visible="False" />
                        <asp:BoundField DataField="Apu_Proyecto_Nombre" HeaderText="Apu_Proyecto_Nombre"
                            SortExpression="Apu_Proyecto_Nombre" Visible="False" />
                        <asp:BoundField DataField="Apu_Proyecto_Etapa" HeaderText="Apu_Proyecto_Etapa" SortExpression="Apu_Proyecto_Etapa"
                            Visible="False" />
                        <asp:BoundField DataField="Apu_Material_Codigo" HeaderText="Apu_Material_Codigo"
                            SortExpression="Apu_Material_Codigo" Visible="False" />
                        <asp:BoundField DataField="Apu_Material_Costo_Total" HeaderText="Apu_Material_Costo_Total"
                            SortExpression="Apu_Material_Costo_Total" Visible="False" />
                        <asp:BoundField DataField="Apu_Material_Costo_Parcial" HeaderText="Apu_Material_Costo_Parcial"
                            SortExpression="Apu_Material_Costo_Parcial" Visible="False" />
                        <asp:BoundField DataField="Apu_Material_Costo_Otros" HeaderText="Apu_Material_Costo_Otros"
                            SortExpression="Apu_Material_Costo_Otros" Visible="False" />
                        <asp:BoundField DataField="Cantidad_Material" HeaderText="Cantidad_Material" SortExpression="Cantidad_Material"
                            Visible="False" />
                        <asp:BoundField DataField="Cantidad_Material_X_Costo" HeaderText="Cantidad_Material_X_Costo"
                            SortExpression="Cantidad_Material_X_Costo" Visible="False" />
                        <asp:BoundField DataField="Apu_Indice_Codigo" HeaderText="Apu_Indice_Codigo" SortExpression="Apu_Indice_Codigo"
                            Visible="False" />
                        <asp:BoundField DataField="Apu_Indice_Nombre" HeaderText="Apu_Indice_Nombre" SortExpression="Apu_Indice_Nombre"
                            Visible="False" />
                        <asp:BoundField DataField="Int_Moneda_Simbolo" HeaderText="Int_Moneda_Simbolo" SortExpression="Int_Moneda_Simbolo"
                            Visible="False" />
                        <asp:BoundField DataField="Estado_Nombre" HeaderText="Estado_Nombre" SortExpression="Estado_Nombre"
                            Visible="False" />
                        <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" Visible="False" />
                        <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" Visible="False" />
                        <asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado" Visible="False" />
                   </Columns>
                </koala:KGrid>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:ObjectDataSource 
        ID="odsgvapu_proyecto_material" 
        runat="server" 
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetByProyecto" 
        TypeName="FEL.APU.BO_Apu_Proyecto_Material">
                <SelectParameters>
                    <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
                    <asp:QueryStringParameter Name="apu_proyecto_Id" QueryStringField="Apu_Proyecto_Id"
                        Type="String" />
                </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

