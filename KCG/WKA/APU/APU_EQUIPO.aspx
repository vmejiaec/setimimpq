<%@ Page Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="APU_EQUIPO.aspx.cs" 
    Inherits="APU_Apu_Equipo" 
    StylesheetTheme="EstiloKCG"
    Theme="EstiloKCG"
    meta:resourcekey="Tit_Apu_EquipoRecursoKCG" %>
    
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
                    <asp:Panel 
                    runat="server" 
                    ID="pnlDatos"
                    meta:resourcekey="Rec_Apu_EquipoRecursoKCG">                            
                        <asp:FormView 
                        ID="FormViewEquipos" 
                        runat="server" 
                        AllowPaging="True" 
                        DataSourceID="OdsApu_Equipo" 
                        DefaultMode="Insert" >
                        
                        <EditItemTemplate>
                            <table>
                                    <tr>
                                        <td colspan="4">
                                            <asp:Label 
                                                ID="lblEstado_Nombre" 
                                                runat="server" 
                                                Text='<%# Bind("Estado_Nombre") %>'>
                                            </asp:Label> 
                                        </td> 
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label 
                                                ID="lblCodigo" 
                                                runat="server"                                                
                                                Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'
                                                >
                                            </asp:Label>
                                         </td>   
                                        <td >
                                            <asp:TextBox 
                                                ID="Codigo" 
                                                runat="server" 
                                                Text='<%# Bind("Codigo") %>'  
                                                TabIndex="-1"                                             
                                                ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'
                                                ReadOnly = "true">
                                            </asp:TextBox>                                        
                                        </td>
                                        <td>
                                            <asp:Label 
                                                ID="lblDisponible" 
                                                runat="server"                                                
                                                Text='<%# GetLocalResourceObject("DisponibleRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList 
                                                ID="Disponible" 
                                                runat="server" 
                                                CssClass="TEXTO_EDICION_KCG"
                                                DataSourceID="odsDisponible" 
                                                DataTextField="Nombre" 
                                                DataValueField="Dic_Dominio_Dominio" 
                                                TabIndex="-1"
                                                SelectedValue='<%# Bind("Disponible") %>'>
                                            </asp:DropDownList><asp:ObjectDataSource 
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
                                                        DefaultValue="" Name="s" 
                                                        SessionField="Scope" 
                                                        Type="Object" />
                                                    <asp:Parameter 
                                                        DefaultValue="APU_EQUIPO" 
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
                                                ID="lblNombre" 
                                                runat="server" 
                                                AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                                AssociatedControlID="Nombre"                                               
                                                Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>                                         
                                        <td colspan="4">
                                            <asp:TextBox 
                                                Width="400px"
                                                CssClass="TEXTO_EDICION_KCG"
                                                ID="Nombre"
                                                Style="text-transform:uppercase" 
                                                runat="server" 
                                                Text='<%# Bind("Nombre") %>'         
                                                Height="50px" 
                                                TextMode ="MultiLine"                                       
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
                                                ID="caValidator"
                                                TargetControlID="rfvNombre"/>
                                        </td>
                                     </tr>
                                     <tr>
                                        <td>
                                            <asp:Label 
                                                ID="lblCosto_Combustible" 
                                                runat="server"                                                
                                                Text='<%# GetLocalResourceObject("Costo_CombustibleRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>
                                        <td 
                                            style="white-space:nowrap">
                                            <asp:TextBox 
                                                 CssClass="TEXTO_EDICION_KCG"
                                                 Style="text-align:right"
                                                ID="Costo_Combustible" 
                                                runat="server" 
                                                Text='<%# Bind("Costo_Combustible") %>'
                                                ToolTip='<%# GetLocalResourceObject("Costo_CombustibleRecursoKCG.ToolTip").ToString() %>'>
                                            </asp:TextBox>
                                            <asp:Label 
                                                ID="lblMoneda" 
                                                runat="server" 
                                                Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                            </asp:Label>          
                                            <AjaxControlToolkit:MaskedEditExtender 
                                                ID="meeCosto_Combustible" 
                                                runat="server"
                                                TargetControlID="Costo_Combustible"
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
                                                ControlExtender="meeCosto_Combustible"
                                                ControlToValidate="Costo_Combustible"
                                                IsValidEmpty="False"
                                                EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                                InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                                MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                                MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                                MinimumValue="0.0000"
                                                MaximumValue="9999999999999.9999" 
                                                Display="Dynamic"
                                                EmptyValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>'
                                                InvalidValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>'
                                                MaximumValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>' 
                                                MinimumValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>'
                                                ValidationGroup="I" />                                        
                                            <AjaxControlToolkit:ValidatorCalloutExtender 
                                                runat="Server" 
                                                ID="ValidatorCalloutExtender2"
                                                TargetControlID="MaskedEditValidator1"/>
                                            
                                        </td>                                        
                                        <td>
                                            <asp:Label 
                                                ID="lblCosto_Alquiler" 
                                                runat="server"                                                
                                                Text='<%# GetLocalResourceObject("Costo_AlquilerRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>
                                        <td 
                                            style="white-space:nowrap">
                                            <asp:TextBox 
                                                ID="Costo_Alquiler"
                                                Style="text-align:right"
                                                CssClass="TEXTO_EDICION_KCG" 
                                                runat="server" 
                                                Text='<%# Bind("Costo_Alquiler") %>'
                                                ToolTip='<%# GetLocalResourceObject("Costo_AlquilerRecursoKCG.ToolTip").ToString() %>'>
                                            </asp:TextBox>
                                            <asp:Label 
                                                ID="Label3" 
                                                runat="server" 
                                                Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                            </asp:Label>
                                            <AjaxControlToolkit:MaskedEditExtender 
                                                ID="meeCosto_Alquiler" 
                                                runat="server"
                                                TargetControlID="Costo_Alquiler"
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
				                                ID="MaskedEditValidator4" 
				                                runat="server"
                                                ControlExtender="meeCosto_Alquiler"
                                                ControlToValidate="Costo_Alquiler"
                                                IsValidEmpty="False"
                                                EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                                InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                                MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                                MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                                MinimumValue="0.0000"
                                                MaximumValue="9999999999999.9999" 
                                                Display="Dynamic"
                                                EmptyValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>'
                                                InvalidValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>'
                                                MaximumValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>' 
                                                MinimumValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>'
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
                                                ID="lblCosto_Repuesto" 
                                                runat="server"                                                
                                                Text='<%# GetLocalResourceObject("Costo_RepuestoRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>
                                        <td 
                                            style="white-space:nowrap">
                                            <asp:TextBox 
                                            ID="Costo_Repuesto"
                                            Style="text-align:right"
                                            CssClass="TEXTO_EDICION_KCG" 
                                            runat="server" 
                                            Text='<%# Bind("Costo_Repuesto") %>'
                                            ToolTip='<%# GetLocalResourceObject("Costo_RepuestoRecursoKCG.ToolTip").ToString() %>'>
                                            </asp:TextBox>
                                            <asp:Label 
                                                ID="Label1" 
                                                runat="server" 
                                                Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                            </asp:Label>
                                            <AjaxControlToolkit:MaskedEditExtender 
                                                ID="meeCosto_Repuesto" 
                                                runat="server"
                                                TargetControlID="Costo_Repuesto"
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
                                                ControlExtender="meeCosto_Repuesto"
                                                ControlToValidate="Costo_Repuesto"
                                                IsValidEmpty="False"
                                                EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                                InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                                MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                                MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                                MinimumValue="0.0000"
                                                MaximumValue="9999999999999.9999" 
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
                                        <td>
                                            <asp:Label 
                                                ID="lblCosto_Otros" 
                                                runat="server"                                                
                                                Text='<%# GetLocalResourceObject("Costo_OtrosRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>
                                        <td 
                                            style="white-space:nowrap">
                                            <asp:TextBox 
                                                ID="Costo_Otros"
                                                CssClass="TEXTO_EDICION_KCG"
                                                Style="text-align:right"
                                                runat="server" 
                                                Text='<%# Bind("Costo_Otros") %>'
                                                ToolTip='<%# GetLocalResourceObject("Costo_OtrosRecursoKCG.ToolTip").ToString() %>'>
                                            </asp:TextBox>
                                            <asp:Label 
                                                ID="Label4" 
                                                runat="server" 
                                                Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                            </asp:Label>
                                            <AjaxControlToolkit:MaskedEditExtender 
                                                ID="meeCosto_Otros" 
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
                                            <AjaxControlToolkit:MaskedEditValidator 
				                                ID="MaskedEditValidator5" 
				                                runat="server"
                                                ControlExtender="meeCosto_Otros"
                                                ControlToValidate="Costo_Otros"
                                                IsValidEmpty="False"
                                                EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                                InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                                MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                                MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                                MinimumValue="0.0000"
                                                MaximumValue="9999999999999.9999" 
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
                                                ID="lblCosto_Mantenimiento" 
                                                runat="server"                                                
                                                Text='<%# GetLocalResourceObject("Costo_MantenimientoRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>
                                        <td 
                                            style="white-space:nowrap">
                                            <asp:TextBox 
                                                ID="Costo_Mantenimiento"
                                                Style="text-align:right"
                                                CssClass="TEXTO_EDICION_KCG" 
                                                runat="server" 
                                                Text='<%# Bind("Costo_Mantenimiento") %>'
                                                ToolTip='<%# GetLocalResourceObject("Costo_MantenimientoRecursoKCG.ToolTip").ToString() %>'>
                                            </asp:TextBox>
                                            <asp:Label 
                                                ID="Label2" 
                                                runat="server" 
                                                Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                            </asp:Label>
                                            <AjaxControlToolkit:MaskedEditExtender 
                                                ID="meeCosto_Mantenimiento" 
                                                runat="server"
                                                TargetControlID="Costo_Mantenimiento"
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
				                                ID="MaskedEditValidator3" 
				                                runat="server"
                                                ControlExtender="meeCosto_Mantenimiento"
                                                ControlToValidate="Costo_Mantenimiento"
                                                IsValidEmpty="False"
                                                EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                                InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                                MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                                MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                                MinimumValue="0.0000"
                                                MaximumValue="9999999999999.9999" 
                                                Display="Dynamic"
                                                EmptyValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>'
                                                InvalidValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>'
                                                MaximumValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>' 
                                                MinimumValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>'
                                                ValidationGroup="I" />                                        
                                            <AjaxControlToolkit:ValidatorCalloutExtender 
                                                runat="Server" 
                                                ID="ValidatorCalloutExtender3"
                                                TargetControlID="MaskedEditValidator3"/>
                                        </td>
                                        <td >
                                            <asp:Label 
                                                ID="lblCosto_Total" 
                                                runat="server"                                                
                                                Text='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>
                                        <td 
                                            colspan="2">
                                            <asp:TextBox 
                                                ID="Costo_Total" 
                                                runat="server"
                                                Style="text-align:right" 
                                                ReadOnly = "True"
                                                TabIndex = "-1"
                                                Text= '<%# Bind("Costo_Total","{0:N4}") %>'
                                                ToolTip='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.ToolTip").ToString() %>'> 
                                                </asp:TextBox>
                                            <asp:Label 
                                                ID="Label5" 
                                                runat="server" 
                                                Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                            </asp:Label>       
                                        </td>                                        
                                    </tr> 
                                    <tr>
                                        <td>
                                            <asp:Label 
                                                ID="lblCosto_Hora" 
                                                runat="server"                                                
                                                Text='<%# GetLocalResourceObject("Costo_HoraRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>
                                        <td 
                                            style="white-space:nowrap">
                                            <asp:TextBox 
                                                ID="Costo_Hora"
                                                ReadOnly = "True"
                                                TabIndex = "-1"
                                                Style="text-align:right"
                                                runat="server" 
                                                Text='<%# Bind("Costo_Hora","{0:N4}") %>'
                                                ToolTip='<%# GetLocalResourceObject("Costo_HoraRecursoKCG.ToolTip").ToString() %>'>
                                            </asp:TextBox>
                                            <asp:Label 
                                                ID="Label6" 
                                                runat="server" 
                                                Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                            </asp:Label>  
                                        </td>                                        
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label 
                                                ID="lblUpdate_Per_Personal_Nombre" 
                                                runat="server"                                                
                                                Text='<%# GetLocalResourceObject("Update_Per_Personal_NombreRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>               
                                        <td>
                                            <asp:TextBox 
                                                ID="Update_Per_Personal_Nombre"
                                                ReadOnly="true" 
                                                runat="server"
                                                TabIndex="-1" 
                                                Text='<%# Bind("Update_Per_Personal_Nombre") %>'
                                                ToolTip='<%# GetLocalResourceObject("Update_Per_Personal_NombreRecursoKCG.ToolTip").ToString() %>'>
                                            </asp:TextBox>          
                                        </td>
                                        <td>
                                            <asp:Label 
                                                ID="lblFecha_Update" 
                                                runat="server"                                                
                                                Text='<%# GetLocalResourceObject("Fecha_UpdateRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox 
                                                ID="Fecha_Update"
                                                ReadOnly="true"                                                 
                                                runat="server" 
                                                TabIndex="-1"
                                                Text='<%# Bind("Fecha_Update") %>'
                                                ToolTip='<%# GetLocalResourceObject("Fecha_UpdateRecursoKCG.ToolTip").ToString() %>'>
                                            </asp:TextBox>
                                         </td>
                                    </tr>
                                    <tr>
                                        <td 
                                            colspan="2" >
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
                                                ID= "wucMensajeActualizar1" 
                                                runat="server" />
                                        </td>
                                    </tr>  
                             </table>
                             
                              <%--IDs--%>
                               
                                <asp:TextBox 
                                    ID="Int_Sucursal_Id"
                                    Style="display:none"  
                                    runat="server" 
                                    Text='<%# Bind("Int_Sucursal_Id") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Int_Moneda_Id" 
                                    Style="display:none" 
                                    runat="server" 
                                    Text='<%# Bind("Int_Moneda_Id") %>'>
                                </asp:TextBox> 
                                <asp:TextBox 
                                    ID="Creacion_Per_Personal_Id"
                                    Style="display:none"  
                                    runat="server" 
                                    Text='<%# Bind("Creacion_Per_Personal_Id") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Update_Per_Personal_Id"
                                     Style="display:none"  
                                    runat="server" 
                                    Text='<%# Bind("Update_Per_Personal_Id") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Int_Empresa_Id"
                                     Style="display:none"  
                                    runat="server" 
                                    Text='<%# Bind("Int_Empresa_Id") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Id" 
                                    Style="display:none" 
                                    runat="server" 
                                    Text='<%# Bind("Id") %>'>
                                </asp:TextBox>
                                
                                <%--Campos ocultos--%>
                                            
                                
                                <asp:TextBox 
                                    ID="Int_Sucursal_Codigo"
                                    Visible ="false"  
                                    runat="server" 
                                    Text='<%# Bind("Int_Sucursal_Codigo") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Int_Sucursal_Nombre"
                                    Visible ="false"  
                                    runat="server" 
                                    Text='<%# Bind("Int_Sucursal_Nombre") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Int_Empresa_Codigo" 
                                    Visible ="false" 
                                    runat="server" 
                                    Text='<%# Bind("Int_Empresa_Codigo") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Int_Empresa_Nombre"
                                    Visible ="false" 
                                    runat="server" 
                                    Text='<%# Bind("Int_Empresa_Nombre") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Int_Moneda_Codigo"
                                    Visible ="false"  
                                    runat="server" 
                                    Text='<%# Bind("Int_Moneda_Codigo") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Int_Moneda_Nombre"
                                    Visible ="false"  
                                    runat="server" 
                                    Text='<%# Bind("Int_Moneda_Nombre") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Int_Moneda_Simbolo" 
                                    Visible ="false" 
                                    runat="server" 
                                    Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Creacion_Per_Personal_Codigo"
                                    Visible ="false"  
                                    runat="server" 
                                    Text='<%# Bind("Creacion_Per_Personal_Codigo") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Creacion_Per_Personal_Nombre"
                                    Visible ="false"  
                                    runat="server" 
                                    Text='<%# Bind("Creacion_Per_Personal_Nombre") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Update_Per_Personal_Codigo"
                                    Visible ="false"  
                                    runat="server" 
                                    Text='<%# Bind("Update_Per_Personal_Codigo") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Disponible_Nombre"
                                    Visible ="false"  
                                    runat="server" 
                                    Text='<%# Bind("Disponible_Nombre") %>'>
                                </asp:TextBox>
                                <asp:TextBox
                                    ID="Estado"
                                    Visible ="false"  
                                    runat="server" 
                                    Text='<%# Bind("Estado") %>'>
                                </asp:TextBox>
                                <%-- <asp:TextBox             
                                    ID="Campo_Nombre"
                                    Visible ="false"  
                                    runat="server" 
                                    Text='<%# Bind("Campo_Nombre") %>'>
                                </asp:TextBox>--%>
                                <asp:TextBox 
                                    ID="Estado_Nombre" 
                                    Visible ="false" 
                                    runat="server" 
                                    Text='<%# Bind("Estado_Nombre") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Fecha_Creacion" 
                                    Visible ="false" 
                                    runat="server" 
                                    Text='<%# Bind("Fecha_Creacion") %>'>
                                </asp:TextBox>
                        </EditItemTemplate>                    
                        <InsertItemTemplate>
                                <table>
                                    <tr>
                                        <td colspan="4">
                                            <asp:Label 
                                                ID="lblEstado_Nombre" 
                                                runat="server" 
                                                Text='<%# Bind("Estado_Nombre") %>'>
                                            </asp:Label> 
                                        </td> 
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label 
                                                ID="lblCodigo" 
                                                runat="server"                                                
                                                Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>' >
                                            </asp:Label>
                                        </td>   
                                        <td >
                                            <asp:TextBox 
                                                ID="Codigo" 
                                                runat="server" 
                                                Text='<%# Bind("Codigo") %>'                                               
                                                ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'
                                                TabIndex="-1"
                                                ReadOnly = "true">
                                                
                                            </asp:TextBox>                                        
                                        </td>
                                        <td>
                                            <asp:Label 
                                                ID="lblDisponible" 
                                                runat="server"                                                
                                                Text='<%# GetLocalResourceObject("DisponibleRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList 
                                                ID="Disponible" 
                                                runat="server" 
                                                CssClass="TEXTO_EDICION_KCG"
                                                DataSourceID="odsDisponible" 
                                                DataTextField="Nombre" 
                                                DataValueField="Dic_Dominio_Dominio" 
                                                TabIndex="-1"
                                                SelectedValue='<%# Bind("Disponible") %>' 
                                                OnDataBound="Disponible_DataBound">
                                            </asp:DropDownList><asp:ObjectDataSource 
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
                                                        DefaultValue="" 
                                                        Name="s" 
                                                        SessionField="Scope" 
                                                        Type="Object" />
                                                    <asp:Parameter 
                                                        DefaultValue="APU_EQUIPO" 
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
                                                ID="lblNombre" 
                                                runat="server" 
                                                AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                                AssociatedControlID="Nombre"                                               
                                                Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>                                         
                                        <td colspan="4">
                                            <asp:TextBox 
                                                Width="400px"
                                                CssClass="TEXTO_EDICION_KCG"
                                                Style="text-transform:uppercase" 
                                                ID="Nombre" 
                                                runat="server" 
                                                Text='<%# Bind("Nombre") %>'  
                                                Height ="50px"
                                                TextMode="MultiLine"                                             
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
                                                ID="caValidator"
                                                TargetControlID="rfvNombre"/>
                                        </td>
                                     </tr>
                                     <tr>
                                        <td>
                                            <asp:Label 
                                                ID="lblCosto_Combustible" 
                                                runat="server"                                                
                                                Text='<%# GetLocalResourceObject("Costo_CombustibleRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>
                                        <td
                                            style="white-space:nowrap">
                                            <asp:TextBox 
                                                 CssClass="TEXTO_EDICION_KCG"
                                                 Style="text-align:right"
                                                ID="Costo_Combustible" 
                                                runat="server" 
                                                Text='<%# Bind("Costo_Combustible") %>'
                                                ToolTip='<%# GetLocalResourceObject("Costo_CombustibleRecursoKCG.ToolTip").ToString() %>'>
                                            </asp:TextBox>
                                            <asp:Label 
                                                ID="lblMoneda" 
                                                runat="server" 
                                                Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                            </asp:Label>
                                            <AjaxControlToolkit:MaskedEditExtender 
                                                ID="meeCosto_Combustible" 
                                                runat="server"
                                                TargetControlID="Costo_Combustible"
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
                                                ControlExtender="meeCosto_Combustible"
                                                ControlToValidate="Costo_Combustible"
                                                IsValidEmpty="False"
                                                EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                                InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                                MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                                MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                                MinimumValue="0.0000"
                                                MaximumValue="9999999999999.9999" 
                                                Display="Dynamic"
                                                EmptyValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>'
                                                InvalidValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>'
                                                MaximumValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>' 
                                                MinimumValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>'
                                                ValidationGroup="I" />                                        
                                            <AjaxControlToolkit:ValidatorCalloutExtender 
                                                runat="Server" 
                                                ID="ValidatorCalloutExtender2"
                                                TargetControlID="MaskedEditValidator1"/>
                                        </td>
                                        <td>
                                            <asp:Label 
                                                ID="lblCosto_Alquiler" 
                                                runat="server"                                                
                                                Text='<%# GetLocalResourceObject("Costo_AlquilerRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>
                                        <td 
                                            style="white-space:nowrap">
                                            <asp:TextBox 
                                                ID="Costo_Alquiler"
                                                Style="text-align:right"
                                                CssClass="TEXTO_EDICION_KCG" 
                                                runat="server" 
                                                Text='<%# Bind("Costo_Alquiler") %>'
                                                ToolTip='<%# GetLocalResourceObject("Costo_AlquilerRecursoKCG.ToolTip").ToString() %>'>
                                            </asp:TextBox>
                                            <asp:Label 
                                                ID="Label9" 
                                                runat="server" 
                                                Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                            </asp:Label>
                                            <AjaxControlToolkit:MaskedEditExtender 
                                                ID="meeCosto_Alquiler" 
                                                runat="server"
                                                TargetControlID="Costo_Alquiler"
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
				                                ID="MaskedEditValidator4" 
				                                runat="server"
                                                ControlExtender="meeCosto_Alquiler"
                                                ControlToValidate="Costo_Alquiler"
                                                IsValidEmpty="False"
                                                EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                                InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                                MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                                MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                                MinimumValue="0.0000"
                                                MaximumValue="9999999999999.9999" 
                                                Display="Dynamic"
                                                EmptyValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>'
                                                InvalidValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>'
                                                MaximumValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>' 
                                                MinimumValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>'
                                                ValidationGroup="I" />                                        
                                            <AjaxControlToolkit:ValidatorCalloutExtender 
                                                runat="Server" 
                                                ID="ValidatorCalloutExtender5"
                                                TargetControlID="MaskedEditValidator4" /> 
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label 
                                                ID="lblCosto_Repuesto" 
                                                runat="server"                                                
                                                Text='<%# GetLocalResourceObject("Costo_RepuestoRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>
                                        <td
                                            style="white-space:nowrap">
                                            <asp:TextBox 
                                                ID="Costo_Repuesto"
                                                Style="text-align:right"
                                                CssClass="TEXTO_EDICION_KCG" 
                                                runat="server" 
                                                Text='<%# Bind("Costo_Repuesto") %>'
                                                ToolTip='<%# GetLocalResourceObject("Costo_RepuestoRecursoKCG.ToolTip").ToString() %>'>
                                            </asp:TextBox>
                                            <asp:Label 
                                                ID="Label7" 
                                                runat="server" 
                                                Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                            </asp:Label>
                                            <AjaxControlToolkit:MaskedEditExtender 
                                                ID="meeCosto_Repuesto" 
                                                runat="server"
                                                TargetControlID="Costo_Repuesto"
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
                                                ControlExtender="meeCosto_Repuesto"
                                                ControlToValidate="Costo_Repuesto"
                                                IsValidEmpty="False"
                                                EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                                InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                                MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                                MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                                MinimumValue="0.0000"
                                                MaximumValue="9999999999999.9999" 
                                                Display="Dynamic"
                                                EmptyValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>'
                                                InvalidValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>'
                                                MaximumValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>' 
                                                MinimumValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>'
                                                ValidationGroup="I" />                                        
                                            <AjaxControlToolkit:ValidatorCalloutExtender 
                                                runat="Server" 
                                                ID="ValidatorCalloutExtender3"
                                                TargetControlID="MaskedEditValidator2"/>                                      
                                        </td>
                                        <td>
                                            <asp:Label 
                                                ID="lblCosto_Otros" 
                                                runat="server"                                                
                                                Text='<%# GetLocalResourceObject("Costo_OtrosRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>
                                        <td 
                                            style="white-space:nowrap">
                                            <asp:TextBox 
                                                ID="Costo_Otros"
                                                CssClass="TEXTO_EDICION_KCG"
                                                Style="text-align:right"
                                                runat="server" 
                                                Text='<%# Bind("Costo_Otros") %>'
                                                ToolTip='<%# GetLocalResourceObject("Costo_OtrosRecursoKCG.ToolTip").ToString() %>'>
                                            </asp:TextBox>
                                            <asp:Label 
                                                ID="Label10" 
                                                runat="server" 
                                                Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                            </asp:Label>
                                            <AjaxControlToolkit:MaskedEditExtender 
                                                ID="meeCosto_Otros" 
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
                                            <AjaxControlToolkit:MaskedEditValidator 
				                                ID="MaskedEditValidator5" 
				                                runat="server"
                                                ControlExtender="meeCosto_Otros"
                                                ControlToValidate="Costo_Otros"
                                                IsValidEmpty="False"
                                                EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                                InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                                MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                                MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                                MinimumValue="0.0000"
                                                MaximumValue="9999999999999.9999" 
                                                Display="Dynamic"
                                                EmptyValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>'
                                                InvalidValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>'
                                                MaximumValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>' 
                                                MinimumValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>'
                                                ValidationGroup="I" />                                        
                                            <AjaxControlToolkit:ValidatorCalloutExtender 
                                                runat="Server" 
                                                ID="ValidatorCalloutExtender6"
                                                TargetControlID="MaskedEditValidator5" />
                                        </td>                                        
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label 
                                                ID="lblCosto_Mantenimiento" 
                                                runat="server"                                                
                                                Text='<%# GetLocalResourceObject("Costo_MantenimientoRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>
                                        <td 
                                            style="white-space:nowrap">
                                            <asp:TextBox 
                                                ID="Costo_Mantenimiento"
                                                Style="text-align:right"
                                                CssClass="TEXTO_EDICION_KCG" 
                                                runat="server" 
                                                Text='<%# Bind("Costo_Mantenimiento") %>'
                                                ToolTip='<%# GetLocalResourceObject("Costo_MantenimientoRecursoKCG.ToolTip").ToString() %>'>
                                            </asp:TextBox>
                                            <asp:Label 
                                                ID="Label8" 
                                                runat="server" 
                                                Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                            </asp:Label>
                                            <AjaxControlToolkit:MaskedEditExtender 
                                                ID="meeCosto_Mantenimiento" 
                                                runat="server"
                                                TargetControlID="Costo_Mantenimiento"
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
				                                ID="MaskedEditValidator3" 
				                                runat="server"
                                                ControlExtender="meeCosto_Mantenimiento"
                                                ControlToValidate="Costo_Mantenimiento"
                                                IsValidEmpty="False"
                                                EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                                InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                                MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                                MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                                MinimumValue="0.0000"
                                                MaximumValue="9999999999999.9999" 
                                                Display="Dynamic"
                                                EmptyValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>'
                                                InvalidValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>'
                                                MaximumValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>' 
                                                MinimumValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>'
                                                ValidationGroup="I" />                                        
                                            <AjaxControlToolkit:ValidatorCalloutExtender 
                                                runat="Server" 
                                                ID="ValidatorCalloutExtender1"
                                                TargetControlID="MaskedEditValidator3"/> 
                                        </td>
                                        <td>
                                            <asp:Label 
                                                ID="lblCosto_Total" 
                                                runat="server"                                                
                                                Text='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>
                                        <td 
                                            style="white-space:nowrap">
                                            <asp:TextBox 
                                                ID="Costo_Total" 
                                                runat="server"
                                                Style="text-align:right" 
                                                ReadOnly = "True"
                                                TabIndex = "-1"
                                                Text= '<%# Bind("Costo_Total","{0:N4}") %>'
                                                ToolTip='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.ToolTip").ToString() %>'> 
                                                </asp:TextBox>
                                            <asp:Label 
                                                ID="Label11" 
                                                runat="server" 
                                                Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                            </asp:Label>                                               
                                               <script 
                                                    type="text/javascript">
                                                        Sys.Application.add_load(page_load);
                                                        Sys.Application.add_unload(page_unload);
                                                        
                                                        var Costo_Combustible = null;
                                                        var Costo_Repuesto = null; 
                                                        var Costo_Mantenimiento = null; 
                                                        var Costo_Alquiler = null; 
                                                        var Costo_Otros = null;
                                                        var Costo_Total = null; 

                                                        
                                                        function page_load(sender, e){
                                                        Costo_Combustible = $get("ctl00_ContentPlaceHolder1_FormViewEquipos_Costo_Combustible");
                                                        Costo_Repuesto = $get("ctl00_ContentPlaceHolder1_FormViewEquipos_Costo_Repuesto");
                                                        Costo_Mantenimiento = $get("ctl00_ContentPlaceHolder1_FormViewEquipos_Costo_Mantenimiento");
                                                        Costo_Alquiler = $get("ctl00_ContentPlaceHolder1_FormViewEquipos_Costo_Alquiler");
                                                        Costo_Otros = $get("ctl00_ContentPlaceHolder1_FormViewEquipos_Costo_Otros");
                                                        
                                                        Costo_Total = $get("ctl00_ContentPlaceHolder1_FormViewEquipos_Costo_Total");
                                                        Costo_Hora = $get("ctl00_ContentPlaceHolder1_FormViewEquipos_Costo_Hora");

                                                        $addHandler(Costo_Combustible, "change", datos_onchange);
                                                        $addHandler(Costo_Repuesto, "change", datos_onchange);
                                                        $addHandler(Costo_Mantenimiento, "change", datos_onchange);
                                                        $addHandler(Costo_Alquiler, "change", datos_onchange);
                                                        $addHandler(Costo_Otros, "change", datos_onchange);
                                                        }
                                                        
                                                        function page_unload(sender, e){
                                                        $removeHandler(Costo_Combustible, "change", datos_onchange);
                                                        $removeHandler(Costo_Repuesto, "change", datos_onchange);
                                                        $removeHandler(Costo_Mantenimiento, "change", datos_onchange);
                                                        $removeHandler(Costo_Alquiler, "change", datos_onchange);
                                                        $removeHandler(Costo_Otros, "change", datos_onchange);
                                                        }
                                                        
                                                        function datos_onchange(sender, e){
                                                        Sumar();
                                                        }
                                                        
                                                        function Sumar()
                                                        {
                                                        var costoTotalCalculado = 0.00;
                                                        
                                                        var numCosto_Combustible = Number.parseLocale(Costo_Combustible.value);
                                                        if(!isNaN(numCosto_Combustible))
                                                            costoTotalCalculado += numCosto_Combustible;

                                                        var numCosto_Repuesto = Number.parseLocale(Costo_Repuesto.value);
                                                        if(!isNaN(numCosto_Repuesto))
                                                            costoTotalCalculado += numCosto_Repuesto;
                                                        
                                                        var numCosto_Mantenimiento = Number.parseLocale(Costo_Mantenimiento.value);
                                                        if(!isNaN(numCosto_Mantenimiento))
                                                            costoTotalCalculado += numCosto_Mantenimiento;
           
                                                        var numCosto_Alquiler = Number.parseLocale(Costo_Alquiler.value);
                                                        if(!isNaN(numCosto_Alquiler))
                                                            costoTotalCalculado += numCosto_Alquiler;

                                                        var numCosto_Otros = Number.parseLocale(Costo_Otros.value);
                                                        if(!isNaN(numCosto_Otros))
                                                            costoTotalCalculado += numCosto_Otros;

                                                        numCosto_Hora = costoTotalCalculado / 8;
                                                        numCosto_Hora = Redondear(numCosto_Hora, 4);
                                                        
                                                        Costo_Total.value = costoTotalCalculado.localeFormat("N4");
                                                        Costo_Hora.value = numCosto_Hora.localeFormat("N4");
                                                        }
                                                        
                                                        function Redondear(x,numeroDecimales) {
	                                                        return (Math.round(x*Math.pow(10,numeroDecimales)))/Math.pow(10,numeroDecimales);
                                                        }
                                                </script> 
                                        </td>                                        
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label 
                                                ID="lblCosto_Hora" 
                                                runat="server"                                                
                                                Text='<%# GetLocalResourceObject("Costo_HoraRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>
                                        <td
                                            style="white-space:nowrap">
                                            <asp:TextBox 
                                                ID="Costo_Hora"
                                                ReadOnly = "True"
                                                TabIndex = "-1"
                                                Style="text-align:right"
                                                runat="server" 
                                                Text='<%# Bind("Costo_Hora","{0:N4}") %>'
                                                ToolTip='<%# GetLocalResourceObject("Costo_HoraRecursoKCG.ToolTip").ToString() %>'>
                                            </asp:TextBox>
                                            <asp:Label 
                                                ID="Label12" 
                                                runat="server" 
                                                Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                            </asp:Label>
                                        </td>                                        
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label 
                                                ID="lblUpdate_Per_Personal_Nombre" 
                                                runat="server"                                                
                                                Text='<%# GetLocalResourceObject("Update_Per_Personal_NombreRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>               
                                        <td >
                                            <asp:TextBox 
                                                ID="Update_Per_Personal_Nombre"
                                                ReadOnly="true" 
                                                runat="server" 
                                                TabIndex="-1"
                                                Text='<%# Bind("Update_Per_Personal_Nombre") %>'
                                                ToolTip='<%# GetLocalResourceObject("Update_Per_Personal_NombreRecursoKCG.ToolTip").ToString() %>'>
                                            </asp:TextBox>          
                                        </td>
                                        <td >
                                            <asp:Label 
                                                ID="lblFecha_Update" 
                                                runat="server"                                                
                                                Text='<%# GetLocalResourceObject("Fecha_UpdateRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>
                                        <td >
                                            <asp:TextBox 
                                                ID="Fecha_Update"
                                                ReadOnly="true"
                                                runat="server" 
                                                TabIndex="-1"
                                                Text='<%# Bind("Fecha_Update") %>'
                                                ToolTip='<%# GetLocalResourceObject("Fecha_UpdateRecursoKCG.ToolTip").ToString() %>'>
                                            </asp:TextBox>
                                         </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            <asp:Button 
                                                ID="InsertButton" 
                                                runat="server" 
                                                CausesValidation="True" 
                                                CommandName="Insert"
                                                ValidationGroup="I"
                                                AccessKey="I"
                                                Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_InsertRecursoKCG.Text").ToString() %>'
                                                ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_InsertRecursoKCG.ToolTip").ToString() %>'>
                                            </asp:Button>
                                            <asp:Button 
                                                ID="InsertCancelButton" 
                                                runat="server" 
                                                CausesValidation="False" 
                                                CommandName="Cancel"
                                                AccessKey="C"
                                                Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_CancelRecursoKCG.Text").ToString() %>'
                                                ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_CancelRecursoKCG.ToolTip").ToString() %>'>
                                            </asp:Button>
                                        </td>
                                    </tr>
                                </table>                      
                             
                              <%--IDs--%>                               
                              
                                <asp:TextBox 
                                    ID="Int_Sucursal_Id"
                                    Style="display:none"  
                                    runat="server" 
                                    Text='<%# Bind("Int_Sucursal_Id") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Int_Moneda_Id" 
                                    Style="display:none" 
                                    runat="server" 
                                    Text='<%# Bind("Int_Moneda_Id") %>'>
                                </asp:TextBox> 
                                <asp:TextBox 
                                    ID="Creacion_Per_Personal_Id"
                                    Style="display:none"  
                                    runat="server" 
                                    Text='<%# Bind("Creacion_Per_Personal_Id") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Update_Per_Personal_Id"
                                     Style="display:none"  
                                    runat="server" 
                                    Text='<%# Bind("Update_Per_Personal_Id") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Int_Empresa_Id"
                                     Style="display:none"  
                                    runat="server" 
                                    Text='<%# Bind("Int_Empresa_Id") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Id" 
                                    Style="display:none" 
                                    runat="server" 
                                    Text='<%# Bind("Id") %>'>
                                </asp:TextBox>
                                
                                <%--Campos ocultos--%>                        
                            
                                <asp:TextBox
                                    ID="Int_Sucursal_Codigo"
                                    Visible ="false"  
                                    runat="server" 
                                    Text='<%# Bind("Int_Sucursal_Codigo") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Int_Sucursal_Nombre"
                                    Visible ="false"  
                                    runat="server" 
                                    Text='<%# Bind("Int_Sucursal_Nombre") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Int_Empresa_Codigo" 
                                    Visible ="false" 
                                    runat="server" 
                                    Text='<%# Bind("Int_Empresa_Codigo") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Int_Empresa_Nombre"
                                    Visible ="false" 
                                    runat="server" 
                                    Text='<%# Bind("Int_Empresa_Nombre") %>'>
                                </asp:TextBox>
                                <asp:TextBox
                                    ID="Int_Moneda_Codigo"
                                    Visible ="false"  
                                    runat="server" 
                                    Text='<%# Bind("Int_Moneda_Codigo") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Int_Moneda_Nombre"
                                    Visible ="false"  
                                    runat="server" 
                                    Text='<%# Bind("Int_Moneda_Nombre") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Int_Moneda_Simbolo" 
                                    Visible ="false" 
                                    runat="server" 
                                    Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Creacion_Per_Personal_Codigo"
                                    Visible ="false"  
                                    runat="server" 
                                    Text='<%# Bind("Creacion_Per_Personal_Codigo") %>'>
                                </asp:TextBox>
                                <asp:TextBox
                                    ID="Creacion_Per_Personal_Nombre"
                                    Visible ="false"  
                                    runat="server" 
                                    Text='<%# Bind("Creacion_Per_Personal_Nombre") %>'>
                                </asp:TextBox>
                                <asp:TextBox
                                    ID="Update_Per_Personal_Codigo"
                                    Visible ="false"  
                                    runat="server" 
                                    Text='<%# Bind("Update_Per_Personal_Codigo") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Disponible_Nombre"
                                    Visible ="false"  
                                    runat="server" 
                                    Text='<%# Bind("Disponible_Nombre") %>'>
                                </asp:TextBox>
                                <asp:TextBox
                                    ID="Estado"
                                    Visible ="false"  
                                    runat="server" 
                                    Text='<%# Bind("Estado") %>'>
                                </asp:TextBox>
                                <asp:TextBox             
                                    ID="Campo_Nombre"
                                    Visible ="false"  
                                    runat="server" 
                                    Text='<%# Bind("Campo_Nombre") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Estado_Nombre" 
                                    Visible ="false" 
                                    runat="server" 
                                    Text='<%# Bind("Estado_Nombre") %>'>
                                </asp:TextBox>
                                 <asp:TextBox 
                                    ID="Fecha_Creacion"
                                    Visible ="false"  
                                    runat="server" 
                                    Text='<%# Bind("Fecha_Creacion") %>'>
                                </asp:TextBox>               
                        </InsertItemTemplate>
                        <ItemTemplate>
                                <table>
                                    <tr>
                                        <td colspan="4">
                                            <asp:Label 
                                                ID="lblEstado_Nombre" 
                                                runat="server" 
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
                                                Readonly="true"
                                                TabIndex="-1"
                                                Text='<%# Bind("Codigo") %>'                                               
                                                ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'>
                                            </asp:TextBox>                                        
                                         </td>
                                        <td>
                                            <asp:Label 
                                                ID="lblDisponible" 
                                                runat="server"                                                
                                                Text='<%# GetLocalResourceObject("DisponibleRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox 
                                                ID="Disponible" 
                                                runat="server" 
                                                Readonly="true"
                                                TabIndex="-1"
                                                Text='<%# Bind("Disponible") %>'
                                                ToolTip='<%# GetLocalResourceObject("DisponibleRecursoKCG.ToolTip").ToString() %>'>
                                             </asp:TextBox>
                                        </td>
                                     </tr>
                                    <tr>
                                        <td >
                                            <asp:Label 
                                                ID="lblNombre" 
                                                runat="server"                                             
                                                Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>                                         
                                        <td colspan ="4">
                                            <asp:TextBox
                                                Width ="400px" 
                                                ID="Nombre" 
                                                runat="server"
                                                Readonly="true" 
                                                CssClass="TEXTO_LECTURA_KCG" 
                                                TabIndex="-1"
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
                                                ID="lblCosto_Combustible" 
                                                runat="server"                                                
                                                Text='<%# GetLocalResourceObject("Costo_CombustibleRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>
                                        <td
                                            style="white-space:nowrap">
                                            <asp:TextBox 
                                                ID="Costo_Combustible"
                                                Style="text-align:right" 
                                                runat="server" 
                                                Readonly="true"
                                                TabIndex="-1"
                                                Text='<%# Bind("Costo_Combustible","{0:N4}") %>'
                                                ToolTip='<%# GetLocalResourceObject("Costo_CombustibleRecursoKCG.ToolTip").ToString() %>'>
                                            </asp:TextBox>
                                            <asp:Label 
                                                ID="lblMoneda" 
                                                runat="server" 
                                                Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                            </asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label 
                                                ID="lblCosto_Alquiler" 
                                                runat="server"                               
                                                Text='<%# GetLocalResourceObject("Costo_AlquilerRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>
                                        <td 
                                            style="white-space:nowrap">
                                            <asp:TextBox 
                                                ID="Costo_Alquiler"
                                                Readonly="true"
                                                Style="text-align:right"  
                                                runat="server" 
                                                TabIndex="-1"
                                                Text='<%# Bind("Costo_Alquiler","{0:N4}") %>'
                                                ToolTip='<%# GetLocalResourceObject("Costo_AlquilerRecursoKCG.ToolTip").ToString() %>'>
                                            </asp:TextBox>
                                            <asp:Label 
                                                ID="Label15" 
                                                runat="server" 
                                                Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                            </asp:Label>
                                         </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label 
                                                ID="lblCosto_Repuesto" 
                                                runat="server"                                                
                                                Text='<%# GetLocalResourceObject("Costo_RepuestoRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>
                                        <td 
                                            style="white-space:nowrap">
                                            <asp:TextBox 
                                            ID="Costo_Repuesto"
                                            Readonly="true"
                                            Style="text-align:right"
                                            runat="server" 
                                            TabIndex="-1"
                                            Text='<%# Bind("Costo_Repuesto","{0:N4}") %>'
                                            ToolTip='<%# GetLocalResourceObject("Costo_RepuestoRecursoKCG.ToolTip").ToString() %>'>
                                            </asp:TextBox>
                                            <asp:Label 
                                                ID="Label13" 
                                                runat="server" 
                                                Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                            </asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label 
                                                ID="lblCosto_Otros" 
                                                runat="server"                                                
                                                Text='<%# GetLocalResourceObject("Costo_OtrosRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>
                                        <td 
                                            style="white-space:nowrap">
                                            <asp:TextBox 
                                                ID="Costo_Otros"
                                                Readonly="true"
                                                Style="text-align:right"  
                                                runat="server" 
                                                TabIndex="-1"
                                                Text='<%# Bind("Costo_Otros","{0:N4}") %>'
                                                ToolTip='<%# GetLocalResourceObject("Costo_OtrosRecursoKCG.ToolTip").ToString() %>'>
                                            </asp:TextBox>
                                            <asp:Label 
                                                ID="Label16" 
                                                runat="server" 
                                                Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                            </asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label 
                                                ID="lblCosto_Mantenimiento" 
                                                runat="server"                                                
                                                Text='<%# GetLocalResourceObject("Costo_MantenimientoRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>
                                        <td 
                                            style="white-space:nowrap">
                                            <asp:TextBox 
                                                ID="Costo_Mantenimiento"
                                                Readonly="true"
                                                Style="text-align:right"
                                                runat="server"
                                                TabIndex="-1" 
                                                Text='<%# Bind("Costo_Mantenimiento","{0:N4}") %>'
                                                ToolTip='<%# GetLocalResourceObject("Costo_MantenimientoRecursoKCG.ToolTip").ToString() %>'>
                                            </asp:TextBox>
                                            <asp:Label 
                                                ID="Label14" 
                                                runat="server" 
                                                Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                            </asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label 
                                                ID="lblCosto_Total" 
                                                runat="server"                                                
                                                Text='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>
                                        <td 
                                            style="white-space:nowrap">
                                            <asp:TextBox 
                                                ID="Costo_Total"
                                                Style="text-align:right" 
                                                runat="server"
                                                TabIndex="-1"
                                                Readonly="true"   
                                                Text='<%# Bind("Costo_Total","{0:N4}") %>'
                                                ToolTip='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.ToolTip").ToString() %>'></asp:TextBox>
                                            <asp:Label 
                                                ID="Label17" 
                                                runat="server" 
                                                Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                            </asp:Label>
                                        </td>                                        
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label 
                                                ID="lblCosto_Hora" 
                                                runat="server"                                                
                                                Text='<%# GetLocalResourceObject("Costo_HoraRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>
                                        <td
                                            style="white-space:nowrap">
                                            <asp:TextBox 
                                                ID="Costo_Hora"
                                                Style="text-align:right"
                                                Readonly="true"  
                                                runat="server" 
                                                TabIndex="-1"
                                                Text='<%# Bind("Costo_Hora","{0:N4}") %>'
                                                ToolTip='<%# GetLocalResourceObject("Costo_HoraRecursoKCG.ToolTip").ToString() %>'>
                                            </asp:TextBox>
                                            <asp:Label 
                                                ID="Label18" 
                                                runat="server" 
                                                Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                            </asp:Label>
                                        </td>                                        
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label 
                                                ID="lblUpdate_Per_Personal_Nombre" 
                                                runat="server"                                                
                                                Text='<%# GetLocalResourceObject("Update_Per_Personal_NombreRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>               
                                        <td>
                                            <asp:TextBox 
                                                ID="Update_Per_Personal_Nombre"
                                                Readonly="true"  
                                                runat="server"
                                                TabIndex="-1" 
                                                Text='<%# Bind("Update_Per_Personal_Nombre") %>'
                                                ToolTip='<%# GetLocalResourceObject("Update_Per_Personal_NombreRecursoKCG.ToolTip").ToString() %>'>
                                            </asp:TextBox>          
                                        </td>
                                        <td>
                                            <asp:Label 
                                                ID="lblFecha_Update" 
                                                runat="server"                                                
                                                Text='<%# GetLocalResourceObject("Fecha_UpdateRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox 
                                                ID="Fecha_Update" 
                                                Readonly="true"  
                                                runat="server" 
                                                TabIndex="-1"
                                                Text='<%# Bind("Fecha_Update") %>'
                                                ToolTip='<%# GetLocalResourceObject("Fecha_UpdateRecursoKCG.ToolTip").ToString() %>'>
                                            </asp:TextBox>
                                         </td>
                                     </tr>
                                    <tr align="left">
                                        <td colspan="4" >
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

                             
                              <%--IDs--%>
                               
                                
                                <asp:TextBox 
                                    ID="Int_Sucursal_Id"
                                    Style="display:none"  
                                    runat="server" 
                                    Text='<%# Bind("Int_Sucursal_Id") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Int_Moneda_Id" 
                                    Style="display:none" 
                                    runat="server" 
                                    Text='<%# Bind("Int_Moneda_Id") %>'>
                                </asp:TextBox> 
                                <asp:TextBox 
                                    ID="Creacion_Per_Personal_Id"
                                    Style="display:none"  
                                    runat="server" 
                                    Text='<%# Bind("Creacion_Per_Personal_Id") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Update_Per_Personal_Id"
                                     Style="display:none"  
                                    runat="server" 
                                    Text='<%# Bind("Update_Per_Personal_Id") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Int_Empresa_Id"
                                     Style="display:none"  
                                    runat="server" 
                                    Text='<%# Bind("Int_Empresa_Id") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Id" 
                                    Style="display:none" 
                                    runat="server" 
                                    Text='<%# Bind("Id") %>'>
                                </asp:TextBox>
                                
                                <%--Campos ocultos--%>
                                            
                                
                                <asp:TextBox 
                                    ID="Int_Sucursal_Codigo"
                                    Visible ="false"  
                                    runat="server" 
                                    Text='<%# Bind("Int_Sucursal_Codigo") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Int_Sucursal_Nombre"
                                    Visible ="false"  
                                    runat="server" 
                                    Text='<%# Bind("Int_Sucursal_Nombre") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Int_Empresa_Codigo" 
                                    Visible ="false" 
                                    runat="server" 
                                    Text='<%# Bind("Int_Empresa_Codigo") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Int_Empresa_Nombre"
                                    Visible ="false" 
                                    runat="server" 
                                    Text='<%# Bind("Int_Empresa_Nombre") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Int_Moneda_Codigo"
                                    Visible ="false"  
                                    runat="server" 
                                    Text='<%# Bind("Int_Moneda_Codigo") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Int_Moneda_Nombre"
                                    Visible ="false"  
                                    runat="server" 
                                    Text='<%# Bind("Int_Moneda_Nombre") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Int_Moneda_Simbolo" 
                                    Visible ="false" 
                                    runat="server" 
                                    Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Creacion_Per_Personal_Codigo"
                                    Visible ="false"  
                                    runat="server" 
                                    Text='<%# Bind("Creacion_Per_Personal_Codigo") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Creacion_Per_Personal_Nombre"
                                    Visible ="false"  
                                    runat="server" 
                                    Text='<%# Bind("Creacion_Per_Personal_Nombre") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Update_Per_Personal_Codigo"
                                    Visible ="false"  
                                    runat="server" 
                                    Text='<%# Bind("Update_Per_Personal_Codigo") %>'>
                                </asp:TextBox>
                                <asp:TextBox
                                    ID="Disponible_Nombre"
                                    Visible ="false"  
                                    runat="server" 
                                    Text='<%# Bind("Disponible_Nombre") %>'>
                                </asp:TextBox>
                                <asp:TextBox
                                    ID="Estado"
                                    Visible ="false"  
                                    runat="server" 
                                    Text='<%# Bind("Estado") %>'>
                                </asp:TextBox>
                                <%--<asp:TextBox             
                                    ID="Campo_Nombre"
                                    Visible ="false"  
                                    runat="server" 
                                    Text='<%# Bind("Campo_Nombre") %>'>
                                </asp:TextBox>--%>
                               
                                <asp:TextBox 
                                    ID="Fecha_Creacion" 
                                    Visible ="false" 
                                    runat="server" 
                                    Text='<%# Bind("Fecha_Creacion") %>'>
                                </asp:TextBox>
                        </ItemTemplate>
                    </asp:FormView>
                    </asp:Panel>
                    <koala:KNavegacion 
                    ID="nav"
                    runat="server"                         
                    GridViewID="GridViewEquipos"
                    FormViewID="FormViewEquipos" 
                    OnNavegar="nav_Siguiente" />
               </ContentTemplate>      
                <Triggers>
                    <asp:AsyncPostBackTrigger 
                    ControlID="GridViewEquipos" 
                    EventName="SelectedIndexChanged" />
               </Triggers>
        </asp:UpdatePanel>       
        <asp:ObjectDataSource 
            ID="OdsApu_Equipo" 
            runat="server" 
            DeleteMethod="Delete"
            InsertMethod="Insert"
            OldValuesParameterFormatString="original{0}"
            SelectMethod="GetById" 
            TypeName="FEL.APU.BO_Apu_Equipo" 
            ConflictDetection="CompareAllValues" 
            SortParameterName="sortExpression" 
            UpdateMethod="Update">         
            <SelectParameters>
                <asp:SessionParameter 
                Name="s" 
                SessionField="Scope" 
                Type="Object" />
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
                    <koala:KFiltro 
                        ID="kftFiltro" 
                        runat="server" 
                        Contenedor="APU_EQUIPO" 
                        Objeto="APU_EQUIPO" 
                        IndiceScope ="Scope"
                        Orden="1" 
                        ObjectDataSourceID="OdsgvEquipos"/>
                    <asp:Button 
                        ID="btn_Clonar" 
                        runat="server" 
                        OnClick="btn_Clonar_Click" />
                    <asp:Button 
                        ID="btn_Historico" 
                        runat="server" 
                        OnClick="btn_Historico_Click" />
                    <asp:Panel 
                        runat="server" 
                        ID="pnlEquipo"  
                        meta:resourcekey="Rec_Listado_EquipoRecursoKCG">                                                    
                        <koala:KGrid                            
                            ID="GridViewEquipos"  
                            runat="server" 
                            AllowPaging="True"
                            AllowSorting="True" 
                            AutoGenerateColumns="False"
                            AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>'
                            DataSourceID="OdsgvEquipos" 
                            DataKeyNames="Id">
                            <AlternatingRowStyle 
                                CssClass="alternatingrowstyle" />
                            <HeaderStyle 
                                CssClass="headerstyle" />
                            <PagerStyle 
                                CssClass="pagerstyle" />
                            <SelectedRowStyle 
                                CssClass="selectedrowstyle" />                            
                            <Columns>
                                <asp:CommandField 
                                    ButtonType="Button" 
                                    ShowSelectButton="True" 
                                    SelectText="..." />
                                 <asp:BoundField   
                                    DataField="Codigo"  
                                    meta:ResourceKey ="BoundCodigoRecursoKCG"                                   
                                    SortExpression="Codigo"  > 
                                    <itemstyle horizontalalign="Right" /> 
                                  </asp:BoundField> 
                                <asp:BoundField 
                                    DataField="Nombre" 
                                     meta:ResourceKey ="BoundNombreRecursoKCG"                               
                                    SortExpression="Nombre" >
                                    <itemstyle wrap="True" width="80mm" />
                                </asp:BoundField>
                                <asp:BoundField 
                                    DataField="Costo_Total" 
                                    meta:ResourceKey ="BoundCosto_TotalRecursoKCG"  
                                    SortExpression="Costo_Total" 
                                    dataformatstring="{0:N4}" >
                                     <itemstyle horizontalalign="Right" /> 
                                  </asp:BoundField> 
                                <asp:BoundField 
                                    DataField="Costo_Hora" 
                                    meta:ResourceKey ="BoundCosto_HoraRecursoKCG"
                                    SortExpression="Costo_Hora" 
                                    dataformatstring="{0:N4}" >
                                     <itemstyle horizontalalign="Right" /> 
                                  </asp:BoundField> 
                                <asp:BoundField 
                                    DataField="Fecha_Update" 
                                     meta:ResourceKey ="BoundFecha_UpdateRecursoKCG"                                 
                                    SortExpression="Fecha_Update" >
                                    <itemstyle wrap="False" />
                                    </asp:BoundField>
                                <asp:BoundField 
                                    DataField="Costo_Alquiler" 
                                    HeaderText="Costo_Alquiler" 
                                    SortExpression="Costo_Alquiler" 
                                    Visible="False" />
                                <asp:BoundField 
                                    DataField="Costo_Otros" 
                                    HeaderText="Costo_Otros" 
                                    SortExpression="Costo_Otros" 
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
                                    DataField="Int_Moneda_Simbolo" 
                                    HeaderText="Int_Moneda_Simbolo" 
                                    SortExpression="Int_Moneda_Simbolo" 
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
                                    DataField="Disponible_Nombre" 
                                    HeaderText="Disponible_Nombre" 
                                    SortExpression="Disponible_Nombre" 
                                    Visible="False" />
                                <asp:BoundField 
                                    DataField="Estado_Nombre" 
                                    HeaderText="Estado_Nombre" 
                                    SortExpression="Estado_Nombre" 
                                    Visible="False" />
                                <asp:BoundField                                 
                                    DataField="Campo_Nombre" 
                                    HeaderText="Campo_Nombre" 
                                    SortExpression="Campo_Nombre" 
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
                                <asp:BoundField 
                                    DataField="Disponible" 
                                    HeaderText="Disponible" 
                                    SortExpression="Disponible" 
                                    Visible="False" />
                                <asp:BoundField 
                                    DataField="Costo_Combustible" 
                                    HeaderText="Costo_Combustible" 
                                    SortExpression="Costo_Combustible" 
                                    Visible="False" />
                                <asp:BoundField 
                                    DataField="Costo_Repuesto" 
                                    HeaderText="Costo_Repuesto" 
                                    SortExpression="Costo_Repuesto" 
                                    Visible="False" />
                                <asp:BoundField 
                                    DataField="Costo_Mantenimiento" 
                                    HeaderText="Costo_Mantenimiento"
                                    SortExpression="Costo_Mantenimiento" 
                                    Visible="False" />
                        </Columns>
                       </koala:KGrid>
                   </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>    
        <asp:ObjectDataSource 
                ID="OdsgvEquipos" 
                runat="server" 
                OldValuesParameterFormatString="original_{0}"
                SelectMethod="Get" TypeName="FEL.APU.BO_Apu_Equipo">
         <SelectParameters>
         <asp:SessionParameter 
                Name="s" 
                SessionField="Scope" 
                Type="Object" />
            </SelectParameters>
        </asp:ObjectDataSource>      
</asp:Content>

