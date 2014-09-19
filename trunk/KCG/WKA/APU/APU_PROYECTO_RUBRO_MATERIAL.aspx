<%@ Page Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="APU_PROYECTO_RUBRO_MATERIAL.aspx.cs" 
    Inherits="APU_APU_PROYECTO_RUBRO_MATERIAL" 
    meta:resourcekey="Tit_Apu_Proyecto_Rubro_MaterialRecursoKCG"
    StylesheetTheme="EstiloKCG"
    Theme="EstiloKCG" %>

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
    
    <%@ Register tagprefix="koala" 
    assembly="KoalaWebControls" 
    namespace="Koala.KoalaWebControls" %>
    
<asp:Content ID="Content1" 
    ContentPlaceHolderID="ContentPlaceHolder1" 
    Runat="Server">
    
    <script type="text/javascript">
        // Work around browser behavior of "auto-submitting" simple forms
        Sys.Application.add_load(page_load);
        Sys.Application.add_unload(page_unload);
                
        var costo_unitario = null;
        var Cantidad = null;
        
        function page_load(sender, e){
        Cantidad = $get("ctl00_ContentPlaceHolder1_fvApuProyectoRubroMaterial_Cantidad");
        costo_unitario = $get("ctl00_ContentPlaceHolder1_fvApuProyectoRubroMaterial_costo_unitario");
        //Costo_Hora.onfocus = function preventFocus(e) { this.blur(); };
        $addHandler(Cantidad, "change", Cantidad_onchange);
        }
               
        function page_unload(sender, e){
        $removeHandler(Cantidad, "change", Cantidad_onchange);
        }
        
        function Cantidad_onchange(sender, e){
        Calcular();
        }
        
        var frm = document.getElementById("aspnetForm");
        if (frm) {
            frm.onsubmit = function() { return false; };
        }        

        function ItemSelected( source, eventArgs ) 
        {
            var valor = eventArgs.get_value();
            var temp = new Array();
            temp = valor.split('||');
            
            var Apu_Material_Id =     $get("ctl00_ContentPlaceHolder1_fvApuProyectoRubroMaterial_Apu_Material_Id");
            var Apu_Material_Unidad = $get("ctl00_ContentPlaceHolder1_fvApuProyectoRubroMaterial_Apu_Material_Unidad");
            
            Apu_Material_Id.value = temp[0];
            Apu_Material_Unidad.value = temp[2];
            costo_unitario.value = temp[1];
            
            Calcular();    
        }
        
        function Calcular()
        {
            var resultado = 0.00;
            var costo_total = $get("ctl00_ContentPlaceHolder1_fvApuProyectoRubroMaterial_costo_total");
                            
            var numCosto_unitario = Number.parseLocale(costo_unitario.value);
            if(isNaN(numCosto_unitario))
                numCosto_unitario = 0.0; 
            
            var numCantidad = Number.parseLocale(Cantidad.value);
            if(isNaN(numCantidad))
                numCantidad = 0.0;
            
            resultado = numCosto_unitario *  numCantidad;
            resultado = Redondear(resultado,4);
            costo_total.value = resultado.localeFormat("N4");
        }
        
        function Redondear(x,numeroDecimales) {
            return (Math.round(x*Math.pow(10,numeroDecimales)))/Math.pow(10,numeroDecimales);
        }
    </script>
    <asp:UpdatePanel ID="UpdatePanel1" 
        runat="server" 
        UpdateMode="Conditional">
        <ContentTemplate>
    <asp:FormView ID="fvApuProyectoRubroMaterial" 
        runat="server" 
        DataSourceID="odsFvApuProyectoRubroMaterial"
        DefaultMode="Insert">
        <EditItemTemplate>
            <asp:Panel ID="pnlProyecto"
                runat="server"
                meta:resourcekey="Rec_Proyecto_Rubro_Material_ProyectoRecursoKCG">
                <table style="white-space:nowrap">
                    <tr>
                        <td align="left">
                            <asp:Label 
                                ID="lblApu_Proyecto_Nombre"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Apu_Proyecto_NombreRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Apu_Proyecto_Codigo"
                                ReadOnly="True" 
                                TabIndex="-1"
                                runat="server" 
                                Text='<%# Bind("Apu_Proyecto_Codigo") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Proyecto_CodigoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                            <asp:TextBox ID="Apu_Proyecto_Nombre"
                                Width="400px"
                                Height="50px"
                                TabIndex="-1"
                                ReadOnly="True" 
                                runat="server" 
                                TextMode="MultiLine"
                                CssClass="TEXTO_LECTURA_KCG"
                                Text='<%# Bind("Apu_Proyecto_Nombre") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Proyecto_NombreRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            
            <asp:Panel ID="pnlRubro"
                runat="server"
                meta:resourcekey="Rec_Apu_Proyecto_Rubro_Material_RubroRecursoKCG">
                <table style="white-space:nowrap">
                    <tr align="left">
                        <td>
                            <asp:Label 
                                ID="lblApu_Rubro_Nombre" 
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                            
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="Apu_Rubro_Codigo"
                                ReadOnly = "True"
                                TabIndex="-1"
                                runat="server" 
                                Text='<%# Bind("Apu_Rubro_Codigo") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Rubro_CodigoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:TextBox 
                                ID="Apu_Rubro_Nombre"
                                Width="400px"
                                TabIndex="-1"
                                ReadOnly = "True"
                                runat="server" 
                                Text='<%# Bind("Apu_Rubro_Nombre") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>   
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            <asp:Label 
                                ID="lblApu_Rubro_Unidad" 
                                runat="server"                                                
                                Text='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="Apu_Rubro_Unidad"
                                ReadOnly = "True"
                                TabIndex="-1"
                                runat="server" 
                                Text='<%# Bind("Apu_Rubro_Unidad") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                </table> 
            </asp:Panel>
            
            <asp:Panel ID="pnlMaterial"
                runat="server"
                meta:resourcekey="Rec_Apu_Proyecto_Rubro_MaterialRecursoKCG">
                <table style="white-space:nowrap">
                    <tr  align="right">
                        <td colspan="2">
                            <asp:Label 
                                ID="Estado_Nombre" 
                                runat="server" 
                                Text='<%# Bind("Estado_Nombre") %>'>
                            </asp:Label>
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            <asp:Label 
                                ID="lblApu_Material_Nombre" 
                                runat="server"                                               
                                Text='<%# GetLocalResourceObject("Apu_Material_NombreRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Apu_Material_Nombre"
                                Style="text-transform:uppercase"
                                TabIndex="-1"
                                Height="50px"
                                TextMode="MultiLine" 
                                CssClass ="TEXTO_LECTURA_KCG"
                                Width="400px"
                                ReadOnly="True"
                                runat="server" 
                                Text='<%# Bind("Apu_Material_Nombre") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Material_NombreRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            <asp:Label 
                                ID="lblApu_Material_Unidad" 
                                runat="server"                                                
                                Text='<%# GetLocalResourceObject("Apu_Material_UnidadRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Apu_Material_Unidad"
                                ReadOnly="True" 
                                TabIndex="-1"
                                runat="server" 
                                Text='<%# Bind("Apu_Material_Unidad") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Material_UnidadRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            <asp:Label 
                                ID="lblCantidad" 
                                AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                AssociatedControlID="Cantidad" 
                                runat="server"                                                
                                Text='<%# GetLocalResourceObject("CantidadRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Cantidad"
                                Style="text-align:right"
                                CssClass="TEXTO_EDICION_KCG"
                                runat="server" 
                                Text='<%# Bind("Cantidad") %>'
                                ToolTip='<%# GetLocalResourceObject("CantidadRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            
                            <AjaxControlToolkit:MaskedEditExtender 
                                ID="meeCantidad" 
                                runat="server"
                                TargetControlID="Cantidad"
                                Mask="9,999,999,999,999.9999"
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

                            <AjaxControlToolkit:MaskedEditValidator ID="mevCantidad" runat="server"
                                ControlExtender="meeCantidad"
                                ControlToValidate="Cantidad"
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
                                ID="vceCantidad"
                                TargetControlID="mevCantidad"/> 
                            
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            <asp:Label 
                                ID="lblcosto_unitario" 
                                runat="server"                                                
                                Text='<%# GetLocalResourceObject("costo_unitarioRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="costo_unitario"
                                Style="text-align:right"
                                TabIndex="-1"
                                ReadOnly="True"  
                                runat="server" 
                                Text='<%# Bind("costo_unitario","{0:N4}") %>'
                                ToolTip='<%# GetLocalResourceObject("costo_unitarioRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:Label ID="lblint_moneda_simbolo"  
                                runat="server" 
                                Text='<%# Eval("int_moneda_simbolo") %>'>
                            </asp:Label>
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            <asp:Label 
                                ID="lblcosto_total" 
                                runat="server"                                                
                                Text='<%# GetLocalResourceObject("costo_totalRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="costo_total"
                                Style="text-align:right"
                                ReadOnly="True"  
                                TabIndex="-1"
                                runat="server" 
                                Text='<%# Bind("costo_total","{0:N4}") %>'
                                ToolTip='<%# GetLocalResourceObject("costo_totalRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:Label ID="Label1"  
                                runat="server" 
                                Text='<%# Eval("int_moneda_simbolo") %>'>
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
                             <uc1:wucMensajeActualizar ID="WucMensajeActualizar1" runat="server" />  
                        </td>
                    </tr>
                    
                </table>
            </asp:Panel>
            
            <%--IDs--%>
            
            <asp:TextBox ID="Apu_Proyecto_Rubro_Id"
                Style="display:none" 
                runat="server" 
                Text='<%# Bind("Apu_Proyecto_Rubro_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Material_Id"
                Style="display:none" 
                runat="server" 
                Text='<%# Bind("Apu_Material_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Creacion_Per_Personal_Id" 
                Style="display:none"
                runat="server" 
                Text='<%# Bind("Creacion_Per_Personal_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Update_Per_Personal_Id" 
                Style="display:none"
                runat="server" 
                Text='<%# Bind("Update_Per_Personal_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="UpdateTransporte_Per_Personal_Id"
                Style="display:none"
                runat="server" 
                Text='<%# Bind("UpdateTransporte_Per_Personal_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Proyecto_Id" 
                Style="display:none"
                runat="server" 
                Text='<%# Bind("Apu_Proyecto_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Rubro_Id"
                Style="display:none"
                runat="server" 
                Text='<%# Bind("Apu_Rubro_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Id" 
                Style="display:none"
                runat="server" 
                Text='<%# Bind("Id") %>'>
            </asp:TextBox>
            
            <%--Campos no visibles--%>        

            <asp:TextBox ID="Fecha_Creacion" 
                Visible="false"
                runat="server" 
                Text='<%# Bind("Fecha_Creacion") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Fecha_Update"  
                Visible="false"
                runat="server" 
                Text='<%# Bind("Fecha_Update") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Fecha_UpdateTransporte"  
                Visible="false"
                runat="server" 
                Text='<%# Bind("Fecha_UpdateTransporte") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Proyecto_Rubro_Codigo"  
                Visible="false"
                runat="server" 
                Text='<%# Bind("Apu_Proyecto_Rubro_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Proyecto_Etapa"  
                Visible="false"
                runat="server" 
                Text='<%# Bind("Apu_Proyecto_Etapa") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Material_Codigo"  
                Visible="false"
                runat="server" 
                Text='<%# Bind("Apu_Material_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Material_Costo_Parcial"  
                Visible="false"
                runat="server" 
                Text='<%# Bind("Apu_Material_Costo_Parcial") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Material_Costo_Otros"  
                Visible="false"
                runat="server" 
                Text='<%# Bind("Apu_Material_Costo_Otros") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Creacion_Per_Personal_Codigo"  
                Visible="false"
                runat="server" 
                Text='<%# Bind("Creacion_Per_Personal_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Creacion_Per_Personal_Nombre"  
                Visible="false"
                runat="server" 
                Text='<%# Bind("Creacion_Per_Personal_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Update_Per_Personal_Codigo"  
                Visible="false"
                runat="server" 
                Text='<%# Bind("Update_Per_Personal_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Update_Per_Personal_Nombre"  
                Visible="false"
                runat="server" 
                Text='<%# Bind("Update_Per_Personal_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="UpdateTransporte_Per_Personal_Codigo"  
                Visible="false"
                runat="server" 
                Text='<%# Bind("UpdateTransporte_Per_Personal_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="UpdateTransporte_Per_Personal_Nombre"  
                Visible="false"
                runat="server" 
                Text='<%# Bind("UpdateTransporte_Per_Personal_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="costo_unitario_transporte"  
                Visible="false"
                runat="server" 
                Text='<%# Bind("costo_unitario_transporte") %>'>
            </asp:TextBox>
            <asp:TextBox ID="costo_total_transporte"  
                Visible="false"
                runat="server" 
                Text='<%# Bind("costo_total_transporte") %>'>
            </asp:TextBox>
            <asp:TextBox ID="int_moneda_simbolo"  
                Visible="false"
                runat="server" 
                Text='<%# Bind("int_moneda_simbolo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Codigo"  
                Visible="false"
                runat="server" Text='<%# Bind("Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Nombre"  
                Visible="false"
                runat="server" 
                Text='<%# Bind("Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Estado"  
                Visible="false"
                runat="server" 
                Text='<%# Bind("Estado") %>'>
            </asp:TextBox>
        </EditItemTemplate>
        <InsertItemTemplate>
            <asp:Panel ID="pnlProyecto"
                runat="server"
                meta:resourcekey="Rec_Proyecto_Rubro_Material_ProyectoRecursoKCG">
                <table style="white-space:nowrap">
                    <tr>
                        <td align="left">
                            <asp:Label 
                                ID="lblApu_Proyecto_Nombre"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Apu_Proyecto_NombreRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Apu_Proyecto_Codigo"
                                ReadOnly="True" 
                                TabIndex="-1"
                                runat="server" 
                                Text='<%# Bind("Apu_Proyecto_Codigo") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Proyecto_CodigoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                            <asp:TextBox ID="Apu_Proyecto_Nombre"
                                Width="400px"
                                Height="50px"
                                ReadOnly="True" 
                                TabIndex="-1"
                                runat="server" 
                                TextMode="MultiLine"
                                CssClass="TEXTO_LECTURA_KCG"
                                Text='<%# Bind("Apu_Proyecto_Nombre") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Proyecto_NombreRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            
            <asp:Panel ID="pnlRubro"
                runat="server"
                meta:resourcekey="Rec_Apu_Proyecto_Rubro_Material_RubroRecursoKCG">
                <table style="white-space:nowrap">
                    <tr align="left">
                        <td>
                            <asp:Label 
                                ID="lblApu_Rubro_Nombre" 
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                            
                        </td>
                        <td style="white-space:nowrap">
                            <asp:TextBox 
                                ID="Apu_Rubro_Codigo"
                                ReadOnly = "True"
                                TabIndex="-1"
                                runat="server" 
                                Text='<%# Bind("Apu_Rubro_Codigo") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Rubro_CodigoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:TextBox 
                                ID="Apu_Rubro_Nombre"
                                Width="400px"
                                TabIndex="-1"
                                ReadOnly = "True"
                                runat="server" 
                                Text='<%# Bind("Apu_Rubro_Nombre") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>   
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            <asp:Label 
                                ID="lblApu_Rubro_Unidad" 
                                runat="server"                                                
                                Text='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="Apu_Rubro_Unidad"
                                ReadOnly = "True"
                                TabIndex="-1"
                                runat="server" 
                                Text='<%# Bind("Apu_Rubro_Unidad") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                </table> 
            </asp:Panel>
            
            <asp:Panel ID="pnlMaterial"
                runat="server"
                meta:resourcekey="Rec_Apu_Proyecto_Rubro_MaterialRecursoKCG">
                <table style="white-space:nowrap">
                    <tr  align="right">
                        <td colspan="2">
                            <asp:Label 
                                ID="Estado_Nombre" 
                                runat="server" 
                                Text='<%# Bind("Estado_Nombre") %>'>
                            </asp:Label>
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            <asp:Label 
                                ID="lblApu_Material_Nombre"
                                AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                AssociatedControlID="Apu_Material_Nombre"  
                                runat="server"                                                
                                Text='<%# GetLocalResourceObject("Apu_Material_NombreRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Apu_Material_Nombre"
                                Style="text-transform:uppercase"
                                Height="50px"
                                TextMode="MultiLine" 
                                Width="400px" 
                                CssClass="TEXTO_COMBOPER_KCG"
                                runat="server" 
                                Text='<%# Bind("Apu_Material_Nombre") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Material_NombreRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            
                            <asp:RequiredFieldValidator runat="server" 
                                ID="rfvApu_Material_Nombre"
                                ControlToValidate="Apu_Material_Nombre"
                                ValidationGroup="I"
                                ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                               <AjaxControlToolkit:ValidatorCalloutExtender 
                               runat="Server" ID="vceApu_Material_Nombre"
                               TargetControlID="rfvApu_Material_Nombre" />
                            
                            <AjaxControlToolkit:AutoCompleteExtender
                            runat="server" 
                            BehaviorID="AutoCompleteEx"
                            ID="autoComplete1" 
                            TargetControlID="Apu_Material_Nombre"
                            ServicePath="~/APU/APU_PROYECTO_RUBRO_MATERIAL.aspx" 
                            ServiceMethod="GetMaterial"
                            MinimumPrefixLength="1" 
                            CompletionInterval="500"
                            EnableCaching="true"
                            CompletionSetCount="500"
                            CompletionListCssClass="autocomplete_completionListElement" 
                            CompletionListItemCssClass="autocomplete_listItem" 
                            CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                            OnClientItemSelected="ItemSelected" >
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
                                            var behavior = $find('AutoCompleteEx');
                                            if (!behavior._height) {
                                                var target = behavior.get_completionList();
                                                behavior._height = target.offsetHeight - 2;
                                                target.style.height = '0px';
                                            }" />
                                        
                                        <%-- Expand from 0px to the appropriate size while fading in --%>
                                        <Parallel Duration=".4">
                                            <FadeIn />
                                            <Length PropertyKey="height" StartValue="0" EndValueScript="$find('AutoCompleteEx')._height" />
                                        </Parallel>
                                    </Sequence>
                                </OnShow>
                                <OnHide>
                                    <%-- Collapse down to 0px and fade out --%>
                                    <Parallel Duration=".4">
                                        <FadeOut />
                                        <Length PropertyKey="height" StartValueScript="$find('AutoCompleteEx')._height" EndValue="0" />
                                    </Parallel>
                                </OnHide>
                            </Animations>
                        </AjaxControlToolkit:AutoCompleteExtender>
                        
                        <%-- Prevent enter in textbox from causing the collapsible panel from operating --%>
                        <input type="submit" style="display:none;" />
                            
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            <asp:Label 
                                ID="lblApu_Material_Unidad" 
                                runat="server"                                                
                                Text='<%# GetLocalResourceObject("Apu_Material_UnidadRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Apu_Material_Unidad"
                                ReadOnly="True" 
                                TabIndex="-1"
                                runat="server" 
                                Text='<%# Bind("Apu_Material_Unidad") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Material_UnidadRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            <asp:Label 
                                ID="lblCantidad" 
                                runat="server"                                                
                                Text='<%# GetLocalResourceObject("CantidadRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Cantidad"
                                Style="text-align:right"
                                CssClass="TEXTO_EDICION_KCG"
                                runat="server" 
                                Text='<%# Bind("Cantidad") %>'
                                ToolTip='<%# GetLocalResourceObject("CantidadRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <AjaxControlToolkit:MaskedEditExtender 
                                ID="meeCantidad" 
                                runat="server"
                                TargetControlID="Cantidad"
                                Mask="9,999,999,999,999.9999"
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

                            <AjaxControlToolkit:MaskedEditValidator ID="mevCantidad" runat="server"
                                ControlExtender="meeCantidad"
                                ControlToValidate="Cantidad"
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
                                ID="vceCantidad"
                                TargetControlID="mevCantidad"/> 
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            <asp:Label 
                                ID="lblcosto_unitario" 
                                runat="server"                                                
                                Text='<%# GetLocalResourceObject("costo_unitarioRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="costo_unitario"
                                Style="text-align:right"
                                TabIndex="-1"
                                ReadOnly="True"  
                                runat="server" 
                                Text='<%# Bind("costo_unitario","{0:N4}") %>'
                                ToolTip='<%# GetLocalResourceObject("costo_unitarioRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:Label ID="lblint_moneda_simbolo"  
                                runat="server" 
                                Text='<%# Eval("int_moneda_simbolo") %>'>
                            </asp:Label>
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            <asp:Label 
                                ID="lblcosto_total" 
                                runat="server"                                                
                                Text='<%# GetLocalResourceObject("costo_totalRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="costo_total"
                                Style="text-align:right"
                                TabIndex="-1"
                                ReadOnly="True"  
                                runat="server" 
                                Text='<%# Bind("costo_total","{0:N4}") %>'
                                ToolTip='<%# GetLocalResourceObject("costo_totalRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:Label ID="Label2"  
                                runat="server" 
                                Text='<%# Eval("int_moneda_simbolo") %>'>
                            </asp:Label>
                        </td>
                    </tr>
                    <tr align="left" >
                        <td colspan="2">
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
            
            <%--IDs--%>
            
            <asp:TextBox ID="Apu_Proyecto_Rubro_Id"
                Style="display:none" 
                runat="server" 
                Text='<%# Bind("Apu_Proyecto_Rubro_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Material_Id"
                Style="display:none" 
                runat="server" 
                Text='<%# Bind("Apu_Material_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Creacion_Per_Personal_Id" 
                Style="display:none"
                runat="server" 
                Text='<%# Bind("Creacion_Per_Personal_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Update_Per_Personal_Id" 
                Style="display:none"
                runat="server" 
                Text='<%# Bind("Update_Per_Personal_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="UpdateTransporte_Per_Personal_Id"
                Style="display:none"
                runat="server" 
                Text='<%# Bind("UpdateTransporte_Per_Personal_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Proyecto_Id" 
                Style="display:none"
                runat="server" 
                Text='<%# Bind("Apu_Proyecto_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Rubro_Id"
                Style="display:none"
                runat="server" 
                Text='<%# Bind("Apu_Rubro_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Id" 
                Style="display:none"
                runat="server" 
                Text='<%# Bind("Id") %>'>
            </asp:TextBox>
            
            <%--Campos no visibles--%>        

            <asp:TextBox ID="Fecha_Creacion" 
                Visible="false"
                runat="server" 
                Text='<%# Bind("Fecha_Creacion") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Fecha_Update"  
                Visible="false"
                runat="server" 
                Text='<%# Bind("Fecha_Update") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Fecha_UpdateTransporte"  
                Visible="false"
                runat="server" 
                Text='<%# Bind("Fecha_UpdateTransporte") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Proyecto_Rubro_Codigo"  
                Visible="false"
                runat="server" 
                Text='<%# Bind("Apu_Proyecto_Rubro_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Proyecto_Etapa"  
                Visible="false"
                runat="server" 
                Text='<%# Bind("Apu_Proyecto_Etapa") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Material_Codigo"  
                Visible="false"
                runat="server" 
                Text='<%# Bind("Apu_Material_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Material_Costo_Parcial"  
                Visible="false"
                runat="server" 
                Text='<%# Bind("Apu_Material_Costo_Parcial") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Material_Costo_Otros"  
                Visible="false"
                runat="server" 
                Text='<%# Bind("Apu_Material_Costo_Otros") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Creacion_Per_Personal_Codigo"  
                Visible="false"
                runat="server" 
                Text='<%# Bind("Creacion_Per_Personal_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Creacion_Per_Personal_Nombre"  
                Visible="false"
                runat="server" 
                Text='<%# Bind("Creacion_Per_Personal_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Update_Per_Personal_Codigo"  
                Visible="false"
                runat="server" 
                Text='<%# Bind("Update_Per_Personal_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Update_Per_Personal_Nombre"  
                Visible="false"
                runat="server" 
                Text='<%# Bind("Update_Per_Personal_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="UpdateTransporte_Per_Personal_Codigo"  
                Visible="false"
                runat="server" 
                Text='<%# Bind("UpdateTransporte_Per_Personal_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="UpdateTransporte_Per_Personal_Nombre"  
                Visible="false"
                runat="server" 
                Text='<%# Bind("UpdateTransporte_Per_Personal_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="costo_unitario_transporte"  
                Visible="false"
                runat="server" 
                Text='<%# Bind("costo_unitario_transporte") %>'>
            </asp:TextBox>
            <asp:TextBox ID="costo_total_transporte"  
                Visible="false"
                runat="server" 
                Text='<%# Bind("costo_total_transporte") %>'>
            </asp:TextBox>
            <asp:TextBox ID="int_moneda_simbolo"  
                Visible="false"
                runat="server" 
                Text='<%# Bind("int_moneda_simbolo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Codigo"  
                Visible="false"
                runat="server" Text='<%# Bind("Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Nombre"  
                Visible="false"
                runat="server" 
                Text='<%# Bind("Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Estado"  
                Visible="false"
                runat="server" 
                Text='<%# Bind("Estado") %>'>
            </asp:TextBox>
            
        </InsertItemTemplate>
        <ItemTemplate>
            <asp:Panel ID="pnlProyecto"
                runat="server"
                meta:resourcekey="Rec_Proyecto_Rubro_Material_ProyectoRecursoKCG">
                <table style="white-space:nowrap">
                    <tr>
                        <td align="left">
                            <asp:Label 
                                ID="lblApu_Proyecto_Nombre"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Apu_Proyecto_NombreRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Apu_Proyecto_Codigo"
                                ReadOnly="True"
                                TabIndex="-1"
                                runat="server" 
                                Text='<%# Bind("Apu_Proyecto_Codigo") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Proyecto_CodigoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                            <asp:TextBox ID="Apu_Proyecto_Nombre"
                                Width="400px"
                                Height="50px"
                                TabIndex="-1"
                                ReadOnly="True" 
                                runat="server" 
                                TextMode="MultiLine"
                                CssClass="TEXTO_LECTURA_KCG"
                                Text='<%# Bind("Apu_Proyecto_Nombre") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Proyecto_NombreRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            
            <asp:Panel ID="pnlRubro"
                runat="server"
                meta:resourcekey="Rec_Apu_Proyecto_Rubro_Material_RubroRecursoKCG">
                <table style="white-space:nowrap">
                    <tr align="left">
                        <td>
                            <asp:Label 
                                ID="lblApu_Rubro_Nombre" 
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                            
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="Apu_Rubro_Codigo"
                                ReadOnly = "True"
                                TabIndex="-1"
                                runat="server" 
                                Text='<%# Bind("Apu_Rubro_Codigo") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Rubro_CodigoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:TextBox 
                                ID="Apu_Rubro_Nombre"
                                Width="400px"
                                TabIndex="-1"
                                ReadOnly = "True"
                                runat="server" 
                                Text='<%# Bind("Apu_Rubro_Nombre") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>   
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            <asp:Label 
                                ID="lblApu_Rubro_Unidad" 
                                runat="server"                                                
                                Text='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="Apu_Rubro_Unidad"
                                ReadOnly = "True"
                                TabIndex="-1"
                                runat="server" 
                                Text='<%# Bind("Apu_Rubro_Unidad") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                </table> 
            </asp:Panel>
            
            <asp:Panel ID="pnlMaterial"
                runat="server"
                meta:resourcekey="Rec_Apu_Proyecto_Rubro_MaterialRecursoKCG">
                <table style="white-space:nowrap">
                    <tr  align="right">
                        <td colspan="2">
                            <asp:Label 
                                ID="Estado_Nombre" 
                                runat="server" 
                                Text='<%# Bind("Estado_Nombre") %>'>
                            </asp:Label>
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            <asp:Label 
                                ID="lblApu_Material_Nombre" 
                                runat="server"                                                
                                Text='<%# GetLocalResourceObject("Apu_Material_NombreRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Apu_Material_Nombre"
                                Style="text-transform:uppercase"
                                Height ="50px"
                                TextMode="MultiLine" 
                                CssClass ="TEXTO_LECTURA_KCG"
                                Width="400px"  
                                TabIndex="-1"
                                ReadOnly = "True"
                                runat="server" 
                                Text='<%# Bind("Apu_Material_Nombre") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Material_NombreRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            <asp:Label 
                                ID="lblApu_Material_Unidad" 
                                runat="server"                                                
                                Text='<%# GetLocalResourceObject("Apu_Material_UnidadRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Apu_Material_Unidad" 
                                ReadOnly = "True"
                                TabIndex="-1"
                                runat="server" 
                                Text='<%# Bind("Apu_Material_Unidad") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Material_UnidadRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            <asp:Label 
                                ID="lblCantidad" 
                                runat="server"                                                
                                Text='<%# GetLocalResourceObject("CantidadRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Cantidad" 
                                Style="text-align:right"
                                TabIndex="-1"
                                ReadOnly = "True"
                                runat="server" 
                                Text='<%# Bind("Cantidad","{0:N4}") %>'
                                ToolTip='<%# GetLocalResourceObject("CantidadRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            <asp:Label 
                                ID="lblcosto_unitario" 
                                runat="server"                                                
                                Text='<%# GetLocalResourceObject("costo_unitarioRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="costo_unitario"
                                Style="text-align:right" 
                                ReadOnly = "True"
                                TabIndex="-1"
                                runat="server" 
                                Text='<%# Bind("costo_unitario","{0:N4}") %>'
                                ToolTip='<%# GetLocalResourceObject("costo_unitarioRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:Label ID="lblint_moneda_simbolo"  
                                runat="server" 
                                Text='<%# Eval("int_moneda_simbolo") %>'>
                            </asp:Label>
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            <asp:Label 
                                ID="lblcosto_total" 
                                runat="server"                                                
                                Text='<%# GetLocalResourceObject("costo_totalRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="costo_total" 
                                Style="text-align:right"
                                TabIndex="-1"
                                ReadOnly = "True"
                                runat="server" 
                                Text='<%# Bind("costo_total","{0:N4}") %>'
                                ToolTip='<%# GetLocalResourceObject("costo_totalRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:Label ID="Label3"  
                                runat="server" 
                                Text='<%# Eval("int_moneda_simbolo") %>'>
                            </asp:Label>
                        </td>
                    </tr>
                    <tr align="left">
                        <td colspan="2">
                            <asp:Button 
                                ID="EditButton" 
                                runat="server"
                                CausesValidation="False" 
                                CommandName="Edit"
                                Enabled='<%# HER.PermisosMovimientos.Movimiento_Apu_Proyecto_Rubro_Material(Request.QueryString["Estado"], Request.QueryString["Apu_Presupuesto_Estado"], HER.PermisosMovimientos.ModoOperacion.Editar ) %>'
                                AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_EditarRecursoKCG.AccesKey").ToString() %>'  
                                Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_EditRecursoKCG.Text").ToString() %>'
                                ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_EditRecursoKCG.ToolTip").ToString() %>'>
                            </asp:Button>
                            <asp:Button 
                                ID="DeleteButton" 
                                runat="server" 
                                CausesValidation="False" 
                                CommandName="Delete"
                                Enabled='<%# HER.PermisosMovimientos.Movimiento_Apu_Proyecto_Rubro_Material(Request.QueryString["Estado"], Request.QueryString["Apu_Presupuesto_Estado"], HER.PermisosMovimientos.ModoOperacion.Eliminar ) %>'
                                AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_EliminarRecursoKCG.AccesKey").ToString() %>'  
                                Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_DeleteRecursoKCG.Text").ToString() %>'
                                ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_DeleteRecursoKCG.ToolTip").ToString() %>'>
                            </asp:Button>
                            <asp:Button 
                                ID="NewButton" 
                                runat="server" 
                                CausesValidation="False" 
                                CommandName="New"
                                Enabled='<%# HER.PermisosMovimientos.Movimiento_Apu_Proyecto_Rubro_Material(Request.QueryString["Estado"], Request.QueryString["Apu_Presupuesto_Estado"], HER.PermisosMovimientos.ModoOperacion.Nuevo ) %>'
                                AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_NuevoRecursoKCG.AccesKey").ToString() %>'  
                                Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_NewRecursoKCG.Text").ToString() %>'
                                ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_NewRecursoKCG.ToolTip").ToString() %>'>
                            </asp:Button>
                            <uc2:wucMensajeEliminar ID="WucMensajeEliminar1" runat="server" /> 
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            
            <%--IDs--%>
            
            <asp:TextBox ID="Apu_Proyecto_Rubro_Id"
                Style="display:none" 
                runat="server" 
                Text='<%# Bind("Apu_Proyecto_Rubro_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Material_Id"
                Style="display:none" 
                runat="server" 
                Text='<%# Bind("Apu_Material_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Creacion_Per_Personal_Id" 
                Style="display:none"
                runat="server" 
                Text='<%# Bind("Creacion_Per_Personal_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Update_Per_Personal_Id" 
                Style="display:none"
                runat="server" 
                Text='<%# Bind("Update_Per_Personal_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="UpdateTransporte_Per_Personal_Id"
                Style="display:none"
                runat="server" 
                Text='<%# Bind("UpdateTransporte_Per_Personal_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Proyecto_Id" 
                Style="display:none"
                runat="server" 
                Text='<%# Bind("Apu_Proyecto_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Rubro_Id"
                Style="display:none"
                runat="server" 
                Text='<%# Bind("Apu_Rubro_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Id" 
                Style="display:none"
                runat="server" 
                Text='<%# Bind("Id") %>'>
            </asp:TextBox>
            
            <%--Campos no visibles--%>        

            <asp:TextBox ID="Fecha_Creacion" 
                Visible="false"
                runat="server" 
                Text='<%# Bind("Fecha_Creacion") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Fecha_Update"  
                Visible="false"
                runat="server" 
                Text='<%# Bind("Fecha_Update") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Fecha_UpdateTransporte"  
                Visible="false"
                runat="server" 
                Text='<%# Bind("Fecha_UpdateTransporte") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Proyecto_Rubro_Codigo"  
                Visible="false"
                runat="server" 
                Text='<%# Bind("Apu_Proyecto_Rubro_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Proyecto_Etapa"  
                Visible="false"
                runat="server" 
                Text='<%# Bind("Apu_Proyecto_Etapa") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Material_Codigo"  
                Visible="false"
                runat="server" 
                Text='<%# Bind("Apu_Material_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Material_Costo_Parcial"  
                Visible="false"
                runat="server" 
                Text='<%# Bind("Apu_Material_Costo_Parcial") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Material_Costo_Otros"  
                Visible="false"
                runat="server" 
                Text='<%# Bind("Apu_Material_Costo_Otros") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Creacion_Per_Personal_Codigo"  
                Visible="false"
                runat="server" 
                Text='<%# Bind("Creacion_Per_Personal_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Creacion_Per_Personal_Nombre"  
                Visible="false"
                runat="server" 
                Text='<%# Bind("Creacion_Per_Personal_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Update_Per_Personal_Codigo"  
                Visible="false"
                runat="server" 
                Text='<%# Bind("Update_Per_Personal_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Update_Per_Personal_Nombre"  
                Visible="false"
                runat="server" 
                Text='<%# Bind("Update_Per_Personal_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="UpdateTransporte_Per_Personal_Codigo"  
                Visible="false"
                runat="server" 
                Text='<%# Bind("UpdateTransporte_Per_Personal_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="UpdateTransporte_Per_Personal_Nombre"  
                Visible="false"
                runat="server" 
                Text='<%# Bind("UpdateTransporte_Per_Personal_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="costo_unitario_transporte"  
                Visible="false"
                runat="server" 
                Text='<%# Bind("costo_unitario_transporte") %>'>
            </asp:TextBox>
            <asp:TextBox ID="costo_total_transporte"  
                Visible="false"
                runat="server" 
                Text='<%# Bind("costo_total_transporte") %>'>
            </asp:TextBox>
            <asp:TextBox ID="int_moneda_simbolo"  
                Visible="false"
                runat="server" 
                Text='<%# Bind("int_moneda_simbolo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Codigo"  
                Visible="false"
                runat="server" Text='<%# Bind("Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Nombre"  
                Visible="false"
                runat="server" 
                Text='<%# Bind("Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Estado"  
                Visible="false"
                runat="server" 
                Text='<%# Bind("Estado") %>'>
            </asp:TextBox>
        </ItemTemplate>
    </asp:FormView>
        <koala:KNavegacion 
            ID="nav"
            runat="server"
            GridViewID="gvApuProyectoRubroMaterial"
            FormViewID="fvApuProyectoRubroMaterial" 
            OnNavegar="nav_Siguiente" />
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="gvApuProyectoRubroMaterial" EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:ObjectDataSource ID="odsFvApuProyectoRubroMaterial" runat="server" DeleteMethod="Delete"
        InsertMethod="Insert" OldValuesParameterFormatString="original{0}" SelectMethod="GetById"
        TypeName="FEL.APU.BO_Apu_Proyecto_Rubro_Material" UpdateMethod="Update" ConflictDetection="CompareAllValues" SortParameterName="SortExpression">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
            <asp:Parameter Name="Id" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    
    <asp:UpdatePanel 
        ID="upBotones" 
        runat="server">
        <ContentTemplate>
            <asp:Button 
            ID="bRegreso" 
            runat="server" 
            Visible="False" />
            <asp:Button 
            ID="bResponder" 
            runat="server" 
            Visible="False" /> 
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <koala:KFiltro ID="kftFiltro" 
                runat="server" 
                Contenedor="APU_PROYECTO_RUBRO_MATERIAL" 
                Objeto="APU_PROYECTO_RUBRO_MATERIAL" 
                IndiceScope ="Scope"
                Orden="1" ObjectDataSourceID="odsGvApuPoyectoRubroMaterial"/>  
            
            <asp:Button ID="btn_Apu_Proyecto_Rubro"
                runat="server"
                Text="Rubro" />

            <asp:Panel ID="pnlGv" runat="server" meta:resourcekey="Rec_Listado_Apu_Proyecto_Rubro_MaterialRecursoKCG">
            
            <koala:KGrid ID="gvApuProyectoRubroMaterial" 
                runat="server" 
                AutoGenerateColumns="False"
                AllowSorting="True"
                DataSourceID="odsGvApuPoyectoRubroMaterial" 
                AllowPaging="True" 
                DataKeyNames="Id"
                AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>'>
                
                <AlternatingRowStyle CssClass="alternatingrowstyle" />
                <HeaderStyle CssClass="headerstyle" />
                <PagerStyle CssClass="pagerstyle" />
                <SelectedRowStyle CssClass="selectedrowstyle" />
                
                <Columns>
                    <asp:CommandField ButtonType="Button" 
                        SelectText="..." 
                        ShowSelectButton="True" />
                    <asp:BoundField DataField="Apu_Material_Codigo" 
                        meta:resourcekey="BoundApu_Material_CodigoRecursoKCG" 
                        SortExpression="Apu_Material_Codigo" >
                        <itemstyle horizontalalign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Apu_Material_Nombre" 
                        meta:resourcekey="BoundApu_Material_NombreRecursoKCG" 
                        SortExpression="Apu_Material_Nombre" >
                        <ItemStyle Wrap="False" width="80mm"/>
                    </asp:BoundField>
                    <asp:BoundField DataField="Apu_Material_Unidad" 
                        meta:resourcekey="BoundApu_Material_UnidadRecursoKCG" 
                        SortExpression="Apu_Material_Unidad" >
                        <itemstyle horizontalalign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Cantidad" 
                        meta:resourcekey="BoundCantidadRecursoKCG" 
                        SortExpression="Cantidad" 
                        dataformatstring="{0:N4}">
                        <ItemStyle horizontalalign="right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="costo_unitario" 
                        meta:resourcekey="Boundcosto_unitarioRecursoKCG" 
                        SortExpression="costo_unitario" 
                        dataformatstring="{0:N4}">
                        <ItemStyle horizontalalign="right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="costo_total" 
                        meta:resourcekey="Boundcosto_totalRecursoKCG" 
                        SortExpression="costo_total"
                        dataformatstring="{0:N4}">
                        <ItemStyle horizontalalign="right" />
                    </asp:BoundField>
                    
                    <%--Campos no visibles--%>
                    
                    <asp:BoundField DataField="Apu_Proyecto_Rubro_Id" HeaderText="Apu_Proyecto_Rubro_Id"
                        SortExpression="Apu_Proyecto_Rubro_Id" Visible="False" />
                    <asp:BoundField DataField="Apu_Material_Id" HeaderText="Apu_Material_Id" SortExpression="Apu_Material_Id" Visible="False" />
                    <asp:BoundField DataField="Fecha_Creacion" HeaderText="Fecha_Creacion" SortExpression="Fecha_Creacion" Visible="False" />
                    <asp:BoundField DataField="Creacion_Per_Personal_Id" HeaderText="Creacion_Per_Personal_Id"
                        SortExpression="Creacion_Per_Personal_Id" Visible="False" />
                    <asp:BoundField DataField="Fecha_Update" HeaderText="Fecha_Update" SortExpression="Fecha_Update" Visible="False" />
                    <asp:BoundField DataField="Update_Per_Personal_Id" HeaderText="Update_Per_Personal_Id"
                        SortExpression="Update_Per_Personal_Id" Visible="False" />
                    <asp:BoundField DataField="Fecha_UpdateTransporte" HeaderText="Fecha_UpdateTransporte"
                        SortExpression="Fecha_UpdateTransporte" Visible="False" />
                    <asp:BoundField DataField="UpdateTransporte_Per_Personal_Id" HeaderText="UpdateTransporte_Per_Personal_Id"
                        SortExpression="UpdateTransporte_Per_Personal_Id" Visible="False" />
                    <asp:BoundField DataField="Apu_Proyecto_Rubro_Codigo" HeaderText="Apu_Proyecto_Rubro_Codigo"
                        SortExpression="Apu_Proyecto_Rubro_Codigo" Visible="False" />
                    <asp:BoundField DataField="Apu_Proyecto_Id" HeaderText="Apu_Proyecto_Id" SortExpression="Apu_Proyecto_Id" Visible="False" />
                    <asp:BoundField DataField="Apu_Proyecto_Codigo" HeaderText="Apu_Proyecto_Codigo"
                        SortExpression="Apu_Proyecto_Codigo" Visible="False" />
                    <asp:BoundField DataField="Apu_Proyecto_Nombre" HeaderText="Apu_Proyecto_Nombre"
                        SortExpression="Apu_Proyecto_Nombre" Visible="False" />
                    <asp:BoundField DataField="Apu_Proyecto_Etapa" HeaderText="Apu_Proyecto_Etapa" SortExpression="Apu_Proyecto_Etapa" Visible="False" />
                    <asp:BoundField DataField="Apu_Rubro_Id" HeaderText="Apu_Rubro_Id" SortExpression="Apu_Rubro_Id" Visible="False" />
                    <asp:BoundField DataField="Apu_Rubro_Codigo" HeaderText="Apu_Rubro_Codigo" SortExpression="Apu_Rubro_Codigo" Visible="False" />
                    <asp:BoundField DataField="Apu_Rubro_Nombre" HeaderText="Apu_Rubro_Nombre" SortExpression="Apu_Rubro_Nombre" Visible="False" />
                    <asp:BoundField DataField="Apu_Rubro_Unidad" HeaderText="Apu_Rubro_Unidad" SortExpression="Apu_Rubro_Unidad" Visible="False" />
                    <asp:BoundField DataField="Apu_Material_Costo_Parcial" HeaderText="Apu_Material_Costo_Parcial"
                        SortExpression="Apu_Material_Costo_Parcial" Visible="False" />
                    <asp:BoundField DataField="Apu_Material_Costo_Otros" HeaderText="Apu_Material_Costo_Otros"
                        SortExpression="Apu_Material_Costo_Otros" Visible="False" />
                    <asp:BoundField DataField="Creacion_Per_Personal_Codigo" HeaderText="Creacion_Per_Personal_Codigo"
                        SortExpression="Creacion_Per_Personal_Codigo" Visible="False" />
                    <asp:BoundField DataField="Creacion_Per_Personal_Nombre" HeaderText="Creacion_Per_Personal_Nombre"
                        SortExpression="Creacion_Per_Personal_Nombre" Visible="False" />
                    <asp:BoundField DataField="Update_Per_Personal_Codigo" HeaderText="Update_Per_Personal_Codigo"
                        SortExpression="Update_Per_Personal_Codigo" Visible="False" />
                    <asp:BoundField DataField="Update_Per_Personal_Nombre" HeaderText="Update_Per_Personal_Nombre"
                        SortExpression="Update_Per_Personal_Nombre" Visible="False" />
                    <asp:BoundField DataField="UpdateTransporte_Per_Personal_Codigo" HeaderText="UpdateTransporte_Per_Personal_Codigo"
                        SortExpression="UpdateTransporte_Per_Personal_Codigo" Visible="False" />
                    <asp:BoundField DataField="UpdateTransporte_Per_Personal_Nombre" HeaderText="UpdateTransporte_Per_Personal_Nombre"
                        SortExpression="UpdateTransporte_Per_Personal_Nombre" Visible="False" />
                    <asp:BoundField DataField="costo_unitario_transporte" HeaderText="costo_unitario_transporte"
                        SortExpression="costo_unitario_transporte" Visible="False" />
                    <asp:BoundField DataField="costo_total_transporte" HeaderText="costo_total_transporte"
                        SortExpression="costo_total_transporte" Visible="False" />
                    <asp:BoundField DataField="int_moneda_simbolo" HeaderText="int_moneda_simbolo" SortExpression="int_moneda_simbolo" Visible="False" />
                    <asp:BoundField DataField="Estado_Nombre" HeaderText="Estado_Nombre" SortExpression="Estado_Nombre" Visible="False" />
                    <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" Visible="False" />
                    <asp:BoundField DataField="Codigo" HeaderText="Codigo" SortExpression="Codigo_int" Visible="False" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" Visible="False" />
                    <asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado" Visible="False" />
                </Columns>
            </koala:KGrid>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:ObjectDataSource ID="odsGvApuPoyectoRubroMaterial" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetByRubro" TypeName="FEL.APU.BO_Apu_Proyecto_Rubro_Material">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
            <asp:QueryStringParameter Name="Apu_Proyecto_Rubro_Id" QueryStringField="Apu_Proyecto_Rubro_id"
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    
</asp:Content>

