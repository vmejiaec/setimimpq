<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="APU_PROYECTO_RUBRO.aspx.cs" 
    Inherits="APU_APU_PROYECTO_RUBRO" 
    meta:resourcekey="Tit_Apu_Proyecto_RubroRecursoKCG" 
    Theme="EstiloKCG"
    StylesheetTheme="EstiloKCG"
    ValidateRequest="false" %>

<%@ Register Src="../WebUserControls/wucMensajeEliminar.ascx" 
    TagName="wucMensajeEliminar"
    TagPrefix="uc1" %>
    
<%@ Register Src="../WebUserControls/wucMensajeActualizar.ascx" 
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
            <script type="text/javascript" language="javascript">
                // Work around browser behavior of "auto-submitting" simple forms
                Sys.Application.add_load(page_load);
                Sys.Application.add_unload(page_unload);                                       
                
                var Costo_Unitario = null;
                var Cantidad = null;
                var Apu_Rubro_Codigo = null;
                
                function page_load(sender, e){
                Cantidad = $get("ctl00_ContentPlaceHolder1_fvapu_proyecto_rubro_Cantidad");                            
                Costo_Unitario = $get("ctl00_ContentPlaceHolder1_fvapu_proyecto_rubro_Costo_Unitario");     
                Apu_Rubro_Codigo = $get("ctl00_ContentPlaceHolder1_fvapu_proyecto_rubro_Apu_Rubro_Codigo");                                                                                                        
                $addHandler(Cantidad, "change", datos_onchange);
                $addHandler(Apu_Rubro_Codigo, "change", datos_onchange2);
                }
                
                function page_unload(sender, e){                            
                $removeHandler(Cantidad, "change", datos_onchange);
                $removeHandler(Apu_Rubro_Codigo, "change", datos_onchange2);
                }
                
                function datos_onchange(sender, e){
                Calcular();
                }
                
                function datos_onchange2(sender, e){ 
                Llamar_WebService();
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
                    
                    var Apu_Rubro_Id = $get("ctl00_ContentPlaceHolder1_fvapu_proyecto_rubro_Apu_Rubro_Id");
                    Apu_Rubro_Id.value = temp[0]; 
                                    
                    var Apu_Rubro_Nombre = $get("ctl00_ContentPlaceHolder1_fvapu_proyecto_rubro_Apu_Rubro_Nombre");
                    Apu_Rubro_Nombre.value = temp[1]; 
                                                  
                    var Apu_Rubro_Unidad = $get("ctl00_ContentPlaceHolder1_fvapu_proyecto_rubro_Apu_Rubro_Unidad");
                    Apu_Rubro_Unidad.value = temp[2];
                    
                    Costo_Unitario.value = temp[3];
                    
                    var Rendimiento_Mano_Obra = $get("ctl00_ContentPlaceHolder1_fvapu_proyecto_rubro_Rendimiento_Mano_Obra");
                    Rendimiento_Mano_Obra.value = temp[4];
                    
                    var Rendimiento_Equipo = $get("ctl00_ContentPlaceHolder1_fvapu_proyecto_rubro_Rendimiento_Equipo");              
                    Rendimiento_Equipo.value = temp[5];
                    
                    var Apu_Subtitulo_id = $get("ctl00_ContentPlaceHolder1_fvapu_proyecto_rubro_Apu_Subtitulo_id");
                    Apu_Subtitulo_id.value  = temp[6];
                    
                    var Equipo_costo_total_v = $get("ctl00_ContentPlaceHolder1_fvapu_proyecto_rubro_Equipo_costo_total_");
                    Equipo_costo_total_v.value  = temp[7];
                    
                    var Mano_obra_costo_total_v = $get("ctl00_ContentPlaceHolder1_fvapu_proyecto_rubro_Mano_obra_costo_total_");
                    Mano_obra_costo_total_v.value  = temp[8];
                    
                    var Material_costo_total_v = $get("ctl00_ContentPlaceHolder1_fvapu_proyecto_rubro_Material_costo_total_");
                    Material_costo_total_v.value  = temp[9];
                    
                    var Transporte_costo_total_v = $get("ctl00_ContentPlaceHolder1_fvapu_proyecto_rubro_Transporte_costo_total_");
                    Transporte_costo_total_v.value  = temp[9];
                                                                
                    Calcular();    
                }
                
                function Llamar_WebService()
                {                                           
                    var Apu_Rubro_Codigo = $get("ctl00_ContentPlaceHolder1_fvapu_proyecto_rubro_Apu_Rubro_Codigo").value;                                                                                     
                    Sys.Net.WebServiceProxy.invoke('APU_PROYECTO_RUBRO.aspx', 'GetProyectoRubrotest', false, {'codigo':Apu_Rubro_Codigo}, OnSucceeded, OnFailed,"User Context",1000000);
                }
                
                function OnSucceeded(result, eventArgs)
                {  
                    //Mostrar el Resultado                                                         
                    var temp = result;
                    
                    var Apu_Rubro_Id = $get("ctl00_ContentPlaceHolder1_fvapu_proyecto_rubro_Apu_Rubro_Id");
                    Apu_Rubro_Id.value = temp[0]; 
                                    
                    var Apu_Rubro_Nombre = $get("ctl00_ContentPlaceHolder1_fvapu_proyecto_rubro_Apu_Rubro_Nombre");
                    Apu_Rubro_Nombre.value = temp[1]; 
                                                  
                    var Apu_Rubro_Unidad = $get("ctl00_ContentPlaceHolder1_fvapu_proyecto_rubro_Apu_Rubro_Unidad");
                    Apu_Rubro_Unidad.value = temp[2];
                    
                    Costo_Unitario.value = temp[3];
                    
                    var Rendimiento_Mano_Obra = $get("ctl00_ContentPlaceHolder1_fvapu_proyecto_rubro_Rendimiento_Mano_Obra");
                    Rendimiento_Mano_Obra.value = temp[4];
                    
                    var Rendimiento_Equipo = $get("ctl00_ContentPlaceHolder1_fvapu_proyecto_rubro_Rendimiento_Equipo");              
                    Rendimiento_Equipo.value = temp[5];
                    
                    var Apu_Subtitulo_id = $get("ctl00_ContentPlaceHolder1_fvapu_proyecto_rubro_Apu_Subtitulo_id");
                    Apu_Subtitulo_id.value  = temp[6];
                    
                    var Equipo_costo_total_v = $get("ctl00_ContentPlaceHolder1_fvapu_proyecto_rubro_Equipo_costo_total_");
                    Equipo_costo_total_v.value  = temp[7];
                    
                    var Mano_obra_costo_total_v = $get("ctl00_ContentPlaceHolder1_fvapu_proyecto_rubro_Mano_obra_costo_total_");
                    Mano_obra_costo_total_v.value  = temp[8];
                    
                    var Material_costo_total_v = $get("ctl00_ContentPlaceHolder1_fvapu_proyecto_rubro_Material_costo_total_");
                    Material_costo_total_v.value  = temp[9];
                    
                    var Transporte_costo_total_v = $get("ctl00_ContentPlaceHolder1_fvapu_proyecto_rubro_Transporte_costo_total_");
                    Transporte_costo_total_v.value  = temp[9];
                }
                
                function OnFailed(error)
                {
                    // Display the error.    
                    var Apu_Rubro_Nombre = $get("ctl00_ContentPlaceHolder1_fvapu_proyecto_rubro_Apu_Rubro_Nombre");
                    Apu_Rubro_Nombre.value = "Service Error: " + error.get_message();
                }
                
                function Calcular()
                {
                    var resultado = 0.00;
                    var Costo_Total = $get("ctl00_ContentPlaceHolder1_fvapu_proyecto_rubro_Costo_Total");
                                    
                    var numCosto_Unitario = Number.parseLocale(Costo_Unitario.value);
                    if(isNaN(numCosto_Unitario))
                        numCosto_Unitario = 0.0; 
                    
                    var numCantidad = Number.parseLocale(Cantidad.value);
                    if(isNaN(numCantidad)) 
                         numCantidad = 0.0;
                    
                    resultado = numCosto_Unitario *  numCantidad;
                    resultado = Redondear(resultado,4);
                    Costo_Total.value = resultado.localeFormat("N4");
                }
                
                function Redondear(x,numeroDecimales) {
                    return (Math.round(x*Math.pow(10,numeroDecimales)))/Math.pow(10,numeroDecimales);
                }
            </script>
            <asp:FormView 
                ID="fvapu_proyecto_rubro" 
                runat="server" 
                DataSourceID="odsapu_proyecto_rubro"
                DefaultMode="Insert">
                <EditItemTemplate>
                    <asp:Panel
                        runat="server"
                        id="Panel1"
                        meta:resourcekey="Rec_Apu_Proyecto_Rubro_ProyectoRecursoKCG">
                        <table>
                            <tr align="left" >                                   
                                <td valign="top">
                                    <asp:TextBox 
                                        ID="Apu_Proyecto_Codigo" 
                                        runat="server"
                                        style="text-align:right"
                                        Width="60px"
                                        TabIndex="-1"                               
                                        ToolTip='<%# GetLocalResourceObject("Apu_Proyecto_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true" 
                                        Text='<%# Bind("Apu_Proyecto_Codigo") %>'>
                                    </asp:TextBox>
                                </td>
                                <td valign="top">
                                    <asp:TextBox 
                                        ID="Apu_Proyecto_Nombre" 
                                        runat="server"
                                        Width="600px" 
                                        Height="50px"
                                        CssClass ="TEXTO_LECTURA_KCG"
                                        TabIndex="-1"
                                        TextMode="MultiLine"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Proyecto_NombreRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        Text='<%# Bind("Apu_Proyecto_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                                <td valign="top">
                                    <asp:TextBox 
                                        ID="Apu_Proyecto_Costo_Total" 
                                        runat="server"  
                                        style="text-align:right"
                                        TabIndex="-1"
                                        ReadOnly="true"
                                        Text='<%# Bind("Apu_Proyecto_Costo_Total","{0:N2}") %>'>
                                    </asp:TextBox> 
                                    <asp:Label
                                        ID="lbmodena0" 
                                        runat="server"                                         
                                        Text='<%# Bind("int_moneda_simbolo") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                        </table>     
                    </asp:Panel> <!-- Inf. del Proyecto -->
                    <asp:Panel
                        runat="server"
                        id="Panel2"
                        meta:resourcekey="Rec_Apu_Proyecto_RubroRecursoKCG">
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
                            <tr align="center"> 
                                <td>
                                    <asp:Label 
                                        ID="lblcodigo" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Apu_Rubro_CodigoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label> 
                                </td>
                                <td>
                                    <asp:Label 
                                        ID="lblrubro" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>                                    
                                </td>
                                <td>
                                    <asp:Label 
                                        ID="lblunidad" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:Label 
                                        ID="lblvolumen" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("CantidadRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>    
                                </td>
                                <td>
                                    <asp:Label 
                                        ID="lblcosto_unitario" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Costo_UnitarioRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>    
                                </td>
                                <td>
                                    <asp:Label 
                                        ID="lblcosto_total" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.Text").ToString() %>'>
                                    </asp:Label> 
                                </td>
                            </tr> <!-- Cabecera -->
                            <tr>
                                <td valign="top">
                                    <asp:TextBox 
                                        ID="Apu_Rubro_Codigo" 
                                        runat="server"  
                                        Width="60px"
                                        TabIndex="-1"
                                        style="text-align:right"                                       
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        Text='<%# Bind("Apu_Rubro_Codigo") %>'>
                                    </asp:TextBox>    
                                </td>
                                <td valign="top">
                                    <asp:TextBox 
                                        ID="Apu_Rubro_Nombre" 
                                        runat="server" 
                                        style="text-transform:uppercase"
                                        Width="400px"
                                        CssClass ="TEXTO_LECTURA_KCG"
                                        Height="50px"
                                        TabIndex="-1"
                                        TextMode="MultiLine"
                                        ReadOnly="true"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Rubro_Nombre") %>'>
                                    </asp:TextBox>
                                </td> 
                                <td valign="top">
                                    <asp:TextBox 
                                        ID="Apu_Rubro_Unidad" 
                                        runat="server"                                        
                                        ReadOnly="true"  
                                        Width="50px"
                                        TabIndex="-1"
                                        style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("Apu_Rubro_Unidad") %>'>
                                    </asp:TextBox></td>
                                <td valign="top">
                                    <asp:TextBox 
                                        ID="Cantidad" 
                                        runat="server" 
                                        style="text-align:right"
                                        CssClass="TEXTO_EDICION_KCG"
                                        Width="110"
                                        ToolTip='<%# GetLocalResourceObject("CantidadRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("Cantidad") %>'>
                                    </asp:TextBox>
                                <AjaxControlToolkit:MaskedEditExtender 
                                    ID="meeCantidad" 
                                    runat="server"
                                    TargetControlID="Cantidad"
                                    Mask="999,999,999.9999"
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
                                <AjaxControlToolkit:MaskedEditValidator ID="MaskedEditValidator2" runat="server"
                                    ControlExtender="meeCantidad"
                                    ControlToValidate="Cantidad"
                                    IsValidEmpty="False"
                                    EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                    InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                    MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                    MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                    MinimumValue="0.0000"
                                    MaximumValue="999999999.9999" 
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
                                <td style="white-space:nowrap" valign="top">                                
                                    <asp:TextBox 
                                        ID="Costo_Unitario" 
                                        runat="server"
                                        style="text-align:right"
                                        tabindex="-1"
                                        ReadOnly="true" 
                                        ToolTip='<%# GetLocalResourceObject("Costo_UnitarioRecursoKCG.ToolTip").ToString() %>'  
                                        Text='<%# Bind("Costo_Unitario","{0:N4}") %>'>
                                    </asp:TextBox>
                                    <asp:Label
                                        ID="lblmoneda1" 
                                        runat="server"                                         
                                        Text='<%# Bind("int_moneda_simbolo") %>'>
                                    </asp:Label>                                                                                      
                                  </td>
                                  <td style="white-space:nowrap" valign="top">
                                    <asp:TextBox 
                                        ID="Costo_Total" 
                                        runat="server" 
                                        style="text-align:right"
                                        tabindex="-1"
                                        ReadOnly="true" 
                                        ToolTip='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.ToolTip").ToString() %>'  
                                        Text='<%# Bind("Costo_Total","{0:N2}") %>'>
                                    </asp:TextBox>
                                    <asp:Label
                                        ID="Label5" 
                                        runat="server"                                         
                                        Text='<%# Bind("int_moneda_simbolo") %>'>
                                    </asp:Label>                                       
                                  </td>
                            </tr> <!-- Datos -->
                                                  
                        </table> 
                    </asp:Panel>  <!-- Rubro del proyecto -->
                    <asp:Panel
                        runat="server"
                        id="pnleinsumos"
                        meta:resourcekey="Rec_Apu_Proyecto_Rubro_PrecioRecursoKCG">
                        <table>
                            <tr align="left">
                                <td>
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                                <td align="center">
                                     <asp:Label  
                                        ID="lblequipocostototal"
                                        runat="server" 
                                        visible="true"                                                                                              
                                        Text= '<%# GetLocalResourceObject("Lab_Proyecto_Rubro_Insumo_CostoRecursoKCG.Text").ToString() %>'>             
                                    </asp:Label>    
                                </td>
                            </tr>                        
                            <tr align="left">
                                <td> 
                                    <asp:Label
                                        ID="lblrendimiento"
                                        runat="server"                                                                                                        
                                        Text='<%# GetLocalResourceObject("Rendimiento_EquipoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label> 
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Rendimiento_Equipo" 
                                        runat="server" 
                                        style="text-align:right"
                                        CssClass="TEXTO_EDICION_KCG"
                                        TabIndex="-1"                                                 
                                        ToolTip='<%# GetLocalResourceObject("Rendimiento_EquipoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Rendimiento_Equipo") %>'>
                                    </asp:TextBox>                                    
                                    <asp:RequiredFieldValidator 
                                        runat="server" 
                                        ID="rfvrendimiento_equipo"
                                        ControlToValidate="Rendimiento_Equipo"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>'/>   
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server"  ID="ValidatorCalloutExtender7"
                                        TargetControlID="rfvrendimiento_equipo" />  
                                    <AjaxControlToolkit:MaskedEditExtender 
                                        ID="acrendimiento_equipo" 
                                        runat="server"
                                        TargetControlID="Rendimiento_Equipo"
                                        Mask="9,999,999,999,999.999999"
                                        MessageValidatorTip="false"
                                        OnFocusCssClass="MaskedEditFocus"
                                        OnInvalidCssClass="MaskedEditError"
                                        MaskType="Number"
                                        InputDirection="RightToLeft"
                                        AcceptNegative="None"
                                        DisplayMoney="None"
                                        ErrorTooltipEnabled="false"
                                        ClearMaskOnLostFocus="True"
                                        />                                      
                                </td>
                                <td>
                                    <asp:Button 
                                        ID="BtnEquipo" 
                                        runat="server"
                                        CausesValidation="True" 
                                        CommandName="Insert"
                                        ValidationGroup="I"
                                        AccessKey="I"
                                        Enabled="false"
                                        Text='<%# GetLocalResourceObject("Btn_Apu_Proyecto_Rubro_EquipoRecursoKCG.Text").ToString() %>'                                    
                                        ToolTip='<%# GetLocalResourceObject("Btn_Apu_Proyecto_Rubro_EquipoRecursoKCG.ToolTip").ToString() %>' OnClick="BtnEquipo_Click"/>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="TextBox2" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"                                                     
                                        style="text-align:right"                                                   
                                        Text='<%# Bind("Equipo_costo_total") %>'>
                                    </asp:TextBox>                                               
                                    <asp:Label 
                                        ID="Label1" 
                                        runat="server" 
                                        visible="true"                                                
                                        Text='<%# Bind("int_moneda_simbolo") %>'>
                                    </asp:Label>    
                                </td>
                            </tr>
                            <tr align="left">    
                                <td>  
                                    <asp:Label
                                        ID="lblrendimientomano"
                                        runat="server"                                                     
                                        Text='<%# GetLocalResourceObject("Rendimiento_Mano_ObraRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>                                     
                                    <asp:TextBox 
                                        ID="Rendimiento_Mano_Obra" 
                                        runat="server"
                                        Style="text-align:right"
                                        CssClass="TEXTO_EDICION_KCG"
                                        TabIndex="-1"                                                  
                                        ToolTip='<%# GetLocalResourceObject("Rendimiento_Mano_ObraRecursoKCG.ToolTip").ToString() %>'                                       
                                        Text='<%# Bind("Rendimiento_Mano_Obra") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        runat="server" 
                                        ID="rfvrendimiento_mano_obra"
                                        ControlToValidate="Rendimiento_Mano_Obra"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>'/>   
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server"  ID="ValidatorCalloutExtender2"
                                        TargetControlID="rfvrendimiento_mano_obra" />  
                                    <AjaxControlToolkit:MaskedEditExtender 
                                        ID="arendimientomano_obra" 
                                        runat="server"
                                        TargetControlID="Rendimiento_Mano_Obra"
                                        Mask="9,999,999,999,999.999999"
                                        MessageValidatorTip="false"
                                        OnFocusCssClass="MaskedEditFocus"
                                        OnInvalidCssClass="MaskedEditError"
                                        MaskType="Number"
                                        InputDirection="RightToLeft"
                                        AcceptNegative="None"
                                        DisplayMoney="None"
                                        ErrorTooltipEnabled="false"
                                        ClearMaskOnLostFocus="True"
                                        />                                                             
                                </td>  
                                <td>
                                    <asp:Button 
                                        ID="BtnManoObra" 
                                        runat="server"
                                        CausesValidation="True" 
                                        CommandName="Insert"
                                        ValidationGroup="I"
                                        Enabled="false"
                                        AccessKey="I"
                                        Text='<%# GetLocalResourceObject("Btn_Apu_Proyecto_Rubro_Mano_ObraRecursoKCG.Text").ToString() %>'                                    
                                        ToolTip='<%# GetLocalResourceObject("Btn_Apu_Proyecto_Rubro_Mano_ObraRecursoKCG.ToolTip").ToString() %>' OnClick="BtnManoObra_Click"/>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="TextBox1" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"                                                 
                                        style="text-align:right"                                                    
                                        Text='<%# Bind("Mano_obra_costo_total") %>'>
                                    </asp:TextBox>                                                              
                                    <asp:Label 
                                        ID="Label2" 
                                        runat="server"                                                                                                    
                                        Text='<%# Bind("int_moneda_simbolo") %>'>
                                    </asp:Label>        
                                </td>    
                            </tr>  
                            <tr align="left">
                                <td>
                                </td>
                                <td>
                                </td>
                                <td>
                                    <asp:Button 
                                        ID="BtnMateriales" 
                                        runat="server"
                                        CausesValidation="True" 
                                        CommandName="Insert"
                                        ValidationGroup="I"
                                        Enabled="false"
                                        AccessKey="I"
                                        Text='<%# GetLocalResourceObject("Btn_Apu_Proyecto_Rubro_MaterialRecursoKCG.Text").ToString() %>'                                    
                                        ToolTip='<%# GetLocalResourceObject("Btn_Apu_Proyecto_Rubro_MaterialRecursoKCG.ToolTip").ToString() %>' OnClick="BtnMateriales_Click"/>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="TextBox3" 
                                        runat="server" 
                                        style="text-align:right"
                                        TabIndex="-1"
                                        ReadOnly="true"                                                    
                                        Text='<%# Bind("Material_costo_total") %>'>
                                    </asp:TextBox>                                                            
                                    <asp:Label 
                                        ID="Label3" 
                                        runat="server" 
                                        visible="true"                                                
                                        Text='<%# Bind("int_moneda_simbolo") %>'>
                                    </asp:Label>  
                                </td>                           
                            </tr>
                            <tr align="left">
                                <td>                                
                                </td>
                                <td>
                                </td>
                                <td>
                                    <asp:Button 
                                        ID="BtnTransporte" 
                                        runat="server"
                                        CausesValidation="True" 
                                        CommandName="Insert"
                                        ValidationGroup="I"
                                        Enabled="false"
                                        AccessKey="I"
                                        Text='<%# GetLocalResourceObject("Btn_Apu_Proyecto_Rubro_TransporteRecursoKCG.Text").ToString() %>'                                    
                                        ToolTip='<%# GetLocalResourceObject("Btn_Apu_Proyecto_Rubro_TransporteRecursoKCG.ToolTip").ToString() %>' OnClick="BtnTransporte_Click"/>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="TextBox4" 
                                        runat="server" 
                                        style="text-align:right"
                                        TabIndex="-1"
                                        ReadOnly="true"
                                        Text='<%# Bind("Transporte_costo_total") %>'>
                                    </asp:TextBox>                                                
                                    <asp:Label 
                                        ID="Label4" 
                                        runat="server" 
                                        visible="true"                                                
                                        Text='<%# Bind("int_moneda_simbolo") %>'>
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
                    </asp:Panel> <!-- APU del Rubro -->
                                   
                    <%--ID'S--%>
                    
                    <asp:TextBox 
                        ID="Int_Sucursal_Id" 
                        runat="server" 
                        visible="true"
                        style="display:none"
                        Text='<%# Bind("Int_Sucursal_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Id" 
                        runat="server" 
                        visible="true"
                        style="display:none"
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Subtitulo_id" 
                        runat="server" 
                        visible="true"
                        style="display:none"
                        Text='<%# Bind("Apu_Subtitulo_id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Titulo_id" 
                        runat="server" 
                        visible="true"
                        style="display:none"
                        Text='<%# Bind("Apu_Titulo_id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Rubro_Id" 
                        runat="server" 
                        visible="true"
                        style="display:none"
                        Text='<%# Bind("Apu_Rubro_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Proyecto_Id" 
                        runat="server" 
                        visible="true"
                        style="display:none"
                        Text='<%# Bind("Apu_Proyecto_Id") %>'>
                    </asp:TextBox>
                                        
                    <%--CAMPOS NO VISIBLES--%>
                        
                    
                    <asp:TextBox 
                        ID="int_moneda_simbolo" 
                        runat="server" 
                        visible="False"
                        Text='<%# Bind("int_moneda_simbolo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Equipo_costo_total" 
                        runat="server" 
                        visible="false"                                                  
                        Text='<%# Bind("Equipo_costo_total") %>'>
                    </asp:TextBox> 
                    <asp:TextBox 
                        ID="Mano_obra_costo_total" 
                        runat="server" 
                        visible="false"                                                   
                        Text='<%# Bind("Mano_obra_costo_total") %>'>
                    </asp:TextBox> 
                    <asp:TextBox 
                        ID="Material_costo_total" 
                        runat="server" 
                        Visible="false" 
                        Text='<%# Bind("Material_costo_total") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Transporte_costo_total" 
                        runat="server" 
                        Visible="false" 
                        Text='<%# Bind("Transporte_costo_total") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Equipo_ultima_fecha_update" 
                        runat="server" 
                        Visible="false"                                                
                        Text='<%# Bind("Equipo_ultima_fecha_update") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Mano_obra_ultima_fecha_update" 
                        runat="server" 
                        Visible="false"                                                
                        Text='<%# Bind("Mano_obra_ultima_fecha_update") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Material_ultima_fecha_update" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Material_ultima_fecha_update") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Transporte_ultima_fecha_update" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Transporte_ultima_fecha_update") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Estado_Nombre" 
                        runat="server" 
                        visible="False"
                        Text='<%# Bind("Estado_Nombre") %>'>
                    </asp:TextBox>                    
                    <asp:TextBox 
                        ID="Apu_Proyecto_Etapa" 
                        runat="server" 
                        visible="False"
                        Text='<%# Bind("Apu_Proyecto_Etapa") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_rubro_Costo_Total" 
                        runat="server" 
                        visible="False"
                        Text='<%# Bind("Apu_rubro_Costo_Total") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Rendimiento_Mano_Obra_Hora" 
                        runat="server" 
                        visible="False"
                        Text='<%# Bind("Rendimiento_Mano_Obra_Hora") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Subtitulo_Codigo" 
                        runat="server" 
                        visible="False"
                        Text='<%# Bind("Apu_Subtitulo_Codigo") %>'>
                    </asp:TextBox>                    
                    <asp:TextBox 
                        ID="Nombre" 
                        runat="server" 
                        visible="False"
                        Text='<%# Bind("Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Rendimiento_Equipo_Hora" 
                        runat="server" 
                        visible="False"
                        Text='<%# Bind("Rendimiento_Equipo_Hora") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Titulo_Nombre" 
                        runat="server" 
                        visible="False"
                        Text='<%# Bind("Apu_Titulo_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Codigo" 
                        runat="server" 
                        visible="False"
                        Text='<%# Bind("Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Subtitulo_Nombre" 
                        runat="server" 
                        visible="False"
                        Text='<%# Bind("Apu_Subtitulo_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Titulo_Codigo" 
                        runat="server" 
                        visible="False"
                        Text='<%# Bind("Apu_Titulo_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Estado" 
                        runat="server" 
                        visible="False"
                        Text='<%# Bind("Estado") %>'>
                    </asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:Panel
                        runat="server"
                        id="Panel1"
                        meta:resourcekey="Rec_Apu_Proyecto_Rubro_ProyectoRecursoKCG">
                        <table>
                            <tr align="left" >                                   
                                <td valign="top">
                                    <asp:TextBox 
                                        ID="Apu_Proyecto_Codigo" 
                                        runat="server"
                                        style="text-align:right"
                                        Width="60px"
                                        TabIndex="-1"                               
                                        ToolTip='<%# GetLocalResourceObject("Apu_Proyecto_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true" 
                                        Text='<%# Bind("Apu_Proyecto_Codigo") %>'>
                                    </asp:TextBox>
                                </td>
                                <td valign="top">
                                    <asp:TextBox 
                                        ID="Apu_Proyecto_Nombre" 
                                        runat="server"
                                        Width="600px" 
                                        CssClass ="TEXTO_LECTURA_KCG"
                                        Height="50px"
                                        TabIndex="-1"
                                        TextMode="MultiLine"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Proyecto_NombreRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        Text='<%# Bind("Apu_Proyecto_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                                <td valign="top">
                                    <asp:TextBox 
                                        ID="Apu_Proyecto_Costo_Total" 
                                        runat="server"  
                                        TabIndex="-1"
                                        ReadOnly="true"
                                        Text='<%# Bind("Apu_Proyecto_Costo_Total","{0:N2}") %>'>
                                    </asp:TextBox> 
                                </td>
                            </tr>
                        </table>     
                    </asp:Panel>  <!-- Inf. del Proyecto -->
                    <asp:Panel
                        runat="server"
                        id="PanelI2"
                        meta:resourcekey="Rec_Apu_Proyecto_RubroRecursoKCG">
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
                            <tr align="center"> 
                                <td
                                    style="white-space:nowrap">
                                    <asp:Label 
                                        ID="Label14" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Apu_Rubro_CodigoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label> 
                                </td>
                                <td>
                                    <asp:Label 
                                        ID="Label15" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:Label 
                                        ID="Label16" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:Label 
                                        ID="Label17" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("CantidadRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>    
                                </td>
                                <td>
                                    <asp:Label 
                                        ID="Label18" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Costo_UnitarioRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>    
                                </td>
                                <td>
                                    <asp:Label 
                                        ID="Label19" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.Text").ToString() %>'>
                                    </asp:Label> 
                                </td>
                            </tr> <!-- Cabecera -->
                            <tr align="left">
                                <td valign="top" style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Apu_Rubro_Codigo" 
                                        runat="server"
                                        CssClass="TEXTO_EDICION_KCG"
                                        Width="50px"
                                        style="text-align:right"                                         
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="false"                                    
                                        Text='<%# Bind("Apu_Rubro_Codigo") %>'>
                                    </asp:TextBox>
                                    <AjaxControlToolkit:FilteredTextBoxExtender 
                                        ID="ftbe" 
                                        runat="server"
                                        TargetControlID="Apu_Rubro_Codigo"         
                                        FilterType="Custom, Numbers" />
                                    <asp:RequiredFieldValidator 
                                        runat="server" 
                                        ID="Apu_Rubro_CodigoReq"
                                        ControlToValidate="Apu_Rubro_Codigo"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ3RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ3RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="Apu_Rubro_CodigoReqE"
                                        TargetControlID="Apu_Rubro_CodigoReq" />                                    
                                    
                                    <input type="submit" style="display:none;" value="Submit Query" />                                 
                                </td>
                                <td valign="top">
                                    <asp:TextBox 
                                        ID="Apu_Rubro_Nombre" 
                                        runat="server"
                                        ReadOnly="true" 
                                        style="text-transform:uppercase"
                                        Width="400px"
                                        Height="50px"
                                        TabIndex="-1"
                                        TextMode="MultiLine"
                                        CssClass="TEXTO_LECTURA_KCG"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Rubro_Nombre") %>'>
                                    </asp:TextBox>
                                </td> 
                                <td valign="top">
                                    <asp:TextBox 
                                        ID="Apu_Rubro_Unidad" 
                                        runat="server"                                        
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("Apu_Rubro_Unidad") %>' 
                                        Width="50px">
                                    </asp:TextBox>    
                                </td>
                                <td valign="top">
                                    <asp:TextBox 
                                        ID="Cantidad" 
                                        runat="server" 
                                        style="text-align:right"
                                        CssClass="TEXTO_EDICION_KCG"
                                        Width="110"
                                        ToolTip='<%# GetLocalResourceObject("CantidadRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("Cantidad") %>'>
                                    </asp:TextBox>  
                                    <AjaxControlToolkit:MaskedEditExtender 
                                    ID="meeCantidad" 
                                    runat="server"
                                    TargetControlID="Cantidad"
                                    Mask="999,999,999.9999"
                                    MessageValidatorTip="false"
                                    OnFocusCssClass="MaskedEditFocus"
                                    OnInvalidCssClass="MaskedEditError"
                                    MaskType="Number"
                                    InputDirection="RightToLeft"
                                    AcceptNegative="None"
                                    DisplayMoney="None"
                                    ErrorTooltipEnabled="False"
                                    ClearMaskOnLostFocus="True" />
                                <AjaxControlToolkit:MaskedEditValidator ID="MaskedEditValidator2" runat="server"
                                    ControlExtender="meeCantidad"
                                    ControlToValidate="Cantidad"
                                    IsValidEmpty="False"
                                    EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                    InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                    MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                    MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                    MinimumValue="0.0000"
                                    MaximumValue="999999999.9999" 
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
                                <td style="white-space:nowrap" valign="top">
                                    <asp:TextBox 
                                        ID="Costo_Unitario" 
                                        runat="server"
                                        style="text-align:right"                                        
                                        ReadOnly="true" 
                                        tabindex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Costo_UnitarioRecursoKCG.ToolTip").ToString() %>'  
                                        Text='<%# Bind("Costo_Unitario","{0:N4}") %>'>
                                    </asp:TextBox>
                                    <asp:Label
                                        ID="lblmoneda1" 
                                        runat="server"                                         
                                        Text='<%# Bind("int_moneda_simbolo") %>'>
                                    </asp:Label>
                                 </td>
                                 <td style="white-space:nowrap" valign="top">   
                                    <asp:TextBox 
                                        ID="Costo_Total" 
                                        runat="server" 
                                        style="text-align:right"
                                        tabindex="-1"
                                        ReadOnly="true" 
                                        ToolTip='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.ToolTip").ToString() %>'  
                                        Text='<%# Bind("Costo_Total","{0:N2}") %>'>
                                    </asp:TextBox>
                                    <asp:Label
                                        ID="lblmoneda2" 
                                        runat="server"                                         
                                        Text='<%# Bind("int_moneda_simbolo") %>'>
                                    </asp:Label>                                       
                                </td>
                            </tr>                            
                        </table>      
                    </asp:Panel> 
                    <asp:Panel
                        runat="server"
                        id="pnlinsumos"
                        meta:resourcekey="Rec_Apu_Proyecto_Rubro_PrecioRecursoKCG">
                        <table>
                            <tr align="left">
                                <td>
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                                <td align="center">
                                     <asp:Label  
                                        ID="lblequipocostototal"
                                        runat="server" 
                                        visible="true"                                                                                              
                                        Text= '<%# GetLocalResourceObject("Lab_Proyecto_Rubro_Insumo_CostoRecursoKCG.Text").ToString() %>'>             
                                    </asp:Label>    
                                </td>
                            </tr>                        
                            <tr align="left">
                                <td> 
                                    <asp:Label
                                        ID="lblrendimiento"
                                        runat="server"                                                                                                        
                                        Text='<%# GetLocalResourceObject("Rendimiento_EquipoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label> 
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Rendimiento_Equipo" 
                                        runat="server" 
                                        style="text-align:right"
                                        CssClass="TEXTO_EDICION_KCG"
                                        TabIndex="-1"                                                 
                                        ToolTip='<%# GetLocalResourceObject("Rendimiento_EquipoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Rendimiento_Equipo") %>'>
                                    </asp:TextBox>                                    
                                    <asp:RequiredFieldValidator 
                                        runat="server" 
                                        ID="rfvrendimiento_equipo"
                                        ControlToValidate="Rendimiento_Equipo"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>'/>   
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server"  ID="ValidatorCalloutExtender7"
                                        TargetControlID="rfvrendimiento_equipo" />  
                                    <AjaxControlToolkit:MaskedEditExtender 
                                        ID="acrendimiento_equipo" 
                                        runat="server"
                                        TargetControlID="Rendimiento_Equipo"
                                        Mask="9,999,999,999,999.999999"
                                        MessageValidatorTip="false"
                                        OnFocusCssClass="MaskedEditFocus"
                                        OnInvalidCssClass="MaskedEditError"
                                        MaskType="Number"
                                        InputDirection="RightToLeft"
                                        AcceptNegative="None"
                                        DisplayMoney="None"
                                        ErrorTooltipEnabled="false"
                                        ClearMaskOnLostFocus="True"
                                        />                                      
                                </td>
                                <td>
                                    <asp:Button 
                                        ID="BtnEquipo" 
                                        runat="server"
                                        CausesValidation="True" 
                                        CommandName="Insert"
                                        ValidationGroup="I"
                                        AccessKey="I"
                                        Enabled="false"
                                        Text='<%# GetLocalResourceObject("Btn_Apu_Proyecto_Rubro_EquipoRecursoKCG.Text").ToString() %>'                                    
                                        ToolTip='<%# GetLocalResourceObject("Btn_Apu_Proyecto_Rubro_EquipoRecursoKCG.ToolTip").ToString() %>' OnClick="BtnEquipo_Click"/>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Equipo_costo_total_" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"                                                     
                                        style="text-align:right"                                                   
                                        Text='<%# Bind("Equipo_costo_total") %>'>
                                    </asp:TextBox>                                               
                                    <asp:Label 
                                        ID="Label1" 
                                        runat="server" 
                                        visible="true"                                                
                                        Text='<%# Bind("int_moneda_simbolo") %>'>
                                    </asp:Label>    
                                </td>
                            </tr>
                            <tr align="left">    
                                <td>  
                                    <asp:Label
                                        ID="lblrendimientomano"
                                        runat="server"                                                     
                                        Text='<%# GetLocalResourceObject("Rendimiento_Mano_ObraRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>                                     
                                    <asp:TextBox 
                                        ID="Rendimiento_Mano_Obra" 
                                        runat="server"
                                        Style="text-align:right"
                                        CssClass="TEXTO_EDICION_KCG"
                                        TabIndex="-1"                                                  
                                        ToolTip='<%# GetLocalResourceObject("Rendimiento_Mano_ObraRecursoKCG.ToolTip").ToString() %>'                                       
                                        Text='<%# Bind("Rendimiento_Mano_Obra") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        runat="server" 
                                        ID="rfvrendimiento_mano_obra"
                                        ControlToValidate="Rendimiento_Mano_Obra"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>'/>   
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server"  ID="ValidatorCalloutExtender2"
                                        TargetControlID="rfvrendimiento_mano_obra" />  
                                    <AjaxControlToolkit:MaskedEditExtender 
                                        ID="arendimientomano_obra" 
                                        runat="server"
                                        TargetControlID="Rendimiento_Mano_Obra"
                                        Mask="9,999,999,999,999.999999"
                                        MessageValidatorTip="false"
                                        OnFocusCssClass="MaskedEditFocus"
                                        OnInvalidCssClass="MaskedEditError"
                                        MaskType="Number"
                                        InputDirection="RightToLeft"
                                        AcceptNegative="None"
                                        DisplayMoney="None"
                                        ErrorTooltipEnabled="false"
                                        ClearMaskOnLostFocus="True"
                                        />                                                             
                                </td>  
                                <td>
                                    <asp:Button 
                                        ID="BtnManoObra" 
                                        runat="server"
                                        CausesValidation="True" 
                                        CommandName="Insert"
                                        ValidationGroup="I"
                                        Enabled="false"
                                        AccessKey="I"
                                        Text='<%# GetLocalResourceObject("Btn_Apu_Proyecto_Rubro_Mano_ObraRecursoKCG.Text").ToString() %>'                                    
                                        ToolTip='<%# GetLocalResourceObject("Btn_Apu_Proyecto_Rubro_Mano_ObraRecursoKCG.ToolTip").ToString() %>' 
                                        OnClick="BtnManoObra_Click"/>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Mano_obra_costo_total_" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"                                                 
                                        style="text-align:right"                                                    
                                        Text='<%# Bind("Mano_obra_costo_total") %>'>
                                    </asp:TextBox>                                                              
                                    <asp:Label 
                                        ID="Label2" 
                                        runat="server"                                                                                                    
                                        Text='<%# Bind("int_moneda_simbolo") %>'>
                                    </asp:Label>        
                                </td>    
                            </tr>  
                            <tr align="left">
                                <td>
                                </td>
                                <td>
                                </td>
                                <td>
                                    <asp:Button 
                                        ID="BtnMateriales" 
                                        runat="server"
                                        CausesValidation="True" 
                                        CommandName="Insert"
                                        ValidationGroup="I"
                                        Enabled="false"
                                        AccessKey="I"
                                        Text='<%# GetLocalResourceObject("Btn_Apu_Proyecto_Rubro_MaterialRecursoKCG.Text").ToString() %>'                                    
                                        ToolTip='<%# GetLocalResourceObject("Btn_Apu_Proyecto_Rubro_MaterialRecursoKCG.ToolTip").ToString() %>' 
                                        OnClick="BtnMateriales_Click"/>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Material_costo_total_" 
                                        runat="server" 
                                        style="text-align:right"
                                        TabIndex="-1"
                                        ReadOnly="true"                                                    
                                        Text='<%# Bind("Material_costo_total") %>'>
                                    </asp:TextBox>                                                            
                                    <asp:Label 
                                        ID="Label3" 
                                        runat="server" 
                                        visible="true"                                                
                                        Text='<%# Bind("int_moneda_simbolo") %>'>
                                    </asp:Label>  
                                </td>                           
                            </tr>
                            <tr align="left">
                                <td>                                
                                </td>
                                <td>
                                </td>
                                <td>
                                    <asp:Button 
                                        ID="BtnTransporte" 
                                        runat="server"
                                        CausesValidation="True" 
                                        CommandName="Insert"
                                        ValidationGroup="I"
                                        Enabled="false"
                                        AccessKey="I"
                                        Text='<%# GetLocalResourceObject("Btn_Apu_Proyecto_Rubro_TransporteRecursoKCG.Text").ToString() %>'                                    
                                        ToolTip='<%# GetLocalResourceObject("Btn_Apu_Proyecto_Rubro_TransporteRecursoKCG.ToolTip").ToString() %>' OnClick="BtnTransporte_Click"/>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Transporte_costo_total_" 
                                        runat="server" 
                                        style="text-align:right"
                                        TabIndex="-1"
                                        ReadOnly="true"
                                        Text='<%# Bind("Transporte_costo_total") %>'>
                                    </asp:TextBox>                                                
                                    <asp:Label 
                                        ID="Label4" 
                                        runat="server" 
                                        visible="true"                                                
                                        Text='<%# Bind("int_moneda_simbolo") %>'>
                                    </asp:Label> 
                                </td>                                                      
                            </tr>                                        
                        </table>   
                        <table>   
                                <tr align="left">
                                    <td colspan="2">                                       
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
                    </asp:Panel> 
                                   
                    <%--ID'S--%>
                    
                    <asp:TextBox 
                        ID="Int_Sucursal_Id" 
                        runat="server" 
                        visible="true"
                        style="display:none"
                        Text='<%# Bind("Int_Sucursal_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Id" 
                        runat="server" 
                        visible="true"
                        style="display:none"
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Subtitulo_id" 
                        runat="server" 
                        visible="true"
                        style="display:none"
                        Text='<%# Bind("Apu_Subtitulo_id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Titulo_id" 
                        runat="server" 
                        visible="true"
                        style="display:none"
                        Text='<%# Bind("Apu_Titulo_id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Rubro_Id" 
                        runat="server" 
                        visible="true"
                        style="display:none"
                        Text='<%# Bind("Apu_Rubro_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Proyecto_Id" 
                        runat="server" 
                        visible="true"
                        style="display:none"
                        Text='<%# Bind("Apu_Proyecto_Id") %>'>
                    </asp:TextBox>
                                        
                    <%--CAMPOS NO VISIBLES--%>
                        
                    
                    <asp:TextBox 
                        ID="int_moneda_simbolo" 
                        runat="server" 
                        visible="False"
                        Text='<%# Bind("int_moneda_simbolo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Equipo_costo_total" 
                        runat="server" 
                        visible="false"                                                  
                        Text='<%# Bind("Equipo_costo_total") %>'>
                    </asp:TextBox> 
                    <asp:TextBox 
                        ID="Mano_obra_costo_total" 
                        runat="server" 
                        visible="false"                                                   
                        Text='<%# Bind("Mano_obra_costo_total") %>'>
                    </asp:TextBox> 
                    <asp:TextBox 
                        ID="Material_costo_total" 
                        runat="server" 
                        Visible="false" 
                        Text='<%# Bind("Material_costo_total") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Transporte_costo_total" 
                        runat="server" 
                        Visible="false" 
                        Text='<%# Bind("Transporte_costo_total") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Equipo_ultima_fecha_update" 
                        runat="server" 
                        Visible="false"                                                
                        Text='<%# Bind("Equipo_ultima_fecha_update") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Mano_obra_ultima_fecha_update" 
                        runat="server" 
                        Visible="false"                                                
                        Text='<%# Bind("Mano_obra_ultima_fecha_update") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Material_ultima_fecha_update" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Material_ultima_fecha_update") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Transporte_ultima_fecha_update" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Transporte_ultima_fecha_update") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Estado_Nombre" 
                        runat="server" 
                        visible="False"
                        Text='<%# Bind("Estado_Nombre") %>'>
                    </asp:TextBox>                    
                    <asp:TextBox 
                        ID="Apu_Proyecto_Etapa" 
                        runat="server" 
                        visible="False"
                        Text='<%# Bind("Apu_Proyecto_Etapa") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_rubro_Costo_Total" 
                        runat="server" 
                        visible="False"
                        Text='<%# Bind("Apu_rubro_Costo_Total") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Rendimiento_Mano_Obra_Hora" 
                        runat="server" 
                        visible="False"
                        Text='<%# Bind("Rendimiento_Mano_Obra_Hora") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Subtitulo_Codigo" 
                        runat="server" 
                        visible="False"
                        Text='<%# Bind("Apu_Subtitulo_Codigo") %>'>
                    </asp:TextBox>                    
                    <asp:TextBox 
                        ID="Nombre" 
                        runat="server" 
                        visible="False"
                        Text='<%# Bind("Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Rendimiento_Equipo_Hora" 
                        runat="server" 
                        visible="False"
                        Text='<%# Bind("Rendimiento_Equipo_Hora") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Titulo_Nombre" 
                        runat="server" 
                        visible="False"
                        Text='<%# Bind("Apu_Titulo_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Codigo" 
                        runat="server" 
                        visible="False"
                        Text='<%# Bind("Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Subtitulo_Nombre" 
                        runat="server" 
                        visible="False"
                        Text='<%# Bind("Apu_Subtitulo_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Titulo_Codigo" 
                        runat="server" 
                        visible="False"
                        Text='<%# Bind("Apu_Titulo_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Estado" 
                        runat="server" 
                        visible="False"
                        Text='<%# Bind("Estado") %>'>
                    </asp:TextBox>                                            
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Panel
                        runat="server"
                        id="Panel1"
                        meta:resourcekey="Rec_Apu_Proyecto_Rubro_ProyectoRecursoKCG">
                        <table>
                            <tr align="left" >                                   
                                <td valign="top">
                                    <asp:TextBox 
                                        ID="Apu_Proyecto_Codigo" 
                                        runat="server"
                                        style="text-align:right"
                                        Width="60px"
                                        TabIndex="-1"                               
                                        ToolTip='<%# GetLocalResourceObject("Apu_Proyecto_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true" 
                                        Text='<%# Bind("Apu_Proyecto_Codigo") %>'>
                                    </asp:TextBox>
                                </td>
                                <td valign="top">
                                    <asp:TextBox 
                                        ID="Apu_Proyecto_Nombre" 
                                        runat="server"
                                        Width="600px" 
                                        CssClass ="TEXTO_LECTURA_KCG"
                                        Height="50px"
                                        TabIndex="-1"
                                        TextMode="MultiLine"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Proyecto_NombreRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        Text='<%# Bind("Apu_Proyecto_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                                <td valign="top">
                                    <asp:TextBox 
                                        ID="Apu_Proyecto_Costo_Total" 
                                        runat="server"  
                                        TabIndex="-1"
                                        style="text-align:right"
                                        ReadOnly="true"
                                        Text='<%# Bind("Apu_Proyecto_Costo_Total","{0:N2}") %>'>
                                    </asp:TextBox> 
                                    <asp:Label
                                        ID="lbmodena0" 
                                        runat="server"                                         
                                        Text='<%# Bind("int_moneda_simbolo") %>'>
                                    </asp:Label>
                                </td>                                
                            </tr> <!-- Inf. del Proyecto -->
                        </table>     
                    </asp:Panel> 
                    <asp:Panel
                        runat="server"
                        id="Panel2"
                        meta:resourcekey="Rec_Apu_Proyecto_RubroRecursoKCG">
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
                            <tr align="center"> 
                                <td>
                                    <asp:Label 
                                        ID="Label8" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Apu_Rubro_CodigoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label> 
                                </td>
                                <td>
                                    <asp:Label 
                                        ID="Label9" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:Label 
                                        ID="Label10" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:Label 
                                        ID="Label11" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("CantidadRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>    
                                </td>
                                <td>
                                    <asp:Label 
                                        ID="Label12" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Costo_UnitarioRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>    
                                </td>
                                <td>
                                    <asp:Label 
                                        ID="Label13" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.Text").ToString() %>'>
                                    </asp:Label> 
                                </td>
                            </tr> <!-- Cabecera -->
                            <tr align="left">
                                <td valign="top">
                                    <asp:TextBox 
                                        ID="Apu_Rubro_Codigo" 
                                        runat="server" 
                                        Width="60px"
                                        TabIndex="-1"
                                        style="text-align:right"                                           
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        Text='<%# Bind("Apu_Rubro_Codigo") %>'>
                                    </asp:TextBox>    
                                </td>
                                <td valign="top">
                                    <asp:TextBox 
                                        ID="Apu_Rubro_Nombre" 
                                        runat="server" 
                                        CssClass ="TEXTO_LECTURA_KCG"
                                        Width="400px"
                                        Height="50px"
                                        TabIndex="-1"
                                        TextMode="MultiLine"
                                        readOnly="true"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Rubro_Nombre") %>'>
                                    </asp:TextBox>                                    
                                </td> 
                                <td valign="top">
                                    <asp:TextBox 
                                        ID="Apu_Rubro_Unidad" 
                                        runat="server"                                        
                                        ReadOnly="true"  
                                        Width="50px"
                                        TabIndex="-1"
                                        style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("Apu_Rubro_Unidad") %>'>
                                    </asp:TextBox>    
                                </td>
                                <td valign="top">
                                    <asp:TextBox 
                                        ID="Cantidad" 
                                        runat="server" 
                                        style="text-align:right"
                                        Width="110"
                                        ReadOnly="true"                                        
                                        ToolTip='<%# GetLocalResourceObject("CantidadRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("Cantidad","{0:N4}") %>'>
                                    </asp:TextBox>                                       
                                </td>
                                <td style="white-space:nowrap" valign="top">
                                    <asp:TextBox 
                                        ID="Costo_Unitario" 
                                        runat="server"
                                        style="text-align:right" 
                                        ReadOnly="true"                                       
                                        ToolTip='<%# GetLocalResourceObject("Costo_UnitarioRecursoKCG.ToolTip").ToString() %>'  
                                        Text='<%# Bind("Costo_Unitario","{0:N4}") %>'>
                                    </asp:TextBox> 
                                    <asp:Label
                                        ID="lblmoneda1" 
                                        runat="server"                                         
                                        Text='<%# Bind("int_moneda_simbolo") %>'>
                                    </asp:Label> 
                                 </td>
                                 <td style="white-space:nowrap" valign="top">
                                    <asp:TextBox 
                                        ID="Costo_Total" 
                                        runat="server" 
                                        ReadOnly="true" 
                                        TabIndex="-1"
                                        style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.ToolTip").ToString() %>'  
                                        Text='<%# Bind("Costo_Total","{0:N2}") %>'>
                                    </asp:TextBox>   
                                    <asp:Label
                                        ID="Label7" 
                                        runat="server"                                         
                                        Text='<%# Bind("int_moneda_simbolo") %>'>
                                    </asp:Label>                                  
                                </td>
                            </tr>                            
                        </table>                                
                    </asp:Panel> 
                    <asp:Panel
                        runat="server"
                        id="pnlrinsumos"
                        meta:resourcekey="Rec_Apu_Proyecto_Rubro_PrecioRecursoKCG">
                        <table style="white-space:nowrap">
                            <tr align="left">
                                <td>
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                                <td align="center">
                                     <asp:Label  
                                        ID="lblequipocostototal"
                                        runat="server" 
                                        visible="true"                                                                                              
                                        Text= '<%# GetLocalResourceObject("Lab_Proyecto_Rubro_Insumo_CostoRecursoKCG.Text").ToString() %>'>             
                                    </asp:Label>    
                                </td>
                            </tr>
                            <tr>
                                <td style="white-space:nowrap">
                                    <asp:Label
                                        ID="lblrendimiento"
                                        runat="server"                                                                                                        
                                        Text='<%# GetLocalResourceObject("Rendimiento_EquipoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>     
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Rendimiento_Equipo" 
                                        runat="server" 
                                        style="text-align:right"    
                                        readonly="true"                                                                                               
                                        ToolTip='<%# GetLocalResourceObject("Rendimiento_EquipoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Rendimiento_Equipo","{0:N6}") %>'>
                                    </asp:TextBox>     
                                </td>
                                <td>
                                    <asp:Button 
                                        ID="BtnEquipo" 
                                        runat="server"
                                        CausesValidation="True" 
                                        CommandName="Insert"
                                        ValidationGroup="I"
                                        AccessKey="I"
                                        Text='<%# GetLocalResourceObject("Btn_Apu_Proyecto_Rubro_EquipoRecursoKCG.Text").ToString() %>'                                    
                                        ToolTip='<%# GetLocalResourceObject("Btn_Apu_Proyecto_Rubro_EquipoRecursoKCG.ToolTip").ToString() %>' OnClick="BtnEquipo_Click"/>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Equipo_costo_total" 
                                        runat="server" 
                                        ReadOnly="true"                                                    
                                        style="text-align:right"                                                   
                                        Text='<%# Bind("Equipo_costo_total","{0:N4}") %>'>
                                    </asp:TextBox>                                               
                                    <asp:Label 
                                        ID="Label1" 
                                        runat="server" 
                                        visible="true"                                                
                                        Text='<%# Bind("int_moneda_simbolo") %>'>
                                    </asp:Label>    
                                </td>
                            </tr>         
                            <tr align="left">    
                                <td style="white-space:nowrap">  
                                    <asp:Label
                                        ID="lblrendimientomano"
                                        runat="server"                                                     
                                        Text='<%# GetLocalResourceObject("Rendimiento_Mano_ObraRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>  
                                </td>
                                <td>                                   
                                    <asp:TextBox 
                                        ID="Rendimiento_Mano_Obra" 
                                        runat="server"
                                        readonly="true"
                                        Style="text-align:right"                                                                                                         
                                        ToolTip='<%# GetLocalResourceObject("Rendimiento_Mano_ObraRecursoKCG.ToolTip").ToString() %>'                                       
                                        Text='<%# Bind("Rendimiento_Mano_Obra","{0:N6}") %>'>
                                    </asp:TextBox>                                                                                                             
                                </td>  
                                <td>
                                    <asp:Button 
                                        ID="BtnManoObra" 
                                        runat="server"
                                        CausesValidation="True" 
                                        CommandName="Insert"
                                        ValidationGroup="I"
                                        AccessKey="I"
                                        Text='<%# GetLocalResourceObject("Btn_Apu_Proyecto_Rubro_Mano_ObraRecursoKCG.Text").ToString() %>'                                    
                                        ToolTip='<%# GetLocalResourceObject("Btn_Apu_Proyecto_Rubro_Mano_ObraRecursoKCG.ToolTip").ToString() %>' OnClick="BtnManoObra_Click"/>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Mano_obra_costo_total" 
                                        runat="server" 
                                        ReadOnly="true"                                                    
                                        style="text-align:right"                                                    
                                        Text='<%# Bind("Mano_obra_costo_total","{0:N4}") %>'>
                                    </asp:TextBox>                                                              
                                    <asp:Label 
                                        ID="Label2" 
                                        runat="server"                                                                                                    
                                        Text='<%# Bind("int_moneda_simbolo") %>'>
                                    </asp:Label>        
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                </td>
                                <td>
                                </td>
                                <td>
                                    <asp:Button 
                                        ID="BtnMateriales" 
                                        runat="server"
                                        CausesValidation="True" 
                                        CommandName="Insert"
                                        ValidationGroup="I"
                                        AccessKey="I"
                                        Text='<%# GetLocalResourceObject("Btn_Apu_Proyecto_Rubro_MaterialRecursoKCG.Text").ToString() %>'                                    
                                        ToolTip='<%# GetLocalResourceObject("Btn_Apu_Proyecto_Rubro_MaterialRecursoKCG.ToolTip").ToString() %>' OnClick="BtnMateriales_Click"/>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Material_costo_total" 
                                        runat="server" 
                                        style="text-align:right"
                                        ReadOnly="true"                                                    
                                        Text='<%# Bind("Material_costo_total","{0:N4}") %>'>
                                    </asp:TextBox>                                                            
                                    <asp:Label 
                                        ID="Label3" 
                                        runat="server" 
                                        visible="true"                                                
                                        Text='<%# Bind("int_moneda_simbolo") %>'>
                                    </asp:Label>  
                                </td>                           
                            </tr>
                            <tr align="left">
                                <td>                                
                                </td>
                                <td>
                                </td>
                                <td>
                                    <asp:Button 
                                        ID="BtnTransporte" 
                                        runat="server"
                                        CausesValidation="True" 
                                        CommandName="Insert"
                                        ValidationGroup="I"
                                        AccessKey="I"
                                        Text='<%# GetLocalResourceObject("Btn_Apu_Proyecto_Rubro_TransporteRecursoKCG.Text").ToString() %>'                                    
                                        ToolTip='<%# GetLocalResourceObject("Btn_Apu_Proyecto_Rubro_TransporteRecursoKCG.ToolTip").ToString() %>' OnClick="BtnTransporte_Click"/>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Transporte_costo_total" 
                                        runat="server" 
                                        style="text-align:right"
                                        ReadOnly="true"
                                        Text='<%# Bind("Transporte_costo_total","{0:N4}") %>'>
                                    </asp:TextBox>                                                
                                    <asp:Label 
                                        ID="Label4" 
                                        runat="server" 
                                        visible="true"                                                
                                        Text='<%# Bind("int_moneda_simbolo") %>'>
                                    </asp:Label> 
                                </td>                                                      
                            </tr>  
                            <tr align="left">
                                <td colspan="3">                                    
                                     <asp:Button 
                                        ID="EditButton" 
                                        runat="server"
                                        CausesValidation="False" 
                                        CommandName="Edit"
                                        Enabled='<%# HER.PermisosMovimientos.Movimiento_Apu_Proyecto_Rubro(Request.QueryString["Estado"], Request.QueryString["Apu_Presupuesto_Estado"], HER.PermisosMovimientos.ModoOperacion.Editar ) %>'
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_EditarRecursoKCG.AccesKey").ToString() %>'  
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_EditRecursoKCG.Text").ToString() %>'
                                        ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_EditRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:Button>
                                    <asp:Button 
                                        ID="DeleteButton" 
                                        runat="server" 
                                        CausesValidation="False" 
                                        CommandName="Delete"
                                        Enabled='<%# HER.PermisosMovimientos.Movimiento_Apu_Proyecto_Rubro(Request.QueryString["Estado"], Request.QueryString["Apu_Presupuesto_Estado"], HER.PermisosMovimientos.ModoOperacion.Eliminar ) %>'
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_EliminarRecursoKCG.AccesKey").ToString() %>'  
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_DeleteRecursoKCG.Text").ToString() %>'
                                        ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_DeleteRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:Button>
                                    <asp:Button 
                                        ID="NewButton" 
                                        runat="server" 
                                        CausesValidation="False" 
                                        CommandName="New"
                                        Enabled='<%# HER.PermisosMovimientos.Movimiento_Apu_Proyecto_Rubro(Request.QueryString["Estado"], Request.QueryString["Apu_Presupuesto_Estado"], HER.PermisosMovimientos.ModoOperacion.Nuevo ) %>'
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_NuevoRecursoKCG.AccesKey").ToString() %>'  
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_NewRecursoKCG.Text").ToString() %>'
                                        ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_NewRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:Button>
                                    <uc1:wucMensajeEliminar ID="WucMensajeEliminar1" runat="server" />
                                </td>
                            </tr>                           
                        </table>
                    </asp:Panel>                     
                                   
                    <%--ID'S--%>
                    
                    <asp:TextBox 
                        ID="Int_Sucursal_Id" 
                        runat="server" 
                        visible="true"
                        style="display:none"
                        Text='<%# Bind("Int_Sucursal_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Id" 
                        runat="server" 
                        visible="true"
                        style="display:none"
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Subtitulo_id" 
                        runat="server" 
                        visible="true"
                        style="display:none"
                        Text='<%# Bind("Apu_Subtitulo_id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Titulo_id" 
                        runat="server" 
                        visible="true"
                        style="display:none"
                        Text='<%# Bind("Apu_Titulo_id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Rubro_Id" 
                        runat="server" 
                        visible="true"
                        style="display:none"
                        Text='<%# Bind("Apu_Rubro_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Proyecto_Id" 
                        runat="server" 
                        visible="true"
                        style="display:none"
                        Text='<%# Bind("Apu_Proyecto_Id") %>'>
                    </asp:TextBox>
                                        
                    <%--CAMPOS NO VISIBLES--%>
                        
                    
                    <asp:TextBox 
                        ID="int_moneda_simbolo" 
                        runat="server" 
                        visible="False"
                        Text='<%# Bind("int_moneda_simbolo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Estado_Nombre" 
                        runat="server" 
                        visible="False"
                        Text='<%# Bind("Estado_Nombre") %>'>
                    </asp:TextBox>                    
                    <asp:TextBox 
                        ID="Apu_Proyecto_Etapa" 
                        runat="server" 
                        visible="False"
                        Text='<%# Bind("Apu_Proyecto_Etapa") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_rubro_Costo_Total" 
                        runat="server" 
                        visible="False"
                        Text='<%# Bind("Apu_rubro_Costo_Total") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Rendimiento_Mano_Obra_Hora" 
                        runat="server" 
                        visible="False"
                        Text='<%# Bind("Rendimiento_Mano_Obra_Hora") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Subtitulo_Codigo" 
                        runat="server" 
                        visible="False"
                        Text='<%# Bind("Apu_Subtitulo_Codigo") %>'>
                    </asp:TextBox>                   
                    <asp:TextBox 
                        ID="Nombre" 
                        runat="server" 
                        visible="False"
                        Text='<%# Bind("Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Rendimiento_Equipo_Hora" 
                        runat="server" 
                        visible="False"
                        Text='<%# Bind("Rendimiento_Equipo_Hora") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Titulo_Nombre" 
                        runat="server" 
                        visible="False"
                        Text='<%# Bind("Apu_Titulo_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Codigo" 
                        runat="server" 
                        visible="False"
                        Text='<%# Bind("Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Subtitulo_Nombre" 
                        runat="server" 
                        visible="False"
                        Text='<%# Bind("Apu_Subtitulo_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Titulo_Codigo" 
                        runat="server" 
                        visible="False"
                        Text='<%# Bind("Apu_Titulo_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Estado" 
                        runat="server" 
                        visible="False"
                        Text='<%# Bind("Estado") %>'>
                    </asp:TextBox>                    
                </ItemTemplate>
            </asp:FormView>
            <koala:KNavegacion 
                    ID="nav"
                    runat="server"
                    GridViewID="gvapu_proyecto_rubro"
                    FormViewID="FormView1" 
                    OnNavegar="nav_Siguiente" />
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger 
                ControlID="gvapu_proyecto_rubro" 
                EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>  
    <asp:ObjectDataSource 
        ID="odsapu_proyecto_rubro" 
        runat="server" 
        ConflictDetection="CompareAllValues"
        DeleteMethod="Delete" 
        InsertMethod="Insert" 
        OldValuesParameterFormatString="original{0}"
        SelectMethod="GetById" 
        SortParameterName="sortExpression" 
        TypeName="FEL.APU.BO_Apu_Proyecto_Rubro"
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
                        Contenedor="APU_PROYECTO_RUBRO" 
                        Objeto="APU_PROYECTO_RUBRO" 
                        IndiceScope ="Scope"
                        Orden="1"
                        ObjectDataSourceID="odsgvapu_proyecto_rubro" />
                </td>
                <td>
                    <asp:Button 
                        ID="BtnProyecto" 
                        runat="server"                             
                        OnClick="BtnProyecto_Click"/>
                </td>
                <td>
                    <asp:Button 
                        ID="Especificacion" 
                        runat="server"                        
                        OnClick="Especificacion_Click"/>                                
                </td>                
            </tr>            
        </table>            
            <asp:Panel 
                runat="server"
                id="pnlDatosGrid"
                meta:resourcekey="Rec_Apu_Proyecto_Rubro_ListadoRecursoKCG">                 
                <koala:KGrid  
                    ID="gvapu_proyecto_rubro" 
                    runat="server" 
                    AllowPaging="True" 
                    AllowSorting="True"
                    AutoGenerateColumns="False"
                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>'                
                    DataKeyNames="Id" 
                    DataSourceID="odsgvapu_proyecto_rubro">  
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
                            DataField="Apu_Rubro_Codigo" 
                            meta:resourcekey="BoundApu_Rubro_CodigoRecursoKCG" 
                            SortExpression="Apu_Rubro_Codigo_Int" >
                            <itemstyle horizontalalign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Apu_Rubro_Nombre" 
                            meta:resourcekey="BoundApu_Rubro_NombreRecursoKCG" 
                            SortExpression="Apu_Rubro_Nombre" >
                            <itemstyle wrap="True" width="80mm"  />
                        </asp:BoundField>                           
                        <asp:BoundField 
                            DataField="Apu_Rubro_Unidad" 
                            meta:resourcekey="BoundApu_Rubro_UnidadRecursoKCG" 
                            SortExpression="Apu_Rubro_Unidad" />
                        <asp:BoundField 
                            DataField="Cantidad" 
                            meta:resourcekey="BoundCantidadRecursoKCG"
                            SortExpression="Cantidad" 
                            dataformatstring="{0:N4}">
                            <itemstyle wrap="False" horizontalalign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Costo_Unitario" 
                            meta:resourcekey="BoundCosto_UnitarioRecursoKCG" 
                            SortExpression="Costo_Unitario"  
                            dataformatstring="{0:N4}">
                            <itemstyle wrap="False" horizontalalign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Costo_Total" 
                            meta:resourcekey="BoundCosto_totalRecursoKCG" 
                            SortExpression="Costo_Total"   
                            dataformatstring="{0:N4}" >
                            <itemstyle wrap="False" horizontalalign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Material_costo_total" 
                            HeaderText="Material_costo_total"
                            SortExpression="Material_costo_total" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Estado_Nombre" 
                            HeaderText="Estado_Nombre" 
                            SortExpression="Estado_Nombre" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Rendimiento_mano_obra_hora1" 
                            HeaderText="Rendimiento_mano_obra_hora1"
                            SortExpression="Rendimiento_mano_obra_hora1" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Proyecto_Etapa" 
                            HeaderText="Apu_Proyecto_Etapa" 
                            SortExpression="Apu_Proyecto_Etapa" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Material_ultima_fecha_update" 
                            HeaderText="Material_ultima_fecha_update"
                            SortExpression="Material_ultima_fecha_update" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Rendimiento_Equipo" 
                            HeaderText="Rendimiento_Equipo" 
                            SortExpression="Rendimiento_Equipo" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Int_Sucursal_Id" 
                            HeaderText="Int_Sucursal_Id" 
                            SortExpression="Int_Sucursal_Id" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Id" 
                            HeaderText="Id" 
                            SortExpression="Id" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_rubro_Costo_Total" 
                            HeaderText="Apu_rubro_Costo_Total"
                            SortExpression="Apu_rubro_Costo_Total" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Subtitulo_id" 
                            HeaderText="Apu_Subtitulo_id" 
                            SortExpression="Apu_Subtitulo_id" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Rendimiento_Mano_Obra_Hora" 
                            HeaderText="Rendimiento_Mano_Obra_Hora"
                            SortExpression="Rendimiento_Mano_Obra_Hora" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Mano_obra_costo_total" 
                            HeaderText="Mano_obra_costo_total"
                            SortExpression="Mano_obra_costo_total" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Rendimiento_Mano_Obra" 
                            HeaderText="Rendimiento_Mano_Obra"
                            SortExpression="Rendimiento_Mano_Obra" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Titulo_id" 
                            HeaderText="Apu_Titulo_id" 
                            SortExpression="Apu_Titulo_id" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Subtitulo_Codigo" 
                            HeaderText="Apu_Subtitulo_Codigo"
                            SortExpression="Apu_Subtitulo_Codigo" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Transporte_ultima_fecha_update" 
                            HeaderText="Transporte_ultima_fecha_update"
                            SortExpression="Transporte_ultima_fecha_update" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Mano_obra_ultima_fecha_update" 
                            HeaderText="Mano_obra_ultima_fecha_update"
                            SortExpression="Mano_obra_ultima_fecha_update" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Rendimiento_equipo_hora1" 
                            HeaderText="Rendimiento_equipo_hora1"
                            SortExpression="Rendimiento_equipo_hora1" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Equipo_ultima_fecha_update" 
                            HeaderText="Equipo_ultima_fecha_update"
                            SortExpression="Equipo_ultima_fecha_update" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Rubro_Id" 
                            HeaderText="Apu_Rubro_Id" 
                            SortExpression="Apu_Rubro_Id" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Nombre" 
                            HeaderText="Nombre" 
                            SortExpression="Nombre" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Rendimiento_Equipo_Hora" 
                            HeaderText="Rendimiento_Equipo_Hora"
                            SortExpression="Rendimiento_Equipo_Hora" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Titulo_Nombre" 
                            HeaderText="Apu_Titulo_Nombre" 
                            SortExpression="Apu_Titulo_Nombre" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Codigo" 
                            HeaderText="Codigo" 
                            SortExpression="Codigo_int" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Transporte_costo_total" 
                            HeaderText="Transporte_costo_total"
                            SortExpression="Transporte_costo_total" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Subtitulo_Nombre" 
                            HeaderText="Apu_Subtitulo_Nombre"
                            SortExpression="Apu_Subtitulo_Nombre" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Proyecto_Nombre" 
                            HeaderText="Apu_Proyecto_Nombre"
                            SortExpression="Apu_Proyecto_Nombre" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Proyecto_Codigo" 
                            HeaderText="Apu_Proyecto_Codigo"
                            SortExpression="Apu_Proyecto_Codigo" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Titulo_Codigo" 
                            HeaderText="Apu_Titulo_Codigo" 
                            SortExpression="Apu_Titulo_Codigo" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Estado" 
                            HeaderText="Estado" 
                            SortExpression="Estado" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Proyecto_Id" 
                            HeaderText="Apu_Proyecto_Id" 
                            SortExpression="Apu_Proyecto_Id" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Equipo_costo_total" 
                            HeaderText="Equipo_costo_total" 
                            SortExpression="Equipo_costo_total" 
                            Visible="False" />
                    </Columns>
                </koala:KGrid>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:ObjectDataSource 
        ID="odsgvapu_proyecto_rubro" 
        runat="server"
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetByProyecto" 
        TypeName="FEL.APU.BO_Apu_Proyecto_Rubro">
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

