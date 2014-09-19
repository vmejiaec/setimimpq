<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="FIS_PLANILLA.aspx.cs" 
    Inherits="FIS_FIS_PLANILLA" 
    StylesheetTheme="EstiloKCG"
    Theme="EstiloKCG"
    meta:resourcekey="Tit_Fis_PlanillaRecursoKCG"%>
    
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
            <script type="text/javascript">
                Sys.Application.add_load(page_load);
                Sys.Application.add_unload(page_unload);
            
                var Fecha_Inicio_Ingreso = null;
            
            function page_load(sender, e)
            {                                                 
                Fecha_Inicio_Ingreso = $get("ctl00_ContentPlaceHolder1_Fv_Fis_Planilla_Fecha_Inicio_Ingreso");
                $addHandler(Fecha_Inicio_Ingreso, "change", Fecha_Inicio_onchange);                      
            }
            
            function page_unload(sender, e)
            {                        
                $removeHandler(Fecha_Inicio_Ingreso, "change", Fecha_Inicio_onchange);                 
            }  
            
            function Fecha_Inicio_onchange(sender, e)
            {  
                var Fecha_Inicio_Ingreso = $get("ctl00_ContentPlaceHolder1_Fv_Fis_Planilla_Fecha_Inicio_Ingreso");
                var Fecha_Ultimo_Ingreso = $get("ctl00_ContentPlaceHolder1_Fv_Fis_Planilla_Fecha_Ultimo_Ingreso");
                var Fecha_Reajuste_Provisional = $get("ctl00_ContentPlaceHolder1_Fv_Fis_Planilla_Fecha_Reajuste_Provisional");
                var Fecha_Reajuste_Definitivo = $get("ctl00_ContentPlaceHolder1_Fv_Fis_Planilla_Fecha_Reajuste_Definitivo");
                var Id = $get("ctl00_ContentPlaceHolder1_Fv_Fis_Planilla_Id");
                if(Id.value == "")
                {
                    Fecha_Ultimo_Ingreso.value = Fecha_Inicio_Ingreso.value;
                    Fecha_Reajuste_Provisional.value = Fecha_Inicio_Ingreso.value;
                    Fecha_Reajuste_Definitivo.value = Fecha_Inicio_Ingreso.value;
                }
            }                         
                            
            function checkSelectedValue_Tipo_Planilla()
            {   
                var ddl_Tipo_Planilla = $get("ctl00_ContentPlaceHolder1_Fv_Fis_Planilla_ddl_Tipo_Planilla");
                var Tipo_Planilla = $get("ctl00_ContentPlaceHolder1_Fv_Fis_Planilla_Tipo_Planilla");
                var Anticipo_Devengar = $get("ctl00_ContentPlaceHolder1_Fv_Fis_Planilla_Anticipo_Devengar");
                var Tipo_Nombre = $get("ctl00_ContentPlaceHolder1_Fv_Fis_Planilla_Tipo_Nombre");
                                
                Tipo_Planilla.value = ddl_Tipo_Planilla.options[ddl_Tipo_Planilla.selectedIndex].value;
                Tipo_Nombre.value = ddl_Tipo_Planilla.options[ddl_Tipo_Planilla.selectedIndex].text;                
                if(Tipo_Planilla.value == "ANT")
                    Anticipo_Devengar.disabled = true;
                else
                    Anticipo_Devengar.disabled = false;
            }
            
            function ItemSelected_Porcentaje_Iva( source, eventArgs ) 
            {   
                var valor = eventArgs.get_value();
                var temp = new Array();
                temp = valor.split('||');
                                                    
                var Porcentaje_Iva = $get("ctl00_ContentPlaceHolder1_Fv_Fis_Planilla_Porcentaje_Iva");
                Porcentaje_Iva.value = temp[0];                                                                                                                                                                                              
            }  
            
            function ItemSelected_PorRet( source, eventArgs ) 
            {   
                var valor = eventArgs.get_value();
                var temp = new Array();
                temp = valor.split('||');
                                                    
                var Porcentaje_Retencion = $get("ctl00_ContentPlaceHolder1_Fv_Fis_Planilla_Porcentaje_Retencion");
                Porcentaje_Retencion.value = temp[0];                                                                                                                                                                                              
            }  
            
            </script>
            <asp:Panel 
                ID="pnl_Proyecto" 
                runat="server" 
                meta:resourcekey="Rec_Fis_ProyectoRecursoKCG" >
                <table>
                    <tr>
                        <td>
                            <asp:Label 
                                ID="lbl_Proy_Codigo" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>' >
                            </asp:Label>
                        </td>                        
                        <td>
                            <asp:Label 
                                ID="lbl_Proy_CodInst" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("Codigo_InstitucionRecursoKCG.Text").ToString() %>' >
                            </asp:Label>
                        </td>                        
                        <td>
                            <asp:Label 
                                ID="lbl_Proy_FechaI" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("Fecha_Ini_ContratoRecursoKCG.Text").ToString() %>' >
                            </asp:Label>
                        </td>                        
                        <td>
                            <asp:Label 
                                ID="lbl_Proy_Plazo" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("Plazo_ContratoRecursoKCG.Text").ToString() %>' >
                            </asp:Label>
                        </td>                        
                        <td>
                            <asp:Label 
                                ID="lbl_FechaF" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("Fecha_Fin_ContratoRecursoKCG.Text").ToString() %>' >
                            </asp:Label>
                        </td>                        
                        <td>
                            <asp:Label 
                                ID="lbl_Proy_Estado" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("Estado_NombreRecursoKCG.Text").ToString() %>' >
                                </asp:Label>
                        </td>                                                                       
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox 
                                ID="Proy_Codigo" 
                                runat="server"
                                onfocus="this.blur()" 
                                TabIndex="-1"
                                style="text-align:right"
                                ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="Proy_CodInst" 
                                runat="server"
                                onfocus="this.blur()" 
                                TabIndex="-1"
                                style="text-align:right"
                                ToolTip='<%# GetLocalResourceObject("Codigo_InstitucionRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>                        
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="Proy_FechaI" 
                                runat="server"
                                onfocus="this.blur()" 
                                TabIndex="-1"
                                ToolTip='<%# GetLocalResourceObject("Fecha_Ini_ContratoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="Proy_Plazo" 
                                runat="server"
                                onfocus="this.blur()" 
                                TabIndex="-1"
                                style="text-align:right"
                                ToolTip='<%# GetLocalResourceObject("Plazo_ContratoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="Proy_FechaF" 
                                runat="server"
                                onfocus="this.blur()" 
                                TabIndex="-1"
                                ToolTip='<%# GetLocalResourceObject("Fecha_Fin_ContratoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="Proy_Estado" 
                                runat="server"
                                onfocus="this.blur()" 
                                TabIndex="-1"
                                ToolTip='<%# GetLocalResourceObject("Estado_NombreRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td> 
                    </tr>
                </table>
                <table>
                    <tr>
                        <td>
                            <asp:Label 
                                ID="lbl_Proy_Proyecto" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("Apu_Origen_NombreRecursoKCG.Text").ToString() %>' >
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
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox 
                                ID="Proy_Proyecto" 
                                runat="server"
                                onfocus="this.blur()" 
                                TabIndex="-1"
                                Width="700px"
                                Height="50px"
                                TextMode="MultiLine"
                                Font-Names="Arial"                              
                                ToolTip='<%# GetLocalResourceObject("Apu_Origen_NombreRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:FormView 
                ID="Fv_Fis_Planilla" 
                runat="server" 
                DataSourceID="odsFv_Fis_Planilla"
                DefaultMode="Insert">
                <EditItemTemplate>
                    <asp:Panel 
                        ID="pnl_Planillas" 
                        runat="server" 
                        meta:resourcekey="Rec_Fis_PlanillaRecursoKCG" >
                        <table>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Numero_Planilla" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Numero_PlanillaRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>
                                <td>    
                                    <asp:TextBox 
                                        ID="Numero_Planilla" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Numero_PlanillaRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Numero_Planilla") %>'>
                                    </asp:TextBox>
                                </td>
                                <td> 
                                    <asp:Label 
                                        ID="lbl_AnticipoDeve" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Anticipo_DevengarRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>
                                <td> 
                                    <asp:TextBox 
                                        ID="Anticipo_Devengar" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG"
                                        style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("Anticipo_DevengarRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Anticipo_Devengar","{0:N2}") %>'>
                                    </asp:TextBox>
                                    <AjaxControlToolkit:MaskedEditExtender   
                                        ID="mee_Anticipo_Devengar" 
                                        runat="server"
                                        TargetControlID="Anticipo_Devengar"
                                        Mask="9,999,999,999,999.99"
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
                                        ID="mev_Anticipo_Devengar" 
                                        runat="server"
                                        ControlExtender="mee_Anticipo_Devengar"
                                        ControlToValidate="Anticipo_Devengar"
                                        IsValidEmpty="False"
                                        EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        MinimumValue="0.00"
                                        MaximumValue="9999999999999.99" 
                                        Display="Dynamic"
                                        EmptyValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>'
                                        InvalidValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>'
                                        MaximumValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>' 
                                        MinimumValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>'
                                         />                                      
                                      <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="vce_Anticipo_Devengar"
                                        TargetControlID="mev_Anticipo_Devengar"/> 
                                </td>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Deduccion_Anticipo" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Deduccion_AnticipoRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Deduccion_Anticipo" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("Deduccion_AnticipoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Deduccion_Anticipo","{0:N2}") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Fecha_Inicio_Ingreso" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Fecha_PresentacionRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Fecha_Inicio_Ingreso" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG"  
                                        ToolTip='<%# GetLocalResourceObject("Fecha_PresentacionRecursoKCG.ToolTip").ToString() %>'                                      
                                        Text='<%# Bind("Fecha_Inicio_Ingreso") %>'>
                                    </asp:TextBox>
                                    <AjaxControlToolkit:CalendarExtender
                                        ID="ce_Fecha_Inicio_Ingreso" 
                                        runat="server" 
                                        TargetControlID="Fecha_Inicio_Ingreso" 
                                        Format="dd/MM/yyyy">          
                                    </AjaxControlToolkit:CalendarExtender>
                                    <AjaxControlToolkit:MaskedEditExtender 
                                        TargetControlID="Fecha_Inicio_Ingreso" 
                                        Mask="99/99/9999" 
                                        MaskType="Date"  
                                        ID="mee_Fecha_Inicio_Ingreso"          
                                        OnFocusCssClass="MaskedEditFocus"
                                        runat="server">
                                   </AjaxControlToolkit:MaskedEditExtender>
                                    <AjaxControlToolkit:MaskedEditValidator
                                        ControlToValidate="Fecha_Inicio_Ingreso" 
                                        ControlExtender="mee_Fecha_Inicio_Ingreso" 
                                        id="mev_Fecha_Inicio_Ingreso"   
                                        TooltipMessage="*"  
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
                                        ID="vce_Fecha_Inicio_Ingreso"
                                        TargetControlID="mev_Fecha_Inicio_Ingreso" />
                                </td>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Fecha_Ultimo_Ingreso" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Fecha_Ultimo_IngresoRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Fecha_Ultimo_Ingreso" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG"  
                                        ToolTip='<%# GetLocalResourceObject("Fecha_Ultimo_IngresoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Fecha_Ultimo_Ingreso") %>'>
                                    </asp:TextBox>
                                    <AjaxControlToolkit:CalendarExtender
                                        ID="ce_Fecha_Ultimo_Ingreso" 
                                        runat="server" 
                                        TargetControlID="Fecha_Ultimo_Ingreso" 
                                        Format="dd/MM/yyyy">          
                                    </AjaxControlToolkit:CalendarExtender>
                                    <AjaxControlToolkit:MaskedEditExtender 
                                        TargetControlID="Fecha_Ultimo_Ingreso" 
                                        Mask="99/99/9999" 
                                        MaskType="Date"  
                                        ID="mee_Fecha_Ultimo_Ingreso"          
                                        OnFocusCssClass="MaskedEditFocus"
                                        runat="server">
                                   </AjaxControlToolkit:MaskedEditExtender>
                                    <AjaxControlToolkit:MaskedEditValidator
                                        ControlToValidate="Fecha_Ultimo_Ingreso" 
                                        ControlExtender="mee_Fecha_Ultimo_Ingreso" 
                                        id="mev_Fecha_Ultimo_Ingreso"   
                                        TooltipMessage="*"  
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
                                        ID="vce_Fecha_Ultimo_Ingreso"
                                        TargetControlID="mev_Fecha_Ultimo_Ingreso" />
                                </td>
                                <td> 
                                    <asp:Label 
                                        ID="lbl_Tipo_Planilla" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Tipo_PlanillaRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>
                                <td> 
                                    <asp:TextBox 
                                        ID="Tipo_Planilla" 
                                        runat="server" 
                                        style="display:none"
                                        Text='<%# Bind("Tipo_Planilla") %>'>
                                    </asp:TextBox>
                                    <asp:DropDownList 
                                        ID="ddl_Tipo_Planilla" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG"
                                        DataSourceID="odsddl_Tipo_Planilla"
                                        DataTextField="Nombre" 
                                        DataValueField="Dic_Dominio_Dominio"
                                        OnDataBound="Tipo_Planilla_DataBound">
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource 
                                        ID="odsddl_Tipo_Planilla" 
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
                                        DefaultValue="Fis_Planilla" 
                                            Name="Dic_Objeto_Nombre" 
                                            Type="String" />
                                        <asp:Parameter 
                                            DefaultValue="Tipo_Planilla" 
                                            Name="Dic_Campo_Nombre" 
                                            Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Fecha_Inicial" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Fecha_InicialRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                    <asp:TextBox 
                                        ID="txt_p3" 
                                        Width="30px"
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
                                        ID="Fecha_Inicial" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG"  
                                        ToolTip='<%# GetLocalResourceObject("Fecha_InicialRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Fecha_Inicial") %>'>
                                    </asp:TextBox>
                                    <AjaxControlToolkit:CalendarExtender
                                        ID="ce_Fecha_Inicial" 
                                        runat="server" 
                                        TargetControlID="Fecha_Inicial" 
                                        Format="dd/MM/yyyy">          
                                    </AjaxControlToolkit:CalendarExtender>
                                    <AjaxControlToolkit:MaskedEditExtender 
                                        TargetControlID="Fecha_Inicial" 
                                        Mask="99/99/9999" 
                                        MaskType="Date"  
                                        ID="mee_Fecha_Inicial"          
                                        OnFocusCssClass="MaskedEditFocus"
                                        runat="server">
                                   </AjaxControlToolkit:MaskedEditExtender>
                                    <AjaxControlToolkit:MaskedEditValidator
                                        ControlToValidate="Fecha_Inicial" 
                                        ControlExtender="mee_Fecha_Inicial" 
                                        id="mev_Fecha_Inicial"   
                                        TooltipMessage="*"   
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
                                        ID="vce_Fecha_Inicial"
                                        TargetControlID="mev_Fecha_Inicial" />
                                </td>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Fecha_Final" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Fecha_FinalRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Fecha_Final" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG"  
                                        ToolTip='<%# GetLocalResourceObject("Fecha_FinalRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Fecha_Final") %>'>
                                    </asp:TextBox>
                                    <AjaxControlToolkit:CalendarExtender
                                        ID="ce_Fecha_Final" 
                                        runat="server" 
                                        TargetControlID="Fecha_Final" 
                                        Format="dd/MM/yyyy">          
                                    </AjaxControlToolkit:CalendarExtender>
                                    <AjaxControlToolkit:MaskedEditExtender 
                                        TargetControlID="Fecha_Final" 
                                        Mask="99/99/9999" 
                                        MaskType="Date"  
                                        ID="mee_Fecha_Final"          
                                        OnFocusCssClass="MaskedEditFocus"
                                        runat="server">
                                   </AjaxControlToolkit:MaskedEditExtender>
                                    <AjaxControlToolkit:MaskedEditValidator
                                        ControlToValidate="Fecha_Final" 
                                        ControlExtender="mee_Fecha_Final" 
                                        id="mev_Fecha_Final"   
                                        TooltipMessage="*"   
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
                                        ID="vce_Fecha_Final"
                                        TargetControlID="mev_Fecha_Final" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Total" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("TotalRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Total" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("TotalRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Total","{0:N2}") %>'>
                                    </asp:TextBox> 
                                </td>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Porcentaje_Iva" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Porcentaje_IvaRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Porcentaje_Iva" 
                                        runat="server" 
                                        CssClass="TEXTO_COMBOPER_KCG"  
                                        style="text-align:left"
                                        ToolTip='<%# GetLocalResourceObject("Porcentaje_IvaRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Porcentaje_Iva") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        ID="rfv_Porcentaje_Iva"
                                        runat="server" 
                                        ControlToValidate="Porcentaje_Iva"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="vce_Porcentaje_Iva"
                                        TargetControlID="rfv_Porcentaje_Iva"/>
                                    <AjaxControlToolkit:AutoCompleteExtender
                                        runat="server" 
                                        BehaviorID="AutoCompEx_Porcentaje_Iva"
                                        ID="ace_Porcentaje_Iva"                                         
                                        TargetControlID="Porcentaje_Iva"
                                        ServicePath="~/FIS/FIS_PLANILLA.aspx" 
                                        ServiceMethod="Get_Porcentaje_Iva"
                                        MinimumPrefixLength="0" 
                                        CompletionInterval="500"
                                        EnableCaching="true"
                                        CompletionSetCount="500"
                                        CompletionListCssClass="autocomplete_completionListElement" 
                                        CompletionListItemCssClass="autocomplete_listItem" 
                                        CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                        OnClientItemSelected="ItemSelected_Porcentaje_Iva" >
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
                                                        var behavior = $find('AutoCompEx_Porcentaje_Iva');
                                                        if (!behavior._height) {
                                                            var target = behavior.get_completionList();
                                                            behavior._height = target.offsetHeight - 2;
                                                            target.style.height = '0px';
                                                        }" />                                                    
                                                    <%-- Expand from 0px to the appropriate size while fading in --%>
                                                    <Parallel Duration=".4">
                                                        <FadeIn />
                                                        <Length PropertyKey="height" StartValue="0" EndValueScript="$find('AutoCompEx_Porcentaje_Iva')._height" />
                                                    </Parallel>
                                                </Sequence>
                                            </OnShow>
                                            <OnHide>
                                                <%-- Collapse down to 0px and fade out --%>
                                                <Parallel Duration=".4">
                                                    <FadeOut />
                                                    <Length PropertyKey="height" StartValueScript="$find('AutoCompEx_Porcentaje_Iva')._height" EndValue="0" />
                                                </Parallel>
                                            </OnHide>
                                        </Animations>
                                    </AjaxControlToolkit:AutoCompleteExtender>
                                    <asp:Label 
                                        ID="lbl_Porc1" 
                                        runat="server"
                                        Font-Bold="true"
                                        Text="%">
                                    </asp:Label>  
                                </td>
                                <td>                                 
                                    <asp:Label 
                                        ID="lbl_Porcentaje_Retencion" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Porcentaje_RetencionRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>    
                                </td>
                                <td>                            
                                    <asp:TextBox 
                                        ID="Porcentaje_Retencion" 
                                        runat="server" 
                                        CssClass="TEXTO_COMBOPER_KCG"  
                                        style="text-align:left"
                                        ToolTip='<%# GetLocalResourceObject("Porcentaje_RetencionRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Porcentaje_Retencion") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        ID="rfv_Porcentaje_Retencion"
                                        runat="server" 
                                        ControlToValidate="Porcentaje_Retencion"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="vce_Porcentaje_Retencion"
                                        TargetControlID="rfv_Porcentaje_Retencion"/>
                                    <AjaxControlToolkit:AutoCompleteExtender
                                        runat="server" 
                                        BehaviorID="AutoCompEx_PorRet"
                                        ID="ace_PorRet"                                         
                                        TargetControlID="Porcentaje_Retencion"
                                        ServicePath="~/FIS/FIS_PLANILLA.aspx" 
                                        ServiceMethod="Get_PorRet"
                                        MinimumPrefixLength="0" 
                                        CompletionInterval="500"
                                        EnableCaching="true"
                                        CompletionSetCount="500"
                                        CompletionListCssClass="autocomplete_completionListElement" 
                                        CompletionListItemCssClass="autocomplete_listItem" 
                                        CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                        OnClientItemSelected="ItemSelected_PorRet" >
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
                                                        var behavior = $find('AutoCompEx_PorRet');
                                                        if (!behavior._height) {
                                                            var target = behavior.get_completionList();
                                                            behavior._height = target.offsetHeight - 2;
                                                            target.style.height = '0px';
                                                        }" />                                                    
                                                    <%-- Expand from 0px to the appropriate size while fading in --%>
                                                    <Parallel Duration=".4">
                                                        <FadeIn />
                                                        <Length PropertyKey="height" StartValue="0" EndValueScript="$find('AutoCompEx_PorRet')._height" />
                                                    </Parallel>
                                                </Sequence>
                                            </OnShow>
                                            <OnHide>
                                                <%-- Collapse down to 0px and fade out --%>
                                                <Parallel Duration=".4">
                                                    <FadeOut />
                                                    <Length PropertyKey="height" StartValueScript="$find('AutoCompEx_PorRet')._height" EndValue="0" />
                                                </Parallel>
                                            </OnHide>
                                        </Animations>
                                    </AjaxControlToolkit:AutoCompleteExtender>                                        
                                    <asp:Label 
                                        ID="lbl_Porc2" 
                                        runat="server"
                                        Font-Bold="true"
                                        Text="%">
                                    </asp:Label>   
                                </td>
                            </tr>
                        </table>
                        <table>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Descripcion" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("DescripcionRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>
                                <td colspan="3">
                                    <asp:TextBox 
                                        ID="Descripcion" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG"
                                        Width="400px"
                                        Height="50px"
                                        TextMode="MultiLine"
                                        ToolTip='<%# GetLocalResourceObject("DescripcionRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Descripcion") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Fecha_Reajuste_Provisional" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Fecha_Reajuste_ProvisionalRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Fecha_Reajuste_Provisional" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG"
                                        ToolTip='<%# GetLocalResourceObject("Fecha_Reajuste_ProvisionalRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Fecha_Reajuste_Provisional") %>'>
                                    </asp:TextBox>
                                    <AjaxControlToolkit:CalendarExtender
                                        ID="ce_Fecha_Reajuste_Provisional" 
                                        runat="server" 
                                        TargetControlID="Fecha_Reajuste_Provisional" 
                                        Format="dd/MM/yyyy">          
                                    </AjaxControlToolkit:CalendarExtender>
                                    <AjaxControlToolkit:MaskedEditExtender 
                                        TargetControlID="Fecha_Reajuste_Provisional" 
                                        Mask="99/99/9999" 
                                        MaskType="Date"  
                                        ID="mee_Fecha_Reajuste_Provisional"          
                                        OnFocusCssClass="MaskedEditFocus"
                                        runat="server">
                                   </AjaxControlToolkit:MaskedEditExtender>
                                    <AjaxControlToolkit:MaskedEditValidator
                                        ControlToValidate="Fecha_Reajuste_Provisional" 
                                        ControlExtender="mee_Fecha_Reajuste_Provisional" 
                                        id="mev_Fecha_Reajuste_Provisional"   
                                        TooltipMessage="*"   
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
                                        ID="vce_Fecha_Reajuste_Provisional"
                                        TargetControlID="mev_Fecha_Reajuste_Provisional" />
                                </td>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Publicacion_Reajuste_Provisional" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Publicacion_Reajuste_ProvisionalRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Provisional_Fis_Catalogo_Fecha_Publicacion" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Publicacion_Reajuste_ProvisionalRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Provisional_Fis_Catalogo_Fecha_Publicacion") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Descripcion_Provisional" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Descripcion_ProvisionalRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>
                                <td colspan="3">
                                    <asp:TextBox 
                                        ID="Descripcion_Provisional" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG"
                                        Width="400px"
                                        Height="50px"
                                        TextMode="MultiLine"
                                        ToolTip='<%# GetLocalResourceObject("Descripcion_ProvisionalRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Descripcion_Provisional") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Fecha_Reajuste_Definitivo" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Fecha_Reajuste_DefinitivoRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Fecha_Reajuste_Definitivo" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG"
                                        ToolTip='<%# GetLocalResourceObject("Fecha_Reajuste_DefinitivoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Fecha_Reajuste_Definitivo") %>'>
                                    </asp:TextBox>
                                    <AjaxControlToolkit:CalendarExtender
                                        ID="ce_Fecha_Reajuste_Definitivo" 
                                        runat="server" 
                                        TargetControlID="Fecha_Reajuste_Definitivo" 
                                        Format="dd/MM/yyyy">          
                                    </AjaxControlToolkit:CalendarExtender>
                                    <AjaxControlToolkit:MaskedEditExtender 
                                        TargetControlID="Fecha_Reajuste_Definitivo" 
                                        Mask="99/99/9999" 
                                        MaskType="Date"  
                                        ID="mee_Fecha_Reajuste_Definitivo"          
                                        OnFocusCssClass="MaskedEditFocus"
                                        runat="server">
                                   </AjaxControlToolkit:MaskedEditExtender>
                                    <AjaxControlToolkit:MaskedEditValidator
                                        ControlToValidate="Fecha_Reajuste_Definitivo" 
                                        ControlExtender="mee_Fecha_Reajuste_Definitivo" 
                                        id="mev_Fecha_Reajuste_Definitivo"   
                                        TooltipMessage="*"   
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
                                        ID="vce_Fecha_Reajuste_Definitivo"
                                        TargetControlID="mev_Fecha_Reajuste_Definitivo" />
                                </td>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Publicacion_Reajuste_Definitivo" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Publicacion_Reajuste_DefinitivoRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Definitivo_Fis_Catalogo_Fecha_Publicacion" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Publicacion_Reajuste_DefinitivoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Definitivo_Fis_Catalogo_Fecha_Publicacion") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Descripcion_Definitiva" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Descripcion_DefinitivaRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>
                                <td colspan="3">
                                    <asp:TextBox 
                                        ID="Descripcion_Definitiva" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG"
                                        Width="400px"
                                        Height="50px"
                                        TextMode="MultiLine"
                                        ToolTip='<%# GetLocalResourceObject("Descripcion_DefinitivaRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Descripcion_Definitiva") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
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
                        ID="Apu_Presupuesto_Apu_Origen_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Apu_Presupuesto_Apu_Origen_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Provisional_Fis_Catalogo_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Provisional_Fis_Catalogo_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Definitivo_Fis_Catalogo_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Definitivo_Fis_Catalogo_Id") %>'>
                    </asp:TextBox>
                    
                    <%--campos no visible--%>
                    
                    <asp:TextBox 
                        ID="Contratista_Per_Personal_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Contratista_Per_Personal_Nombre") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Apu_Presupuesto_Codigo_Institucional" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Apu_Presupuesto_Codigo_Institucional") %>'>
                    </asp:TextBox>                                        
                    
                    <asp:TextBox 
                        ID="Fecha_Pago" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Fecha_Pago") %>'>
                    </asp:TextBox>                                        
                    
                    <asp:TextBox 
                        ID="Apu_Presupuesto_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Apu_Presupuesto_Codigo") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Apu_Presupuesto_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Apu_Presupuesto_Nombre") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Tipo_Nombre" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Tipo_Nombre") %>'>
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
                        ID="pnl_Planillas" 
                        runat="server" 
                        meta:resourcekey="Rec_Fis_PlanillaRecursoKCG" >
                        <table>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Numero_Planilla" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Numero_PlanillaRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>
                                <td>    
                                    <asp:TextBox 
                                        ID="Numero_Planilla" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Numero_PlanillaRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Numero_Planilla") %>'>
                                    </asp:TextBox>
                                </td>
                                <td> 
                                    <asp:Label 
                                        ID="lbl_AnticipoDeve" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Anticipo_DevengarRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>
                                <td> 
                                    <asp:TextBox 
                                        ID="Anticipo_Devengar" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG"
                                        style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("Anticipo_DevengarRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Anticipo_Devengar","{0:N2}") %>'>
                                    </asp:TextBox>
                                    <AjaxControlToolkit:MaskedEditExtender   
                                        ID="mee_Anticipo_Devengar" 
                                        runat="server"
                                        TargetControlID="Anticipo_Devengar"
                                        Mask="9,999,999,999,999.99"
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
                                        ID="mev_Anticipo_Devengar" 
                                        runat="server"
                                        ControlExtender="mee_Anticipo_Devengar"
                                        ControlToValidate="Anticipo_Devengar"
                                        IsValidEmpty="False"
                                        EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.ErrorMessage").ToString() %>'
                                        MinimumValue="0.00"
                                        MaximumValue="9999999999999.99" 
                                        Display="Dynamic"
                                        EmptyValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>'
                                        InvalidValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>'
                                        MaximumValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>' 
                                        MinimumValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ29RecursoKCG.Text").ToString() %>'
                                         />                                      
                                      <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="vce_Anticipo_Devengar"
                                        TargetControlID="mev_Anticipo_Devengar"/>                                       
                                </td>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Deduccion_Anticipo" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Deduccion_AnticipoRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Deduccion_Anticipo" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("Deduccion_AnticipoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Deduccion_Anticipo","{0:N2}") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Fecha_Inicio_Ingreso" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Fecha_PresentacionRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Fecha_Inicio_Ingreso" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG"  
                                        ToolTip='<%# GetLocalResourceObject("Fecha_PresentacionRecursoKCG.ToolTip").ToString() %>'                                      
                                        Text='<%# Bind("Fecha_Inicio_Ingreso") %>'>
                                    </asp:TextBox>
                                    <AjaxControlToolkit:CalendarExtender
                                        ID="ce_Fecha_Inicio_Ingreso" 
                                        runat="server" 
                                        TargetControlID="Fecha_Inicio_Ingreso" 
                                        Format="dd/MM/yyyy">          
                                    </AjaxControlToolkit:CalendarExtender>
                                    <AjaxControlToolkit:MaskedEditExtender 
                                        TargetControlID="Fecha_Inicio_Ingreso" 
                                        Mask="99/99/9999" 
                                        MaskType="Date"  
                                        ID="mee_Fecha_Inicio_Ingreso"          
                                        OnFocusCssClass="MaskedEditFocus"
                                        runat="server">
                                   </AjaxControlToolkit:MaskedEditExtender>
                                    <AjaxControlToolkit:MaskedEditValidator
                                        ControlToValidate="Fecha_Inicio_Ingreso" 
                                        ControlExtender="mee_Fecha_Inicio_Ingreso" 
                                        id="mev_Fecha_Inicio_Ingreso"   
                                        TooltipMessage="*"  
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
                                        ID="vce_Fecha_Inicio_Ingreso"
                                        TargetControlID="mev_Fecha_Inicio_Ingreso" />
                                </td>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Fecha_Ultimo_Ingreso" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Fecha_Ultimo_IngresoRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Fecha_Ultimo_Ingreso" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG"  
                                        ToolTip='<%# GetLocalResourceObject("Fecha_Ultimo_IngresoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Fecha_Ultimo_Ingreso") %>'>
                                    </asp:TextBox>
                                    <AjaxControlToolkit:CalendarExtender
                                        ID="ce_Fecha_Ultimo_Ingreso" 
                                        runat="server" 
                                        TargetControlID="Fecha_Ultimo_Ingreso" 
                                        Format="dd/MM/yyyy">          
                                    </AjaxControlToolkit:CalendarExtender>
                                    <AjaxControlToolkit:MaskedEditExtender 
                                        TargetControlID="Fecha_Ultimo_Ingreso" 
                                        Mask="99/99/9999" 
                                        MaskType="Date"  
                                        ID="mee_Fecha_Ultimo_Ingreso"          
                                        OnFocusCssClass="MaskedEditFocus"
                                        runat="server">
                                   </AjaxControlToolkit:MaskedEditExtender>
                                    <AjaxControlToolkit:MaskedEditValidator
                                        ControlToValidate="Fecha_Ultimo_Ingreso" 
                                        ControlExtender="mee_Fecha_Ultimo_Ingreso" 
                                        id="mev_Fecha_Ultimo_Ingreso"   
                                        TooltipMessage="*"  
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
                                        ID="vce_Fecha_Ultimo_Ingreso"
                                        TargetControlID="mev_Fecha_Ultimo_Ingreso" />
                                </td>
                                <td> 
                                    <asp:Label 
                                        ID="lbl_Tipo_Planilla" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Tipo_PlanillaRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>
                                <td> 
                                    <asp:TextBox 
                                        ID="Tipo_Planilla" 
                                        runat="server" 
                                        style="display:none"                                                                          
                                        Text='<%# Bind("Tipo_Planilla") %>'>
                                    </asp:TextBox>
                                    <asp:DropDownList 
                                        ID="ddl_Tipo_Planilla" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG"
                                        DataSourceID="odsddl_Tipo_Planilla"
                                        DataTextField="Nombre" 
                                        DataValueField="Dic_Dominio_Dominio"
                                        OnDataBound="Tipo_Planilla_DataBound">
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource 
                                        ID="odsddl_Tipo_Planilla" 
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
                                        DefaultValue="Fis_Planilla" 
                                            Name="Dic_Objeto_Nombre" 
                                            Type="String" />
                                        <asp:Parameter 
                                            DefaultValue="Tipo_Planilla" 
                                            Name="Dic_Campo_Nombre" 
                                            Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Fecha_Inicial" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Fecha_InicialRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                    <asp:TextBox 
                                        ID="txt_p3" 
                                        Width="30px"
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
                                        ID="Fecha_Inicial" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG"  
                                        ToolTip='<%# GetLocalResourceObject("Fecha_InicialRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Fecha_Inicial") %>'>
                                    </asp:TextBox>
                                    <AjaxControlToolkit:CalendarExtender
                                        ID="ce_Fecha_Inicial" 
                                        runat="server" 
                                        TargetControlID="Fecha_Inicial" 
                                        Format="dd/MM/yyyy">          
                                    </AjaxControlToolkit:CalendarExtender>
                                    <AjaxControlToolkit:MaskedEditExtender 
                                        TargetControlID="Fecha_Inicial" 
                                        Mask="99/99/9999" 
                                        MaskType="Date"  
                                        ID="mee_Fecha_Inicial"          
                                        OnFocusCssClass="MaskedEditFocus"
                                        runat="server">
                                   </AjaxControlToolkit:MaskedEditExtender>
                                    <AjaxControlToolkit:MaskedEditValidator
                                        ControlToValidate="Fecha_Inicial" 
                                        ControlExtender="mee_Fecha_Inicial" 
                                        id="mev_Fecha_Inicial"   
                                        TooltipMessage="*"  
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
                                        ID="vce_Fecha_Inicial"
                                        TargetControlID="mev_Fecha_Inicial" />
                                </td>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Fecha_Final" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Fecha_FinalRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Fecha_Final" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG"  
                                        ToolTip='<%# GetLocalResourceObject("Fecha_FinalRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Fecha_Final") %>'>
                                    </asp:TextBox>
                                    <AjaxControlToolkit:CalendarExtender
                                        ID="ce_Fecha_Final" 
                                        runat="server" 
                                        TargetControlID="Fecha_Final" 
                                        Format="dd/MM/yyyy">          
                                    </AjaxControlToolkit:CalendarExtender>
                                    <AjaxControlToolkit:MaskedEditExtender 
                                        TargetControlID="Fecha_Final" 
                                        Mask="99/99/9999" 
                                        MaskType="Date"  
                                        ID="mee_Fecha_Final"          
                                        OnFocusCssClass="MaskedEditFocus"
                                        runat="server">
                                   </AjaxControlToolkit:MaskedEditExtender>
                                    <AjaxControlToolkit:MaskedEditValidator
                                        ControlToValidate="Fecha_Final" 
                                        ControlExtender="mee_Fecha_Final" 
                                        id="mev_Fecha_Final"   
                                        TooltipMessage="*"  
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
                                        ID="vce_Fecha_Final"
                                        TargetControlID="mev_Fecha_Final" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Total" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("TotalRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Total" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("TotalRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Total","{0:N2}") %>'>
                                    </asp:TextBox> 
                                </td>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Porcentaje_Iva" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Porcentaje_IvaRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Porcentaje_Iva" 
                                        runat="server" 
                                        CssClass="TEXTO_COMBOPER_KCG"  
                                        style="text-align:left"
                                        ToolTip='<%# GetLocalResourceObject("Porcentaje_IvaRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Porcentaje_Iva") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        ID="rfv_Porcentaje_Iva"
                                        runat="server" 
                                        ControlToValidate="Porcentaje_Iva"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="vce_Porcentaje_Iva"
                                        TargetControlID="rfv_Porcentaje_Iva"/>
                                    <AjaxControlToolkit:AutoCompleteExtender
                                        runat="server" 
                                        BehaviorID="AutoCompEx_Porcentaje_Iva"
                                        ID="ace_Porcentaje_Iva"                                         
                                        TargetControlID="Porcentaje_Iva"
                                        ServicePath="~/FIS/FIS_PLANILLA.aspx" 
                                        ServiceMethod="Get_Porcentaje_Iva"
                                        MinimumPrefixLength="0" 
                                        CompletionInterval="500"
                                        EnableCaching="true"
                                        CompletionSetCount="500"
                                        CompletionListCssClass="autocomplete_completionListElement" 
                                        CompletionListItemCssClass="autocomplete_listItem" 
                                        CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                        OnClientItemSelected="ItemSelected_Porcentaje_Iva" >
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
                                                        var behavior = $find('AutoCompEx_Porcentaje_Iva');
                                                        if (!behavior._height) {
                                                            var target = behavior.get_completionList();
                                                            behavior._height = target.offsetHeight - 2;
                                                            target.style.height = '0px';
                                                        }" />                                                    
                                                    <%-- Expand from 0px to the appropriate size while fading in --%>
                                                    <Parallel Duration=".4">
                                                        <FadeIn />
                                                        <Length PropertyKey="height" StartValue="0" EndValueScript="$find('AutoCompEx_Porcentaje_Iva')._height" />
                                                    </Parallel>
                                                </Sequence>
                                            </OnShow>
                                            <OnHide>
                                                <%-- Collapse down to 0px and fade out --%>
                                                <Parallel Duration=".4">
                                                    <FadeOut />
                                                    <Length PropertyKey="height" StartValueScript="$find('AutoCompEx_Porcentaje_Iva')._height" EndValue="0" />
                                                </Parallel>
                                            </OnHide>
                                        </Animations>
                                    </AjaxControlToolkit:AutoCompleteExtender>
                                    <asp:Label 
                                        ID="lbl_Porc1" 
                                        runat="server"
                                        Font-Bold="true"
                                        Text="%">
                                    </asp:Label>    
                                </td>
                                <td>                               
                                    <asp:Label 
                                        ID="lbl_Porcentaje_Retencion" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Porcentaje_RetencionRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>    
                                </td>
                                <td>                           
                                    <asp:TextBox 
                                        ID="Porcentaje_Retencion" 
                                        runat="server" 
                                        CssClass="TEXTO_COMBOPER_KCG"  
                                        style="text-align:left"
                                        ToolTip='<%# GetLocalResourceObject("Porcentaje_RetencionRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Porcentaje_Retencion") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        ID="rfv_Porcentaje_Retencion"
                                        runat="server" 
                                        ControlToValidate="Porcentaje_Retencion"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="vce_Porcentaje_Retencion"
                                        TargetControlID="rfv_Porcentaje_Retencion"/>
                                    <AjaxControlToolkit:AutoCompleteExtender
                                        runat="server" 
                                        BehaviorID="AutoCompEx_PorRet"
                                        ID="ace_PorRet"                                         
                                        TargetControlID="Porcentaje_Retencion"
                                        ServicePath="~/FIS/FIS_PLANILLA.aspx" 
                                        ServiceMethod="Get_PorRet"
                                        MinimumPrefixLength="0" 
                                        CompletionInterval="500"
                                        EnableCaching="true"
                                        CompletionSetCount="500"
                                        CompletionListCssClass="autocomplete_completionListElement" 
                                        CompletionListItemCssClass="autocomplete_listItem" 
                                        CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                        OnClientItemSelected="ItemSelected_PorRet" >
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
                                                        var behavior = $find('AutoCompEx_PorRet');
                                                        if (!behavior._height) {
                                                            var target = behavior.get_completionList();
                                                            behavior._height = target.offsetHeight - 2;
                                                            target.style.height = '0px';
                                                        }" />                                                    
                                                    <%-- Expand from 0px to the appropriate size while fading in --%>
                                                    <Parallel Duration=".4">
                                                        <FadeIn />
                                                        <Length PropertyKey="height" StartValue="0" EndValueScript="$find('AutoCompEx_PorRet')._height" />
                                                    </Parallel>
                                                </Sequence>
                                            </OnShow>
                                            <OnHide>
                                                <%-- Collapse down to 0px and fade out --%>
                                                <Parallel Duration=".4">
                                                    <FadeOut />
                                                    <Length PropertyKey="height" StartValueScript="$find('AutoCompEx_PorRet')._height" EndValue="0" />
                                                </Parallel>
                                            </OnHide>
                                        </Animations>
                                    </AjaxControlToolkit:AutoCompleteExtender>
                                    <asp:Label 
                                        ID="lbl_Porc2" 
                                        runat="server"
                                        Font-Bold="true"
                                        Text="%">
                                    </asp:Label>   
                                </td>
                            </tr>
                        </table>
                        <table>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Descripcion" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("DescripcionRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>
                                <td colspan="3">
                                    <asp:TextBox 
                                        ID="Descripcion" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG"
                                        Width="400px"
                                        Height="50px"
                                        TextMode="MultiLine"
                                        ToolTip='<%# GetLocalResourceObject("DescripcionRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Descripcion") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Fecha_Reajuste_Provisional" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Fecha_Reajuste_ProvisionalRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Fecha_Reajuste_Provisional" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG"
                                        ToolTip='<%# GetLocalResourceObject("Fecha_Reajuste_ProvisionalRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Fecha_Reajuste_Provisional") %>'>
                                    </asp:TextBox>
                                    <AjaxControlToolkit:CalendarExtender
                                        ID="ce_Fecha_Reajuste_Provisional" 
                                        runat="server" 
                                        TargetControlID="Fecha_Reajuste_Provisional" 
                                        Format="dd/MM/yyyy">          
                                    </AjaxControlToolkit:CalendarExtender>
                                    <AjaxControlToolkit:MaskedEditExtender 
                                        TargetControlID="Fecha_Reajuste_Provisional" 
                                        Mask="99/99/9999" 
                                        MaskType="Date"  
                                        ID="mee_Fecha_Reajuste_Provisional"          
                                        OnFocusCssClass="MaskedEditFocus"
                                        runat="server">
                                   </AjaxControlToolkit:MaskedEditExtender>
                                    <AjaxControlToolkit:MaskedEditValidator
                                        ControlToValidate="Fecha_Reajuste_Provisional" 
                                        ControlExtender="mee_Fecha_Reajuste_Provisional" 
                                        id="mev_Fecha_Reajuste_Provisional"   
                                        TooltipMessage="*"  
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
                                        ID="vce_Fecha_Reajuste_Provisional"
                                        TargetControlID="mev_Fecha_Reajuste_Provisional" />
                                </td>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Publicacion_Reajuste_Provisional" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Publicacion_Reajuste_ProvisionalRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Provisional_Fis_Catalogo_Fecha_Publicacion" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Publicacion_Reajuste_ProvisionalRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Provisional_Fis_Catalogo_Fecha_Publicacion") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Descripcion_Provisional" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Descripcion_ProvisionalRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>
                                <td colspan="3">
                                    <asp:TextBox 
                                        ID="Descripcion_Provisional" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG"
                                        Width="400px"
                                        Height="50px"
                                        TextMode="MultiLine"
                                        ToolTip='<%# GetLocalResourceObject("Descripcion_ProvisionalRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Descripcion_Provisional") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Fecha_Reajuste_Definitivo" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Fecha_Reajuste_DefinitivoRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Fecha_Reajuste_Definitivo" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG"
                                        ToolTip='<%# GetLocalResourceObject("Fecha_Reajuste_DefinitivoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Fecha_Reajuste_Definitivo") %>'>
                                    </asp:TextBox>
                                    <AjaxControlToolkit:CalendarExtender
                                        ID="ce_Fecha_Reajuste_Definitivo" 
                                        runat="server" 
                                        TargetControlID="Fecha_Reajuste_Definitivo" 
                                        Format="dd/MM/yyyy">          
                                    </AjaxControlToolkit:CalendarExtender>
                                    <AjaxControlToolkit:MaskedEditExtender 
                                        TargetControlID="Fecha_Reajuste_Definitivo" 
                                        Mask="99/99/9999" 
                                        MaskType="Date"  
                                        ID="mee_Fecha_Reajuste_Definitivo"          
                                        OnFocusCssClass="MaskedEditFocus"
                                        runat="server">
                                   </AjaxControlToolkit:MaskedEditExtender>
                                    <AjaxControlToolkit:MaskedEditValidator
                                        ControlToValidate="Fecha_Reajuste_Definitivo" 
                                        ControlExtender="mee_Fecha_Reajuste_Definitivo" 
                                        id="mev_Fecha_Reajuste_Definitivo"   
                                        TooltipMessage="*"  
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
                                        ID="vce_Fecha_Reajuste_Definitivo"
                                        TargetControlID="mev_Fecha_Reajuste_Definitivo" />
                                </td>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Publicacion_Reajuste_Definitivo" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Publicacion_Reajuste_DefinitivoRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Definitivo_Fis_Catalogo_Fecha_Publicacion" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Publicacion_Reajuste_DefinitivoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Definitivo_Fis_Catalogo_Fecha_Publicacion") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Descripcion_Definitiva" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Descripcion_DefinitivaRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>
                                <td colspan="3">
                                    <asp:TextBox 
                                        ID="Descripcion_Definitiva" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG"
                                        Width="400px"
                                        Height="50px"
                                        TextMode="MultiLine"
                                        ToolTip='<%# GetLocalResourceObject("Descripcion_DefinitivaRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Descripcion_Definitiva") %>'>
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
                        ID="Apu_Presupuesto_Apu_Origen_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Apu_Presupuesto_Apu_Origen_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Provisional_Fis_Catalogo_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Provisional_Fis_Catalogo_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Definitivo_Fis_Catalogo_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Definitivo_Fis_Catalogo_Id") %>'>
                    </asp:TextBox>
                    
                    <%--campos no visible--%>
                    
                    <asp:TextBox 
                        ID="Contratista_Per_Personal_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Contratista_Per_Personal_Nombre") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Apu_Presupuesto_Codigo_Institucional" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Apu_Presupuesto_Codigo_Institucional") %>'>
                    </asp:TextBox>                                        
                    
                    <asp:TextBox 
                        ID="Fecha_Pago" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Fecha_Pago") %>'>
                    </asp:TextBox>                                        
                    
                    <asp:TextBox 
                        ID="Apu_Presupuesto_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Apu_Presupuesto_Codigo") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Apu_Presupuesto_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Apu_Presupuesto_Nombre") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Tipo_Nombre" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Tipo_Nombre") %>'>
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
                        ID="pnl_Planillas" 
                        runat="server" 
                        meta:resourcekey="Rec_Fis_PlanillaRecursoKCG" >
                        <table>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Numero_Planilla" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Numero_PlanillaRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>
                                <td>    
                                    <asp:TextBox 
                                        ID="Numero_Planilla" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Numero_PlanillaRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Numero_Planilla") %>'>
                                    </asp:TextBox>
                                </td>
                                <td> 
                                    <asp:Label 
                                        ID="lbl_AnticipoDeve" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Anticipo_DevengarRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>
                                <td> 
                                    <asp:TextBox 
                                        ID="Anticipo_Devengar" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("Anticipo_DevengarRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Anticipo_Devengar","{0:N2}") %>'>
                                    </asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Deduccion_Anticipo" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Deduccion_AnticipoRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Deduccion_Anticipo" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("Deduccion_AnticipoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Deduccion_Anticipo","{0:N2}") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Fecha_Inicio_Ingreso" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Fecha_PresentacionRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Fecha_Inicio_Ingreso" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        CssClass="TEXTO_LECTURA_KCG"  
                                        ToolTip='<%# GetLocalResourceObject("Fecha_PresentacionRecursoKCG.ToolTip").ToString() %>'                                      
                                        Text='<%# Bind("Fecha_Inicio_Ingreso") %>'>
                                    </asp:TextBox>                                    
                                </td>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Fecha_Ultimo_Ingreso" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Fecha_Ultimo_IngresoRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Fecha_Ultimo_Ingreso" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        CssClass="TEXTO_LECTURA_KCG"  
                                        ToolTip='<%# GetLocalResourceObject("Fecha_Ultimo_IngresoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Fecha_Ultimo_Ingreso") %>'>
                                    </asp:TextBox>                                    
                                </td>
                                <td> 
                                    <asp:Label 
                                        ID="lbl_Tipo_Planilla" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Tipo_PlanillaRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>
                                <td> 
                                    <asp:TextBox 
                                        ID="Tipo_Nombre" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"   
                                        ToolTip='<%# GetLocalResourceObject("Tipo_PlanillaRecursoKCG.ToolTip").ToString() %>'                                    
                                        Text='<%# Bind("Tipo_Nombre") %>'>
                                    </asp:TextBox>                                    
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Fecha_Inicial" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Fecha_InicialRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                    <asp:TextBox 
                                        ID="txt_p3" 
                                        Width="30px"
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
                                        ID="Fecha_Inicial" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        CssClass="TEXTO_LECTURA_KCG"  
                                        ToolTip='<%# GetLocalResourceObject("Fecha_InicialRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Fecha_Inicial") %>'>
                                    </asp:TextBox>                                   
                                </td>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Fecha_Final" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Fecha_FinalRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Fecha_Final" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        CssClass="TEXTO_LECTURA_KCG"  
                                        ToolTip='<%# GetLocalResourceObject("Fecha_FinalRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Fecha_Final") %>'>
                                    </asp:TextBox>                                    
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Total" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("TotalRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Total" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("TotalRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Total","{0:N2}") %>'>
                                    </asp:TextBox> 
                                </td>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Porcentaje_Iva" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Porcentaje_IvaRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Porcentaje_Iva" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        CssClass="TEXTO_LECTURA_KCG"  
                                        style="text-align:left"
                                        ToolTip='<%# GetLocalResourceObject("Porcentaje_IvaRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Porcentaje_Iva") %>'>
                                    </asp:TextBox>                                   
                                    <asp:Label 
                                        ID="lbl_Porc1" 
                                        runat="server"
                                        Font-Bold="true"
                                        Text="%">
                                    </asp:Label>  
                                </td>
                                <td>                                 
                                    <asp:Label 
                                        ID="lbl_Porcentaje_Retencion" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Porcentaje_RetencionRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>   
                                </td>
                                <td>                             
                                    <asp:TextBox 
                                        ID="Porcentaje_Retencion" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        CssClass="TEXTO_LECTURA_KCG"  
                                        style="text-align:left"
                                        ToolTip='<%# GetLocalResourceObject("Porcentaje_RetencionRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Porcentaje_Retencion") %>'>
                                    </asp:TextBox>                                    
                                    <asp:Label 
                                        ID="lbl_Porc2" 
                                        runat="server"
                                        Font-Bold="true"
                                        Text="%">
                                    </asp:Label>   
                                </td>
                            </tr>
                        </table>
                        <table>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Descripcion" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("DescripcionRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>
                                <td colspan="3">
                                    <asp:TextBox 
                                        ID="Descripcion" 
                                        runat="server" 
                                        CssClass="TEXTO_LECTURA_KCG"
                                        Width="400px"
                                        Height="50px"
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        TextMode="MultiLine"
                                        ToolTip='<%# GetLocalResourceObject("DescripcionRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Descripcion") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Fecha_Reajuste_Provisional" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Fecha_Reajuste_ProvisionalRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Fecha_Reajuste_Provisional" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        CssClass="TEXTO_LECTURA_KCG"
                                        ToolTip='<%# GetLocalResourceObject("Fecha_Reajuste_ProvisionalRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Fecha_Reajuste_Provisional") %>'>
                                    </asp:TextBox>                                    
                                </td>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Publicacion_Reajuste_Provisional" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Publicacion_Reajuste_ProvisionalRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Provisional_Fis_Catalogo_Fecha_Publicacion" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Publicacion_Reajuste_ProvisionalRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Provisional_Fis_Catalogo_Fecha_Publicacion") %>'>
                                    </asp:TextBox>                                    
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Descripcion_Provisional" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Descripcion_ProvisionalRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>
                                <td colspan="3">
                                    <asp:TextBox 
                                        ID="Descripcion_Provisional" 
                                        runat="server" 
                                        CssClass="TEXTO_LECTURA_KCG"
                                        Width="400px"
                                        Height="50px"
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        TextMode="MultiLine"
                                        ToolTip='<%# GetLocalResourceObject("Descripcion_ProvisionalRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Descripcion_Provisional") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Fecha_Reajuste_Definitivo" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Fecha_Reajuste_DefinitivoRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Fecha_Reajuste_Definitivo" 
                                        runat="server" 
                                        CssClass="TEXTO_LECTURA_KCG"
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Fecha_Reajuste_DefinitivoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Fecha_Reajuste_Definitivo") %>'>
                                    </asp:TextBox>                                    
                                </td>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Publicacion_Reajuste_Definitivo" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Publicacion_Reajuste_DefinitivoRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Definitivo_Fis_Catalogo_Fecha_Publicacion" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Publicacion_Reajuste_DefinitivoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Definitivo_Fis_Catalogo_Fecha_Publicacion") %>'>
                                    </asp:TextBox>                                    
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Descripcion_Definitiva" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Descripcion_DefinitivaRecursoKCG.Text").ToString() %>' >
                                    </asp:Label>
                                </td>
                                <td colspan="3">
                                    <asp:TextBox 
                                        ID="Descripcion_Definitiva" 
                                        runat="server" 
                                        CssClass="TEXTO_LECTURA_KCG"
                                        Width="400px"
                                        Height="50px"
                                        TextMode="MultiLine"
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Descripcion_DefinitivaRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Descripcion_Definitiva") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
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
                        ID="Apu_Presupuesto_Apu_Origen_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Apu_Presupuesto_Apu_Origen_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Provisional_Fis_Catalogo_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Provisional_Fis_Catalogo_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Definitivo_Fis_Catalogo_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Definitivo_Fis_Catalogo_Id") %>'>
                    </asp:TextBox>
                    
                    <%--campos no visible--%>
                    
                    <asp:TextBox 
                        ID="Contratista_Per_Personal_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Contratista_Per_Personal_Nombre") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Apu_Presupuesto_Codigo_Institucional" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Apu_Presupuesto_Codigo_Institucional") %>'>
                    </asp:TextBox>                                        
                    
                    <asp:TextBox 
                        ID="Fecha_Pago" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Fecha_Pago") %>'>
                    </asp:TextBox>                                        
                    
                    <asp:TextBox 
                        ID="Apu_Presupuesto_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Apu_Presupuesto_Codigo") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Apu_Presupuesto_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Apu_Presupuesto_Nombre") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Tipo_Planilla" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Tipo_Planilla") %>'>
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
                ID="odsFv_Fis_Planilla" 
                runat="server" 
                ConflictDetection="CompareAllValues"
                DeleteMethod="Delete" 
                InsertMethod="Insert" 
                OldValuesParameterFormatString="original{0}"
                SelectMethod="GetById" 
                SortParameterName="sortExpression" 
                TypeName="FEL.FIS.BO_Fis_Planilla"
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
                            GridViewID="Gv_Fis_Planilla"
                            FormViewID="Fv_Fis_Planilla" 
                            OnNavegar="nav_Siguiente" />
                    </td>
                    <td>
                        <koala:KFiltro 
                            ID="kftFiltro" 
                            runat="server" 
                            Contenedor="FIS_PLANILLA" 
                            Objeto="Fis_Planilla" 
                            IndiceScope ="Scope"
                            Orden="1" 
                            ObjectDataSourceID="odsGv_Fis_Planilla"/>
                    </td>
                    <td>
                        <asp:Button 
                            ID="Btn_Fis_Fiscalizacion" 
                            runat="server" 
                            meta:resourcekey="Btn_Fis_FiscalizacionRecursoKCG" 
                            OnClick="Btn_Fis_Fiscalizacion_Click" />
                    </td>
                    <td>
                        <asp:Button 
                            ID="Btn_Fis_Planilla_Def" 
                            runat="server" 
                            meta:resourcekey="Btn_Fis_Planilla_DefRecursoKCG" 
                            OnClick="Btn_Fis_Planilla_Def_Click" />
                    </td>
                    <td>
                        <asp:Button 
                            ID="Btn_Fis_Planilla_Resumen" 
                            runat="server" 
                            meta:resourcekey="Btn_Fis_Planilla_ResumenRecursoKCG" 
                            OnClick="Btn_Fis_Planilla_Resumen_Click" />
                    </td>
                    <td>
                        <asp:Button 
                            ID="Btn_Fis_Planilla_Multas" 
                            runat="server" 
                            meta:resourcekey="Btn_Fis_Planilla_MultasRecursoKCG" 
                            OnClick="Btn_Fis_Planilla_Multas_Click" />
                    </td>
                </tr>
            </table>
            <asp:Panel 
                ID="pnl_Listado" 
                runat="server" 
                meta:resourcekey="Rec_Fis_ListadoRecursoKCG" >
                <koala:KGrid
                    ID="Gv_Fis_Planilla" 
                    runat="server" 
                    AllowPaging="True" 
                    AllowSorting="True"
                    AutoGenerateColumns="False" 
                    DataKeyNames="Id" 
                    DataSourceID="odsGv_Fis_Planilla"
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
                            DataField="Numero_Planilla" 
                            meta:resourcekey="BoundNumero_PlanillaRecursoKCG"
                            SortExpression="Numero_Planilla">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Fecha_Inicio_Ingreso" 
                            meta:resourcekey="BoundFecha_Inicio_IngresoRecursoKCG"
                            SortExpression="Fecha_Inicio_Ingreso"
                            DataFormatString="{0:dd/MM/yyyy}">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Fecha_Ultimo_Ingreso" 
                            meta:resourcekey="BoundFecha_Ultimo_IngresoRecursoKCG"
                            SortExpression="Fecha_Ultimo_Ingreso"
                            DataFormatString="{0:dd/MM/yyyy}">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Fecha_Inicial" 
                            meta:resourcekey="BoundFecha_InicialRecursoKCG"
                            SortExpression="Fecha_Inicial"
                            DataFormatString="{0:dd/MM/yyyy}">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Fecha_Final" 
                            meta:resourcekey="BoundFecha_FinalRecursoKCG"
                            SortExpression="Fecha_Final"
                            DataFormatString="{0:dd/MM/yyyy}">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Fecha_Pago" 
                            meta:resourcekey="BoundFecha_PagoRecursoKCG"
                            SortExpression="Fecha_Pago"
                            DataFormatString="{0:dd/MM/yyyy}">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        
                        <asp:BoundField 
                            DataField="Tipo_Nombre" 
                            HeaderText="Tipo" 
                            SortExpression="Tipo_Nombre">
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                            
                        <asp:BoundField 
                            DataField="Contratista_Per_Personal_Nombre" 
                            HeaderText="Contratista_Per_Personal_Nombre"
                            SortExpression="Contratista_Per_Personal_Nombre" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Presupuesto_Codigo_Institucional" 
                            HeaderText="Apu_Presupuesto_Codigo_Institucional"
                            SortExpression="Apu_Presupuesto_Codigo_Institucional" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Descripcion" 
                            HeaderText="Descripcion" 
                            SortExpression="Descripcion"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Tipo_Planilla" 
                            HeaderText="Tipo_Planilla" 
                            SortExpression="Tipo_Planilla"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Presupuesto_Id" 
                            HeaderText="Apu_Presupuesto_Id" 
                            SortExpression="Apu_Presupuesto_Id"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Porcentaje_Iva" 
                            HeaderText="Porcentaje_Iva" 
                            SortExpression="Porcentaje_Iva"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Porcentaje_Retencion" 
                            HeaderText="Porcentaje_Retencion"
                            SortExpression="Porcentaje_Retencion" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Fecha_Reajuste_Provisional" 
                            HeaderText="Fecha_Reajuste_Provisional"
                            SortExpression="Fecha_Reajuste_Provisional" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Fecha_Reajuste_Definitivo" 
                            HeaderText="Fecha_Reajuste_Definitivo"
                            SortExpression="Fecha_Reajuste_Definitivo" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Descripcion_Provisional" 
                            HeaderText="Descripcion_Provisional"
                            SortExpression="Descripcion_Provisional" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Descripcion_Definitiva" 
                            HeaderText="Descripcion_Definitiva"
                            SortExpression="Descripcion_Definitiva" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Anticipo_Devengar" 
                            HeaderText="Anticipo_Devengar" 
                            SortExpression="Anticipo_Devengar"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Publicacion_Reajuste_Provisional" 
                            HeaderText="Publicacion_Reajuste_Provisional"
                            SortExpression="Publicacion_Reajuste_Provisional" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Publicacion_Reajuste_Definitivo" 
                            HeaderText="Publicacion_Reajuste_Definitivo"
                            SortExpression="Publicacion_Reajuste_Definitivo" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Presupuesto_Apu_Origen_Id" 
                            HeaderText="Apu_Presupuesto_Apu_Origen_Id"
                            SortExpression="Apu_Presupuesto_Apu_Origen_Id" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Presupuesto_Codigo" 
                            HeaderText="Apu_Presupuesto_Codigo"
                            SortExpression="Apu_Presupuesto_Codigo" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Presupuesto_Nombre" 
                            HeaderText="Apu_Presupuesto_Nombre"
                            SortExpression="Apu_Presupuesto_Nombre" 
                            Visible="False" />
                    
                        <asp:BoundField 
                            DataField="Estado_Nombre" 
                            HeaderText="Estado_Nombre" 
                            SortExpression="Estado_Nombre"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Total" 
                            HeaderText="Total" 
                            SortExpression="Total" 
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
                        <asp:BoundField 
                            DataField="Deduccion_Anticipo" 
                            HeaderText="Deduccion_Anticipo" 
                            SortExpression="Deduccion_Anticipo" 
                            Visible="False" />
                    </Columns>
                </koala:KGrid>
                <asp:ObjectDataSource 
                    ID="odsGv_Fis_Planilla" 
                    runat="server" 
                    OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetByPresupuesto" 
                    TypeName="FEL.FIS.BO_Fis_Planilla">
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

